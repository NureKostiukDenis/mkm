---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "Misleading Microbenchmarks on the Java Virtual Machines"
Authors:
  - Filippo Schiavio
  - Lubomír Bulej
  - Walter Binder
Study type: Methodological / empirical benchmarking study
Venue: The 41st ACM/SIGAPP Symposium on Applied Computing (SAC '26)
DOI: 10.1145/3748522.3779882
link: https://doi.org/10.1145/3748522.3779882
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The authors demonstrate that even when developers strictly follow JMH best practices, microbenchmarks on the JVM can still yield severely misleading results. Because modern JVM JIT compilers are profile-driven (tracking branch probabilities, receiver types, and execution hotness in isolation without real-world resource competition), isolated microbenchmarks induce atypical runtime profiles that trigger unrealistic JIT optimizations that never occur in production environments.

# Limitation
The paper is purely methodological. It does not evaluate Java Virtual Threads, carrier-thread pool pressure, JNI, Panama FFM, native callbacks, or blocking I/O scenarios. It provides warnings and guidelines for benchmark validity rather than solving any threading or concurrency research questions.

# Gap signal
This work reformulates the experimental requirements for studying JVM carrier pinning. It proves that an experiment evaluating JNI vs. FFM carrier starvation cannot rely solely on naive synthetic microbenchmarks in JMH, because isolated calls may be over-optimized by the JIT compiler, hiding true scheduling and cache-coherence bottlenecks.
