---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
Title: "Energy-Aware Scheduling Strategies for Partially-Replicable Task Chains on Heterogeneous Processors"
Authors:
  - Yacine Idouar
  - Adrien Cassagne
  - Laércio Lima Pilla
  - Julien Sopena
  - Manuel Bouyer
  - Diane Orhan
  - Lionel Lacassagne
  - Dimitri Galayko
  - Denis Barthou
  - Christophe Jégo
Study type: Algorithmic & empirical benchmark study (Preprint)
Venue: arXiv:2502.10000
DOI: 
link: https://arxiv.org/abs/2502.10000
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The paper addresses energy-aware scheduling for pipelined, partially-replicable task chains (representative of Software-Defined Radio standards like DVB-S2) executed on hybrid multicore processors featuring asymmetric core types (ARM big.LITTLE, Apple, AMD, Intel). The authors formulate a multi-objective optimization problem to minimize the execution period (maximizing throughput) while minimizing active core count and power consumption by prioritizing energy-efficient (LITTLE) cores. They propose two greedy heuristics (FERTAC and 2CATAC) and an optimal dynamic programming solution (HeRAD), demonstrating near-optimal period and power savings using the *StreamPU* runtime.

# Limitation
While the paper explicitly targets task chains and heterogeneous asymmetric processors, its primary metric is steady-state pipelined throughput (period minimization) and average core power. It does not measure runtime latency jitter, read/write phase variations, or end-to-end jitter propagation across stages. As a preprint, its findings remain under peer review.

# Gap signal
Directly bridges task chains and asymmetric core scheduling for energy and throughput, but leaves unexamined how task placement decisions introduce timing jitter into downstream communication buffers and whether jitter impacts dynamic energy behavior.
