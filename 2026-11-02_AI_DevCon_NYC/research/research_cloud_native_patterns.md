# Research: Cloud Native Patterns (Cornelia Davis)

Back to [research.md](../research.md). Session: [15:15 Cornelia Davis, Your Agent Just Wrote a Tool--and Ran It](../session_notes.md#1515---your-agent-just-wrote-a-tool--and-ran-it-you-need-more-than-a-sandbox---cornelia-davis). Author: [Cornelia Davis](../people.md).

## Link

- Manning: <https://www.manning.com/books/cloud-native-patterns>

## APA citation

Davis, C. (2019). *Cloud native patterns: Designing change-tolerant software*. Manning Publications. <https://www.manning.com/books/cloud-native-patterns>

## Summary (100 words)

Davis argues that cloud native is about how and why software is built, not where it runs. The book gives a mental model for distributed applications that must stay up while everything around them keeps changing: instances, configuration, credentials, dependencies, and the network. Part 1 sets the context: what cloud native means, how these apps run in production, and the platform underneath. Part 2 works through patterns for apps, services, routing, and data, using realistic Java examples. Topics include stateless scale-out, configuration, zero-downtime upgrades, service discovery, retries, circuit breakers, API gateways, and breaking up the data monolith. Gene Kim wrote the foreword.

## Patterns most discussed

Based on the chapter titles and the publisher's description. I found no independent reviews.

- **Event-driven over request/response.** Chapter 4, "Event-driven microservices: It's not just request/response". Services react to events instead of calling each other synchronously, which reduces coupling.
- **Stateless scale-out.** Chapter 5, "App redundancy". Run many identical, stateless instances and keep state in backing services.
- **Externalized configuration.** Chapter 6, "Application configuration: Not just environment variables". Configuration and credentials come from outside the app and can change without a rebuild.
- **Zero-downtime lifecycle.** Chapter 7, "The application lifecycle". Rolling upgrades, versioned services, parallel deploys, and credential rotation.
- **Service discovery and dynamic routing.** Chapter 8, "Accessing apps".
- **Retries and control loops.** Chapter 9, "Interaction redundancy". Retries with backoff, and safe, idempotent operations.
- **Circuit breakers and API gateways.** Chapter 10, "Fronting services".
- **Breaking the data monolith.** Chapter 12, "Cloud-native data". Each service owns its data and gets events from the others; event sourcing.

## Book details

- Publisher: Manning Publications, May 2019
- ISBN: 9781617294297
- About 400 pages

## Sources

- [Manning: Cloud Native Patterns](https://www.manning.com/books/cloud-native-patterns)
- [O'Reilly listing](https://oreilly.com/library/view/cloud-native-patterns/9781617294297)
- [ebooks.com listing (table of contents)](https://www.ebooks.com/en-ad/book/210311865/cloud-native-patterns/cornelia-davis/)
