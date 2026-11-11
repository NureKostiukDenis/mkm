---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "Analysis of Virtual Threads in Spring Applications"
Authors:
  - Patryk Likus
  - Filip Kruzel
Study type: Conference paper / empirical benchmark
Venue: Proceedings of the 39th ECMS International Conference on Modelling and Simulation (ECMS 2025)
DOI: 10.7148/2025-0555
link: https://doi.org/10.7148/2025-0555
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The paper evaluates the operational and performance impacts of Java Virtual Threads within enterprise web applications built on the Spring framework. The authors compare traditional platform thread pools with virtual threads under varying simulated HTTP and database loads. Virtual threads deliver higher throughput and better concurrency scaling for standard web I/O workloads; however, practical gains are strictly constrained by external bottlenecks such as database connection pool sizing (HikariCP) and thread synchronization overheads.

# Limitation
The evaluation is conducted strictly at the Spring application/framework layer, treating Tomcat and Spring Boot as high-level execution environments. It does not measure lower-level JVM internals, carrier thread pool starvation, carrier thread pinning, or the JNI versus Foreign Function & Memory (FFM) boundary.

# Gap signal
While establishing the benefits and application-level pitfalls of virtual threads in real-world microservice architectures, the study demonstrates that application-level benchmarks mask deep JVM carrier thread mechanics, reinforcing the gap regarding native invocation overheads (JNI vs. FFM) under carrier-pool pressure.
