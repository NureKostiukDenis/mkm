---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
Title: "CFSECC: Cyclic feedback scheduling for energy-constrained real-time applications in heterogeneous distributed systems"
Authors:
  - Yuxi Chen
  - Wufei Wu
  - Wei Li
  - Jiaxin Zeng
  - Keqin Li
Study type: Algorithmic & simulation-based distributed systems study
Venue: Journal of Systems Architecture, Volume 178, Article 103906
DOI: 10.1016/j.sysarc.2026.103906
link: https://doi.org/10.1016/j.sysarc.2026.103906
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The paper presents **CFSECC**, a cyclic feedback scheduling strategy specifically formulated for real-time applications running in energy-constrained heterogeneous distributed environments. By utilizing dynamic feedback loops to adapt task allocation and voltage scaling across distributed nodes, the algorithm significantly reduces energy consumption while strictly adhering to real-time deadline constraints under fluctuating execution workloads.

# Limitation
The study focuses on network-distributed heterogeneous nodes rather than an asymmetric shared-memory multicore CPU (such as ARM big.LITTLE / DynamIQ). While it cites prior big.LITTLE scheduling literature, its communication latency models assume network message passing rather than shared cache / cross-cluster memory buses. Furthermore, it measures execution time and deadline misses, but does not model or measure read/write timing jitter propagation.

# Gap signal
Demonstrates the efficacy of feedback-driven energy scheduling in distributed systems, but does not provide an empirical evaluation of placement-induced jitter or jitter-induced energy effects on physical asymmetric multicore hardware.
