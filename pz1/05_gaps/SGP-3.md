---
Date: 2026-11-11
tags:
  - AI
Service: Perplexity
Model: Auto
Relevance:
Additional:
  - "cross-memory: off"
Related:
  - "[[GP-3]]"
---

# PROMPT

```
A review or earlier study suggests:
**The FFM/JNI boundary is underexplored experimentally.** Although native frames are identified as a remaining pinning source, the retrieved evidence does not compare JNI, Panama/FFM, file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure. A decisive study should vary **JVM version, JNI versus FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration**, while holding task semantics and resource budgets constant. Version stratification is particularly important because monitor-pinning behavior changed, whereas native-callback pinning remains a distinct concern in the retrieved engineering evidence.

Search for later peer-reviewed work, especially 2025–2026, that may already address it.

For every later study:
- what part it addresses;
- what remains unresolved;
- classify:
OPEN
PARTIALLY CLOSED
SUBSTANTIALLY CLOSED
REFORMULATED

Final assessment:
"Current status of the gap: ..."

```

# ANSWER

**Current status of the gap: OPEN.** The later peer-reviewed work found (2025–2026) improves the _methodology_ for JVM benchmarking and evaluates virtual-thread concurrency, but none of the retrieved studies provides the decisive, version-stratified comparison of JNI versus FFM, native callbacks, file/socket I/O, and synthetic blocking under controlled carrier-pool pressure.[[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)][[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)][[dl.acm](http://dl.acm.org/doi/10.1145/3669940.3707217)]

## Later peer-reviewed work

|Later study|What it addresses|What remains unresolved|Classification|Explicit/Inferred|Evidence strength|
|---|---|---|---|---|---|
|**FCoral: A Framework for Fine-grained Concurrency Evaluation Across Programming Language Runtimes** (ACM TACO, 2026). [[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)]|Provides a framework for fine-grained concurrency evaluation and reports Java virtual-thread throughput and P99 latency, including behavior as virtual-thread count rises under a fixed worker-thread configuration. [[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)]|Does not isolate JNI versus FFM, native callbacks, file versus socket I/O, synthetic blocking, blocking duration, or carrier-pool saturation. It also does not establish a pre-/post-JEP-491 native-boundary comparison. [[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)]|**PARTIALLY CLOSED**|Framework and VT latency/throughput are **explicit**; native-boundary omission is **inferred** from the retrieved abstract|**Moderate**: directly relevant to virtual-thread concurrency measurement, but not to the FFM/JNI boundary|
|**Misleading Microbenchmarks on the Java Virtual Machines** (ACM SAC, 2026). [[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)]|Shows that JMH microbenchmarks can mislead because JVM profile-driven compilation depends on execution context; proposes practices for more representative microbenchmarks. [[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)]|Does not evaluate virtual threads, carrier pressure, JNI, FFM, callbacks, or I/O blocking. It supplies methodological safeguards rather than resolving the substantive gap. [[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)]|**REFORMULATED**|Microbenchmark-validity contribution is **explicit**; relevance to pinning is **inferred**|**Moderate**: strong methodological relevance, weak direct coverage|
|**Practical Benchmarking Configurations for Reproducible…** (ACM, 2026). [[dl.acm](https://dl.acm.org/doi/pdf/10.1145/3838807)]|Develops reproducible JVM benchmark configurations, including CPU pinning, hyperthreading, and multi-threaded-run settings that reduce scheduling noise and improve stability. [[dl.acm](https://dl.acm.org/doi/pdf/10.1145/3838807)]|“Pinning” here refers to CPU/process affinity, not virtual-thread carrier pinning. It does not compare JNI/FFM or controlled carrier starvation. [[dl.acm](https://dl.acm.org/doi/pdf/10.1145/3838807)]|**REFORMULATED**|Benchmark-stability contribution is **explicit**; distinction from carrier pinning is **inferred**|**Moderate**: useful experimental-design foundation, but not a direct test of the gap|
|**Experimental Evaluation Methodology for the Era of No…** (ACM, 2026). [[dl.acm](https://dl.acm.org/doi/10.1145/3839448)]|Addresses unstable JVM workload performance and proposes a methodology that better handles non-steady-state segments and confidence intervals. [[dl.acm](https://dl.acm.org/doi/10.1145/3839448)]|Does not evaluate virtual-thread carrier behavior or native-boundary blocking. Its findings make naive mean-based comparisons of carrier-pool experiments less trustworthy. [[dl.acm](https://dl.acm.org/doi/10.1145/3839448)]|**REFORMULATED**|Methodological contribution is **explicit**; application to virtual-thread pinning is **inferred**|**Moderate**: strengthens required analysis, not the missing empirical comparison|
|**Rethinking Java Performance Analysis** (ASPLOS, 2025). [[dl.acm](http://dl.acm.org/doi/10.1145/3669940.3707217)]|Refreshes and diversifies the DaCapo benchmark suite and argues for renewed Java performance-evaluation workloads and methodologies. [[dl.acm](http://dl.acm.org/doi/10.1145/3669940.3707217)]|Does not provide a targeted JNI/FFM carrier-pinning experiment, nor a controlled comparison of native, file, socket, and sleep blocking. [[dl.acm](http://dl.acm.org/doi/10.1145/3669940.3707217)]|**REFORMULATED**|Benchmark-suite contribution is **explicit**; absence of the specific experiment is **inferred**|**Moderate**: broad Java benchmarking relevance, limited direct overlap|
|**Fray: An Efficient General-Purpose Concurrency Testing…** (2025). [[dl.acm](https://dl.acm.org/doi/10.1145/3764119)]|Improves concurrency bug finding relative to JPF and rr on independent benchmarks. [[dl.acm](https://dl.acm.org/doi/10.1145/3764119)]|Targets correctness/bug detection rather than performance under carrier-pool pressure; does not compare native-boundary blocking mechanisms. [[dl.acm](https://dl.acm.org/doi/10.1145/3764119)]|**REFORMULATED**|Testing focus is **explicit**; non-overlap is **inferred**|**Moderate**: potentially useful for stress tests, not for the performance gap|

## What later work closes

FCoral is the closest later peer-reviewed contribution because it explicitly evaluates Java virtual threads under concurrency and reports both throughput and tail latency. It therefore partially closes the **measurement infrastructure** side of the gap: a study can now build on established concurrency-evaluation techniques rather than inventing an entire harness.[[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)]

The 2026 JVM benchmarking papers also partially close the **experimental validity** side: they provide concrete guidance on avoiding misleading microbenchmarks, stabilizing multi-threaded measurements, and analyzing non-steady-state workloads. These are prerequisites for a credible carrier-pressure experiment, but they do not supply the missing treatment factors or results.[[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)][[dl.acm](https://dl.acm.org/doi/pdf/10.1145/3838807)][[dl.acm](https://dl.acm.org/doi/10.1145/3839448)]

## What remains unresolved

No retrieved later peer-reviewed study reports a controlled comparison in which **JNI and FFM** are varied as treatments alongside **file I/O, socket I/O, and synthetic sleep/blocking**, while carrier parallelism, concurrency, blocking duration, task semantics, and resource budgets are held constant. The retrieved engineering evidence continues to distinguish monitor-related pinning, addressed by JEP 491, from native-frame pinning, which remains after JDK 24.[[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)][[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)][[dl.acm](http://dl.acm.org/doi/10.1145/3669940.3707217)][[infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)]

The unresolved questions are therefore:

- Does FFM impose a materially different carrier-occupancy cost from JNI for equivalent native blocking work?
- Do native-to-Java callbacks that block produce worse carrier starvation than direct native calls, and does the effect differ between JNI and FFM?
- At what offered concurrency does native-boundary blocking exhaust the carrier pool, relative to file, socket, and synthetic blocking controls?
- How does the effect change across pre- and post-JEP-491 JVM versions, where monitor-related pinning was removed but native-frame pinning remained?[[infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)]
- What blocking duration and native-call frequency make the native boundary observable against ordinary I/O variance?

## Classification rationale

|Classification|Meaning here|Studies|
|---|---|---|
|**OPEN**|No later peer-reviewed study directly measures the specified factorial comparison|The original gap remains open overall|
|**PARTIALLY CLOSED**|Directly advances virtual-thread concurrency measurement, but not the native-boundary comparison|FCoral [[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)]|
|**SUBSTANTIALLY CLOSED**|Would require a later study to report the decisive JNI/FFM/I/O/blocking/carrier-pressure comparison|None found|
|**REFORMULATED**|Changes the methodological problem rather than directly testing the original hypothesis|Microbenchmark validity, benchmark reproducibility, non-steady-state analysis, benchmark-suite renewal, concurrency testing [[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)][[dl.acm](https://dl.acm.org/doi/pdf/10.1145/3838807)][[dl.acm](https://dl.acm.org/doi/10.1145/3839448)][[dl.acm](http://dl.acm.org/doi/10.1145/3669940.3707217)][[dl.acm](https://dl.acm.org/doi/10.1145/3764119)]|

## Final assessment

**Current status of the gap: OPEN.** Later peer-reviewed work has strengthened the methodological toolkit for Java concurrency and JVM benchmarking, especially through FCoral’s virtual-thread evaluation and the 2026 benchmarking-methodology literature. However, the central empirical question—**the relative carrier-pool impact of JNI versus FFM, including native callbacks, against controlled I/O and synthetic blocking baselines across JVM versions—remains unanswered** in the retrieved peer-reviewed record.[[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)][[dl.acm](https://dl.acm.org/doi/10.1145/3748522.3779882)][[dl.acm](https://dl.acm.org/doi/pdf/10.1145/3838807)][[dl.acm](https://dl.acm.org/doi/10.1145/3839448)][[infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)]

A Master's project should therefore be framed as a **version-stratified causal benchmark**, not merely another virtual-thread throughput comparison: use JNI/FFM as the focal treatment, file/socket/sleep as controls, and carrier parallelism, concurrency, and blocking duration as pressure factors, while preserving task semantics and resource budgets.[[dl.acm](https://dl.acm.org/doi/abs/10.1145/3847668?af=R)][[dl.acm](https://dl.acm.org/doi/pdf/10.1145/3838807)][[dl.acm](https://dl.acm.org/doi/10.1145/3839448)]