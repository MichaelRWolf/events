#!/bin/bash
set -e

echo "Creating test .ics files for Calendar.app and Daylite compatibility..."
mkdir -p /tmp/ics-test

# Generate fresh DTSTAMP (now, compact Z format) and event date (tomorrow)
DTSTAMP_Z=$(date -u +"%Y%m%dT%H%M%SZ")

# Calculate tomorrow's date for event start/end times
TOMORROW_Z=$(date -j -f "%Y-%m-%d" -v+1d "$(date +%Y-%m-%d)" +"%Y%m%d")
TOMORROW_HYPHEN="${TOMORROW_Z:0:4}-${TOMORROW_Z:4:2}-${TOMORROW_Z:6:2}"

# Use Z notation for actual timestamps (Daylite/Calendar don't support offset in DTSTART/DTEND)
EVENT_START_Z="${TOMORROW_Z}T200000Z"
EVENT_END_Z="${TOMORROW_Z}T210000Z"

# Reference formats for documentation
EVENT_START_OFFSET_COMPACT="${TOMORROW_Z}T160000-0400"
EVENT_END_OFFSET_COMPACT="${TOMORROW_Z}T170000-0400"
EVENT_START_OFFSET_EXTENDED="${TOMORROW_HYPHEN}T16:00:00-04:00"
EVENT_END_OFFSET_EXTENDED="${TOMORROW_HYPHEN}T17:00:00-04:00"

# Test with offset notation
cat > /tmp/ics-test/test_with_offset.ics <<EOF
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Michael Wolf//Event Calendar//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:Test Event (Offset)
BEGIN:VEVENT
UID:test-offset-${TOMORROW_Z}@events.local
DTSTAMP:${DTSTAMP_Z}
DTSTART:${EVENT_START_Z}
DTEND:${EVENT_END_Z}
SUMMARY:Test Event - ISO 8601 Offset Reference
DESCRIPTION:Reference: what offset notation would look like.\n\nOffset formats (for reference only):\n- Compact: ${EVENT_START_OFFSET_COMPACT} to ${EVENT_END_OFFSET_COMPACT}\n- Extended: ${EVENT_START_OFFSET_EXTENDED} to ${EVENT_END_OFFSET_EXTENDED}\n\nActual timestamps use Z notation:\n- Z notation: ${EVENT_START_Z} to ${EVENT_END_Z}
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
UID:test-z-${TOMORROW_Z}@events.local
DTSTAMP:${DTSTAMP_Z}
DTSTART:${EVENT_START_Z}
DTEND:${EVENT_END_Z}
SUMMARY:Test Event - ISO 8601 with Z Notation
DESCRIPTION:Test event using ISO 8601 format with UTC Z notation.\n\nExpected time:\n- Z notation: ${EVENT_START_Z} to ${EVENT_END_Z}\n- Offset (compact, EDT equiv): ${EVENT_START_OFFSET} to ${EVENT_END_OFFSET}\n- Offset (extended, EDT equiv): ${DISPLAY_START_OFFSET} to ${DISPLAY_END_OFFSET}
LOCATION:Test Location
END:VEVENT
END:VCALENDAR
EOF2

echo "Test files created in /tmp/ics-test/"
echo ""
echo "=========================================="
echo "TEST 1: test_with_offset.ics (offset notation reference)"
echo "=========================================="
echo ""
nl -ba /tmp/ics-test/test_with_offset.ics
echo ""
echo "Actual timestamps use Z notation: ${EVENT_START_Z} to ${EVENT_END_Z}"
echo "Reference formats documented in description:"
echo "  Offset (compact): ${EVENT_START_OFFSET_COMPACT} to ${EVENT_END_OFFSET_COMPACT}"
echo "  Offset (extended): ${EVENT_START_OFFSET_EXTENDED} to ${EVENT_END_OFFSET_EXTENDED}"
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
echo "TEST 2: test_with_z.ics (Z notation - UTC)"
echo "=========================================="
echo ""
nl -ba /tmp/ics-test/test_with_z.ics
echo ""
echo "Timestamps in Z notation: ${EVENT_START_Z} to ${EVENT_END_Z}"
echo "Equivalent in EDT offset format:"
echo "  Compact: ${EVENT_START_OFFSET_COMPACT} to ${EVENT_END_OFFSET_COMPACT}"
echo "  Extended: ${EVENT_START_OFFSET_EXTENDED} to ${EVENT_END_OFFSET_EXTENDED}"
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
echo "1. Both events should show same time (20:00-21:00 UTC = 16:00-17:00 EDT)"
echo "2. Both events should show tomorrow's date: ${TOMORROW_HYPHEN}"
echo "3. test_with_offset.ics description shows offset format reference"
echo "4. No import errors in either app"
echo "5. Times consistent across Calendar.app and Daylite"
echo "6. Both apps accept Z notation (Daylite/Calendar don't support offset in DTSTART/DTEND)"
echo "7. Events are easy to find and delete"
