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

## 11:45 - Building When Code is Cheap and Your Time is Not - Aidan Cunniffe

## 12:25 - Building a harness that keeps up with the latest models - Nicolas Carmont Zaragoza

## 12:55 - 🥪 Lunch

## 13:55 - Security in GitHub Agentic Workflows - Landon Cox

## 14:35 - An Architectural Approach to Regenerative Software - Chad Fowler

## 15:15 - Your Agent Just Wrote a Tool--and Ran It. You Need More than a Sandbox. - Cornelia Davis

## 15:45 - ☕ Coffee Break

## 16:15 - Scaling Agentic Engineering at Zalando - Bartosz Ocytko

## 17:00 - The Future of AI-Powered Factories - Steve Yegge
