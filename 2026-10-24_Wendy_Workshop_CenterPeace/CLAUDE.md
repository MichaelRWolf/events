# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Scope

This directory holds prep, notes, and follow-up for one event: the Wendy workshop at CenterPeace on 2026-10-24. It is a notes directory, not a code project. The parent `/Users/michael/repos/events/CLAUDE.md` applies here: markdown rules, the pre-commit hooks, no `.org` files, and VCF/ICS format rules. This file adds event-specific rules.

## Commands

No build, test, or run commands. Markdown checks only:

```bash
markdownlint --fix --config ~/.markdownlint.json 2026-10-24_Wendy_Workshop_CenterPeace/<file>.md
```

Run from `/Users/michael/repos/events`. The directory is currently untracked (`?? 2026-10-24_Wendy_Workshop_CenterPeace/`), so the repo's `pre-commit run --all-files` does not cover it until it is staged.

## File Roles

- `GrandSummary.md`: the main synthesis from the 2026-10-25 debrief. Read this first. It holds the decisions, open questions, and task list.
- `notes.md`: the event template, only partly filled. Session sections and the links block are still empty.
- `retro_notes.md`: what went well and what to change, from the same debrief.
- `future_marketing.md`: audience, voice, and sample lines for future marketing.
- `todo.md`: three open items from the live note.
- `followup.md`: a draft template for outreach messages and next actions. Messages use `{Name}` placeholders.
- `people.md`: contact list. Public-safe only.
- `transcript.md`, `wendy-michael-transcript-2026-10-25.md`: auto-generated transcripts. Private.
- `mkchael_notes.md`, `mkchael_notes.md~`: stray scratch and backup file. Do not treat as content.

## Rules for This Event

- Transcripts are auto-transcribed. Speaker labels are unreliable: every line carries the mic owner's name, even when someone else spoke. Names and wording are often garbled. Verify before quoting or acting on them.
- Do not hand-edit `transcript.md`. Its header says the next sync overwrites it.
- Never commit `transcript.md` or `wendy-michael-transcript-2026-10-25.md`. The summary says to commit the event directory without `transcript.md`; apply the same exclusion to the second transcript.
- Keep `people.md` and any shared follow-up text public-safe: names and public links only. Put contact details in a file whose name ends in `_private`.
- "Dr. Bell" is deliberately unidentified in the notes. Do not add his identity to any file or draft.
- Quotes (Kerouac, John Denver "Calypso") are from memory. Mark them unverified until checked against the source. Do not present them as exact.
- Treat items marked "(my read)" in the summaries as interpretation, not the user's words.
- Do not delete or rename `mkchael_notes.md` or `mkchael_notes.md~` without asking. The summary lists this as a to-do for the user to decide.
- Do not commit or push without an explicit command from the user.
