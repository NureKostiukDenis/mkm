---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
  - "[[CT-1]]"
Title: "Jitter Propagation in Task Chains"
Authors:
  - Shumo Wang
  - Enrico Bini
  - Qingxu Deng
  - Martina Maggio
Study type: Primary theoretical & analytical modeling study
Venue: 2025 IEEE Real-Time Systems Symposium (RTSS)
DOI: 10.1109/RTSS66672.2025.00017
link: https://doi.org/10.1109/RTSS66672.2025.00017
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The paper introduces a formal, compositional analysis framework with linear-time complexity to model and bound jitter propagation across sequential real-time task chains (such as those in ROS 2-based autonomous systems). By explicitly decoupling read and write uncertainties from task scheduling mechanisms, the authors derive analytical bounds for reaction time, data age, and end-to-end latency across multiple communication paradigms (implicit communication, Logical Execution Time (LET), and mid-execution).

# Limitation
The framework treats jitter purely as an abstract analytical input and propagation phenomenon. It does not model or measure how underlying hardware scheduling mechanisms (such as asymmetric core placement on big.LITTLE architectures, inter-cluster thread migrations, or DVFS frequency adjustments) actively generate or modulate read/write jitter. Furthermore, it contains no physical hardware evaluation, power measurements, or closed-loop feedback between scheduling and energy.

# Gap signal
Provides the formal foundation for task-chain jitter analysis, but remains completely decoupled from physical big.LITTLE hardware scheduling and energy management, confirming that jitter analysis and heterogeneous energy placement exist as disconnected research threads.
