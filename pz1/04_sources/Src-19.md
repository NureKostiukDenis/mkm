---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
Title: "DFTS-MCS: Dynamic fault-tolerant scheduling for mixed-criticality systems on heterogeneous multi-core processors"
Authors:
  - Mahin Moradiyan
  - Yasser Sedaghat
Study type: Algorithmic & simulation-based systems study
Venue: Journal of Systems Architecture, Volume 175, Article 103740
DOI: 10.1016/j.sysarc.2026.103740
link: https://doi.org/10.1016/j.sysarc.2026.103740
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The paper presents **DFTS-MCS**, a dynamic fault-tolerant scheduling framework designed for mixed-criticality systems (MCS) executing on heterogeneous multi-core processors (such as ARM big.LITTLE). It dynamically reallocates tasks between high-performance and energy-efficient cores upon fault occurrences and mode switches, guaranteeing hard real-time execution bounds for high-criticality tasks while minimizing low-criticality task dropping and maintaining overall energy efficiency.

# Limitation
The core objective is fault recovery and criticality mode switching rather than continuous timing variability control. The authors do not measure read/write jitter, event uncertainty, or jitter propagation across communicating task chains. Evaluations rely on discrete task execution times and deadline satisfaction rather than fine-grained hardware latency distributions.

# Gap signal
Advances dynamic scheduling and core-switching on big.LITTLE architectures under fault conditions, but leaves unaddressed how such dynamic migrations affect end-to-end timing jitter and whether jitter can be leveraged to guide energy-aware placement.
