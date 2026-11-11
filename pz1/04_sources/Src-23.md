---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
Title: "Ensuring Data Freshness in Multi-Rate Task Chains Scheduling"
Authors:
  - José Luis Conradi Hoffmann
  - Antônio Augusto Fröhlich
Study type: Algorithmic & theoretical scheduling study (Preprint)
Venue: arXiv:2603.09738
DOI: 
link: https://arxiv.org/abs/2603.09738
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The paper addresses the trade-off between timing determinism and data freshness in multi-rate task chains within safety-critical autonomous systems (e.g., automotive platforms). Contending that the Logical Execution Time (LET) paradigm introduces excessive buffering delays that artificially age sensor data, the authors propose an offset-based synchronization framework. Using Dominant Path Decomposition and a Shared Producer Consensus Search, their scheduler aligns task execution windows to sample inputs "Just-In-Time" while mathematically preserving the full capacity bounds of Global Earliest Deadline First (Global EDF) scheduling.

# Limitation
The framework relies on strict assumptions: deterministic inter-task transmission latency, blocking communication semantics, and freshness reset points at each processing stage. It does not evaluate non-blocking shared memory or asynchronous sensor-to-actuator age tracking. Furthermore, it operates as an analytical and algorithmic scheduling design without energy measurements, DVFS integration, or empirical evaluation on physical asymmetric (big.LITTLE) hardware platforms.

# Gap signal
Illustrates a conceptual and architectural tension between jitter control (LET buffering) and data freshness (offset alignment), but leaves untested how these differing communication semantics perform when subjected to dynamic frequency scaling and energy-aware core placement on asymmetric multicore processors.
