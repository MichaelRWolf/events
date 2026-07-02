#!/usr/bin/env python3
"""
Test: successengineering.works www subdomain configuration.

When I run this, it indicates whether the www subdomain is misconfigured.

Self-contained. No dependencies except requests (which needs one pip install).

Usage:
  python3 test_www_not_secure.py    (macOS/Linux)
  python test_www_not_secure.py     (Windows)

Full details in: issue_www_subdomain_shows_not_secure_in_chrome.md
"""

import sys

try:
    import requests
except ImportError:
    print("Error: 'requests' module not found.\n", file=sys.stderr)
    print("Install it with:", file=sys.stderr)
    print("  pip3 install requests  (macOS/Linux)", file=sys.stderr)
    print("  pip install requests   (Windows)", file=sys.stderr)
    print("\nThen run this script again.", file=sys.stderr)
    sys.exit(1)

import time
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


class TAPTest:
    """TAP (Test Anything Protocol) test runner."""

    def __init__(self):
        self.test_number = 0
        self.passed = 0
        self.failed = 0

    def ok(self, condition, description, expected=None, got=None):
        """Record a test result."""
        self.test_number += 1
        status = "ok" if condition else "not ok"

        if not condition:
            self.failed += 1
        else:
            self.passed += 1

        print(f"{status} {self.test_number} - {description}")
        if expected is not None and got is not None:
            print(f"  Expected: {expected}")
            print(f"  Got:      {got}")

    def summary(self):
        """Print TAP summary."""
        total = self.passed + self.failed
        print(f"\n1..{total}")
        if self.failed > 0:
            print(f"# FAILED: {self.failed} tests failed, {self.passed} passed")
            return False
        else:
            print(f"# PASSED: All {self.passed} tests passed")
            return True


def test_url(url, follow_redirects=False):
    """Test a URL. Returns: {status, headers, ttfb, error}"""
    try:
        start = time.time()
        resp = requests.head(
            url, allow_redirects=follow_redirects, timeout=5, verify=False
        )
        ttfb = time.time() - start

        return {
            "status": resp.status_code,
            "headers": {k.lower(): v for k, v in resp.headers.items()},
            "ttfb": ttfb,
            "error": None,
        }
    except Exception as e:
        return {
            "status": None,
            "headers": {},
            "ttfb": time.time() - start,
            "error": str(e),
        }


def main():
    """Run test suite."""
    tap = TAPTest()

    domain_apex = "https://successengineering.works"
    domain_www = "https://www.successengineering.works"
    domain_apex_http = "http://successengineering.works"
    domain_www_http = "http://www.successengineering.works"

    print("# Testing successengineering.works www subdomain configuration")
    print("# Issue: www subdomain processed by WordPress instead of nginx")
    print("")

    # TEST GROUP 1: Redirect Chain Verification
    print("# TEST GROUP 1: Redirect Chain Verification")
    print("")

    resp = test_url(domain_www)
    if resp["error"] is None:
        tap.ok(
            resp["status"] == 301,
            "www subdomain returns 301 redirect",
            expected="301",
            got=str(resp["status"]),
        )
        location = resp["headers"].get("location", "")
        tap.ok(
            location == "https://successengineering.works/",
            "www redirects to apex domain",
            expected="https://successengineering.works/",
            got=location,
        )
    else:
        tap.ok(False, "www subdomain responds", expected="response", got=resp["error"])

    # TEST GROUP 2: WordPress Misconfiguration
    print("\n# TEST GROUP 2: WordPress Misconfiguration Detection")
    print("# (Currently failing — indicates misconfiguration)")
    print("")

    resp = test_url(domain_www)
    if resp["error"] is None:
        has_wordpress = "x-redirect-by" in resp["headers"]
        wordpress_value = resp["headers"].get("x-redirect-by", "N/A")
        tap.ok(
            not has_wordpress,
            "www does NOT have x-redirect-by: WordPress header",
            expected="Header absent (nginx-level redirect)",
            got=f"Header present: {wordpress_value}"
            if has_wordpress
            else "Header absent",
        )

    # TEST GROUP 3: Performance
    print("\n# TEST GROUP 3: Performance Analysis")
    print("")

    resp_www = test_url(domain_www)
    resp_apex = test_url(domain_apex)

    if resp_www["error"] is None and resp_apex["error"] is None:
        ttfb_www = resp_www["ttfb"]
        ttfb_apex = resp_apex["ttfb"]

        tap.ok(
            ttfb_www < 0.5,
            "www subdomain responds in <0.5s",
            expected="<0.5s",
            got=f"{ttfb_www:.3f}s",
        )
        tap.ok(
            ttfb_apex < 0.5,
            "apex domain responds in <0.5s",
            expected="<0.5s",
            got=f"{ttfb_apex:.3f}s",
        )
        ratio = ttfb_www / ttfb_apex if ttfb_apex > 0 else 0
        tap.ok(
            ratio < 1.5,
            "www not significantly slower than apex",
            expected="<1.5x slower",
            got=f"{ratio:.2f}x slower",
        )

    # TEST GROUP 4: Cache Headers
    print("\n# TEST GROUP 4: Cache Configuration")
    print("")

    resp = test_url(domain_www)
    if resp["error"] is None:
        cache_control = resp["headers"].get("cache-control", "")
        has_cache = "max-age" in cache_control or "public" in cache_control
        tap.ok(
            has_cache,
            "www redirect has reasonable cache-control",
            expected="max-age or public",
            got=cache_control,
        )

    # TEST GROUP 5: HSTS
    print("\n# TEST GROUP 5: Security Headers (HSTS)")
    print("")

    resp = test_url(domain_apex)
    if resp["error"] is None:
        has_hsts = "strict-transport-security" in resp["headers"]
        hsts_value = resp["headers"].get("strict-transport-security", "Header absent")
        tap.ok(
            has_hsts,
            "apex domain has Strict-Transport-Security (HSTS) header",
            expected="HSTS header present",
            got=hsts_value,
        )

    # TEST GROUP 6: HTTP Redirects
    print("\n# TEST GROUP 6: HTTP to HTTPS Redirects")
    print("")

    resp_http_www = test_url(domain_www_http)
    resp_http_apex = test_url(domain_apex_http)

    if resp_http_www["error"] is None:
        tap.ok(
            resp_http_www["status"] == 301,
            "HTTP www redirects to HTTPS",
            expected="301",
            got=str(resp_http_www["status"]),
        )

    if resp_http_apex["error"] is None:
        tap.ok(
            resp_http_apex["status"] == 301,
            "HTTP apex redirects to HTTPS",
            expected="301",
            got=str(resp_http_apex["status"]),
        )

    # TEST GROUP 7: Apex Domain
    print("\n# TEST GROUP 7: Apex Domain (Should Pass)")
    print("")

    resp = test_url(domain_apex)
    if resp["error"] is None:
        tap.ok(
            resp["status"] == 200,
            "apex domain serves content (200 OK)",
            expected="200",
            got=str(resp["status"]),
        )
        has_wordpress = "x-redirect-by" in resp["headers"]
        tap.ok(
            not has_wordpress,
            "apex does NOT have x-redirect-by header",
            expected="Header absent",
            got="Header present" if has_wordpress else "Header absent",
        )

    # Summary
    success = tap.summary()
    return 0 if success else 1


if __name__ == "__main__":
    try:
        exit_code = main()
        sys.exit(exit_code)
    except KeyboardInterrupt:
        print("\n# Test interrupted")
        sys.exit(130)
    except Exception as e:
        print(f"# Error: {e}", file=sys.stderr)
        sys.exit(1)
