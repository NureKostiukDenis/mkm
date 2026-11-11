---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-1]]"
  - "[[SGP-1]]"
  - "[[CT-2]]"
  - "[[GP-3]]"
  - "[[SGP-3]]"
  - "[[T-2]]"
  - "[[T-3]]"
Title: "Virtual Threads after JDK 24: What Changed for Production Java"
Authors:
  - Sandeep Bharadwaj
Study type: Practitioner controlled benchmark & production architecture analysis
Venue: InfoQ
DOI: 
link: https://www.infoq.com/articles/virtual-threads-after-jdk24/
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The article analyzes production adoption of Java Virtual Threads following JDK 24 (JEP 491) and towards JDK 25. While JEP 491 resolved monitor-based pinning in `synchronized` blocks, the author highlights that virtual threads still experience carrier pinning when executing native calls (JNI / Panama FFM) or blocking filesystem calls, necessitating ongoing monitoring via `jdk.VirtualThreadPinned` JFR events. Furthermore, controlled A/B benchmarks on an 8-vCPU cloud instance (`c7i.2xlarge`) under 500 concurrent users demonstrate "bottleneck relocation": unconstrained virtual threads improved web throughput by up to 147% and cut P99 latency by 55%, but overwhelmed downstream connection pools (HikariCP), resulting in ~37% failure rates unless explicit concurrency limits (bulkheading) were enforced.

# Limitation
This is a practitioner engineering benchmark rather than a peer-reviewed academic study. The evaluation lacks energy and power consumption measurements (RAPL or external power meters). The test duration was limited to 60-second windows on a single host topology, and the JDBC test changed both the thread model and connection pool sizes concurrently, confounding isolation of pure scheduling effects.

# Gap signal
The benchmark explicitly proves the phenomenon of "bottleneck relocation"—where virtual threads dramatically improve web-tier throughput and P99 latency while shifting saturation downstream without decreasing error rates. However, it leaves open whether the resulting downstream queueing and retries consume or eliminate the energy benefits reported in academic energy studies.
