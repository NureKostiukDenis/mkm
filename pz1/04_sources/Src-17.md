---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
Title: "Energy-Saving Scheduling Strategy for Real-Time Applications on big.LITTLE Architectures"
Authors:
  - Jiafeng Wang
  - Sai Xiao
  - Xiaochuan Guo
  - Dongfeng Jia
  - Wufei Wu
Study type: Primary empirical & algorithmic systems study
Venue: IEEE Internet of Things Journal, Volume 12, Issue 15, pp. 29460–29471
DOI: 10.1109/JIOT.2025.3568691
link: https://doi.org/10.1109/JIOT.2025.3568691
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The paper develops an optimized energy-saving task scheduling strategy tailored specifically for real-time applications running on ARM big.LITTLE asymmetric multicore architectures. The proposed scheduler effectively assigns real-time tasks to high-performance (big) cores and energy-efficient (LITTLE) cores while dynamically managing frequency scaling, achieving substantial overall system energy savings while strictly meeting hard task deadlines.

# Limitation
The scheduling strategy evaluates hard real-time constraints strictly through binary deadline-miss metrics (guaranteeing that worst-case execution time falls within the allocated deadline). The authors do not measure or model timing variability, read/write jitter, or end-to-end jitter propagation across dependent task chains. Jitter is neither treated as an input constraint nor tracked as an output consequence of asymmetric core assignment and thread migrations.

# Gap signal
Demonstrates that state-of-the-art energy-aware big.LITTLE schedulers optimize energy versus deadline feasibility, but completely ignore the fine-grained timing jitter that asymmetric core transitions introduce into downstream task chains.
