---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-1]]"
  - "[[SGP-1]]"
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "JEP 491: Synchronize Virtual Threads without Pinning"
Authors:
  - Patricio Chilano Mateo
Study type: Primary engineering specification & runtime architectural design
Venue: OpenJDK Enhancement Proposals (Delivered in JDK 24)
DOI: 
link: https://openjdk.org/jeps/491
Pub. Year: 2024
Verified: VERIFIED
---
----

# Key finding
JEP 491 fundamentally re-engineers the JVM's object monitor mechanism so that virtual threads blocking on `synchronized` methods, `synchronized` statements, or `Object.wait()` can safely unmount from their underlying carrier platform thread. This architectural update completely eliminates monitor-induced carrier-thread pinning, allowing existing libraries relying on Java monitors to achieve high concurrency without needing refactoring to `ReentrantLock`.

# Limitation
This document is a technical enhancement proposal and JVM implementation specification, not an empirical benchmarking study. It does not provide empirical energy consumption measurements, tail-latency distributions under heavy saturation, or carrier starvation metrics. Crucially, the specification notes that *residual pinning* still exists: virtual threads remain pinned when executing native frames (JNI / FFM downcalls), native callbacks into Java, class loading/initialization routines, and certain blocking filesystem operations.

# Gap signal
JEP 491 reformulates the virtual-thread pinning problem: monitor-based pinning is solved in JDK 24+, shifting the remaining research gap entirely toward **residual pinning** (native frames, callbacks, class loading) and whether this residual pinning causes carrier starvation and undermines the energy/latency benefits of virtual threads.
