#!/usr/bin/env python3
"""
TAP (Test Anything Protocol) test suite for successengineering.works www subdomain issue.

Tests the security, performance, and redirect configuration of www vs apex domain.
Demonstrates the failed expectations documented in issue_www_subdomain_shows_not_secure_in_chrome.md

Usage:
  macOS/Linux:  python3 test_successengineering_www_not_secure.py
  Windows:      python test_successengineering_www_not_secure.py

Note: Run 'pip3 install -r requirements.txt' first (pip on Windows)
"""

import sys
import os
import time

# Try to import requests, provide helpful error if missing
try:
    import requests
except ImportError:
    print("Error: 'requests' module not found", file=sys.stderr)
    print("", file=sys.stderr)
    print("Install dependencies with:", file=sys.stderr)
    if os.name == "nt":  # Windows
        print("  pip install -r requirements.txt", file=sys.stderr)
    else:  # macOS/Linux
        print("  pip3 install -r requirements.txt", file=sys.stderr)
    sys.exit(1)


class TAPTest:
    """Simple TAP (Test Anything Protocol) test runner."""

    def __init__(self):
        self.test_number = 0
        self.passed = 0
        self.failed = 0
        self.tests = []

    def ok(self, condition, description, expected=None, got=None):
        """Record a passing test."""
        self.test_number += 1
        self.passed += 1
        status = "ok" if condition else "not ok"
        if not condition:
            self.passed -= 1
            self.failed += 1

        print(f"{status} {self.test_number} - {description}")
        if expected is not None and got is not None:
            print(f"  Expected: {expected}")
            print(f"  Got:      {got}")

        self.tests.append(
            {
                "number": self.test_number,
                "status": status,
                "description": description,
                "expected": expected,
                "got": got,
            }
        )

        return condition

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


def test_successengineering_www():
    """Test suite for www.successengineering.works issue."""

    tap = TAPTest()

    domain_apex = "https://successengineering.works"
    domain_www = "https://www.successengineering.works"
    domain_apex_http = "http://successengineering.works"
    domain_www_http = "http://www.successengineering.works"

    # Disable SSL warnings for this test (certs are valid, just checking behavior)
    import urllib3

    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

    print("# Testing successengineering.works www subdomain configuration")
    print("# Issue: www subdomain processed by WordPress instead of nginx")
    print("# Platform:", "Windows" if os.name == "nt" else "macOS/Linux")
    print("")

    # ─────────────────────────────────────────────────────────────────────────
    # TEST GROUP 1: Redirect Chain Verification
    # ─────────────────────────────────────────────────────────────────────────

    print("# TEST GROUP 1: Redirect Chain Verification")
    print("")

    try:
        resp_www = requests.head(domain_www, allow_redirects=False, timeout=5)
        tap.ok(
            resp_www.status_code == 301,
            "www subdomain returns 301 redirect",
            expected="301",
            got=str(resp_www.status_code),
        )

        location = resp_www.headers.get("location", "")
        tap.ok(
            location == "https://successengineering.works/",
            "www redirects to apex domain (not to other URL)",
            expected="https://successengineering.works/",
            got=location,
        )
    except Exception as e:
        tap.ok(
            False,
            "www subdomain responds to HEAD request",
            expected="successful response",
            got=str(e),
        )

    # ─────────────────────────────────────────────────────────────────────────
    # TEST GROUP 2: WordPress Misconfiguration (Expected Failure)
    # ─────────────────────────────────────────────────────────────────────────

    print("\n# TEST GROUP 2: WordPress Misconfiguration Detection")
    print("# (Currently failing — indicates misconfiguration)")
    print("")

    try:
        resp_www = requests.head(domain_www, allow_redirects=False, timeout=5)
        has_wordpress_redirect = "x-redirect-by" in resp_www.headers

        tap.ok(
            not has_wordpress_redirect,
            "www does NOT have x-redirect-by: WordPress header (should be handled by nginx)",
            expected="Header absent (nginx-level redirect)",
            got="Header present: " + resp_www.headers.get("x-redirect-by", "N/A"),
        )
    except Exception as e:
        tap.ok(
            False,
            "Could not check redirect headers",
            expected="response headers",
            got=str(e),
        )

    # ─────────────────────────────────────────────────────────────────────────
    # TEST GROUP 3: Performance (Expected Failure)
    # ─────────────────────────────────────────────────────────────────────────

    print("\n# TEST GROUP 3: Performance Analysis")
    print("# (Currently failing — www is slower due to WordPress processing)")
    print("")

    try:
        start = time.time()
        resp_www = requests.head(domain_www, allow_redirects=False, timeout=5)
        ttfb_www = time.time() - start

        start = time.time()
        resp_apex = requests.head(domain_apex, allow_redirects=False, timeout=5)
        ttfb_apex = time.time() - start

        tap.ok(
            ttfb_www < 0.5,
            "www subdomain responds in <0.5s (currently slow due to WordPress)",
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
            "www is not significantly slower than apex (should be <1.5x ratio)",
            expected="<1.5x slower than apex",
            got=f"{ratio:.2f}x slower",
        )
    except Exception as e:
        tap.ok(
            False,
            "Could not measure response times",
            expected="response times",
            got=str(e),
        )

    # ─────────────────────────────────────────────────────────────────────────
    # TEST GROUP 4: Cache Headers (Expected Failure)
    # ─────────────────────────────────────────────────────────────────────────

    print("\n# TEST GROUP 4: Cache Configuration")
    print("# (Currently failing — cache-control prevents browser caching)")
    print("")

    try:
        resp_www = requests.head(domain_www, allow_redirects=False, timeout=5)
        cache_control = resp_www.headers.get("cache-control", "")

        tap.ok(
            "max-age" in cache_control or "public" in cache_control,
            "www redirect has reasonable cache-control (not 'no-cache')",
            expected="max-age or public in cache-control",
            got=cache_control,
        )
    except Exception as e:
        tap.ok(
            False, "Could not check cache headers", expected="cache headers", got=str(e)
        )

    # ─────────────────────────────────────────────────────────────────────────
    # TEST GROUP 5: HSTS Security Header (Expected Failure)
    # ─────────────────────────────────────────────────────────────────────────

    print("\n# TEST GROUP 5: Security Headers (HSTS)")
    print("# (Currently failing — HSTS not configured)")
    print("")

    try:
        resp_apex = requests.head(domain_apex, allow_redirects=False, timeout=5)
        has_hsts = "strict-transport-security" in resp_apex.headers

        tap.ok(
            has_hsts,
            "apex domain has Strict-Transport-Security (HSTS) header",
            expected="HSTS header present",
            got="HSTS header absent"
            if not has_hsts
            else resp_apex.headers.get("strict-transport-security"),
        )
    except Exception as e:
        tap.ok(False, "Could not check HSTS header", expected="HSTS header", got=str(e))

    # ─────────────────────────────────────────────────────────────────────────
    # TEST GROUP 6: HTTP → HTTPS Redirects
    # ─────────────────────────────────────────────────────────────────────────

    print("\n# TEST GROUP 6: HTTP to HTTPS Redirects")
    print("")

    try:
        resp = requests.head(
            domain_www_http, allow_redirects=False, timeout=5, verify=False
        )
        tap.ok(
            resp.status_code == 301,
            "HTTP www redirects to HTTPS",
            expected="301",
            got=str(resp.status_code),
        )
    except Exception as e:
        tap.ok(False, "HTTP www responds", expected="301 response", got=str(e))

    try:
        resp = requests.head(
            domain_apex_http, allow_redirects=False, timeout=5, verify=False
        )
        tap.ok(
            resp.status_code == 301,
            "HTTP apex redirects to HTTPS",
            expected="301",
            got=str(resp.status_code),
        )
    except Exception as e:
        tap.ok(False, "HTTP apex responds", expected="301 response", got=str(e))

    # ─────────────────────────────────────────────────────────────────────────
    # TEST GROUP 7: Apex Domain Functionality
    # ─────────────────────────────────────────────────────────────────────────

    print("\n# TEST GROUP 7: Apex Domain (Should Pass)")
    print("# (These should all pass — apex is correctly configured)")
    print("")

    try:
        resp = requests.head(domain_apex, allow_redirects=False, timeout=5)
        tap.ok(
            resp.status_code == 200,
            "apex domain serves content (200 OK)",
            expected="200",
            got=str(resp.status_code),
        )

        has_wordpress = "x-redirect-by" in resp.headers
        tap.ok(
            not has_wordpress,
            "apex does NOT have x-redirect-by header (correct)",
            expected="Header absent",
            got="Header present" if has_wordpress else "Header absent",
        )
    except Exception as e:
        tap.ok(False, "apex domain responds", expected="200 response", got=str(e))

    # ─────────────────────────────────────────────────────────────────────────
    # Print summary
    # ─────────────────────────────────────────────────────────────────────────

    success = tap.summary()
    return 0 if success else 1


if __name__ == "__main__":
    try:
        exit_code = test_successengineering_www()
        sys.exit(exit_code)
    except KeyboardInterrupt:
        print("\n# Test interrupted by user")
        sys.exit(130)
    except Exception as e:
        print(f"# Fatal error: {e}")
        sys.exit(1)
