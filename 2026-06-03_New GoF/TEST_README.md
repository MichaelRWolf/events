# Test: successengineering.works www Subdomain Security Issue

TAP (Test Anything Protocol) test suite that verifies the www subdomain misconfiguration.

**Status:** 4 failing tests demonstrate the issue exists (as of 2026-07-02).

---

## Quick Start

### macOS / Linux

```bash
# 1. Install dependencies (one time only)
pip3 install -r requirements.txt

# 2. Run the test (choose one):

# Option A: Pretty colored output (RECOMMENDED)
./run_test.sh tap-spec

# Option B: Minimal output
./run_test.sh faucet

# Option C: Perl harness summary
./run_test.sh prove

# Option D: Raw TAP output
./run_test.sh raw
```

### Windows

```cmd
# 1. Install dependencies (one time only)
pip install -r requirements.txt

# 2. Run the test (choose one):

# Option A: Pretty colored output (RECOMMENDED)
run_test.bat tap-spec

# Option B: Minimal output
run_test.bat faucet

# Option C: Raw TAP output
run_test.bat raw
```

### Manual Run (No wrapper needed)

```bash
# macOS/Linux
python3 test_successengineering_www_not_secure.py | tap-spec

# Windows
python test_successengineering_www_not_secure.py | tap-spec
```

---

## TAP Formatters & Test Harnesses

### Available Formatters

| Tool         | Colors    | Summary | Install                   | Best For                     |
|--------------|-----------|---------|---------------------------|------------------------------|
| **tap-spec** | ✓✓ (best) | ✓       | `npm install -g tap-spec` | Best visual output           |
| **faucet**   | ✓         | ✓       | `npm install -g faucet`   | Minimal, clean               |
| **prove**    | ✓         | ✓       | Built-in (Perl)           | No dependencies, macOS/Linux |
| **raw**      | ✗         | ✗       | None                      | Debugging/raw output         |

### Install Formatters (Optional)

**tap-spec (Recommended)**

```bash
# macOS (Homebrew)
brew install node
npm install -g tap-spec

# Linux (Ubuntu/Debian)
sudo apt-get install npm
npm install -g tap-spec

# Windows
# Install Node.js from https://nodejs.org/
npm install -g tap-spec
```

**faucet (Alternative)**

```bash
npm install -g faucet
```

**prove (Built-in, macOS/Linux)**

- Usually pre-installed on macOS and Linux
- Check: `which prove`

---

## What This Test Does

The test checks 12 assertions across 7 groups:

| Group                      | Tests | Status                                 |
|----------------------------|-------|----------------------------------------|
| Redirect Chain             | 2     | ✓ PASS                                 |
| WordPress Misconfiguration | 1     | ✗ **FAIL** (header present)            |
| Performance                | 3     | ✗ **FAIL** (>1s response time)         |
| Cache Headers              | 1     | ✗ **FAIL** (no-cache prevents caching) |
| HSTS Security              | 1     | ✗ **FAIL** (header missing)            |
| HTTP→HTTPS Redirects       | 2     | ✓ PASS                                 |
| Apex Domain                | 2     | ✓ PASS                                 |

**Total: 8 passing, 4 failing**

---

## Expected Test Output

When the issue is **NOT fixed**:

```
# Testing successengineering.works www subdomain configuration
# Issue: www subdomain processed by WordPress instead of nginx

# TEST GROUP 1: Redirect Chain Verification

ok 1 - www subdomain returns 301 redirect
ok 2 - www redirects to apex domain (not to other URL)

# TEST GROUP 2: WordPress Misconfiguration Detection

not ok 3 - www does NOT have x-redirect-by: WordPress header
  Expected: Header absent (nginx-level redirect)
  Got:      Header present: WordPress

# TEST GROUP 3: Performance Analysis

not ok 4 - www subdomain responds in <0.5s (currently slow due to WordPress)
  Expected: <0.5s
  Got:      1.070s

...

1..12
# FAILED: 4 tests failed, 8 passed
```

---

## What Each Failing Test Means

### Test 3: WordPress Redirect Header Present

**Problem:** The www subdomain has `x-redirect-by: WordPress` header, proving WordPress is processing the request instead of nginx short-circuiting it.

**Fix:** Add nginx-level redirect for www subdomain (see issue_www_subdomain_shows_not_secure_in_chrome.md).

### Tests 4-5: Response Time > 1 second

**Problem:** Both www and apex take >1s to respond, exceeding Chrome's HTTPS upgrade timeout (~1.0-1.5s).

**Root cause:** WordPress processing delay.

**Fix:** Implement nginx-level redirect (faster than WordPress).

### Test 8: HSTS Header Missing

**Problem:** No `Strict-Transport-Security` header prevents browser caching of HTTPS preference.

**Fix:** Add HSTS header after redirect fix is verified.

---

## Using Test Results to Track Progress

Run this test **before and after** making changes:

```bash
# Before fix:
python3 test_successengineering_www_not_secure.py
# Expected: 4 failed, 8 passed

# After implementing nginx redirect:
python3 test_successengineering_www_not_secure.py
# Expected: 0 failed, 12 passed (or close to it)
```

---

## Troubleshooting

### "ModuleNotFoundError: No module named 'requests'"

**macOS/Linux:**

```bash
pip3 install -r requirements.txt
```

**Windows:**

```cmd
pip install -r requirements.txt
```

### "Connection refused" or timeout

The domain must be reachable from your network. If testing from behind a proxy:

```bash
# Set proxy environment variable
export HTTP_PROXY=http://proxy.example.com:8080
python3 test_successengineering_www_not_secure.py
```

### SSL Certificate Warning (Windows)

Windows may require SSL verification. This is normal and safe for this test. The script already handles this.

---

## Files

- `test_successengineering_www_not_secure.py` -- Main test script
- `requirements.txt` -- Python dependencies
- `TEST_README.md` -- This file
- `issue_www_subdomain_shows_not_secure_in_chrome.md` -- Detailed issue documentation

---

---

## Formatter Examples

### tap-spec Output (Recommended)

```
  Testing successengineering.works www subdomain configuration

  ✔ www subdomain returns 301 redirect
  ✔ www redirects to apex domain
  ✖ www does NOT have x-redirect-by: WordPress header
  ✖ www subdomain responds in <0.5s

  Failed Tests: There were 4 failures

  total:     12
  passing:   8
  failing:   4
```

### prove Output

```
test_successengineering_www_not_secure.py .. 
  ok 1 - www subdomain returns 301 redirect
  ok 2 - www redirects to apex domain
  not ok 3 - www does NOT have x-redirect-by: WordPress header
  ...

Test Summary Report
-------------------
Failed tests:  3-5, 8
Files=1, Tests=12, Failed: 4
Result: FAIL
```

### faucet Output (Minimal)

```
  not ok
    ✖ www does NOT have x-redirect-by: WordPress header
  ✖ 4 tests failed, 8 passed
```

---

## Next Steps for Web Admin

After reviewing the failing tests:

1. Read `issue_www_subdomain_shows_not_secure_in_chrome.md` for detailed explanation
2. Implement nginx-level redirect (see "Solution" section)
3. Re-run this test to verify fix
4. Add HSTS header for final optimization

```bash
# Keep running until all tests pass:
./run_test.sh tap-spec
```

**Success looks like:**

```
total:     12
passing:   12
failing:   0
```
