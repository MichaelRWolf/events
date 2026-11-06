# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Event Folder

This folder holds Michael's notes for Open Space on November 6, 2026. Event notes live in `event_notes.md`. The schedule grid and live notes live in `session_notes.md`. People, sessions, and organizations live in `people.md`, `sessions.md`, and `organizations.md`. Screenshots live in `images/`. Times are Eastern.

The schedule is one line per session at the top of `session_notes.md`, in the form `HH:MM - Track - Speaker - Title`, using 24-hour times. The newest schedule image is the source of truth; when it conflicts with the schedule lines, update the lines to match the image.

There is no build, lint, or test tooling here beyond the repo-level pre-commit checks in `../CLAUDE.md`.

## Commands

- **take notes**: enter note-taking mode for the rest of the conversation. Each of Michael's messages is appended to `session_notes.md` under the current session heading, as one `HH:MM:SS - <text>` line, and is not answered. Every reply in this mode is exactly `✏️ Taking notes...` and nothing else. If a new conversation starts, the mode is off until "take notes" is said again.
- **stop taking notes**: leave note-taking mode and answer normally.
- **end session**: commit all changes in this folder. Commit subject is `End session - <name> - <time>`, where `<name>` is the speaker of the current session heading in `session_notes.md` and `<time>` is that heading's start time as `HH:MM`. Commit body is bullets for other relevant details, such as files changed and events covered. Pre-commit hooks must run; a hook failure is reported, not bypassed.

## Note Format

- Session headings: `## HH:MM - Track - Speaker`, with the session title on the line below the heading. Add a heading for each session Michael attends. An entry goes under the latest heading whose start time is at or before the entry's time. Entries before the first heading go above it.
- Photos of a video grid or chat: after the photo's log line, add a `Names on the grid:` line with the participant names read from the tile labels. End the line with a `Partly visible label:` sentence for any cut-off labels.
- Names are taken from the tile labels as shown. Mark unclear or cut-off labels as partly visible rather than guessing.
- Pasted images: save each one in `images/` as `photos_YYYYMMDD-HHMMSS.png`, using the paste time. Log it as one line under the heading whose start time is at or before the paste time: `HH:MM:SS - ![alt text](images/photos_YYYYMMDD-HHMMSS.png)`. Alt text describes what is visible; do not name a person unless the name is confirmed.
- Keep the wording as written. Do not correct or modify entries.
- Markdown hook: write angle-bracket text such as `<pause>` as `(pause)`. Bare `<tag>` text is read as inline HTML, which fails the markdownlint hook (MD033) and blocks the commit.
- A note-taking agent only logs. It does not answer the prompts it records. Role rules bind only the agent that has taken the role; the default Claude instance answers prompts normally.
