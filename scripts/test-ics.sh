#!/bin/bash
set -e

echo "Creating test .ics files for Calendar.app and Daylite compatibility..."
mkdir -p /tmp/ics-test

# Generate fresh DTSTAMP (now, compact Z format) and event date (tomorrow)
DTSTAMP_Z=$(date -u +"%Y%m%dT%H%M%SZ")

# Calculate tomorrow's date for event start/end times
TOMORROW_Z=$(date -j -f "%Y-%m-%d" -v+1d "$(date +%Y-%m-%d)" +"%Y%m%d")
EVENT_START_Z="${TOMORROW_Z}T200000Z"
EVENT_END_Z="${TOMORROW_Z}T210000Z"

# Compact format with offset (no hyphens/colons in timestamp per RFC 5545)
# EDT offset is -0400 (compact), EST offset is -0500
EVENT_START_OFFSET="${TOMORROW_Z}T160000-0400"
EVENT_END_OFFSET="${TOMORROW_Z}T170000-0400"

# Extended format for display (human-readable)
DISPLAY_START_OFFSET="${TOMORROW_Z:0:4}-${TOMORROW_Z:4:2}-${TOMORROW_Z:6:2}T16:00:00-04:00"
DISPLAY_END_OFFSET="${TOMORROW_Z:0:4}-${TOMORROW_Z:4:2}-${TOMORROW_Z:6:2}T17:00:00-04:00"

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
DTSTART:${EVENT_START_OFFSET}
DTEND:${EVENT_END_OFFSET}
SUMMARY:Test Event - ISO 8601 with Offset
DESCRIPTION:Test event using ISO 8601 format with Eastern offset.\n\nExpected time:\n- Offset (compact): ${EVENT_START_OFFSET} to ${EVENT_END_OFFSET}\n- Offset (extended): ${DISPLAY_START_OFFSET} to ${DISPLAY_END_OFFSET}\n- Z notation (equivalent): ${EVENT_START_Z} to ${EVENT_END_Z}
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
echo "TEST 1: test_with_offset.ics"
echo "=========================================="
echo "Expected timing in event description:"
echo "  Offset (compact): ${EVENT_START_OFFSET} to ${EVENT_END_OFFSET}"
echo "  Offset (extended): ${DISPLAY_START_OFFSET} to ${DISPLAY_END_OFFSET}"
echo "  Z notation (UTC equiv): ${EVENT_START_Z} to ${EVENT_END_Z}"
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
echo "  Z notation: ${EVENT_START_Z} to ${EVENT_END_Z}"
echo "  Offset (compact, EDT equiv): ${EVENT_START_OFFSET} to ${EVENT_END_OFFSET}"
echo "  Offset (extended, EDT equiv): ${DISPLAY_START_OFFSET} to ${DISPLAY_END_OFFSET}"
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
echo "2. Both events should show tomorrow's date: ${TOMORROW_Z:0:4}-${TOMORROW_Z:4:2}-${TOMORROW_Z:6:2}"
echo "3. Event descriptions display times in all three formats (compact offset, extended offset, Z)"
echo "4. No import errors in either app"
echo "5. Times consistent across Calendar.app and Daylite"
echo "6. Events are easy to find and delete"
