# Session Notes

## 09:20 - Building a software factory you can trust. - Guy Podjarny

09:21:04 - Is this the best model for this task? I don't need lots of thinking... just capture notes. Prompt with "Next session note?..."

09:21:44 - ![Slide reading "Next up: AI DevCon London", 7 to 8 June 2027, London and virtual, with a luma.com link](images/photos_20261103-092148.png)

09:21:53 - ![Slide reading "Next up: AI DevCon London", 7 to 8 June 2027, London and virtual, with a luma.com link](images/photos_20261103-092159.png)

## 09:22 - Announcements - Simon Maple

09:23:09 - 9:22 - "Introduce my boss -- Guy Po". Founder of Tessl. Previously snyk. Previously Blaze. Guy Podjarny.

09:23:51 - That was Simon doing announcements.

09:24:34 - Is there a better format for capturing my notes as though it is a livestream? If so do that. But for now.... stage and commit with message "Beginning of Keynote - Guy Po"

09:26:02 - ![Speaker at a podium on a dark stage, with partial projected slide text behind him](images/photos_20261103-092607.png)

09:26:43 - Concerns: Quality (is it slop). Cost (will it cost a fortune). Safety (will it break things)

09:26:58 - Try commit again

09:27:15 - fix it

09:27:27 - stage and commit

09:29:26 - Factories are like work as we know it.... Skills. Loops. Factory. -- Trust is important. Getting one you can understand is better. Skills. Triggers. Compose.

09:32:16 - Stages. Skills. Tools. Context. Infrastructure (sandbox, telemetry. Automated vulnerability remediation. Black October. PHP2SHELL. LLMs on both sides. W/in 2 hours of disclosure, 100,000 attacks.

09:34:22 - Just Fix It -- works 26% fix (and no break) rate. Banks are worse. Need better process. Find -> Fix -> Verify fix -> Verify behavior -> Review -> Merge. Feedback loop on missing requirements. Tell the AI what you really wanted them to do.

09:35:14 - "Finds lots of vulnerabilities at an incredible cost" -- Major bank

09:39:10 - Verifiers - Trust (SKILL.md) but Verify

09:40:11 - If I add images here, timestamp them like a text note. ![Keynote slide titled "What is a loop?" listing Skill, Environment, and Trigger / schedule, beside a speaker at a podium](images/photos_20261103-094011.png)

09:41:00 - Self improving loops ![Keynote slide titled "What is a loop?" with Skill, Environment, and Trigger / schedule feeding a Sandbox run, then Output and Logs, with a "Learn & Improve" loop back](images/photos_20261103-094100.png)

09:43:18 - Sponsors -- ![Row of sponsor logos on a black background, including Tessl, MLH, LaunchDarkly, snyk, CodeRabbit, AUTONOMY AI, port, Cockroach Labs, dash0, and Codeplain](images/photos_20261103-094324.png)

09:43:57 - Self-optomizing loops are critical, not add-on. Extract truth from observation. "What do you want for your birthday?" versus watch for a few years. Get truth first, then optomize. Keep them current. Maintenance.

09:44:14 - Factory is sum of skill + loops.

09:45:40 - Factory is 3 things: ![Keynote slide "Building Skills & Loops into Factories" with panels for Reusable Infra & Modules, Factory Operations UX, and Business Outcomes (13m 32s ticket to PR, 330 PRs per week, $13 cost per PR, 2 hours vuln fix time)](images/photos_20261103-094540.png) Reusable Infra & Modules. Factory Operations UX. Business Outcomes.

09:46:46 - "You are not building a factory. You are building a product.". Reminds me of Tesla "Build the X that builds the X". (Look up this quote from Elon Musk.

09:48:49 - Build the factory that builds the product. ![Keynote slide "Committing to your factory" showing four stages: Local skills, Shared skills, Loops, Factory, with the caption "Final transformation: No more interactive development"](images/photos_20261103-094849.png) Don't interactively fix the product. Fix the factory. <-- Guy. This feelsa lot like how I think.

09:52:19 - Buy vs Build ![Keynote slide "Why buy when you can build it all?" with three points: Shared learning, Curation & taste, Excellence & Efficiency](images/photos_20261103-095219.png). But "Embrace a partner because it delights you".

09:54:20 - Fun brag -- What Tessl delivered yesterday. Tickets -> PR. Where requirments? Where tickets? Kicks off loops. Factory floor view is exciting. Metrics build up. Pre-made loops (i.e. fixing vulnerabilities). "Get a little bit of delight".

09:55:22 - ![Tessl promo slide "Start with up to $500 in Tessl credits," with $500 for in-person AI DevCon attendees, $200 for virtual attendees, and a tessl.io/signup QR code](images/photos_20261103-095525.png)

09:55:26 - ![Tessl promo slide "Start with up to $500 in Tessl credits." listing $500 for in-person AI DevCon attendees and $200 for virtual attendees, with a tessl.io/signup QR code](images/photos_20261103-095526.png) $500/in-person, $200/virtual.

09:55:44 - Summary: Skills -> Loops -> Factories. Lay back and let facgories do loops.

09:56:52 - stage, commit, push -- End of keynote. Simon leaves main stage.

Elon Musk quotes (OCR of [Image #7], a search-summary screenshot; not verified against the original sources):

- "The factory is the product." Musk formally tweeted this exact five-word phrase on Elon Musk's Official X Account in January 2021. (Source per screenshot: X post, unverified.)
- "We realized that the true problem... is building the machine that makes the machine. In other words, it's building the factory. I'm really thinking of the factory like a product." Musk explained this during a June 2016 Tesla press conference about the expansion of Gigafactory 1. (Source per screenshot: 2016 press conference, unverified.)

09:58:21 - [Image #7] -- And do OCR to add Elon quotes to end of Keynote (Guy Po) session. commit and push

10:04:20 - My take-aways from keynote. Build skills, loops, factories. It's how I've always worked. Learn. Play/experiment. Notice patterns. Optomize automatable parts. Scale (if needed). 2) Factory is the product. Feels like how I process data munging. Focus on the filters, automate them, rerun when they chage. Don't change data. Change filters.

## 10:05 - Context != Context: One Window, Different Lifecycles - Birgitta Boeckeler

10:05:51 - Start Brigita Beckler - Deeper cut on context engineering. It's 10:05. Readjust session_notes headers to get the right speaker and title. Future notes go in the 10:05 session of @session_notes.md

10:06:40 - ![Speaker standing on a dark stage in a plaid shirt, with a projected slide titled "What is 'context'" and a "window: 36% left (171k" counter](images/photos_20261103-100640.png)

10:07:12 - ![Speaker standing on a dark stage in a plaid shirt, with a projected slide titled "What is 'context'" and a "window: 36% left (171k" counter](images/photos_20261103-100640.png)

10:07:51 - stage. commit. "Correct the main stage agenda" is good starter message.

10:08:06 - ![Slide titled "Context window" with inputs AGENTS.md, SKILL.md, Wiki, and gh feeding Always use / Never do, Spec workflow, Past decision history, and Repo search; Slack, docs/architecture.md, and Task / intent / specification also feed in](images/photos_20261103-100806.png)

10:08:41 - Different colored ![Slide titled "Context window" in dark and purple tags, with AGENTS.md, SKILL.md, Wiki, and gh feeding Always use / Never do, Spec workflow, Past decision history, and Repo search; Slack, docs/architecture.md, and Task / intent / specification also feed in](images/photos_20261103-100841.png)

10:09:03 - ![Two comparison cards. Left, purple tags AGENTS.md, SKILL.md, docs/arch.md: "Deliberately authored", "Versioned (and tested)". Right, dark tags Wiki, Slack, gh: "Assembled at task time", "Connects agent to the environment"](images/photos_20261103-100903.png)

10:10:33 - Purple is deliberate. Black is ephemeral. Both are context. LHS is reusable - conventions, norms. RHS - custom, volitile.

10:10:51 - LHS Codified. RHS Ambient.

10:13:58 - ![Slide titled "The Context delivery life cycle" with a "Codified" tag, showing a cycle of Generate, Distribute, Observe, Evaluate beside a video still titled "Context is the New Code", and four boxes: Generate (how to write skills), Evaluate (skill evals), Distribute (skill registries, plugins, descriptions), Observe (analyse agent traces, learn from errors)](images/photos_20261103-101358.png)

10:14:31 - somebody dew-bwah.

10:15:52 - To evaluate and observe, we need to know what good looks like. Quote ACM article. Forsgren. ![Slide titled "The goal: High quality context" with an ACM Queue research article card, "CAFE(S): Your Agent Is Only As Good As Its Context", beside five tiles: C Clarity, A Actionability, F Fidelity, E Efficiency, and S Security](images/photos_20261103-101552.png) Clarity. Actionability. Fidelity. Efficiency. Security.

10:17:37 - We're doing this now via MCP servers.

10:18:52 - open the *.app link so I can see the main stage list of speakers and times

10:19:29 - Recently moved to Canada to join "Unblocked" company. ![Schedule app card marked NOW for 10:05 to 10:35, TALK, "Context != Context: One Window, Different Lifecycles" by Birgitta Boeckeler, room 52A](images/photos_20261103-101929.png)

10:20:34 - Add. Do not correct or modify. I'll make it consistent tomorrow.

10:21:03 - Add <https://www.linkedin.com/in/birgittaboeckeler/> to Birgitta Boeckler in the people table.

10:21:11 - <https://www.linkedin.com/in/birgittaboeckeler/>

10:22:57 - What are gold documents? What are gold answers?

10:24:23 - Agent is answering my questins. It should be LOGGING my comments. How to flip/flop between logging mode and interaction mode?

10:26:09 - Stay in log mode. Fuck the /log/chat custom shit.

10:26:17 - Stay in log mode. Fuck the /log/chat custom shit.

10:27:31 - Take-away -- This is classical meta-cognition. Thinking about thinking. What do systems know? How can they act? How do they interact. Think. Learn. Tune it.

10:29:04 - How to deliver *ambient* content? Some say it's hard. But it's engineering broken down to small pieces.

10:30:40 - Add guidance to CLAUDE.md for a note-taking feature that logs user text with timestamp but does not submit it to claude as a prompt. Suggest a way for a new agent to take this role.

10:31:14 - Add guidance to CLAUDE.md for a note-taking feature that logs user text with timestamp but does not submit it to claude as a prompt. Suggest a way for a new agent to take this role.

10:32:44 - What does this mean? [Image #1]

10:33:16 - What should we do. Ask questions. Think outloud. Maybe in slack so agent and people can BOTH see it.

10:33:20 - What does this mean? [Image #1]

10:33:50 - I'm stuck in a loop. How to prevent this? [Image #2]

10:34:01 - I'm stuck in a loop. How to prevent this? [Image #2]

## 10:35 - ☕ Coffee Break

10:53:44 - We are on a break.  It is 10:53.

11:00:55 - We are still on a coffee break

## 11:05 - Models Alone Aren't Enough: Engineering Context as a Graph for Human + Agent Teams - Alan Braun

11:08:23 - ![Schedule app card marked NOW for 11:05 to 11:35, TALK, "Models Alone Aren't Enough: Engineering Context as a Graph for Human + Agent Teams" by Alan Braun, room 52A](images/photos_20261103-110823.png)

11:12:14 - Work is a team sport.

11:13:20 - Working team-to-team is difficult.  Now we're doing team-to-agent.  Agent-to-agent.  How to build context for all?[Image #1]

11:15:19 - Code building was long pole in the tent. Plan and Review where short.  Execute is shorter.  Are we releasing faster?  :-)  What silent "tax" is being added?  Lots more review!  Optomize Plan/Execute/Review should optomize for all stages, not just execute.

11:16:11 - [Image #2] [Image #3]

11:17:15 - We'll shorten iff we cut review.  Get faster delivery, not just faster execution.

11:19:41 - Context stack.  Since execution is shorter, we can spend more time up front on specs.  [Image #4]  The **org-wide** context gives a big payback (especilly for product guy).  Seems easy at Jira work item.  (Will he point to Jira Align to show higher connection?)  Misconnections (e.g. marketing/dev not shared).

11:20:53 - [Image #5]  Product hype.  20 years of learning how people/teams/orgs really operate.  [Image #6]

11:21:09 - <https://www.youtube.com/live/kPB9y6ZWXxk>

11:26:04 - MCP connectors are helpful to get the right info.  Time for a video.  Claude (LHS without context.  With context.)  [Image #7]

11:27:14 - [Image #8]

11:28:28 - TWG - Teamwork Graph?

11:32:05 - With TWG, up front context gathering starts slower, but eventually it gets better answer at smaller cost.  48% less tokens.  44% better answers.[Image #9]

11:33:38 - Old school.   Write out inputs, outputs, have blind LLM be the judge.

11:34:55 - ![Slide with five numbered steps on a dark background: 1 Link the work, 2 Write down ownership, 3 Write down decisions, 4 Connect 3 to 5 sources over MCP, not 15, 5 Write one context skill](images/photos_20261103-113455.png)

11:35:31 - More context is not better.  Connected context IS.

11:42:44 - Next session is Aidan.  We're on break.

## 11:45 - Building When Code is Cheap and Your Time is Not - Aidan Cunniffe

11:46:50 - Aiden started git.ai at this conference.  OpenAI bought it 1 month ago.  TY to all who picked up project.

11:46:50 - ![Conference slide titled "Building when code is cheap" with speaker Aidan Cunniffe, Member of Product Staff, OpenAI, and a headshot](images/photos_20261103-114650.png)

11:47:02 - ![Slide with the heading "Alt title:" and the text "🚨🚨 the software factory is inside the house!" beside colorful geometric shapes](images/photos_20261103-114702.png)

11:47:12 - ![Speaker in a denim shirt and lanyard holding a microphone on stage, beside a screen partly reading "servation #1" and "are built and deployed differently"](images/photos_20261103-114712.png)

11:47:29 - Citizen devs are living in the future.

11:48:04 - Auth is outside the app (at another layer).

11:49:14 - Cloud Agent + Dev Environments  != OOTB (Out Of THe Box) Factory

11:49:14 - ![Slide titled "Observation #2" reading "We got Cloud Agents / Dev Environments" and "...still no OOTB software factory"](images/photos_20261103-114914.png)

11:49:27 - ![Slide titled "Observation #3" reading "Code Review is still the bottleneck."](images/photos_20261103-114927.png)

11:40:55 - ![Schedule app card marked NEXT for 11:45 to 12:15, TALK, "Building When Code is Cheap and Your Time is Not" by Aidan Cunniffe, room 52A](images/photos_20261103-114055.png)

11:51:15 - Step back.  What is goal of SW Factory?  (He talks to lots of CTOs)  Follow-up.

11:51:45 -- Goals.   F/U - Review this!!!

11:51:45 - ![Slide titled "Goals of the Software Factory" listing: faster time to market; do more, take bets that never made sense; enable non-technical roles (PMs, designers, the CTO, etc) to contribute code safely; give agents the grunt work (patches, upgrades, etc)](images/photos_20261103-115145.png)

11:52:27 - LHS done.  RHS needs work.  HOW is being built.  WHAT could use some attention (i.e. opportunity)

11:52:27 - ![Two-column slide. Left, labeled HOW, "Dev Infra": Cloud Agents, Dev Environments, Code Review Agents, Incident Response Agents, Skills, @mention @assign triggers. Right, labeled WHAT, "App Platform": Libraries, Design Systems, Workflow Engines, Data access + query layer, AuthN + AuthZ, Audit Logging](images/photos_20261103-115227.png)

11:52:59 - Refactoring got cheaper.  Abstractions got cheaper.

11:53:54 - He's building the library first.  Design-first development.  This gets faster time to market.

11:54:45 - Take more (smaller) bets --

11:54:45 - ![Line chart over time, black background. A green "Build platforms" curve starts high, drops steeply, then flattens low. An orange "Slop cannon" curve starts low and rises slowly. The curves cross early on.](images/photos_20261103-115445.png)

11:55:48 - Big Tech built platforms -

11:55:48 - ![Slide titled "Big tech builds internal platforms" showing Google Zanzibar (authorization), Meta TAO (social graph), Uber Michelangelo (machine learning), Netflix EVCache (distributed caching), and LinkedIn Kafka (event streaming)](images/photos_20261103-115548.png)

11:59:42 - Enable non-technical roles to contribute code.

12:02:00 - Amazon's 2002 API mandate.  ... or you will be fired.   Didn't have time to do it then.  THinks it will become way of working.

12:02:27 - Maybe factory is the interfaces we've been making along the way.

12:02:34 - TODO - git.ai

12:03:52 - <https://www.linkedin.com/in/acunniffe/>

12:05:47 - Takeaway - Citizen deveoper is living in the future.  Look for ways to support them.

## 12:25 - Building a harness that keeps up with the latest models - Nicolas Carmont Zaragoza

12:27:13 - [Image #1]

12:27:43 - [Image #2]

12:28:05 - [Image #3]

12:29:31 - Not taking is broken.

12:31:13 - Notes are working for text.

12:31:31 - ![Speaker at a podium holding a microphone and gesturing on a dark stage, with a projected slide behind him reading "Hard to tell which model..." and "Harness", beside a conference podium marked aiDevCon](images/photos_20261103-123131.png)

12:32:13 - ![Schedule app card marked NOW for 12:25 to 12:55, TALK, "Building a harness that keeps up with the latest models" by Nicolas Carmont Zaragoza, room 52A](images/photos_20261103-123213.png)

12:35:55 - Problem -- Verify was mentioned all over the place.  Opus starts focusing on verification.  Makes old guidance to be duplicated now.  Makes iti cheaper once de-duped.

12:37:29 - As models advance, old habits are inhibiting.  Bit rot is faster.  It's about harness, not the code itself.

12:38:48 - Model bakes in best practices.  Can prune to 20% of previous prompt.  Manager should say WHAT and let employee do HOW.  Unharness!

12:40:45 - Verbosity increases contradictions.  KISS.  Transcripts are wasted on which to obey (e.g. running full tests).  CLAUDE.md and AGENT.md files can be (surprisingly) lean.

12:41:00 - ![Slide titled "02 · Un-harnessing" reading "Six published changes. All of them: simplify." with a table of six rows, each crossing out an old practice and replacing it: explicit rules for every case to let the model use its judgement, examples of how to use tools to design the tools and interfaces, load all context up front to load context when needed, explicit verification instructions to remove them since the model self-checks, "Think carefully" in a chat system prompt to let effort control thinking, and keep last model's effort setting to re-sweep effort per model](images/photos_20261103-124100.png)

12:41:33 - Examples may be helpful.  They may also be biasing.

12:45:30 - Add loop to prune.  Like refactoring.  Get it right; get it small.   Look for "/goal"

12:45:30 - ![Slide titled "Unharnessing SDLC: Un-harness, re-baseline, re-harness, ship" with four numbered steps: 1 Un-harness, 2 Re-baseline (run your evals, sweep effort levels, track cost and latency), 3 Re-harness (add what the new model can now see, like a checklist or time budget), 4 Ship (once evals hold), with a bar reading "Revise your evals every loop", "Read the transcripts", and "Repeat at every model launch"](images/photos_20261103-124530.png)

12:46:38 - "We are in an era where intelligance scales".

12:46:38 - ![Slide titled "03 · The loop · Re-baseline" reading "Evals let you move to a new model in days, not weeks." with a box reading "Start small: 20-50 tasks from real failures" and three points: grade the outcome, not the steps; track cost and latency, not only pass rate; read the transcripts](images/photos_20261103-124638.png)

12:47:24 - Outcomes, not steps.

12:47:38 - Read the transcripts.  Models vent when goal is impossible.

12:48:15 - ![Slide titled "03 · The loop · Worked example" reading "Opus 5 → Opus 5.5" with a note that existing Claude Opus 5 prompts should perform well without changes, so the list is optional tuning. A Remove panel lists "Remove instructions that stood in for thinking", "Think carefully" lines in chat system prompts, and scaffolding for visual inputs if a re-test shows you no longer need it. An Add panel lists a checklist the model updates on long runs, a time budget for multi-agent work if you can estimate one, and enough max_tokens for thinking and the reply](images/photos_20261103-124815.png)

12:50:16 - 1. How would you test correctness after removing 80% of prompt (like Claude did).  3 - Adding ability to vent was helpful (by reading transcripts)

12:50:16 - ![Slide titled "03 · The loop · Work in progress" reading "3 questions I ask:" with three cards: 01 How efficiently can I A/B test a harness change? 02 Which parts of my harness are temporary? 03 What are the model transcripts saying about your eval and harness? Footer quote: "we ran more ablations (removing lines from the system prompt to understand the impact of each line)" - Anthropic Engineering, Apr 2026](images/photos_20261103-125016.png)

12:51:24 - Takeaway - POV (scientist vs engineering).  Look at what to take away, not just what to add.

12:54:57 - Take away - There is a job for moving from model to model.

## 12:55 - 🥪 Lunch

12:56:12 - Traits of engineer and scientist.  Engineering (optomize for X).  When you remove 80%, you have to think differently.  Engineer develops by hand.  Scientist looks to outcomes.

12:57:23 - 61 watching at lunch break.

13:16:07 - We're on lunch break.

13:20:06 - So far... nobody I'm dying to talk to.  That's a signal.  Glad I didn't get up at 4:00 to catch a train to be in the room.  Working on 2 monitors with 2 AI's helping is a good practice.

## 13:55 - Security in GitHub Agentic Workflows - Landon Cox

14:07:10 - ![Schedule app card marked NOW for 13:55 to 14:25, TALK, "Security in GitHub Agentic Workflows" by Landon Cox, room 52A](images/photos_20261103-140710.png)

14:07:36 - Let slop into the repo, then spend tech debt budget to get it out.  Cheaper than keeping it out.

14:11:21 - ![Slide with three columns: "Zero-secret agents" (compiler/sandboxing, instantiate secure architecture, agent runs in a sandbox, auth tokens reside in proxies), "Control untrusted reads" (integrity filtering, low-integrity data is unsafe and wasteful, filter low-integrity data by default, based on Information Flow Control (IFC)), and "Audit all writes" (safe outputs, writes can go wrong, stage all updates, inspect before applying)](images/photos_20261103-141121.png)

14:12:25 - If agents go off rails: 1) Cannot expose secrets.  3) Agents are read-only.  Writes are buffered then audited later.

14:15:02 - Invested lots of time for logging and observability.  Inputs.  Agent calls.  Network firewall.  Token spend.....  Good for debugging and token optomizing.  All inputs (prompts, skills, etc...) are technical debt (AKA technical TODO that can be invested or ignored).

14:17:20 - Safe outputs -> Filter by policy -> Apply writes

14:17:42 - TODO - REview gh.io they are an open source platform.

14:20:59 - TODO - Quick look around gh.io.  Connect with Landon Cox.

14:27:04 - "We are active online.  Best way to interact is via issues."

14:27:18 - gh.io/gh-aw

14:29:33 - TODO: Note to Landan Cox -- What do you learn by watching what your "safe outputs" try to change that's rejected by the filter policy?

## 14:35 - An Architectural Approach to Regenerative Software - Chad Fowler

14:37:43 - ![Schedule app card marked NOW for 14:35 to 15:05, TALK, "An Architectural Approach to Regenerative Software" by Chad Fowler, room 52A](images/photos_20261103-143743.png)

14:37:43 - It's 2:37.  New talk.  Chad Fowler.  Ruby.  Gems.  Is writing book for O'Reilly on regenerative software.

14:39:31 - How to write code now.  No code review.  Nobody writes prompt.  Coding never stops.  Language and stack are chosen by not-people.  Write the spec later.  To learn, remove code.  Discard code.  Keep decisions.

14:39:31 - ![Slide titled "The Plan." with the kicker "All of this, around the clock, seriously" and five bullets: no code review, nobody reads the code; nobody writes a prompt, production does; it never stops, day and night, whatever passes CI ships; humans don't pick the language or the stack anymore; the spec comes later](images/photos_20261103-143930.png)

14:39:31 - ![Slide titled "The Plan." with the kicker "All of this, around the clock, seriously" and seven bullets: no code review, nobody reads the code; nobody writes a prompt, production does; it never stops, day and night, whatever passes CI ships; humans don't pick the language or the stack anymore; the spec comes later; delete the source to find out what you don't know; throw away the history, keep the decisions](images/photos_20261103-143931.png)

14:40:44 - How do we buid systems that survive?   He was a software euthenazer.  He killed big systems.  Immutable infrastructure and disposable code.  Code is an artifact (not a source).

14:41:54 - TODO - Followup.  Code is no longer source.

14:44:08 - Story: Heartbled bug.  Servers were already disposable.  Don't mutate a server.  Reconfig and regenerate.  80+ servers  This is what we'd been training for.  Servers didn't live longer than an hour.  Used to work on wunderlist.

14:45:05 - Simple change (tiny schema change) took 48 hours.  But the related stuff took a bigger toll.

14:45:52 - XP did not remove rigor.  It improved feedback for learning and time to adjust.

14:45:52 - ![Slide with the kicker "Every one of these looked reckless" and the title "Relocating Rigor", with "1999" and the text "XP. Plans became working code, delivered frequently and consistently."](images/photos_20261103-144552.png)

14:46:44 - Checks move from typechecks elsewhere.

14:46:44 - ![Slide with the kicker "Every one of these looked reckless" and the title "Relocating Rigor", listing three items: 1999 XP, plans became working code, delivered frequently and consistently; 2005 Ruby & Rails, static type checks became tests and fast feedback; 2012 continuous deployment, release windows became rollback and observability](images/photos_20261103-144644.png)

14:48:19 - Burn the code.  What to keep?  1) Intent.  2) Architecture.  3) Eval (How we know a replacement is right).  Intents.  Code? 4) Provenance.

14:48:19 - ![Slide titled "If the Code Can Burn, What Cannot?" with four rows: Intent, what must stay true, not how the code works; Architecture, the target the code compiles into, what no implementation may do; Evaluations, how we know a replacement is right; Provenance, why every decision was made, and what it ruled out. Footer: "Same promises, kept. Same reasons, recorded."](images/photos_20261103-144819.png)

14:48:53 - He used granola to capture notes from meeting.

14:49:30 - Can you 'rm -rf src'?  How bad would that be?  WHat remains?  Humans?  What is missing to rereatte is QUICKLY?

14:50:33 - Architectural decisions are actually tech work-arounds.  Architecture is an accident.  It felt like architecture.  Was actually accident of evolution.  What is critical to keep.

14:50:58 - ![Blueprint-style floor plan with the title "Intent → Architecture → Code" and the caption "Code Is a Compiled Artifact." The plan labels a service boundary, a communication primitive, an evaluation hook, and a provenance log, with tape and a pen on the page](images/photos_20261103-145058.png)

14:51:10 - ![Speaker with a gray beard and dark shirt holding a microphone and gesturing toward a projected blueprint with "Service Boundary" and the word "Compiled" on screen, at an aiDevCon podium](images/photos_20261103-145110.png)

14:52:01 - Intent => Architecture => Code.   Compiling to an architecture.  Could you abandon PHP or npm and regenerate elsewhere?

14:59:40 - Specs should not be Google Docs.  Should be colleciton of assertions (graph database).  Ask Gini to generate the document from that graph.

14:59:40 - ![Slide titled "From Conversation to Code, and Back" with the subtitle "Phoenix: the compiler prototype · library example · every artifact real", showing a six-step loop: 1 Conversation & docs, 2 Clauses, 3 Canonical nodes, 4 Implementation unit, 5 Generated code, 6 Evidence & production, with arrows for ingest, canonicalize, plan, regenerate, verify, deploy, observe, and back to intent](images/photos_20261103-145940.png)

14:59:40 - Conversation & Docs -> Clauses -> Canonical nodes -> Implementation unit -> Generated code -> Evidence & Production -> Conversation & Docs.  There is a PoC (Proof of Concept).  Lines trace back to clauses.  This is how I was thinking about new requirements capture at HillRom.  Evaluations survive rewrites.  No need to do that in past.  Can do that now.

15:00:56 - TODO - Look at phoenix thing.  Find the canonicalizer.  Trace "requirements change" to the "code change".  Can regenerate into another target architecture.  Phoenix will redeploy.

15:02:35 - TODO: F/U Tribal Knowledge.  Documented in the code.  Documented in the culture.  Followup posting on LinkedIn.

15:02:35 - ![Slide with the kicker "Regeneration is an epistemic test" and the quote "What does this implementation know that we have forgotten?"](images/photos_20261103-150235.png)

15:03:45 - Pace differs at different layers.  Time scales.  Ant talking to mountain.

15:03:45 - ![Slide titled "Not Everything Regenerates at the Same Speed" with the kicker "Pace, and the state nobody wrote down," over a Stewart Brand "Pace Layers" diagram. Fast layers at the top, UI polish, API shape, email format, URL structure, and data shape, sit above slower strata and mountains. Caption: "Fast layers churn on top of slow contracts. And the state is never where you think."](images/photos_20261103-150345.png)

15:04:55 - Delete Safely.  Then Compact.  Rewrites inject ideas.  That becomes cruft.  Delete concepts.  (Aside... opposite of earlier topic).

15:04:55 - ![Slide titled "Delete Safely. Then Compact." with the kicker "Deletion and compaction" and seven steps: compat, the old path keeps emitting what it emitted, through the new code; migrate, move known consumers one at a time; isolate, the old path complains loudly on every use, hidden dependencies announce themselves; remove, only after nothing has tripped the alarm for long enough; observe, keep watching, long enough is a judgment; compact, fold what you learned into the spec](images/photos_20261103-150455.png)

15:05:12 - ![Slide titled "How a System Becomes Regenerative" with the kicker "One unit at a time, one rung at a time" and four properties: replaceable, a real boundary and evaluations, delete the unit, get it back; remembered, decisions and rejections captured as you work, not reconstructed; gated, evaluations and constraints are the review, where risk allows, you stop reading the diff; selective, a spec change regenerates only what it touches, you stop editing code](images/photos_20261103-150512.png)

15:05:47 - Selective -- tracability allows back/forth

15:06:47 - System is asset.  Code is liability.

15:06:47 - ![Closing slide titled "Keep the System. Delete the Code." with the subtitle "An Architectural Approach to Regenerative Software · AI DevCon NYC", over a candlelit desk with a mug and open notebook. Footer lists slides at chadfowler.com/aidevcon, github.com/chad/phoenix, Regenerative Software (O'Reilly, early release), aicoding.leaflet.pub, and freeq.at](images/photos_20261103-150647.png)

15:07:01 - Read long version in "Regenerative Systems".

## 15:15 - Your Agent Just Wrote a Tool--and Ran It. You Need More than a Sandbox. - Cornelia Davis

15:16:09 - ![Schedule app card marked NOW for 15:15 to 15:45, TALK, "Your Agent Just Wrote a Tool--and Ran It. You Need More than a Sandbox." by Cornelia Davis, room 52A](images/photos_20261103-151609.png)

15:16:22 - Temporal is wicked cool, but not going to talk about it today.

15:16:57 - You need more than a sandbox.

15:16:57 - ![Title slide reading "You Need More than a Sandbox" with the subtitle "Code mode, sandboxes, and keeping generated code inside the agent's governed context" on a dark background](images/photos_20261103-151657.png)

15:17:10 - ![Speaker with long gray hair in a light cardigan, beside projected slide text reading "Cloud Foundry for 8+ ye..." and "Kubernetes fo... 10..." and "Author" with a pointing-hand emoji](images/photos_20261103-151710.png)

15:17:20 - ![Book cover titled "Cloud Native Patterns" by Cornelia Davis, published by Manning, showing an illustrated figure in a blue and red robe with fur trim and a white turban, holding a staff](images/photos_20261103-151720.png)

15:19:52 - There used to be ceremony post-creation.  No PRs.  No checkpoints.  Check it immediately IN PRODUCTION.

15:19:52 - ![Slide titled "The Risk" with the heading "Agents that choose their own path" and five warnings: the execution is determined at runtime by the model, no pull request, no pipeline, no human checkpoint; inputs to the code writing are untrusted, any page, email or ticket the agent reads can carry instructions, prompt injection; the generated code is not the harness, the harness brings guardrails, including around tools, what happens when the harness isn't calling the tool?; the lethal trifecta, private data, plus untrusted content, plus a way to send data out; mistakes move at machine speed, one bad decision can repeat across hundreds of actions before anyone looks](images/photos_20261103-151952.png)

15:20:31 - 3 orders of magnitude time to exploit (from day0) post/pre agentic modes

15:21:26 - "Code Mode" allows agents to build their own tools.  Model builds program that does 10,000s of calls.

15:22:20 - sandbox constrains WHERE code runs, not what code can DO.

15:22:41 - ![Speaker with long gray hair in a light sweater gesturing on stage beside a projected slide reading "Useful and unsafe", "Full network and the user's credentials. Anything injected can do anything the user can", and "A sandbox controls where code runs. ...code can do.", at an aiDevCon podium](images/photos_20261103-152241.png)

15:23:06 - ![Slide titled "Need a sandbox. How to configure it?" with the kicker "Sandboxes" and two panels: Wide open, useful and unsafe, with full network and the user's credentials, where anything injected can do anything the user can; Locked down, safe and useless, with no network, no tools, no data, where the code can compute but can't get anything done. Caption: "A sandbox controls where code runs. It does not fully control what that code can do."](images/photos_20261103-152306.png)

15:24:58 - ![Speaker with long gray hair in a white jacket and jeans gesturing on stage, beside a projected slide titled "Need a sandbox. How to configure it?" with three panels: Wide open, useful and unsafe; Governed, does real work within limits, reads data and calls tools but only with the agent's own permissions, under policy, and on the record, highlighted as the recommended option; Locked down, safe and useless](images/photos_20261103-152458.png)

15:26:33 - ![Dark slide with the heading "Pattern 2: OS sandbox + egress gateway" and the labels "Calls checked: at the network edge, by an MCP-aware proxy" and "Looks like: container or microVM sandboxes whose only way out is the proxy"](images/photos_20261103-152633.png)

15:31:54 - Will use pydantic monte.  Sandbox that's constrained.  Not OS sandbox.  Completely constrained.  Python only.

15:32:08 - I glazed over.  Checked out.  Too many details, or too late in the day?

15:40:05 - One of most important to control is to log.  Helps improvement.  Auditability.

15:40:31 - TODO - COnnect with Cornelia.  Research CEO Amar Abbas.

15:41:12 - TODO:  She wrote Policies in "Dogood" and "Cedar".  Research these.

15:42:40 - Policy is based on context of whole convesation, not just a short piece.

15:43:12 - ![Two-panel diagram titled "Harness in compute" and "Harness separate from compute." The left shows a server or agent harness kicking off a coding agent into a sandbox containing an agent loop, MCPs/tools, and a filesystem, with a gateway service holding secrets that intercepts calls. The right shows secrets, an agent loop, and MCPs/tools running anywhere, with the sandbox and filesystem separate, and the server accessing databases and the web. Footer link: openai.com/index/the-next-evolution-of-the-agents-sdk](images/photos_20261103-154312.png)

15:43:46 - <https://openai.com/index/the-next-evolution-of-the-agents-sdk/>

## 15:45 - ☕ Coffee Break

15:45:56 - Follow-up.  Yes we are hiring at Temporal.

15:47:23 - Followup - Thank her for high energy demo.  Props for doing it live.  Have a great time in Hawaii.

15:50:26 - <https://www.linkedin.com/company/temporal-technologies/> is hiring.

## 16:15 - Scaling Agentic Engineering at Zalando - Bartosz Ocytko

## 17:00 - The Future of AI-Powered Factories - Steve Yegge
