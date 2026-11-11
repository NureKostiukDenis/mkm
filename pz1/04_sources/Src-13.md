---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-1]]"
  - "[[SGP-1]]"
Title: "Spring Boot Virtual Threads Benchmark: Moving Bottlenecks"
Authors:
  - Simon King
Study type: Empirical system benchmark & architectural case study
Venue: GitHub / Tucanoo Solutions
DOI: 
link: https://github.com/tucanoo/springboot-virtualthreads
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The benchmark evaluates a realistic blocking Spring Boot 3 service interacting with PostgreSQL via HikariCP and external HTTP endpoints under extreme concurrency (up to 2,500 concurrent connections). Enabling virtual threads provided approximately a 6× throughput increase compared to standard platform threads while maintaining low P99 latencies. Crucially, the author documented the "moving bottleneck" phenomenon: as Tomcat web-thread exhaustion was eliminated, the bottleneck immediately migrated to downstream resource limits—specifically database connection pools (HikariCP), leading to connection acquisition timeouts if pool parameters were not reconfigured.

# Limitation
The experiment was executed within a virtualized development environment (WSL2) rather than isolated bare-metal hardware, introducing virtualization noise and scheduler artifacts. It does not measure CPU energy or system power consumption. The test suite does not include native code (JNI/FFM) or residual carrier pinning scenarios.

# Gap signal
Provides concrete empirical evidence of how virtual threads relocate system bottlenecks from thread pools to database connection pools in Spring applications. However, it leaves unexamined whether the overhead of saturated downstream pools and thread contention erodes energy efficiency on production-grade bare-metal hardware.
