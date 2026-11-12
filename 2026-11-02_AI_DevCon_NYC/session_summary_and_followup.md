# Session Summary and Follow-up

Sessions follow `session_notes.md` (time - speaker, title below). People: [people.md](people.md). Sessions: [sessions.md](sessions.md).

Each session is grouped into **Observations** (points from the talk and my reactions), **To Do** (actions, including outreach), and **To Learn** (research).

## 09:00 - Simon Maple

Announcements

🔭 Observations:

- Simon Maple works for Guy Podjarny, who goes by "Guy Po".

## 09:20 - Guy Podjarny

Building a software factory you can trust.

🔭 Observations:

- Factories are work as we know it: skills, loops, factory.
- "Just fix it" only works about 25% of the time.
- We need loops and feedback we can trust. Self-optimizing loops are critical, not an add-on.
- Observe what people do, not what they say ("What do you want for your birthday?").
- The factory is the new product. Like Elon Musk said: the factory is the product.
- Don't change the data; change the filters. Feels a lot like transaction processing systems. Nothing new.

📝 To Do:

- [x] Thank Simon and Guy. (LinkedIn connection request sent 2026-11-11)
- [ ] Use the $200 credit for the product shipped at the beginning of November. Not sure what it is yet.

🤓 To Learn:

- [ ] What Tessl shipped the day before the keynote.

## 10:05 - Birgitta Boeckeler

Context != Context: One Window, Different Lifecycles

🔭 Observations:

- I had a hard time following this or making sense of what she was trying to say.

📝 To Do:

- [x] Connect with Birgitta on LinkedIn. (LinkedIn connection request sent 2026-11-11)

🤓 To Learn:

- [ ] Unblocked, the company in Canada that Birgitta works for.

## 10:35 - ☕ Coffee Break

## 11:05 - Alan Braun

Models Alone Aren't Enough: Engineering Context as a Graph for Human + Agent Teams

🔭 Observations:

- Work is a team sport. Team-to-team was already difficult; team-to-agent is more complicated.
- Theory of constraints: now that coding is not the bottleneck, what is? His answer: product. Tickets and code get handled quickly; knowing what to build matters more.
- Now that code is almost free, we seem to be heading back toward old-fashioned requirements up front. Getting requirements right is a human conversation, and coaching.

📝 To Do:

- [x] Connect with Alan. Thank him for the shift-left message now that software is headed toward free. (LinkedIn connection request sent 2026-11-11)

🤓 To Learn:

- [ ] TWG (Teamwork Graph).

## 11:45 - Aidan Cunniffe

Building When Code is Cheap and Your Time is Not

🔭 Observations:

- Citizen devs are living in the future. Like the quote "The future is already here; it's just not evenly distributed" (I credited it to the Cryptonomicon author).
- Software factories are not out of the box (see earlier sessions).
- Code review is the bottleneck. Some folks aren't even doing reviews.
- He's doing design-first development. Iterating the design seems to have replaced iterating the code.
- A nod toward non-technical roles contributing code.
- Callback to Amazon's 2002 API mandate: do it, or you'll be fired.

📝 To Do:

- [x] Connect with Aidan on LinkedIn. He talks to a lot of CTOs; follow up with that in mind. (LinkedIn connection request sent 2026-11-11)

🤓 To Learn:

- [ ] git.ai (see [research/research_git.ai.md](research/research_git.ai.md)).

## 12:25 - Nicolas Carmont Zaragoza

Building a harness that keeps up with the latest models

🔭 Observations:

- I blanked out on this one. Nothing to remember.

## 12:55 - 🥪 Lunch

🔭 Observations:

- Nothing before lunch was really worth reaching out about.

## 13:55 - Landon Cox

Security in GitHub Agentic Workflows

🔭 Observations:

- Landon works for GitHub (Microsoft).
- Interesting filter model: control untrusted reads, audit all writes, no secrets. Feels a bit like functional programming.
- "We are active online." The best way to interact is through issues. Issues are the new unit of conversation.

📝 To Do:

- [ ] Reach out to Landon. Possible product support.

🤓 To Learn:

- [ ] gh.io/gh-aw

## 14:35 - Chad Fowler

An Architectural Approach to Regenerative Software

🔭 Observations:

- Exceptional session. He's awake and on fire. Follow this guy.
- Background: Ruby, Rails, CI/CD.
- Code is an artifact, not the source. Code is a liability; the system is what matters.
- Great Heartbleed story: it was a non-event for them because they'd already been practicing.
- XP didn't remove rigor. It improved feedback.
- Thought experiment: if you burn the code, what do you keep? 1) intent, 2) architecture, 3) evals (how we know a replacement is correct), 4) provenance (what decisions were made, by whom, and why).
- Architecture is an accident; it accretes. Now that refactoring is cheap, we don't need to keep old turds in the architecture.
- The tech stack is irrelevant. When a rewrite on a new stack and architecture is nearly free, history no longer dictates the future.
- Specs are not a document but a collection of assertions. The document (and other artifacts) can be generated from them.
- His code traverses the links between conversations, laws, code, and evidence. Evaluations (tests) survive a rewrite.
- Pace differs by layer, on different time scales: ants talking to mountains. Like lava or water, the bottom layers move slower than the top.

📝 To Do:

- [x] In the connection request, mention my idea that source-of-truth files are now requirements, not code. (LinkedIn connection request sent 2026-11-11)
- [ ] LinkedIn post: "Things are the way they are because they got that way" just changed. Yesterday's architecture no longer constrains how intent becomes code.
- [ ] Look at Phoenix: find the canonicalizer and trace a requirements change to a code change.

🤓 To Learn:

- [ ] What Chad is up to now.
- [ ] Granola, for capturing meeting notes.
- [ ] Chad's "Regenerative Systems".

## 15:15 - Cornelia Davis

Your Agent Just Wrote a Tool--and Ran It. You Need More than a Sandbox.

🔭 Observations:

- She's a keeper.
- Post-creation ceremonies used to serve a purpose. Now that they're gone, that purpose has to be met elsewhere.
- Time to exploit from day 0 has shrunk by 3 orders of magnitude.
- Sandboxes are not enough (see Hugging Face). Constrain what agents do, not where they run.
- Always log. It helps improvement and auditability, and was crucial at Hugging Face.

📝 To Do:

- [x] Connect with Cornelia. Thank her for the high-energy demo and the guts to do it live. Have a great time in Hawaii. (LinkedIn connection request sent 2026-11-11)

🤓 To Learn:

- [ ] *Cloud Native Patterns* (Manning). See [research/research_cloud_native_patterns.md](research/research_cloud_native_patterns.md).
- [ ] Amar Abbas, the CEO.
- [ ] Dogwood and Cedar as policy languages.
- [ ] "The next evolution of the Agents SDK": <https://openai.com/index/the-next-evolution-of-the-agents-sdk/> (see [research/research_openai_agents_sdk.md](research/research_openai_agents_sdk.md)).

## 15:45 - ☕ Coffee Break

## 16:15 - Bartosz Ocytko

Scaling Agentic Engineering at Zalando

📝 To Do:

- [ ] Look at his company for training opportunities. Start with the research file.

🤓 To Learn:

- [ ] engineering.zalando.com (see [research/research_zolando.md](research/research_zolando.md)).

## 17:00 - Steve Yegge

The Future of AI-Powered Factories

🔭 Observations:

- The audience started out slow. Good job warming them up.
- Pets versus cattle. Drew Knox.
- Spends $10,000 a month on Claude Code: 22 Claude Max accounts. Living 12 to 18 months in the future.
- "Factory" isn't a magic word; it's any time agents are running. Many flavors: hippie, control freak, lots of types.
- Open sourcing tore Wheelhouse apart. Wheelhouse came after Gastown.
- "Intelligence is grown, not transplanted." So wisdom matters, not data or tools.
- Agents talk to agents and create their own chiefs of staff and executive assistants. They model human structures: Conway's Law projected onto AI.
- Yegge sees drama among agents. Wendy hears that as agents needing something that wasn't provided.
- These agents have become more like pets, needing lots of maintenance.
- Gastown had a crew, an entourage: his people. That was lost when it became a composable, reusable unit for Wheelhouse.
- Agents can't create good pixel art, maps, lore, or game stories. They can't be creative. Good engineers, but no taste. Taste is critical; taste is the new game. Creativity is messy.
- With building cost near zero, the question is who builds cool things. Build something people will love.
- SaaS is exploitative. Entertainment will dwarf everything. To stand out, don't use AI.
- There is no IDE yet. We're pre-Cambrian, waiting for the explosion.
- The AI vampire: Bezos sees 3-day or even 2-day workweeks; history says otherwise. Without shorter days, we get a 2-class system.
- His big spenders (whales at $1,000 a month) aren't bringing in first-time players.
- He grieved the loss of his identity this year.
- "There will not be an out-of-the-box factory." They are all bespoke.
- "The best a smart model can do is to create a dumb model."

📝 To Do:

- [ ] Include "go at human speed" in a follow-up request.
- [ ] Find Steve Yegge's comic strip.
- [ ] Send Wendy a link to *Thinking, Fast and Slow*.
- [ ] Follow up with Yegge about the Netflix course.

🤓 To Learn:

- [ ] Wheelhouse.
- [ ] Rex, an Emacs interface.
- [ ] yegge.ai.
- [ ] Netflix's 5-hour "0 to 1" identity course.

## Follow-up

## AI Generated Summary

Generated by Claude from `session_notes.md`. High level only; Chad Fowler and Steve Yegge get more detail.

### Day theme

Code is cheap now. The scarce things are intent, context, review, trust, and taste. Speaker after speaker said the same thing in different words: build the system that builds the code, and invest in what survives a rewrite.

### Guy Podjarny

- Skills, then loops, then factories. A factory is skills plus self-improving loops.
- Trust is the bar: quality, cost, safety. "Just fix it" works about a quarter of the time; a find, fix, verify, review loop does better.
- "Build the factory that builds the product." Fix the factory, not the product.
- Your takeaway: this is how you already work. Change the filters, not the data.

### Birgitta Boeckeler

- Two kinds of context: codified (AGENTS.md, skills, docs; authored and versioned) and ambient (Slack, wiki, GitHub; assembled at task time).
- Context needs a life cycle: generate, distribute, observe, evaluate. Quality bar: clarity, actionability, fidelity, efficiency, security.
- Your takeaway: it is metacognition, thinking about what systems know.

### Alan Braun

- Faster code execution just moves the bottleneck to planning and review.
- Connected context beats more context. A teamwork graph cut tokens by about half and improved answers.
- Practical steps: link the work, write down ownership and decisions, use a few MCP sources, write one context skill.

### Aidan Cunniffe

- Citizen developers are living in the future; support them.
- No out-of-the-box factory yet, and code review is still the bottleneck.
- Cheap refactoring makes platforms and design-first libraries pay off, like the Amazon API mandate.

### Nicolas Carmont Zaragoza

- "Un-harness": newer models need less prompting. Pruning a prompt to about 20% can work.
- Evals and reading transcripts let you move to a new model in days. Look at what to remove, not just what to add.

### Landon Cox

- Agent security in three parts: zero-secret agents, control untrusted reads, audit all writes (stage, filter by policy, then apply).
- Log everything. Talk to them through GitHub issues.

### Chad Fowler

- Regenerative software: code is a compiled artifact, not the source. The system is the asset; code is a liability.
- The plan sounds reckless: no code review, prompts written by production, humans don't pick the stack, spec comes later. It follows the history of relocating rigor: XP (1999), Ruby and Rails tests (2005), continuous deployment (2012).
- Heartbleed was a non-event because servers were already disposable and regenerated constantly.
- If you burn the code, keep four things: intent, architecture (the target code compiles into), evaluations (how you know a replacement is right), and provenance (why each decision was made).
- Much of "architecture" is an accident of evolution. Regeneration is an epistemic test: what does the code know that we forgot?
- Specs should be a graph of assertions, not a document. Phoenix traces conversation to clauses, canonical nodes, code, and evidence, then back.
- Things change at different speeds (pace layers). Delete safely, then compact what you learned into the spec.
- A system becomes regenerative one unit at a time: replaceable, remembered, gated, selective.
- Your connection: this matches your "source of truth files" idea and your HillRom requirements-capture thinking.

### Cornelia Davis

- Agents that write and run their own tools skip every old checkpoint, and time-to-exploit has shrunk by three orders of magnitude.
- A sandbox controls where code runs, not what it can do. Govern it with the agent's own permissions, policy, and logging.
- Policy should use the whole conversation as context.

### Bartosz Ocytko

- Zalando's enablement: an LLM guild, 4-hour labs leading to 4-week training, and an AI readiness scan for repos.

### Steve Yegge

- Pets versus cattle. Cattle factories are declared and boring on purpose. His own factories became pets: delicate, hard to transfer, quietly breaking, and in need of constant care.
- He spends about $10,000 a month on Claude Code to live 12 to 18 months in the future.
- "Factory" just means agents running agents. Every factory is bespoke and needs attention.
- Open-sourcing Wheelhouse tore it apart. The Gastown crew's creativity could not be lifted out: "Intelligence is grown, not transplanted."
- Agents copy human org structures (chiefs of staff, assistants, meetings) and make drama. They need time with the leader.
- Agents are good engineers with no taste. With building cost near zero, taste is the new game, and the question is who builds the coolest things.
- He sees SaaS as extractive and expects entertainment to dwarf everything. Standing out may mean not using AI.
- No dominant tools yet; there is no IDE. We are pre-Cambrian.
- The human cost: drained users, the "AI vampire", the hope for shorter workweeks. He grieved a lost identity this year.
- Advice: go at human speed, and build something people will love.
