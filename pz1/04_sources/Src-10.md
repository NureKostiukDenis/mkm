---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-1]]"
  - "[[SGP-1]]"
  - "[[CT-2]]"
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
The article presents a controlled A/B performance benchmark comparing Java platform threads and virtual threads on an 8-vCPU cloud instance (`c7i.2xlarge`) across ThreadLocal and JDBC scenarios under high concurrency (500 concurrent users). Virtual threads improved throughput by 107% (ThreadLocal) and 147% (JDBC), while cutting P99 latency by 64% and 55% respectively. However, the benchmark revealed critical bottleneck relocation: in the JDBC workload, virtual threads rapidly saturated downstream database connections (HikariCP pool), yielding approximately 37% error rates (36.91% vs 37.08%) regardless of the thread model, unless downstream capacity was explicitly bounded.

# Limitation
This is a practitioner engineering benchmark rather than a peer-reviewed academic study. The evaluation lacks energy and power consumption measurements (RAPL or external power meters). The test duration was limited to 60-second windows on a single host topology, and the JDBC test changed both the thread model and connection pool sizes concurrently, confounding isolation of pure scheduling effects.

# Gap signal
The benchmark explicitly proves the phenomenon of "bottleneck relocation"—where virtual threads dramatically improve web-tier throughput and P99 latency while shifting saturation downstream without decreasing error rates. However, it leaves open whether the resulting downstream queueing and retries consume or eliminate the energy benefits reported in academic energy studies.
