# The Glorious Futility of Knowing Where You Are When You're Not Yet Where You're Going

## On the Noble, Ruinous, and Largely Imaginary Art of Project Status Tracking

> "We have 500 projects. None are on-time and on-budget." — Anonymous IT executive, quoted in the original Standish Group CHAOS Report, 1994

There is a species of corporate optimism — aggressive, congenital, impervious to evidence — that holds a single proposition sacred: if we only knew, at every moment, exactly where every project stood relative to where we had confidently and incorrectly predicted it would stand, we would all be richer, thinner, and better rested. This proposition has spawned an entire industry: certification bodies, methodology tomes, enterprise software empires, and a professional class whose singular contribution to civilization is the composition of status reports obsolete before the ink dries or the pixels illuminate.

They are wrong. They have always been wrong. The evidence has been accumulating for thirty years with the persistence of a water stain on a dropped ceiling, and they proceed undaunted, like tourists reading a map upside down and blaming the city for moving.

Let us examine the case for the prosecution.

## Part I: The Sacred Scrolls of Progress

In 1994, the Standish Group published the CHAOS Report, a document so comprehensively demoralizing that a lesser industry would have simply gone home. It found that a mere 16.2 percent of software projects were delivered on time and on budget. A full 31.1 percent were canceled outright before they delivered so much as a login screen. The remaining majority — the grand challenged middle — lurched to some form of completion while hemorrhaging time, money, and dignity.

By 2020, after three decades of methodology refinement and enterprise software evolution, the success rate had climbed to 31 percent. That is not a typo. Three decades of tools, certifications, and frameworks bought this industry fifteen additional points, roughly half a point a year — progress with the pace of continental drift and considerably less impact.

Meanwhile, McKinsey and Oxford examined 5,400 large-scale IT projects and found that, on average, they ran 45 percent over budget and delivered 56 percent less value than promised. A 2022 McKinsey study of 532 capital projects found overruns averaging 79 percent. Megaprojects — those monuments to ambition and accounting creativity — saw 98 percent face delays of up to 20 months.

So: what, precisely, have we been doing with all those status meetings?

Generating more status meetings.

## Part II: The Plan Is the Problem — The Chart Is Just a Picture

The chart is not the center of this apparatus. The chart is an output. Where the mischief actually lives — where the fiction is composed, maintained, and periodically refreshed — is the plan.

The plan is the network of tasks, durations, dependencies, and assigned resources from which scheduling tools generate their displays. It is built on two categories of input, and both are largely fictional.

The first is duration estimates. Textbook version: supplied by the people who will do the work. Actual version: derived by working backward from an arbitrary endpoint — a board presentation, a fiscal close, a launch date chosen for marketing symmetry — then distributing the available time across the task list with whatever arithmetic makes it fit. The people who will do the work are consulted after the dates are set, if at all. Their role at that point is not estimation but ratification: confirming, under institutional pressure, that they can complete in four weeks what any honest assessment would price at ten. A schedule built this way encodes what the deadline permits, not what the work requires. It is a confession written before the crime.

The second category is dependency relationships — the declared sequence in which tasks must proceed. The Critical Path Method identifies the longest chain of dependent tasks and declares it the schedule. Slip one task on that chain, slip the project. The logic is unimpeachable. The inputs are not.

CPM was devised in 1957 by M.R. Walker of DuPont and J.E. Kelly of Remington Rand, for scheduling industrial maintenance shutdowns — environments where tasks and sequences were well understood from repetition. PERT emerged independently and simultaneously from the U.S. Navy, Booz Allen Hamilton, and Lockheed, to manage the Polaris missile program under post-Sputnik emergency. Both solved the same problem: not how to display a schedule, but how to determine which interdependent tasks actually controlled the completion date.

What both methods assume, and what modern projects routinely violate, is that dependencies are fixed, stable, and complete. Real projects run on soft dependencies: resource availability, office politics, vendor responsiveness, and the undocumented fact that Smith in infrastructure has to sign off before Johnson in development can touch anything — known to everyone on the project and recorded nowhere in the plan. The declared critical path diverges from the actual one almost immediately. When reality changes, someone updates the plan and the tool regenerates the chart, and this gets called management. It is closer to a weather forecaster revising yesterday's forecast after checking the window.

Microsoft Project once offered genuine three-point PERT estimation — a probabilistic method that at least admitted uncertainty existed. It removed the feature entirely in Project 2010, evidently judging that nobody was using it. The market had spoken: practitioners preferred the false confidence of a single number to the honest discomfort of a range. Oracle's Primavera, by contrast, still maintains and extends that modeling depth — because Primavera lives in government and large construction, where a scheduling error is measured in nine figures and dependency analysis is not optional decoration. Tell a bridge contractor his critical path is approximate and see how that conversation goes.

The chart, then, is not the plan. It is a rendering of the plan, accurate to whatever degree the plan is accurate — which is to say, not very. The bars, the highlights, the milestone diamonds are the visual expression of every duration compression and undocumented dependency that went into building it. Treating the chart as the object of management attention is the industry's founding error: a photograph of a fire is not a fire extinguisher.

The pricing alone tells you something. Enterprise PM tools run $9 to $54 per user per month. A fifty-person team on a mid-tier platform spends $54,000 to $130,000 a year maintaining a record of how badly it is keeping to a plan it built wrong in the first place — before counting integrations, the administrator who reconciles the tool against reality, and the consultant hired to configure the thing.

The reality, meanwhile, lives elsewhere: in the Slack thread where someone announced the delay three weeks ago, in the standup where the schedule got renegotiated in eleven minutes on a Thursday. The plan doesn't know about any of it until someone tells it. Waiting for the map to redraw itself when the roads change is not a strategy. It is a nap.

## Part III: The Professional Class of Cartographers of the Now

Into this breach strides the project manager, armed with a PMP certification from the Project Management Institute — 1.58 million members worldwide, roughly the population of Philadelphia — and trained in the PMBOK, a document that in its seventh edition spans twelve fundamental principles and enough knowledge areas to provision a small university.

The PMBOK's own admirers concede that, applied mechanistically, it can "generate unnecessary documentation and slow decisions." This is the creators of an anchor conceding that it can, in certain circumstances, slow a boat.

PMI's Pulse of the Profession 2025 surveyed 2,841 project professionals and found only 18 percent demonstrate "high business acumen." That 18 percent achieves 27 percent lower failure rates and better schedule adherence. The other 82 percent, one infers, are busy producing artifacts.

The same report notes, with unusual candor, that organizations are "burying strategic project management partners under 40 percent administrative overhead." The PM who could be thinking about risk is instead "chasing updates, reconciling trackers, and building project status slides that will be outdated before the next meeting."

This is not an accident. This is the system working as designed.

## Part IV: The Economics of Pretending to Know

The average project manager spends three to four hours a week on status reports — more than 150 hours a year, roughly 13 working days, producing documents whose defining feature is that they describe a state of affairs that no longer obtains. PwC found manual status reporting eats roughly 40 percent of project administrative overhead, and that automating it saves $7,000 to $24,000 per resource annually — which is another way of saying the manual version is quietly billing the organization that much already.

A team member earning $80,000 a year who spends five hours a week updating the plan, reconciling the tracker, and correcting last week's status meeting in a follow-up email costs the organization more than $10,000 a year in non-productive time. Multiply by twenty and you've bought yourself a very expensive record of your own uncertainty.

And what does it produce? Not much. Projects buried in status reporters fail at essentially the same rate as projects run off a whiteboard and a weekly conversation. The variables that actually correlate with success — user involvement, executive support, clear requirements — have been the same since 1994. The fidelity of the plan's maintenance appears nowhere on that list.

## Part V: The Agile Messiah and the Bureaucracy It Became

At this point a hand goes up, attached to someone wearing a lanyard from a recent Scrum certification course. "But what about Agile?"

Fair question. Uncomfortable answer.

In February 2001, seventeen software practitioners met in Snowbird, Utah and wrote the Agile Manifesto, preferring "working software over comprehensive documentation" and "responding to change over following a plan." It was a manifesto against exactly the apparatus this article has been describing. Its authors had watched projects drown in their own paperwork and decided the paperwork was the culprit. They were right.

Then enterprise America got hold of it and hired consultants to scale it.

The result was the Scaled Agile Framework — SAFe — which gave large enterprises exactly what they wanted: license to call themselves Agile while continuing to behave like waterfall organizations. SAFe's Program Increments run eight to ten weeks, which is a quarter-long planning cycle with fixed scope wearing a different badge. It requires its own certifications, because no enterprise transformation is complete without a revenue stream attached. Critics inside the Agile community have called SAFe waterfall in a hoodie: same hierarchy, same long-horizon planning, now narrated in sprints and epics instead of work breakdown structures, generating the same status meetings and the same outcomes.

Even genuine Agile grows its own tracking apparatus the moment it scales past one team: standups, sprint reviews, retrospectives, burndown charts, velocity tracking, backlog grooming. Individually defensible. Collectively, a second job. PMI found plenty of the project managers carrying 40 percent administrative overhead worked in shops that called themselves Agile. The vocabulary changed. The overhead did not.

The manifesto said working software over comprehensive documentation. What the enterprise heard was comprehensive documentation, delivered every two weeks instead of every two months.

## Part VI: The One Place It All Makes Sense (And Why That Should Give You Pause)

There is a context where obsessive, continuously maintained plan tracking is not merely defensible but mandatory: the public sector.

Federal agencies operate under the GAO's Yellow Book, which requires documentation of compliance with laws, regulations, and grant agreements. The Department of Energy has been on GAO's high-risk list since 1990. Congressional committees require status reports. Inspectors general require audit trails. In this world, plan tracking is not a management tool — it is a legal instrument, the paper that stands between an agency and a Congressional hearing, between a contractor and termination for cause.

That is a perfectly sensible use of the apparatus. If Washington wants to spend real money tracking a hundred-million-dollar system integration, that is proportionate oversight of public funds.

The trouble starts when private enterprises — accountable to shareholders, not appropriations committees — import this machinery wholesale and point it at projects whose only audience already knows the contents. The PM knows. The stakeholders, if paying attention, know. The team certainly knows, since they caused the condition the report describes. In this setting the status report is not oversight. It is theater, performed for an audience of people reading their own lines back to them, in a tool that costs $24 a seat and a three-day training course to configure.

## Part VII: The Date That Was, the Date That Is, and the Date That Shall Be

Here is what the apparatus conspires to obscure: in the private sector, the only date that matters is the one you keep.

Not the baseline date. Not the revised baseline. Not the re-baselined date after the scope change approved in last quarter's steering committee. Not the date in the plan as of this morning, which reflects last week's update, itself two weeks behind reality when it was entered.

The date you keep.

That date decides whether the product ships before the competitor's, whether the system goes live before the fiscal year closes, whether the client renews. Every other date is history or fiction, and the machinery built to track their evolution — baseline revisions, change control forms, variance reports — exists mainly to explain, after the fact, why the date you kept wasn't the one you promised, dressed up enough to sound like process rather than failure.

Organizations that consistently deliver don't get there through more accurate plans. They get there by making fewer commitments they can't keep, by cutting projects into pieces small enough that the gap between promise and reckoning is weeks rather than years, and by treating the delivery date as a wall rather than an opening bid.

The research bears this out. McKinsey found every additional year on a large IT project adds 15 percent to cost overruns. Standish found small projects succeed roughly 90 percent of the time, while large ones — the kind that generate the most elaborate planning apparatus — succeed less than 10 percent of the time. Projects over $10 million are ten times more likely to be canceled than those under $1 million. Bigger plan, bigger apparatus, worse odds. The correlation runs the wrong way for everyone who sells the apparatus.

No amount of plan maintenance fixes that. It is the analgesic that lets a project miss its first deadline, update the plan, miss the second, re-baseline, miss the third, hold a lessons-learned session, and emerge with a thick folder and no deliverable.

## Part VIII: A Special Circle Reserved for M&A

Everything above concerns ordinary corporate projects, where a slipped deadline is an inconvenience and a re-baselined plan is Tuesday. Now consider a category where the tolerance for slippage is zero and the entire status apparatus turns from wasteful to dangerous: the contract-driven M&A integration.

When two companies combine, they do so under legal agreements with hard dates. Day One is not a target. It is a legal fact. Payroll must run. Regulatory filings must go in. Customer-facing systems must present one face. None of it accommodates a change control process.

M&A integration research makes the earlier failure statistics look cheerful by comparison. Between 70 and 90 percent of acquisitions fail to deliver expected value, and most of that failure traces to execution rather than deal thesis. A quarter of managers overestimate post-deal synergies by more than 25 percent — meaning the financial model underwriting the whole transaction runs on numbers its own authors already doubt.

Into this arrives the 100-day integration plan, that staple of M&A orthodoxy, assembled in the compressed window between signing and closing by deal teams working under non-disclosure constraints, using information from target-company management whose incentives for candor are mixed at best. The subject matter experts who will actually execute the integration — the architects reconciling two ERP systems, the HR managers merging benefit structures across different labor agreements, the controllers consolidating a decade and a half of divergent chart-of-accounts drift — are consulted late, if consulted at all. More often they are simply handed a plan and a Day 30 milestone and asked to confirm it's achievable, which is the same duration-estimation problem from Part II, now played for higher stakes and less time to think it through.

The 100-day plan's core assumptions — that a systems integration can be validated in two weeks, that culture can be assimilated on a schedule, that institutional knowledge transfers cleanly through documentation, that employees worried about their own jobs will cheerfully cooperate with integration demands — are rarely stress-tested with the people who have to deliver them. They are lifted from templates built for other deals, other industries, other cultures, and applied here because the financial model needs synergies by a date, and the plan is the instrument that declares that date achievable.

Integration teams that succeed are not distinguished by better status reporting. They're distinguished by ruthless prioritization, clean Day One versus Day 100 sequencing, and leaders willing to decide things in hours instead of at the next fortnightly steering committee. The integrations that fail usually don't fail because nobody saw it coming. The status reports were fine. The indicators sat amber for eight weeks before they went red. What was missing was the will to act on what the plan had already confessed — a failure of nerve, not of methodology, and not one any PM tool has ever fixed.

## Part IX: What Actually Works, and Why It Is Profoundly Unpopular

The evidence points somewhere simple, which is exactly why the industry has spent decades burying it under methodology.

Commit to dates you can actually keep. Make them soon enough that missing one hurts. Staff the project with people who have both the skill and the authority to decide things. Give them direct access to the stakeholders whose calls affect the work. When something goes wrong — and it will, always, this is the one finding in this field nobody disputes — escalate it in hours, not at next week's status meeting.

PMI's own numbers back this up: the 18 percent of PMs with high business acumen aren't distinguished by their plan maintenance. They're distinguished by their read on organizational context and their willingness to act like a business partner rather than a documentation clerk.

None of it requires a $24-a-seat tool with fifteen views and a Salesforce integration. Most of it needs a shared document, a weekly conversation, and the nerve to say, before the project turns six months old, that the plan is wrong.

That nerve is the scarce resource — not the software, not the methodology. The courage to stand in a room full of people who approved the plan and say the plan was written by people who didn't yet know what they didn't know, and that the only commitment worth honoring is to the outcome, not to the paperwork that was supposed to produce it.

## Part X: A Modest Taxonomy of the Damned

For completeness, the inhabitants of this ecosystem, briefly:

**The plan** — the true locus of the problem. Duration estimates squeezed into the gaps between milestones set before anyone understood the work; dependency relationships that capture the formal sequence and stay silent on every soft constraint that actually governs execution.

**The chart** — Gantt bars, network diagrams, critical path highlights — generated from the plan and inheriting, with mathematical fidelity, every error the plan contains. The chart does not lie. It reports faithfully. The plan is what lies.

**The enterprise PM tool**, which promises real-time visibility and delivers a real-time view of the last time someone updated the plan — a week ago, and stale even then.

**The PMBOK**, which its own adherents insist is not a methodology but a "body of knowledge," a distinction that hasn't stopped a single organization from wielding it as a mandatory checklist.

**The Project Management Office**, which a 2024 survey found fails to demonstrate business value 93 percent of the time — a self-indictment so complete one wonders why PMOs keep commissioning the survey.

**The PMP certification**, held by 1.58 million people, evidence of mastery over a body of knowledge, correlated only loosely with the ability to actually deliver on time.

And finally, **the status report itself**: a monument to retrospective knowledge, built by a PM who spends 150 hours a year on it, read by executives who already know what it says, describing a version of the plan that stopped being true sometime last week.

## Conclusion: The Delivery Date Is the Thing

There is no happy ending. No system will fix the underlying human problems: not knowing what we don't yet know, the pressure to commit before the work is understood, bad news traveling slower than good news, and the universal preference for a plan assembled with algorithmic confidence over an honest conversation about whether it bears any relation to the work as it will actually happen.

What there is instead is a clarifying principle: spend your energy on the commitment you intend to keep, not on documenting the commitments you're in the process of missing. The apparatus — tools, reports, methodologies, certifications, ceremonies — substitutes for that principle in the private sector rather than serving it. It lets organizations be comprehensively informed about their own failure in real time, a genuine achievement that leaves the failure completely undisturbed.

The date matters. Tracking every intermediate state between now and the date is a tax on the people trying to reach it. In the public sector, that tax buys legal cover, and the taxpayer foots the bill. In the private sector, it buys institutional comfort, and the shareholders foot the bill — with more recourse than they typically use.

Which leaves us in a familiar and entirely avoidable place: holding an expensive, widely adopted solution to a problem it doesn't solve, defended by credentialed professionals, facing evidence everyone has quietly agreed not to discuss too loudly.

The project was supposed to ship in Q2.

It is Q3.

Everyone knew this in April.

The status report will confirm it by Friday.

---

## Sources

Consulted include:

- The Standish Group CHAOS Report (1994, 2020)
- McKinsey & Company / University of Oxford, "Delivering Large-Scale IT Projects on Time, On Budget, and On Value"
- McKinsey & Company, "Seize the Decade: Maximizing Value Through Pre-Construction Excellence" (2022)
- McKinsey & Company, "How to Avoid Large Technology-Program Failures"
- PMI Pulse of the Profession 2025
- PMI Pulse of the Profession 2024
- PwC, "Is Manual PMO Status Reporting Slowing Delivery?" (2026)
- PPM Express, "How to Automate Project Status Reports"
- Booz Allen Hamilton, "How PERT Transformed Project Management" (2025)
- Mosaic Projects, "Understanding PERT: Programme Evaluation Review Technique" (White Paper)
- Microsoft Learn, "Project 2010 — PERT Analysis?" (Community Q&A, confirmed removal in Project 2010)
- Beck et al., Manifesto for Agile Software Development, agilemanifesto.org (2001)
- Gothelf, J., "SAFe Is Not Agile," jeffgothelf.com
- AltexSoft, "Scaled Agile Framework: Overview, Pros and Cons" (2023)
- Ansarada, "10 Risks of a Failed M&A Integration" (2025)
- KAIZEN Institute, "100-Day Post-M&A Plan" (2025)
- KPMG, "Unlock Maximum Value Every Transaction" (2025)
- GAO Government Auditing Standards (Yellow Book), 2024 Revision
- GAO Report GAO-07-518, Department of Energy Project Management (2007)
