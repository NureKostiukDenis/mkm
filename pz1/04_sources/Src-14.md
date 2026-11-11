---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-1]]"
  - "[[SGP-1]]"
  - "[[CT-2]]"
Title: "Virtual Thread in Production"
Authors:
  - Kora Framework Team
Study type: Framework architecture & practitioner operational guide
Venue: Kora Documentation
DOI: 
link: https://kora-projects.github.io/kora-docs/v2/en/blog/virtual-thread-in-production/
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The documentation formalizes operational definitions and diagnosis rules for Java Virtual Threads in production backend systems. It formally defines **carrier starvation** as a runtime state where runnable virtual threads are queued waiting for execution, but the JVM's ForkJoinPool carrier threads are fully saturated or pinned. It identifies long-lived or frequent carrier pinning as the primary threat to production system liveness and establishes telemetry guidelines using JFR events (`jdk.VirtualThreadPinned`) and scheduler queue metrics to monitor carrier pool health.

# Limitation
This is technical engineering documentation and operational guidance, not an empirical academic study. It provides architectural principles and diagnostic recipes without controlled experimental benchmarking, without energy/power metrics, and without statistical validation.

# Gap signal
Supplies a formal operational definition of carrier starvation and pinning risks in real-world microservice architectures, but highlights the complete lack of empirical research linking these carrier starvation events to measurable energy and tail-latency trade-offs.
