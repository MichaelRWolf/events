# Research: git-ai

Related: [research.md](research.md) | [Running session: 11:45 Aidan Cunniffe](session_notes.md#1145---building-when-code-is-cheap-and-your-time-is-not---aidan-cunniffe)

## What it is

- Open-source CLI that tracks which lines of code an AI agent wrote, and follows them through commits, rebases, and squashes.
- Works as a wrapper around git. Agents record checkpoints before they write, and those are condensed into authorship data on commit.
- Tools: `git-ai blame` (blame with AI attribution per line) and `git-ai stats` (human vs. AI share of a commit).
- Hooks connect Claude Code, Cursor, and GitHub Copilot.
- Limit: it only sees edits from agents it has hooks for. It does not infer AI authorship from code after the fact.

## History

- July 4, 2025: Aidan Cunniffe and Sasha Varlamov start it to test whether coding agents make them more productive.
- November 2025: 1.0 release.
- Fall 2025: history presented at AI-Native DevCon.
- Next Element formed to fund development and serve enterprise users.
- Recent reports say the founders joined OpenAI, and the site carries a banner saying Git AI is part of OpenAI. Unconfirmed: whether OpenAI acquired the project or whether the repo will move.

## Good for now

- Measuring how much of a codebase is AI-written, across the whole SDLC.
- Enterprise rollout of AI code tracking across engineering teams.
- Learning from the data: better prompting, preparing codebases for agents, finding where agents help.

## Goal

"Track AI code all the way to production." Tracking has to work at the git level, because OpenTelemetry and vendor analytics don't show what was committed and survived.

## Open questions

- Confirm the OpenAI status and whether the repo or license changes.
- Licensing: one source says Apache 2.0, another says MIT. Check the LICENSE file.
- Confirm the AI-Native DevCon Fall 2025 talk details. The talk itself was not retrieved.

## Sources

- [usegitai.com/about](https://usegitai.com/about)
- [How Git AI works](https://usegitai.com/docs/cli/how-git-ai-works)
- [AI blame docs](https://usegitai.com/docs/cli/ai-blame)
- [OpenAI hires Git AI (The New Stack)](https://thenewstack.io/openai-hires-git-ai/)
- [OpenAI Welcomes the Git AI Team (AI Catchup)](https://aicatchup.com/news/openai-welcomes-git-ai-agent-attribution)
