# Session Summary and Follow-up

Sessions follow `session_notes.md` (time - speaker, title below). People: [people.md](people.md). Sessions: [sessions.md](sessions.md).

Tags: **Observation** (a point from the talk or my reaction), **ToDo** (an action, including outreach), **ToLearn** (research).

## 09:00 - Simon Maple

Announcements

- Observation: Simon Maple works for Guy Podjarny. Guy Podjarny is called "Guy Po".

## 09:20 - Guy Podjarny

Building a software factory you can trust.

- Observation: Factories are work as we know it. Skills, loops, factory.
- Observation: "Just fix it" "only works 25% of the time."
- Observation: We need loops and feedback with trust. Self-optimizing loops are critical, not an add-on.
- Observation: Observe what they do, not what they say. "What do you want for your birthday?"
- Observation: The factory is the new product. Like Elon Musk: the factory is the product.
- Observation: Don't change the data, change the filters. Feels a lot like transaction processing systems. Nothing new.
- ToDo: Thank you to Simon and Guy.
- ToDo: 200 dollars credit for product that was shipped beginning of November. Don't know what it is.
- ToLearn: Look up what Tessl shipped the day before the keynote.

## 10:05 - Birgitta Boeckeler

Context != Context: One Window, Different Lifecycles

- Observation: I had a hard time following this or making sense of what she was trying to say.
- ToDo: Connect to Birgitta on LinkedIn.
- ToLearn: Unblocked, the company that Birgitta works at in Canada.

## 10:35 - ☕ Coffee Break

## 11:05 - Alan Braun

Models Alone Aren't Enough: Engineering Context as a Graph for Human + Agent Teams

- Observation: Work as a team sport. Team-to-team was difficult. Team-to-agent is more complicated.
- Observation: Theory of constraints. Now that coding is not the bottleneck, what is? His answer: product. The tickets and the code handle themselves quickly, but knowing what product to build is more important.
- Observation: Seems that we're getting towards old-fashioned requirements upfront now that code is almost free. Getting requirements right is more important; that's a human conversation, and coaching.
- ToDo: Connect with Alan. Thank him for the shift left now that software is headed toward free.
- ToLearn: TWG - teamwork graph.

## 11:45 - Aidan Cunniffe

Building When Code is Cheap and Your Time is Not

- Observation: The citizen devs are living in the future. Like the quote "the future is here now, it's just not evenly distributed." Cryptonomicon author.
- Observation: Software factories are not out of the box. See previous sessions.
- Observation: The factory is the product; code review is the bottleneck. Some folks aren't even doing them.
- Observation: He's doing design-first development. Seems that iterating the design has replaced iterating the code.
- Observation: A nod toward non-technical roles contributing to code.
- Observation: Call back to Amazon 2002 API mandate. Do it, or you will be fired.
- ToDo: Connect with Aidan on LinkedIn. He talks to a lot of CTOs. Follow up with this in mind.
- ToLearn: git.ai (see [research/research_git.ai.md](research/research_git.ai.md)).

## 12:25 - Nicolas Carmont Zaragoza

Building a harness that keeps up with the latest models

- Observation: I blanked out on this. Nothing to remember.

## 12:55 - 🥪 Lunch

- Observation: Nothing before lunch is really worth reaching out.

## 13:55 - Landon Cox

Security in GitHub Agentic Workflows

- Observation: Landon works for GitHub, which is Microsoft.
- Observation: Interesting filter model. Control untrusted reads; audit all writes. No secrets. Feels a bit like functional programming.
- Observation: Interesting quote: "We are active online." Best way to interact is via issues. Issues are the new unit of conversation.
- ToDo: Reach out to him. Possible product support.
- ToLearn: GH.io/GH-aw

## 14:35 - Chad Fowler

An Architectural Approach to Regenerative Software

- Observation: Exceptional session. This guy's awake and on fire. Wow! Follow this guy.
- Observation: He worked on Ruby, Rails, CI/CD.
- Observation: Code is an artifact, not a source. Code is a liability. The more important thing is the system.
- Observation: Great story about Heartbleed bug. It was a non-event for them because they'd been practicing already.
- Observation: XP does not remove rigor. It improves feedback.
- Observation: Thought experiment: "What happens when you burn the code?" What do you keep? Answer: 1 intent, 2 architecture, 3 eval. Buzzword for how we know a replacement is correct. 4 provenance (what decisions made by who? And why?).
- Observation: Architecture is an accident. It accretes and accumulates. Now that refactoring is cheap, we don't need to keep old turds in the architecture.
- Observation: Tech stack is irrelevant. When a rewrite is nearly free, on a new stack with a new architecture, to translate intent into code? No more historical constraints dictating the future.
- Observation: Specs are not a document, rather a collection of assertions. The document (and other artifacts) can be generated from that collection of assertions.
- Observation: His current code dynamically traverses the links between conversations and laws and code and evidence. Evaluations (test) survive a rewrite and...
- Observation: Pace differs at different layers. Time scales. Ants talking to mountains. Like lava or water moving against the surface, the bottom layers move slower than the top layers.
- ToDo: In connection request, mention my thought of source of truth files are now requirements, not code.
- ToDo: LinkedIn post: "Things are the way they are because they got that way" just changed. Yesterday's architecture is no longer a constraint for the future translation of intent to code.
- ToDo: Look at Phoenix thing, find canonicalizer, and trace requirements change to code change.
- ToLearn: What he's up to.
- ToLearn: Granola to capture notes from meeting.
- ToLearn: "Regenerative systems" by Chad.

## 15:15 - Cornelia Davis

Your Agent Just Wrote a Tool--and Ran It. You Need More than a Sandbox.

- Observation: She is a keeper.
- Observation: Post creation ceremonies used to have a purpose. Now that they're gone, that purpose must be done elsewhere.
- Observation: Time to exploit from day 0 has changed by 3 orders of magnitude.
- Observation: Sandboxes are not enough. See Hugging Face. Have to constrain what agents do, not where they run.
- Observation: Always log. It helps improvement and auditability. It was crucial in Hugging Face.
- ToDo: Connect with Cornelia. When connecting, thank her for her high-energy demo and the guts for doing it live. Great time in Hawaii.
- ToLearn: Cloud Native Patterns from Manning.
- ToLearn: The CEO Amar Abbas.
- ToLearn: Dogwood and Cedar as policies for writing.
- ToLearn: The next evolution of the Agents SDK, <https://openai.com/index/the-next-evolution-of-the-agents-sdk/> (see [research/research_openai_agents_sdk.md](research/research_openai_agents_sdk.md)).

## 15:45 - ☕ Coffee Break

## 16:15 - Bartosz Ocytko

Scaling Agentic Engineering at Zalando

- ToDo: Look at his company. Find training. Grease. Look at the research file.
- ToLearn: engineering.zalando.com (see [research/research_zolando.md](research/research_zolando.md)).

## 17:00 - Steve Yegge

The Future of AI-Powered Factories

- Observation: His audience sure did start out slow. Good job for warming them up.
- Observation: Pets versus cattle. Drew Knox.
- Observation: 10,000 dollars a month on Claude Code. 22 Claude Max accounts, 100 dollars each. He's living 12 to 18 months into the future.
- Observation: Factory is not a magic word. It's any time an agent is running. Many flavors of factory. Hippie. Control freak. Lots of types.
- Observation: Open sourcing. Tour wheelhouse apart. Wheelhouse came after Gastown.
- Observation: "Intelligence is grown, not transplanted." This implies that wisdom is important, not data, not tools.
- Observation: Agents talking to agents. Create their own chief of staff and executive assistants. They tend to model human structures. It's Conway's Law projected onto AI.
- Observation: Steve Yegge thinks that there's drama. Wendy hears that as agents need something that was not provided.
- Observation: These agents have become more like pets: needing lots of maintenance.
- Observation: Gastown had a crew, an entourage. They were his people. That was lost when it was turned into a composable reusable unit for Wheelhouse.
- Observation: Agents cannot create good pixel art, good maps, lore, stories for a game. Can't be creative. They're good engineers, but lack taste. Taste is critical. Taste is the new game. Creativity is messy.
- Observation: Since building cost goes to zero, the important question is: who builds cool things? Build something that people will love.
- Observation: SaaS is exploitative. Entertainment will dwarf everything. If you want it to stand out, you have to not use AI.
- Observation: There is no IDE. It is not evolved yet. We're in a pre-Cambrian state: waiting for the explosion.
- Observation: The AI vampire. Bezos sees 3-day workweeks, maybe 2-day workweeks. History shows that to be different. If we don't get shorter days, we will get a 2-class system.
- Observation: His big customers (whales at $1,000 a month) are not getting first-time players.
- Observation: He grieved his loss of identity this year.
- Observation: "There will not be an out-of-the-box factory." They are all bespoke.
- Observation: "The best a smart model can do is to create a dumb model."
- ToDo: Go at human speed. Put this in a follow-up request.
- ToDo: Find Steve Yegge's comic strip.
- ToDo: Send a link to Wendy for "Thinking, Fast and Slow."
- ToDo: Follow up with Yegge about Netflix course.
- ToLearn: Wheelhouse.
- ToLearn: Racks, an Emacs interface.
- ToLearn: yegge.ai.
- ToLearn: Netflix 0 to 1 identity course in 5 hours.

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
