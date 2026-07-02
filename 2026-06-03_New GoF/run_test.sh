#!/bin/bash
# Convenient test runner with formatter selection

SCRIPT="test_successengineering_www_not_secure.py"
FORMATTER="${1:-tap-spec}"  # Default to tap-spec, but allow override

if [ ! -f "$SCRIPT" ]; then
    echo "Error: $SCRIPT not found" >&2
    exit 1
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Running: $SCRIPT"
echo "Formatter: $FORMATTER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

case "$FORMATTER" in
    tap-spec)
        if ! command -v tap-spec &> /dev/null; then
            echo "tap-spec not found. Install with: npm install -g tap-spec"
            exit 1
        fi
        python3 "$SCRIPT" 2>&1 | tap-spec
        ;;
    faucet)
        if ! command -v faucet &> /dev/null; then
            echo "faucet not found. Install with: npm install -g faucet"
            exit 1
        fi
        python3 "$SCRIPT" 2>&1 | faucet
        ;;
    prove)
        if ! command -v prove &> /dev/null; then
            echo "prove not found. Install with: brew install perl (macOS) or apt-get install perl (Linux)"
            exit 1
        fi
        prove -v "$SCRIPT"
        ;;
    raw)
        python3 "$SCRIPT"
        ;;
    *)
        echo "Unknown formatter: $FORMATTER"
        echo ""
        echo "Available formatters:"
        echo "  tap-spec  - Pretty colors and summary (recommended)"
        echo "  faucet    - Minimal colored output"
        echo "  prove     - Perl TAP harness"
        echo "  raw       - Raw TAP output"
        echo ""
        echo "Usage: $0 [formatter]"
        exit 1
        ;;
esac
