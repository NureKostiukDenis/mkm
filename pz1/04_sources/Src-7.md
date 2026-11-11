---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "Benchmarking the Performance of Java Virtual Threads in High-Throughput Workloads"
Authors:
  - Vishesh Pandita
Study type: Master's thesis / empirical benchmark
Venue: School of Computing, National College of Ireland
DOI: 
link: https://norma.ncirl.ie/8134/
Pub. Year: 2024
Verified: VERIFIED
---
----

# Key finding
The thesis provides an empirical comparison between Java Platform Threads and Virtual Threads (JDK 21) across high-throughput workloads. In I/O-intensive scenarios, Virtual Threads achieved up to 60.79% higher throughput and a 28.8% reduction in latency compared to fixed platform thread pools. However, in CPU-bound workloads, performance was essentially identical, while platform thread pools exhibited significantly more stable and predictable execution latency.

# Limitation
The workload categories are aggregated into broad "I/O-intensive" and "CPU-intensive" buckets. The study does not isolate the native execution boundary (JNI vs. FFM), native callbacks, socket vs. file I/O, or carrier-pool pressure dynamics. As a single master's thesis, its results lack external peer-reviewed replication and formal statistical power analyses.

# Gap signal
This foundational benchmark confirmed the context-dependent utility of Virtual Threads, but left completely unexamined whether native-boundary calls (JNI/FFM) degrade or eliminate these throughput and latency benefits under carrier starvation.
