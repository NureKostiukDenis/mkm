---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "Fray: An Efficient General-Purpose Concurrency Testing Platform for the JVM"
Authors:
  - Ao Li
  - Byeongjee Kang
  - Vasudev Vikram
  - Isabella Laybourn
  - Samvid Dharanikota
  - Shrey Tiwari
  - Rohan Padhye
Study type: System design / testing tool & empirical evaluation
Venue: Proceedings of the ACM on Programming Languages (PACMPL), Vol. 9, OOPSLA2, Article 214
DOI: 10.1145/3764119
link: https://doi.org/10.1145/3764119
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The authors present **Fray**, a platform for controlled concurrency testing (CCT) on the JVM that detects race conditions, deadlocks, and assertion violations without replacing native concurrency primitives. By employing a novel *shadow locking* technique via a JVMTI/Java agent, Fray orchestrates thread interleavings across unmodified JUnit/TestNG tests. Tested across 2,664 real-world test cases from Kafka, Lucene, and Guava, it uncovered 18 previously unknown concurrency bugs and provides deterministic replay capabilities.

# Limitation
Fray is strictly designed for correctness and concurrency bug detection (finding deadlock/exception schedules); it does not evaluate performance, tail latency, or throughput degradation under carrier-pool pressure. Crucially, Fray assumes data-race-free programs, cannot interleave multiple virtual threads running on a single carrier thread, and does not compare native JNI vs. FFM blocking behavior.

# Gap signal
Fray provides an advanced infrastructure for detecting concurrency failures, but it does not address the performance and scheduling fragility gap of carrier-thread starvation induced by foreign function invocations.
