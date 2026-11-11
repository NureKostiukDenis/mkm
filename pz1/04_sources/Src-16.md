---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
  - "[[CT-1]]"
Title: "A survey of machine learning-driven task scheduling approaches for multiprocessor systems"
Authors:
  - Shaima Ahmed Rahim
  - Piyoosh Purushothaman Nair
  - Rajesh Devaraj
Study type: Comprehensive literature review / systematic taxonomy
Venue: Journal of Systems Architecture, Volume 171, Article 103628
DOI: 10.1016/j.sysarc.2025.103628
link: https://doi.org/10.1016/j.sysarc.2025.103628
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The paper provides a comprehensive systematic review and taxonomy of machine learning-driven (supervised learning, deep learning, reinforcement learning) task scheduling methodologies on homogeneous and heterogeneous multiprocessor architectures. It reviews diverse scheduling objectives, including makespan, energy consumption, thermal management, reliability, and real-time response, demonstrating how learning-based approaches can adaptively optimize multi-objective tradeoffs in complex computing platforms.

# Limitation
As a broad survey paper, it does not conduct novel hardware experiments or propose a specific closed-loop scheduling algorithm. Crucially, the survey categorizes energy efficiency, makespan, and real-time deadlines as separate optimization targets, but does not identify jitter propagation through communicating task chains as a first-class placement constraint or evaluate reciprocal jitter–energy interactions on big.LITTLE hardware.

# Gap signal
Confirms that the broader multiprocessor scheduling community treats energy efficiency and real-time scheduling as decoupled or parallel objectives, leaving the reciprocal feedback loop between task-chain timing jitter and energy-aware heterogeneous placement unaddressed.
