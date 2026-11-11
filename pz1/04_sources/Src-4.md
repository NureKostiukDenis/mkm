---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Title: "Experimental Evaluation Methodology for the Era of No Steady Performance"
Authors:
  - Jaromír Antoch
  - Walter Binder
  - Lubomír Bulej
  - François Farquet
  - Vojtěch Horký
  - Aleksandar Prokopec
  - Andrea Rosà
  - Petr Tůma
Study type: Primary methodology / empirical benchmarking study
Venue: Proceedings of the ACM on Programming Languages (PACMPL), Vol. 10, OOPSLA1, Article 128
DOI: 10.1145/3839448
link: https://doi.org/10.1145/3839448
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The authors challenge the foundational assumption of JVM performance evaluation—namely, that workloads reach a single stable "steady state" after warm-up. Evaluating large-scale workloads from the Renaissance suite, they demonstrate that modern VM executions exhibit segments of steady performance punctuated by abrupt, non-stationary shifts. They introduce a robust statistical methodology that correctly accounts for non-steady execution segments, providing more accurate confidence intervals and avoiding invalid mean-based statistical conclusions.

# Limitation
The paper focuses strictly on statistical methodology and workload execution analysis. It does not evaluate Java Virtual Threads, carrier-thread scheduling dynamics, native boundary transitions (JNI/FFM), or blocking operations.

# Gap signal
This paper directly reformulates the statistical requirements of the research gap: naive mean-based throughput/latency comparisons of virtual-thread carrier saturation are statistically invalid under abrupt JVM performance shifts. A credible investigation of carrier starvation must employ segmented steady-state analysis and robust variance estimation.
