#!/bin/bash
set -e

echo "Creating test .ics files for Calendar.app and Daylite compatibility..."
mkdir -p /tmp/ics-test

# Generate fresh DTSTAMP values to avoid "out of date" errors
DTSTAMP_OFFSET=$(date +"%Y-%m-%dT%H:%M:%S%z" | sed 's/\([+-][0-9][0-9]\)\([0-9][0-9]\)$/\1:\2/')
DTSTAMP_Z=$(date -u +"%Y%m%dT%H%M%SZ")

# Test with offset notation
cat > /tmp/ics-test/test_with_offset.ics <<EOF
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Michael Wolf//Event Calendar//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:Test Event (Offset)
BEGIN:VEVENT
UID:test-offset-2026-09-03@events.local
DTSTAMP:${DTSTAMP_OFFSET}
DTSTART:2026-09-03T16:00:00-04:00
DTEND:2026-09-03T17:00:00-04:00
SUMMARY:Test Event - ISO 8601 with Offset
DESCRIPTION:Test event using ISO 8601 format with Eastern offset.\n\nExpected time:\n- Offset: 2026-09-03T16:00:00-04:00 to 2026-09-03T17:00:00-04:00\n- Z notation (equivalent): 2026-09-03T20:00:00Z to 2026-09-03T21:00:00Z
LOCATION:Test Location
END:VEVENT
END:VCALENDAR
EOF

# Test with Z notation
cat > /tmp/ics-test/test_with_z.ics <<EOF2
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Michael Wolf//Event Calendar//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:Test Event (UTC-Z)
BEGIN:VEVENT
UID:test-z-2026-09-03@events.local
DTSTAMP:${DTSTAMP_Z}
DTSTART:20260903T200000Z
DTEND:20260903T210000Z
SUMMARY:Test Event - ISO 8601 with Z Notation
DESCRIPTION:Test event using ISO 8601 format with UTC Z notation.\n\nExpected time:\n- Z notation: 2026-09-03T20:00:00Z to 2026-09-03T21:00:00Z\n- Offset (equivalent): 2026-09-03T16:00:00-04:00 to 2026-09-03T17:00:00-04:00
LOCATION:Test Location
END:VEVENT
END:VCALENDAR
EOF2

echo "Test files created in /tmp/ics-test/"
echo ""
echo "=========================================="
echo "TEST 1: test_with_offset.ics"
echo "=========================================="
echo "Expected timing in event description:"
echo "  Offset: 2026-09-03T16:00:00-04:00 to 2026-09-03T17:00:00-04:00"
echo "  Z notation (UTC equiv): 2026-09-03T20:00:00Z to 2026-09-03T21:00:00Z"
echo ""
echo "Opening in Daylite..."
open -a Daylite /tmp/ics-test/test_with_offset.ics
echo "Press Enter after Daylite finishes importing (or close the import dialog)..."
read -r
echo "Opening in Calendar..."
open -a Calendar /tmp/ics-test/test_with_offset.ics
sleep 1

echo ""
echo "=========================================="
echo "TEST 2: test_with_z.ics"
echo "=========================================="
echo "Expected timing in event description:"
echo "  Z notation: 2026-09-03T20:00:00Z to 2026-09-03T21:00:00Z"
echo "  Offset (EDT equiv): 2026-09-03T16:00:00-04:00 to 2026-09-03T17:00:00-04:00"
echo ""
echo "Opening in Daylite..."
open -a Daylite /tmp/ics-test/test_with_z.ics
echo "Press Enter after Daylite finishes importing (or close the import dialog)..."
read -r
echo "Opening in Calendar..."
open -a Calendar /tmp/ics-test/test_with_z.ics
sleep 1

echo ""
echo "=========================================="
echo "Verification checklist:"
echo "=========================================="
echo "1. Both events should show same time (16:00-17:00 EDT)"
echo "2. Event descriptions should display expected times in both formats"
echo "3. No import errors in either app"
echo "4. Times consistent across Calendar.app and Daylite"
