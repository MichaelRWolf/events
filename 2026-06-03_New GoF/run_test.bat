@echo off
REM Convenient test runner with formatter selection (Windows)

setlocal enabledelayedexpansion

set SCRIPT=test_successengineering_www_not_secure.py
set FORMATTER=%1
if "!FORMATTER!"=="" set FORMATTER=tap-spec

if not exist "%SCRIPT%" (
    echo Error: %SCRIPT% not found
    exit /b 1
)

echo.
echo ================================================================================
echo Running: %SCRIPT%
echo Formatter: %FORMATTER%
echo ================================================================================
echo.

if "!FORMATTER!"=="tap-spec" (
    where /q tap-spec
    if errorlevel 1 (
        echo tap-spec not found. Install with: npm install -g tap-spec
        exit /b 1
    )
    python %SCRIPT% 2>&1 | tap-spec
) else if "!FORMATTER!"=="faucet" (
    where /q faucet
    if errorlevel 1 (
        echo faucet not found. Install with: npm install -g faucet
        exit /b 1
    )
    python %SCRIPT% 2>&1 | faucet
) else if "!FORMATTER!"=="raw" (
    python %SCRIPT%
) else (
    echo Unknown formatter: %FORMATTER%
    echo.
    echo Available formatters:
    echo   tap-spec  - Pretty colors and summary (recommended)
    echo   faucet    - Minimal colored output
    echo   raw       - Raw TAP output
    echo.
    echo Usage: %0 [formatter]
    exit /b 1
)
