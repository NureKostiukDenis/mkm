---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "Practical Benchmarking Configurations for Reproducible Execution-Time Measurements of CI/CD-Style Workloads"
Authors:
  - Strahinja Stanojević
  - Vojin Jovanović
  - Milena Vujošević Janičić
Study type: Empirical methodology / benchmarking study
Venue: ACM Transactions on Software Engineering and Methodology (TOSEM)
DOI: 10.1145/3838807
link: https://doi.org/10.1145/3838807
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The paper develops practical benchmarking setups and execution configurations designed to achieve reproducible execution-time measurements in CI/CD environments. By applying OS-level CPU pinning (processor affinity), disabling dynamic scaling noise, and isolating execution environments, the authors achieve an average relative median absolute deviation (RMAD) below 0.55% for general workloads and below 2.0% for multithreaded workloads across diverse testing setups.

# Limitation
The paper's usage of the term "pinning" refers strictly to operating system CPU core affinity / process pinning, not to JVM Virtual Thread carrier pinning. The work does not investigate Project Loom, virtual threads, JNI, FFM, or carrier starvation.

# Gap signal
This paper surfaced in the search due to keyword homonymy ("pinning"). While it provides valuable experimental design guidelines for stabilizing multithreaded JVM execution against OS noise, it leaves the domain of JVM carrier-thread pinning and the FFM/JNI boundary entirely untouched and open.
