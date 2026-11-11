---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-2]]"
  - "[[SGP-2]]"
Title: "Integrating DVFS and Task Scheduling for Soft Real-Time Applications on Heterogeneous Multicore Systems"
Authors:
  - Haoyu Wang
Study type: Master's thesis / empirical hardware evaluation
Venue: Faculty of Computer Science, Dalhousie University
DOI: 
link: https://dalspace.library.dal.ca/items/08a35083-10ce-4d34-bfba-ecec429f648a
Pub. Year: 2025
Verified: VERIFIED
---
----

# Key finding
The thesis investigates the integration of Dynamic Voltage and Frequency Scaling (DVFS) and task scheduling for soft real-time applications running on physical heterogeneous multicore hardware (an ODROID-N2+ board featuring an Amlogic S922X SoC with 4x Cortex-A73 big cores and 2x Cortex-A53 LITTLE cores). Evaluating periodic edge workloads (Keyword Spotting and YOLO-lite), the author designs an intelligent controller that meets Target Execution Time (TET) constraints while significantly reducing per-cycle energy consumption compared to the default Linux `ondemand` governor.

# Limitation
The empirical evaluation is limited to independent, single-threaded periodic inference tasks rather than communicating task chains or pipelines. The primary performance metrics are soft deadline compliance and average cycle energy; the study does not measure read/write jitter, event timestamp variances, or the propagation of timing variability through multi-stage dependency graphs. Furthermore, it evaluates only a single physical board and compares against Linux `ondemand` without fixed-frequency ablation baselines.

# Gap signal
Demonstrates that physical big.LITTLE hardware (ODROID-N2+) can successfully couple DVFS, asymmetric core placement, and execution-time targets for energy reduction, confirming that the missing gap is specifically **task-chain jitter propagation and bidirectional feedback**, rather than the impossibility of timing-energy integration on asymmetric hardware.
