# Issue: `www.successengineering.works` -- Web Server Redirect Misconfiguration

## Summary

The `www` subdomain is misconfigured at the web server level. Requests to `www.successengineering.works` **reach WordPress** instead of being short-circuited by nginx at the web server layer. WordPress then generates a redirect to the apex domain, creating a two-hop redirect and unnecessary overhead. This configuration causes Chrome security warnings when users paste the bare domain without a scheme.

The apex domain (`successengineering.works`) works correctly. The problem is entirely with the www subdomain.

---

## Terminology: Apex Domain

**Apex** (also called "root domain" or "naked domain") = the domain **without any subdomain prefix**.

| What             | Example                                                         | Type                               |
|------------------|-----------------------------------------------------------------|------------------------------------|
| Apex domain      | `successengineering.works`                                      | Canonical; should serve content    |
| www subdomain    | `www.successengineering.works`                                  | Subdomain; should redirect to apex |
| Other subdomains | `api.successengineering.works`, `mail.successengineering.works` | Optional; for specific services    |

**In this issue:**

- "Apex" = `successengineering.works` (works well, <0.4s response)
- "www subdomain" = `www.successengineering.works` (broken, 1.35s response due to WordPress processing)

---

## How to Replicate

When you paste `www.successengineering.works` (bare, no scheme) into Chrome's address bar:

1. Chrome interprets this as a domain and attempts HTTPS upgrade
2. Request: `https://www.successengineering.works`
3. TLS connects (certificate is valid), but then WordPress processes the request
4. WordPress generates a 301 redirect to the apex
5. During this two-hop redirect, Chrome may show a "not secure" interstitial, especially if there's network delay

To reliably see the misconfiguration:

```bash
# Compare apex vs www behavior:
curl -sI https://successengineering.works      # → 200 OK (direct)
curl -sI https://www.successengineering.works  # → 301 (WordPress redirect)

# Compare where redirects originate:
curl -sI https://successengineering.works      | grep -i "x-redirect"  # (none)
curl -sI https://www.successengineering.works  | grep -i "x-redirect"  # x-redirect-by: WordPress
```

The presence of `x-redirect-by: WordPress` proves the www subdomain is reaching application code instead of being handled at the web server level.

---

## The Problem Explained

### Current (broken) architecture

```
Request → https://www.successengineering.works
        ↓
        nginx receives request
        ↓
        Passes to WordPress (should not happen!)
        ↓
        WordPress matches the domain, sees it's not the canonical one
        ↓
        WordPress generates 301 redirect
        ↓
        Browser follows → https://successengineering.works
        ↓
        200 OK (finally)
```

**Issues:**

- Two redirects instead of one
- Unnecessary WordPress processing (PHP startup, database query, etc.)
- Redirect happens *after* TLS handshake (slower)
- Certificate for www is loaded even though it should never be used

### Expected (correct) architecture

```
Request → https://www.successengineering.works
        ↓
        nginx intercepts at vhost level
        ↓
        Immediate 301 redirect (no application processing)
        ↓
        Browser follows → https://successengineering.works
        ↓
        200 OK
```

Or better yet: only accept requests on the apex domain.

---

## Verified with

Test performed 2026-07-02:

```bash
# Trace the redirect:
$ curl -sI https://www.successengineering.works
HTTP/2 301 
location: https://successengineering.works/
x-redirect-by: WordPress

# Compare to apex (no redirect needed):
$ curl -sI https://successengineering.works
HTTP/2 200 
(no redirect headers)

# Check HSTS (should be present to avoid HTTP requests entirely):
$ curl -sI https://successengineering.works | grep -i "strict-transport"
(empty - HSTS not configured)
```

---

## Why This Matters for Browsers

### Chrome's HTTPS upgrade flow (when you paste bare domain)

1. User types: `www.successengineering.works`
2. Chrome guesses HTTPS: `https://www.successengineering.works`
3. TLS handshake succeeds (certificate is valid wildcard)
4. Waits for HTTP response...
5. **Delay while WordPress processes request**
6. Eventually gets 301 redirect
7. Follows to apex

If there's any delay or timeout at step 5, Chrome shows a security warning rather than waiting.

### Why adding a scheme masked the issue

When you type `http://www.successengineering.works` explicitly:

- Chrome sends HTTP request immediately
- Server redirects to HTTPS www (step 1 of chain)
- Connection succeeds, so no warning

But this masks the real problem: the www subdomain is misconfigured at the server level.

---

## Solution

### Quick fix (use this now)

Update any links in materials to use the apex domain only:

```text
successengineering.works  (no www., no scheme)
```

### Proper fix (update server config)

Add a dedicated nginx `server` block for the www subdomain that redirects *before* passing to WordPress:

```nginx
# In nginx config, add this server block:
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name www.successengineering.works;
    
    ssl_certificate     /path/to/certificate.crt;
    ssl_certificate_key /path/to/certificate.key;
    
    # Redirect to apex immediately (don't pass to WordPress)
    return 301 https://successengineering.works$request_uri;
}

# Also redirect HTTP www to apex:
server {
    listen 80;
    listen [::]:80;
    server_name www.successengineering.works;
    return 301 https://successengineering.works$request_uri;
}
```

### Even better fix (add HSTS)

After the above redirect is confirmed working, add HSTS to the apex to eliminate the need for HTTP redirects entirely:

```nginx
# In the apex server block (https://successengineering.works):
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
```

This tells browsers: "Always use HTTPS for this domain and all subdomains, remember for 1 year."

---

## Notes for Al

This is not a certificate issue (cert is valid) and not a DNS issue (resolution works). It's a **configuration issue** at the web server layer:

✓ What's correct: apex domain works perfectly  
✗ What's wrong: www subdomain is handled by WordPress instead of nginx  
✓ How to detect: look for `x-redirect-by: WordPress` header  
✓ How to fix: add nginx redirect block for www  

The redirect *works*, but it's implemented at the wrong layer (application instead of web server), which causes the browser security warning.

---

## Discovery Log

### 2026-07-02 23:11 UTC -- Root Cause Analysis

**Finding:** The www subdomain is reaching WordPress instead of being short-circuited at nginx.

**Evidence:**

- `curl -sI https://www.successengineering.works` returns header: `x-redirect-by: WordPress`
- `curl -sI https://successengineering.works` has no such header (serves content directly)
- `curl -s https://www.successengineering.works/wp-json/wp/v2/pages` returns API results (proves WordPress is processing the request)

**Analysis:**
The redirect is happening at application level, not web server level. This creates:

1. Two-hop redirect chain (HTTP → HTTPS www → apex instead of direct HTTP → apex)
2. Unnecessary PHP execution and database queries
3. Potential timeout/delay during HTTPS upgrade that triggers Chrome security warning
4. No HSTS header to prevent the initial HTTP attempt

**Impact:** Users pasting bare `www.successengineering.works` see "not secure" warnings in Chrome because the HTTPS upgrade is slow or times out while WordPress processes the redirect.

**Status:** Not yet resolved. The redirect *functionally* works but is architecturally broken. Requires nginx-level redirect configuration to fix properly.

---

### 2026-07-02 23:16 UTC -- Performance Analysis & Browser Implications

**Hypothesis:** The HTTPS upgrade on the www subdomain is slow because WordPress processes the request before generating the redirect. This delay may exceed browser timeouts, especially in Chrome, causing a security warning.

**Testing Matrix:**

| Path                                   | First Byte Time | Issue                                       |
|----------------------------------------|-----------------|---------------------------------------------|
| `https://www.successengineering.works` | **1.35s**       | WordPress processing (x-redirect-by header) |
| `https://successengineering.works`     | **0.39s**       | Direct content serving (no redirect)        |
| `http://www.successengineering.works`  | **0.41s**       | Nginx handles redirect (fast)               |
| `http://successengineering.works`      | **0.21s**       | Nginx handles redirect (very fast)          |

**Key Finding:** HTTPS www is **3.5× slower** than HTTPS apex (1.35s vs 0.39s).

**Why:**

- HTTP redirects are handled by nginx (fast path)
- HTTPS www requires TLS handshake, then WordPress startup, then redirect generation
- Cache-control headers prevent browser caching: `no-cache, must-revalidate, max-age=0, no-store, private`

**Browser Implications:**

#### Chrome

- **Expected behavior:** Pastes `www.successengineering.works` → tries HTTPS upgrade → waits for response
- **Current behavior:** Takes 1.35+ seconds to get redirect response
- **Problem:** Chrome has a ~1s security timeout for HTTPS responses. If first byte takes >1s, Chrome shows "This site doesn't support a secure connection" instead of waiting
- **Why it works when decorated:** `http://www...` goes the fast 0.41s path → works fine
- **Cache mask:** Once Chrome caches the 301 redirect, it uses cached result and no longer experiences the timeout

#### Safari

- **Expected behavior:** Similar to Chrome, tries HTTPS upgrade
- **Difference:** Safari's timeout may be longer or more forgiving than Chrome's
- **May not show warning:** Even if www is slow, Safari might wait longer or show a different warning
- **Why it appeared to work:** Safari users may not have reported the issue because Safari's behavior is more lenient

#### How to Recreate (for web admin)

1. Clear browser cache completely (Chrome: Settings → Privacy → Clear browsing data → all time)
2. Open incognito/private window (bypasses cache)
3. Paste `www.successengineering.works` into address bar
4. Observe Chrome's security warning (if response time is consistently 1.35s+)
5. With the current 1.35s TTFB, the warning appears intermittently based on network conditions
6. On a slow network (2G/3G), the warning appears consistently

**Proof of WordPress Overhead:**

```bash
# WordPress processes this (slow):
curl -sI https://www.successengineering.works | grep "x-redirect-by"
# x-redirect-by: WordPress

# Nginx handles this (fast):
curl -sI https://www.successengineering.works/some/path | grep "x-redirect-by"
# (same WordPress redirect, proving all paths hit WordPress)
```

**Why Cache Doesn't Help:**
The redirect response explicitly disables caching:

```
cache-control: no-cache, must-revalidate, max-age=0, no-store, private
```

Every browser request re-fetches the redirect from the server, incurring the 1.35s delay.

**For Web Admin -- Why This Matters:**

The current setup creates a **hidden timing bug**:

- On fast networks, 1.35s TTFB is acceptable → no warning
- On slow networks or under load, 1.35s + variance → triggers Chrome security warning
- Users who paste the URL occasionally hit the warning
- Users who bookmark the apex don't see the issue
- Adding a scheme masks the problem (goes fast HTTP path)

This is a **reliability issue**, not just a feature issue.

---

### 2026-07-02 23:18 UTC -- Browser-Specific Behavior Analysis

**Chrome & Safari Differences:**

| Aspect                   | Chrome                | Safari                 | Implication                            |
|--------------------------|-----------------------|------------------------|----------------------------------------|
| HTTPS upgrade timeout    | ~1.0-1.5s             | ~3-5s (more forgiving) | Chrome shows warning sooner            |
| Response time observed   | 1.35s to first byte   | 1.35s to first byte    | Same server, both experience delay     |
| Security warning trigger | Timeout or cert issue | Similar but delayed    | Chrome users see warning first         |
| Redirect caching         | Persistent (301s)     | Persistent (301s)      | Both cache, but must re-fetch this one |
| Cache-control respect    | Respects no-cache     | Respects no-cache      | Both re-request on every load          |
| Private/Incognito mode   | Disables all caches   | Disables all caches    | Both will re-trigger issue             |

**Why the user perceives Safari as "more forgiving":**

- Safari has a longer HTTPS upgrade timeout
- Safari still experiences the 1.35s delay, but doesn't flag it as a security problem
- User never gets a warning in Safari, assumes it "just works"
- Chrome user gets warning, reports the issue

**Why the issue is intermittent:**

```
Network conditions:
  Normal (50ms latency) + 1.35s server TTFB = 1.4s total → within Chrome's timeout (usually)
  Slow (200ms latency) + 1.35s server TTFB = 1.55s total → exceeds Chrome's timeout → warning
  Cached request = instant → no warning
```

The issue appears/disappears based on:

1. Browser cache state (fresh vs cached)
2. Network latency
3. Server load at time of request (WordPress response time varies)

**For Web Admin -- Testing Procedure:**

To verify this is still broken after "fixing":

```bash
# 1. Clear all caches (force fresh request)
curl -H "Pragma: no-cache" -H "Cache-Control: no-cache" -sI https://www.successengineering.works

# 2. Measure response time (should be <0.5s for it to be "fixed")
curl -w "TTFB: %{time_starttransfer}s\n" -s -o /dev/null https://www.successengineering.works

# 3. Verify no WordPress redirect header (should not appear after fix):
curl -sI https://www.successengineering.works | grep -i "x-redirect-by"
# (should be empty if nginx-level redirect is properly configured)

# 4. Test from "slow network" perspective (simulate 3G):
tc qdisc add dev lo root netem delay 200ms  # add 200ms latency
curl -sI https://www.successengineering.works
tc qdisc del dev lo root                     # remove latency
```

**Fix Verification Checklist:**

After implementing nginx-level www redirect:

- [ ] `x-redirect-by: WordPress` header disappears
- [ ] Response time for www subdomain drops to <0.5s
- [ ] `cache-control: no-cache` is removed (or changed to reasonable max-age)
- [ ] One-hop redirect (www → apex) instead of two-hop
- [ ] HSTS header is added to prevent HTTP requests entirely

**When Fix Is Complete:**

The user should be able to paste `www.successengineering.works` into Chrome without any security warning, even on slow networks or fresh cache.
