#!/usr/bin/env pwsh
<#
.SYNOPSIS
TAP test suite for successengineering.works www subdomain security issue.

.DESCRIPTION
Tests the www subdomain configuration without any external dependencies.
Outputs TAP (Test Anything Protocol) format.

Just run it:
  PowerShell: .\test_successengineering_www_not_secure.ps1
  macOS/Linux: pwsh test_successengineering_www_not_secure.ps1

Requires: PowerShell 5.1+ (built-in on Windows 10+, macOS/Linux via pwsh)
#>

$ErrorActionPreference = "Continue"

class TAPTest {
    [int]$testNumber = 0
    [int]$passed = 0
    [int]$failed = 0
    [array]$tests = @()

    [void] Ok([bool]$condition, [string]$description, [string]$expected, [string]$got) {
        $this.testNumber++
        $status = if ($condition) { "ok" } else { "not ok" }

        if (-not $condition) {
            $this.passed--
            $this.failed++
        } else {
            $this.passed++
        }

        Write-Host "$status $($this.testNumber) - $description"
        if ($expected -and $got) {
            Write-Host "  Expected: $expected"
            Write-Host "  Got:      $got"
        }

        $this.tests += @{
            number = $this.testNumber
            status = $status
            description = $description
            expected = $expected
            got = $got
        }
    }

    [bool] Summary() {
        $total = $this.passed + $this.failed
        Write-Host ""
        Write-Host "1..$total"
        if ($this.failed -gt 0) {
            Write-Host "# FAILED: $($this.failed) tests failed, $($this.passed) passed"
            return $false
        } else {
            Write-Host "# PASSED: All $($this.passed) tests passed"
            return $true
        }
    }
}

function Invoke-SafeWebRequest {
    param(
        [string]$Uri,
        [bool]$FollowRedirects = $false,
        [int]$TimeoutSeconds = 5
    )

    try {
        $params = @{
            Uri = $Uri
            Method = "Head"
            TimeoutSec = $TimeoutSeconds
            SkipCertificateCheck = $true
            ErrorAction = "Stop"
        }

        if (-not $FollowRedirects) {
            $params["MaximumRedirection"] = 0
        }

        $startTime = [datetime]::UtcNow
        $response = Invoke-WebRequest @params
        $elapsed = ([datetime]::UtcNow - $startTime).TotalSeconds

        return @{
            StatusCode = $response.StatusCode
            Headers = $response.Headers
            TimeToFirstByte = $elapsed
            Success = $true
        }
    } catch {
        # Catch redirects (3xx responses throw in PowerShell)
        $response = $_.Exception.Response
        if ($response) {
            $startTime = [datetime]::UtcNow
            $elapsed = ([datetime]::UtcNow - $startTime).TotalSeconds

            return @{
                StatusCode = [int]$response.StatusCode
                Headers = $response.Headers
                TimeToFirstByte = $elapsed
                Success = $true
                IsRedirect = $true
            }
        }

        return @{
            Success = $false
            Error = $_.Exception.Message
        }
    }
}

# ────────────────────────────────────────────────────────────────────────────
# Main Test Suite
# ────────────────────────────────────────────────────────────────────────────

$tap = [TAPTest]::new()

$domainApex = "https://successengineering.works"
$domainWww = "https://www.successengineering.works"
$domainApexHttp = "http://successengineering.works"
$domainWwwHttp = "http://www.successengineering.works"

Write-Host "# Testing successengineering.works www subdomain configuration"
Write-Host "# Issue: www subdomain processed by WordPress instead of nginx"
Write-Host ""

# ────────────────────────────────────────────────────────────────────────────
# TEST GROUP 1: Redirect Chain Verification
# ────────────────────────────────────────────────────────────────────────────

Write-Host "# TEST GROUP 1: Redirect Chain Verification"
Write-Host ""

$resp = Invoke-SafeWebRequest -Uri $domainWww -FollowRedirects $false
if ($resp.Success) {
    $tap.Ok($resp.StatusCode -eq 301, "www subdomain returns 301 redirect", "301", $resp.StatusCode)

    $location = $resp.Headers["location"]
    $tap.Ok($location -eq "https://successengineering.works/", "www redirects to apex domain", "https://successengineering.works/", $location)
} else {
    $tap.Ok($false, "www subdomain responds to request", "successful response", $resp.Error)
}

# ────────────────────────────────────────────────────────────────────────────
# TEST GROUP 2: WordPress Misconfiguration
# ────────────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "# TEST GROUP 2: WordPress Misconfiguration Detection"
Write-Host "# (Currently failing — indicates misconfiguration)"
Write-Host ""

$resp = Invoke-SafeWebRequest -Uri $domainWww -FollowRedirects $false
if ($resp.Success) {
    $hasWordPress = $resp.Headers.ContainsKey("x-redirect-by")
    $wordPressValue = if ($hasWordPress) { $resp.Headers["x-redirect-by"] } else { "N/A" }

    $tap.Ok(-not $hasWordPress, "www does NOT have x-redirect-by: WordPress header", "Header absent", "Header present: $wordPressValue")
}

# ────────────────────────────────────────────────────────────────────────────
# TEST GROUP 3: Performance
# ────────────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "# TEST GROUP 3: Performance Analysis"
Write-Host ""

$respWww = Invoke-SafeWebRequest -Uri $domainWww -FollowRedirects $false
$respApex = Invoke-SafeWebRequest -Uri $domainApex -FollowRedirects $false

if ($respWww.Success -and $respApex.Success) {
    $ttfbWww = $respWww.TimeToFirstByte
    $ttfbApex = $respApex.TimeToFirstByte

    $tap.Ok($ttfbWww -lt 0.5, "www subdomain responds in <0.5s", "<0.5s", "$([Math]::Round($ttfbWww, 3))s")
    $tap.Ok($ttfbApex -lt 0.5, "apex domain responds in <0.5s", "<0.5s", "$([Math]::Round($ttfbApex, 3))s")

    $ratio = if ($ttfbApex -gt 0) { $ttfbWww / $ttfbApex } else { 0 }
    $tap.Ok($ratio -lt 1.5, "www not significantly slower than apex", "<1.5x slower", "$([Math]::Round($ratio, 2))x slower")
}

# ────────────────────────────────────────────────────────────────────────────
# TEST GROUP 4: Cache Headers
# ────────────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "# TEST GROUP 4: Cache Configuration"
Write-Host ""

$resp = Invoke-SafeWebRequest -Uri $domainWww -FollowRedirects $false
if ($resp.Success) {
    $cacheControl = $resp.Headers["cache-control"]
    $hasCacheability = $cacheControl -match "max-age|public"

    $tap.Ok($hasCacheability, "www redirect has reasonable cache-control", "max-age or public", $cacheControl)
}

# ────────────────────────────────────────────────────────────────────────────
# TEST GROUP 5: HSTS
# ────────────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "# TEST GROUP 5: Security Headers (HSTS)"
Write-Host ""

$resp = Invoke-SafeWebRequest -Uri $domainApex -FollowRedirects $false
if ($resp.Success) {
    $hasHsts = $resp.Headers.ContainsKey("strict-transport-security")
    $hstsValue = if ($hasHsts) { $resp.Headers["strict-transport-security"] } else { "Header absent" }

    $tap.Ok($hasHsts, "apex domain has Strict-Transport-Security (HSTS) header", "HSTS header present", $hstsValue)
}

# ────────────────────────────────────────────────────────────────────────────
# TEST GROUP 6: HTTP Redirects
# ────────────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "# TEST GROUP 6: HTTP to HTTPS Redirects"
Write-Host ""

$respHttpWww = Invoke-SafeWebRequest -Uri $domainWwwHttp -FollowRedirects $false
$respHttpApex = Invoke-SafeWebRequest -Uri $domainApexHttp -FollowRedirects $false

if ($respHttpWww.Success) {
    $tap.Ok($respHttpWww.StatusCode -eq 301, "HTTP www redirects to HTTPS", "301", $respHttpWww.StatusCode)
}

if ($respHttpApex.Success) {
    $tap.Ok($respHttpApex.StatusCode -eq 301, "HTTP apex redirects to HTTPS", "301", $respHttpApex.StatusCode)
}

# ────────────────────────────────────────────────────────────────────────────
# TEST GROUP 7: Apex Domain
# ────────────────────────────────────────────────────────────────────────────

Write-Host ""
Write-Host "# TEST GROUP 7: Apex Domain (Should Pass)"
Write-Host ""

$resp = Invoke-SafeWebRequest -Uri $domainApex -FollowRedirects $false
if ($resp.Success) {
    $tap.Ok($resp.StatusCode -eq 200, "apex domain serves content (200 OK)", "200", $resp.StatusCode)

    $hasWordPress = $resp.Headers.ContainsKey("x-redirect-by")
    $tap.Ok(-not $hasWordPress, "apex does NOT have x-redirect-by header", "Header absent", $(if ($hasWordPress) { "Header present" } else { "Header absent" }))
}

# ────────────────────────────────────────────────────────────────────────────
# Summary
# ────────────────────────────────────────────────────────────────────────────

$success = $tap.Summary()
exit $(if ($success) { 0 } else { 1 })
