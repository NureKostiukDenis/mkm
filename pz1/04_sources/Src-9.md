---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-1]]"
  - "[[SGP-1]]"
  - "[[CT-2]]"
Title: "Energy-aware decision making in software stack upgrades"
Authors:
  - Mirko Stocker
  - Michael Wahler
Study type: Primary empirical journal study / automated benchmarking
Venue: Journal of Systems and Software (JSS), Volume 241, Article 112963
DOI: 10.1016/j.jss.2026.112963
link: https://doi.org/10.1016/j.jss.2026.112963
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The paper presents an automated benchmarking approach to measure and evaluate the energy implications of software stack upgrades across framework versions (Spring Boot), JVM runtimes, and execution platforms using the Spring Petclinic REST application as an empirical case study. The authors demonstrate that software updates can significantly alter energy consumption independently of raw throughput, occasionally revealing energy regressions. Upgrading to newer JVM releases and enabling Java 21 Virtual Threads produced substantial energy savings out-of-the-box without requiring code modifications.

# Limitation
The study is exclusively focused on energy consumption metrics. The authors do not measure or report runtime scheduling fragility indicators: carrier thread starvation, JFR `jdk.VirtualThreadPinned` events, pin duration, carrier run-queue depth, or tail-latency (P99/P99.9) degradation. Furthermore, the empirical evidence relies on a single case study application (Spring Petclinic REST) without native-boundary invocations, heavy database connection contention, or deliberate carrier saturation.

# Gap signal
The paper establishes that Virtual Threads reduce energy in a standard, unconstrained I/O-bound Spring workload, but leaves entirely unmeasured whether scheduling fragility mechanisms (such as carrier thread pinning and starvation) erode or reverse these energy savings under downstream bottlenecks or residual pinning conditions.
