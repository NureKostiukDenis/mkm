---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "Rethinking Java Performance Analysis"
Authors:
  - Stephen M. Blackburn
  - Zixian Cai
  - Rui Chen
  - Xi Yang
  - John Zhang
  - John Zigman
Study type: Benchmark suite development & empirical methodology
Venue: Proceedings of the 30th ACM International Conference on Architectural Support for Programming Languages and Operating Systems (ASPLOS '25)
DOI: 10.1145/3669940.3707217
link: https://doi.org/10.1145/3669940.3707217
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The paper introduces an overhaul of the classical DaCapo benchmark suite (DaCapo Chopin), providing 22 new and refreshed production workloads across 47 architectural dimensions validated through Principal Component Analysis (PCA). It presents modern performance analysis methodologies integrated into an open-source framework and performs state-of-the-art assessments of production Java performance, modern garbage collection algorithms, and JIT compilation behavior.

# Limitation
While providing a modernized benchmark suite for standard Java applications and GC behavior, DaCapo does not feature targeted micro- or macro-benchmarks specifically designed to stress-test the Virtual Thread carrier scheduler against native JNI or FFM foreign memory boundaries, nor does it model native callbacks.

# Gap signal
The paper confirms the broader necessity of modernizing Java performance benchmarks beyond legacy suites. However, it highlights that existing standardized JVM benchmark suites (DaCapo, Renaissance) still lack dedicated, controlled workloads for evaluating native-boundary carrier starvation under Project Loom.
