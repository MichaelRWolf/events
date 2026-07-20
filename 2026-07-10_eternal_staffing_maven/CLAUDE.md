# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This directory captures notes, contacts, and follow-up from **Eternal Staffing Questions: How Many People? How Many Teams?** (Maven Lightning Lesson, July 10, 2026). Instructors Elisabeth Hendrickson and Joel Tosi demonstrated interactive simulations (DuckSimNG) showing Brook's Law and U-Curves at team (3-7) and organization (20-100) levels. Michael attended to explore team sizing dynamics and systems thinking approaches.

## Parent Repo

This directory lives inside the `Events` git repo at `/Users/michael/repos/Events/`. Pre-commit hooks are defined there and apply here.

### Checks

```bash
# From the Events repo root
pre-commit run --all-files

# Setup (first time after clone)
./scripts/setup
```

Hooks enforce: markdownlint (with auto-fix), markdown-table-formatter (column alignment), fix-ligatures/smartquotes/unicode-dashes on markdown, and a block on `.org` files.

## Files

| File                       | Purpose                                                  |
|----------------------------|----------------------------------------------------------|
| `notes.md`                 | Event summary, session takeaways, people list, follow-up |
| `Elisabeth_Hendrickson.md` | Background on co-instructor and prior work               |
| `Joel_Tosi.md`             | Background on co-instructor, DuckSimNG simulations, Dojo |
| `li_reply_to_joel.txt`     | Message sent to Joel via LinkedIn (connection accepted)  |

## Key Concepts Covered

- **Brook's Law** -- Adding manpower to late projects makes them later
- **U-Curves** -- Optimal team size trade-offs at individual team and organization level
- **Conway's Law** -- Org structure shapes system architecture
- **Shewhart Charts** -- Process control for measuring stability before improvement
- **DuckSimNG** -- Interactive simulations for understanding team dynamics

## Follow-Up Status

- [x] Review DuckSimNG simulations
- [x] Capture takeaways on team sizing trade-offs
- [x] Map U-Curves findings to current contexts
- [x] Connect with Joel Tosi (accepted July 14, 2026)
- [x] Follow Elisabeth Hendrickson on LinkedIn (July 14, 2026)
- [x] LinkedIn repost published (July 14, 2026)
- [x] Message to Joel in progress (li_reply_to_joel.txt)
