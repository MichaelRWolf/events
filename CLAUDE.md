# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository tracks Michael's event attendance (conferences, meetups, webinars, workshops) and captures structured notes, contacts, and follow-up actions. Each event directory records sessions, speakers, attendees, and action items. The goal is to turn event learning into actionable follow-up--typically through LinkedIn outreach, tool research, or synthesis work that could lead to paid engagements.

## Repository Structure

Event directories follow the naming convention `YYYY-MM-DD_EventName`. Each event typically contains:

- `notes.md` -- Session summaries, key takeaways, speaker list, and synthesis
- `people.vcf` (optional) -- vCard 3.0 contact records for speakers/attendees
- `organizations.vcf` (optional) -- vCard 3.0 organization records
- `event.ics` (optional) -- Calendar events in iCalendar format
- Individual contact/background files (e.g., `SpeakerName.md`)
- Follow-up tracking files (e.g., `followup.md`, individual message files like `li_reply_to_joel.txt`)

Template files live at `YYYY-MM-DD_Template_Files_for_New_Event/` for reference when creating new events.

## Pre-Commit Hooks & Checks

Setup hooks after clone:

```bash
./scripts/setup
```

Run checks on all files:

```bash
pre-commit run --all-files
```

Update hook versions (maintainers only):

```bash
pre-commit autoupdate
```

### Enforced Checks

- **markdownlint** -- Enforces markdown style (auto-fix enabled)
  - `MD013` disabled (no line-length enforcement)
  - `MD060` disabled (table column style conflicts with markdown-table-formatter)
- **markdown-table-formatter** -- Auto-aligns table columns
- **fix-ligatures, fix-smartquotes, fix-unicode-dashes** -- Typographic fixes on markdown files
- **shellcheck** -- Validates shell scripts with `-x` flag
- **forbid org-mode files** -- Blocks `.org` files from being committed (24 pre-existing `.org` files are already committed and cannot be re-staged)

## Markdown Conventions

Per Michael's global preferences:

- **No hard-wrapped prose.** Write paragraphs as single long lines; the editor handles display wrapping via `visual-line-mode`
- **Structural elements keep line breaks**: list items, table rows, blockquotes, code blocks maintain intentional structure
- Table column alignment is handled automatically by `markdown-table-formatter`
- `markdownlint --fix --config ~/.markdownlint.json` fixes most issues

## vCard (VCF) Format

Contact files use vCard 3.0 format (`.vcf` extension). For organization cards, use the `X-ABShowAs:COMPANY` property to ensure Daylite treats them as company records. See existing event directories (e.g., `2026-05-14_GenAI_Day_7/`) for examples.

## iCalendar (ICS) Format

Calendar events use `.ics` format with timezone-aware timestamps (typically `TZID=America/New_York` unless the event specifies otherwise). Include the full-day umbrella event plus individual sessions.

## Event-Specific CLAUDE.md Files

Individual event directories may have their own `CLAUDE.md` files documenting event-specific goals, strategic intent, or file structure beyond the defaults. These override or extend the repo-level guidance.

## Follow-Up Tracking

After attending an event, use the `/event-prep-followup` skill to track follow-up status by phase:

- **prep** -- Pre-event research and preparation
- **attend** -- Notes during/after the event
- **follow-up** -- Action items, outreach, research
- **closed** -- Follow-up complete

Status is marked as ready/WIP/done on individual todo items. Event notes files typically have a "Follow-up" section with a checklist of TODOs.

## Important Rules

- **No `.org` files** -- Pre-commit hook will block them
- **Prose paragraphs are single lines** -- No manual line breaks for readability
- **Use templates** -- Copy from `YYYY-MM-DD_Template_Files_for_New_Event/` when starting new events
- **VCF/ICS files are precise** -- These integrate with calendar and contact managers; formatting matters
