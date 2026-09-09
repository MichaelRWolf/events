# Calendar Invitation Guidelines

Guidelines for creating calendar events and `.ics` (iCalendar) files that work reliably across macOS Calendar.app and Daylite.

## Time Format: ISO 8601 with Eastern Offset (Preferred)

**Always use ISO 8601 format with Eastern US offset:**

```
2026-09-03T16:00:00-04:00  (EDT, roughly March–November)
2026-01-03T16:00:00-05:00  (EST, roughly November–March)
```

This format is self-documenting, timezone-aware, and removes the need for TZID or VTIMEZONE declarations. The offset captures the DST context at event time without external lookup tables.

**When a data format forbids offset notation** (rare), fall back to UTC with `Z` suffix:

```ics
DTSTART:20260903T200000Z
DTEND:20260903T210000Z
```

**Avoid TZID and VTIMEZONE entirely.** They are legacy complexity. ISO 8601 offset notation is sufficient and clearer.

### Title (SUMMARY)

Must be a single line. No escape sequences, no line breaks.

```ics
SUMMARY:ChatGPT Codex Under the Hood
```

### Details (DESCRIPTION) and Event Link

**If there is an online event URL** (e.g., Zoom link, LinkedIn event, etc.): Include it **both** in a separate `URL:` property **and** in the DESCRIPTION field, separated by a blank line.

Use RFC 5545 escape sequences for multi-line content: `\n` for line break, `\n\n` for blank line.

```ics
DESCRIPTION:George and David will discuss all things ChatGPT Codex, from there George will get "under the hood" and showcase some demos.\n\nhttps://www.linkedin.com/events/7497622989929316352/
URL:https://www.linkedin.com/events/7497622989929316352/
```

**Formatting:** URLs appear alone on final line(s) of DESCRIPTION with no decoration or prefix. No "Event:", "Link:", or other labels. Blank line (`\n\n`) separates URL from description body.

**Why:** RFC 5545 specifies `\n` escape sequences for semantic newlines in TEXT properties. Both Calendar.app and Daylite properly render `\n` sequences. Daylite does not display the `URL:` property field—it's a 2005-era limitation. Including the URL in DESCRIPTION ensures visibility in both apps. Calendar.app displays both the `URL:` field and the DESCRIPTION, so redundancy is acceptable and necessary for accessibility.

### Event Duration

Provide both start and end times:

```ics
DTSTART:2026-09-03T16:00:00-04:00
DTEND:2026-09-03T17:00:00-04:00
```

Do not use `DURATION` when both `DTSTART` and `DTEND` are present (RFC 5545 treats them as mutually exclusive; some parsers are strict).

### Recurring Events (RRULE)

For recurring events that span multiple months or years, **always use UTC Z notation** to sidestep DST ambiguity:

```ics
DTSTART:20260903T200000Z
DTEND:20260903T210000Z
RRULE:FREQ=WEEKLY;BYDAY=WE;COUNT=52
```

A single RRULE with all instances in UTC is unambiguous and portable. Calendar.app and Daylite will render each occurrence in your local timezone correctly on import.

### All-Day Events

All-day events use the `VALUE=DATE` format with no time or offset component:

```ics
DTSTART;VALUE=DATE:20260903
DTEND;VALUE=DATE:20260904
```

No timezone information needed.

### Non-Eastern Timezone Events

If an event is in a different timezone (Pacific, London, etc.), use that event's local offset, not Eastern:

```ics
DTSTART:2026-09-03T13:00:00-07:00  (Pacific Daylight Time)
DTEND:2026-09-03T14:00:00-07:00
```

Calendar.app and Daylite will display it correctly in your Eastern calendar. Keep the time self-documenting in its original timezone.

### Timestamp (DTSTAMP) — Always Fresh

Generate current time with offset every time you create or export the `.ics` file. **Do not hardcode or reuse old DTSTAMP values.**

```ics
DTSTAMP:2026-09-02T21:38:35-04:00
```

Generate with:
```bash
date +"%Y-%m-%dT%H:%M:%S%z" | sed 's/\([+-][0-9][0-9]\)\([0-9][0-9]\)$/\1:\2/'
```

**Why:** Calendar.app and Daylite use DTSTAMP to distinguish between different versions of the same event (identified by UID). Reusing an old DTSTAMP causes "invitation is out of date" rejection errors on reimport. Fresh DTSTAMP = reliable re-import behavior, no surprises.

## Minimal Valid VEVENT

```ics
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//Michael Wolf//Event Calendar//EN
CALSCALE:GREGORIAN
METHOD:PUBLISH
X-WR-CALNAME:Event Title
BEGIN:VEVENT
UID:2026-09-03-unique-id@events.local
DTSTAMP:2026-09-02T20:17:17-04:00
DTSTART:2026-09-03T16:00:00-04:00
DTEND:2026-09-03T17:00:00-04:00
SUMMARY:Event Title
DESCRIPTION:Event description and details on a single line
LOCATION:Online or location
URL:https://example.com/event
END:VEVENT
END:VCALENDAR
```

Generate `DTSTAMP` dynamically with offset: `date +"%Y-%m-%dT%H:%M:%S%z" | sed 's/\([+-][0-9][0-9]\)\([0-9][0-9]\)$/\1:\2/'`

## Testing

Verify that both Calendar.app and Daylite accept `.ics` files with offset notation and Z notation without errors.

**Automated test:**

```bash
make test-ics
```

This creates test events with both formats, opens them in Calendar.app and Daylite, and prompts for manual verification. Both apps should import successfully without "No valid events" or format-related errors.

**Manual test:**

```bash
open -a Calendar event.ics
open -a Daylite event.ics
```

Both should import the event successfully without errors.

## Why This Approach?

ISO 8601 with offset notation is the modern, spec-compliant standard (RFC 5545). It eliminates:
- TZID/VTIMEZONE boilerplate (unmaintained, DST-fragile, error-prone)
- UTC conversion friction (offset visible at a glance)
- Calendar.app and Daylite both parse offset-based 8601 without issue

Both apps handle display and rendering independently—the `.ics` file is just data.
