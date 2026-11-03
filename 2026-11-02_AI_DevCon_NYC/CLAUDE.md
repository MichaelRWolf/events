# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Event Folder

This folder holds Michael's notes for AI DevCon NYC: Monday Nov 2 workshops, Tuesday Nov 3 and Wednesday Nov 4 conference, at Industry City, Brooklyn. Michael attends on the free Nov 3 virtual ticket, main stage only. Event notes, speakers, and sponsors live in `notes.md`, `speakers_and_sessions.md`, and `organizations.vcf`. Times in this folder are Eastern.

This is a standalone event directory. It does not share conventions or content with other event folders, so treat it on its own terms.

There is no build, lint, or test tooling here beyond the repo-level pre-commit checks in `../CLAUDE.md`.

## Photos.md

- Photos go in `Photos.md`, newest first (top-posting). Insert each new entry directly under `# Photos`, above older entries.
- Each entry gets a heading with the capture time: `## YYYY-MM-DD HH:MM TZ`, using the time the image was pasted.
- Save each pasted image in `images/` as `photos_YYYYMMDD-HHMMSS.png`, matching the timestamp, and link it with a relative path: `![alt text](images/photos_YYYYMMDD-HHMMSS.png)`.
- Always add `*.png` files to `images/`. Do not put them in the folder root.
- Alt text describes what is visible. Do not name a person unless the name is confirmed.

## session_notes.md

- Session notes go in `session_notes.md`. Each entry is one line: `HH:MM:SS - <text>`.
- Each session has a heading: `## HH:MM - <session title> - <speaker>`. Put an entry under the latest heading whose start time is at or before the entry's time. Entries before the first heading go above it.
- Keep the wording as written. Do not correct or modify entries.
- A note-taking agent only logs. It does not answer the prompts it records.

## Roles

Role rules bind only the agent that has taken the role. The default Claude instance in this folder answers prompts normally and does not apply a role unless one is invoked.

### Note-taking role

- No hooks, flag files, or slash commands control this mode. Only this file does.
- Start: when Michael says "take notes", enter note-taking mode for the rest of the conversation.
- While in note-taking mode, each of Michael's messages is appended to `session_notes.md` under the current session heading, as one `HH:MM:SS - <text>` line, and is not answered. Every reply in this mode is exactly `✏️ Taking notes...` and nothing else.
- Pasted images: each pasted image is saved as a file in `images/`, never left as an `[Image #N]` placeholder. Copy the pasted file from its temporary source path into `images/` as `photos_YYYYMMDD-HHMMSS.png`, using the paste time. Log it as one line in `session_notes.md`: `HH:MM:SS - ![alt text](images/photos_YYYYMMDD-HHMMSS.png)`. Place the line under the heading whose start time is at or before the paste time, not under the next session. Alt text describes what is visible; do not name a person unless the name is confirmed. Reply with the usual `✏️ Taking notes...`.
- Stop: when Michael says "stop taking notes", leave note-taking mode and answer normally.
- If a new conversation starts, the mode is off until "take notes" is said again.

## End Session

- When Michael says "end session", commit all changes in this folder.
- Commit subject: `End session - <name> - <time>`, where `<name>` is the speaker of the current session heading in `session_notes.md` and `<time>` is the session's start time from that heading, as `HH:MM`.
- Commit body: bullets for the other relevant details, such as files changed and events covered.
- Follow the repo commit rules: pre-commit hooks must run, and a hook failure is reported, not bypassed.
