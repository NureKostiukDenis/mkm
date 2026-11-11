---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
Title: "Optimizing Reliability and Energy Efficiency in Heterogeneous Multicore Systems: A Novel Task Deployment Strategy"
Authors:
  - Yu-Guang Chen
  - Yin-Rong Zhuo
  - Zheng-Wei Chen
  - Yung-Chun Chang
  - Yuan-Hao Chang
Study type: Algorithmic & simulation-based systems study
Venue: Proceedings of the 2025 on Great Lakes Symposium on VLSI (GLSVLSI '25)
DOI: 10.1145/3716368.3735195
link: https://doi.org/10.1145/3716368.3735195
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The paper introduces a reliability-aware and energy-efficient task deployment framework for heterogeneous multicore processors (explicitly modeling asymmetric big.LITTLE / DynamIQ-style core configurations). The proposed strategy optimizes thermal distribution and core aging to maximize system lifetime while meeting predefined reliability thresholds and reducing overall energy consumption under dynamic multi-task workloads.

# Limitation
The evaluation optimizes the trade-off between device lifetime/reliability and energy efficiency. It does not measure fine-grained runtime timing jitter, release jitter, or jitter propagation in dependent task pipelines. Real-time constraints are modeled at a coarse task level rather than as sensor-to-actuator latency bounds or read/write phase variations.

# Gap signal
Confirms that multi-objective heterogeneous scheduling focuses on reliability, thermal balancing, and energy, but leaves unexamined the reciprocal interaction between asymmetric task deployment and task-chain jitter.
