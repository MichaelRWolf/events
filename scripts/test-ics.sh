#!/bin/bash
set -e

echo "Creating test .ics files for Calendar.app and Daylite compatibility..."
mkdir -p /tmp/ics-test

# Test with offset notation
cat > /tmp/ics-test/test_with_offset.ics <<'EOF'
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Michael Wolf//Event Calendar//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:Test Event (Offset)
BEGIN:VEVENT
UID:test-offset-2026-09-03@events.local
DTSTAMP:2026-09-02T20:17:17-04:00
DTSTART:2026-09-03T16:00:00-04:00
DTEND:2026-09-03T17:00:00-04:00
SUMMARY:Test Event - ISO 8601 with Offset
DESCRIPTION:Test event using ISO 8601 format with Eastern offset (-04:00)
LOCATION:Test Location
END:VEVENT
END:VCALENDAR
EOF

# Test with Z notation
cat > /tmp/ics-test/test_with_z.ics <<'EOF'
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Michael Wolf//Event Calendar//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:Test Event (UTC-Z)
BEGIN:VEVENT
UID:test-z-2026-09-03@events.local
DTSTAMP:20260902T201717Z
DTSTART:20260903T200000Z
DTEND:20260903T210000Z
SUMMARY:Test Event - ISO 8601 with Z Notation
DESCRIPTION:Test event using ISO 8601 format with UTC Z notation
LOCATION:Test Location
END:VEVENT
END:VCALENDAR
EOF

echo "Opening test_with_offset.ics in Daylite..."
open -a Daylite /tmp/ics-test/test_with_offset.ics

echo "Opening test_with_offset.ics in Calendar..."
open -a Calendar /tmp/ics-test/test_with_offset.ics

echo "Opening test_with_z.ics in Daylite..."
open -a Daylite /tmp/ics-test/test_with_z.ics

echo "Opening test_with_z.ics in Calendar..."
open -a Calendar /tmp/ics-test/test_with_z.ics

echo ""
echo "Test files created in /tmp/ics-test/"
echo "Verify both apps imported events correctly without errors."
