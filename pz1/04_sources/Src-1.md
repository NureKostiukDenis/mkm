---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
  - "[[GP-1]]"
  - "[[SGP-1]]"
Title: "FCoral: A Framework for Fine-grained Concurrency Evaluation Across Programming Language Runtimes"
Authors:
  - Jianjun Shi
  - Yinghui Huang
  - Bingxin Liu
  - Danying Ge
  - Jianhua Gao
  - Yuxiang Zhang
  - Weixing Ji
Study type: Primary empirical / framework & benchmark evaluation
Venue: ACM Transactions on Architecture and Code Optimization (TACO)
DOI: 10.1145/3847668
link: https://doi.org/10.1145/3847668
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The paper presents **FCoral**, a framework designed for fair, fine-grained concurrency evaluation across modern language runtimes (FFRT C++, Go, JVM, Tokio Rust, Cangjie). It introduces formally verified *Concurrent Workload Programs (CWPs)* to generate semantically consistent workloads across languages. For Java Virtual Threads, it measures throughput and P99 tail latency as concurrency scales under fixed worker/carrier thread allocations across CPU-bound, I/O-bound, and mixed workloads.

# Limitation
The framework evaluates language runtimes as black boxes using high-level concurrent tasks. It does not isolate native-boundary transitions (JNI vs. Panama FFM), native callbacks into Java, blocking file vs. socket I/O, or synthetic sleeps under carrier-pool pressure. Furthermore, it does not evaluate JVM version differences (pre- vs. post-JEP 491).

# Gap signal
While FCoral advances the state of the art in concurrency benchmarking infrastructure (partially closing the tooling gap), the substantive empirical question of carrier pinning and starvation on the native FFM/JNI boundary remains completely unaddressed and OPEN.
