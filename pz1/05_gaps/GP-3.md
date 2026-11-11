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
  - "[[CT-3]]"
---

# PROMPT 1

```

Analyze recent scholarly sources about:
**The FFM/JNI boundary is underexplored experimentally.** Although native frames are identified as a remaining pinning source, the retrieved evidence does not compare JNI, Panama/FFM, file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure. A decisive study should vary **JVM version, JNI versus FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration**, while holding task semantics and resource budgets constant. Version stratification is particularly important because monitor-pinning behavior changed, whereas native-callback pinning remains a distinct concern in the retrieved engineering evidence.

Focus on:
- limitations;
- threats to validity;
- future work;
- open challenges;
- unanswered questions;
- conflicting findings;
- missing populations;
- missing datasets;
- missing benchmarks;
- methodological weaknesses.

OUTPUT
Source | Limitation | Future work | Gap type | Explicit/Infered | Evidence strength | Potential Master's direction

```

# ANSWER

**The retrieved literature supports a scoped research gap, not a definitive claim that no relevant experiment exists:** the identified studies address broad workload performance, application behavior, or scheduling, rather than establishing a controlled JNI–FFM comparison under carrier-pool pressure. **Version stratification is essential:** JEP 491 changes monitor-related pinning, while engineering guidance separately identifies blocking Java callbacks reached through JNI or FFM as a remaining concern.[[norma.ncirl](https://norma.ncirl.ie/8134/)][[scs-europe](https://scs-europe.net/dlib/2025/ecms2025acceptedpapers/0555_dis_ecms2025_0034.pdf)][[arxiv](https://arxiv.org/html/2511.09194v1)][[openjdk](https://openjdk.org/jeps/491)][[quarkus](https://quarkus.io/guides/virtual-threads/)]

The table distinguishes **explicit source statements** from **inferred research opportunities**; proposed future work is my synthesis unless marked otherwise. Evidence strength concerns support for the identified limitation—not the overall quality of the source. Because full study methods were not inspected, inferred omissions remain provisional.

| Source                                                                                                                                                                                      | Limitation                                                                                                                                                                                                                                                            | Future work                                                                                                                                  | Gap type                                                 | Explicit/Inferred                                                           | Evidence strength                                                                                             | Potential Master's direction                                                                                                                      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Pandita (2024), _Benchmarking the Performance of Java Virtual Threads in High-Throughput Workloads_*** — Master's thesis. [[norma.ncirl](https://norma.ncirl.ie/8134/)]                   | The available description compares platform and virtual threads across CPU- and I/O-intensive workloads; it does not establish whether JNI, FFM, callback topology, and carrier pressure were independently controlled. [[norma.ncirl](https://norma.ncirl.ie/8134/)] | Replace aggregate “I/O-bound” categories with matched operations that isolate native-boundary and scheduler effects.                         | Construct validity; missing benchmark dimensions         | **Inferred** from available scope; absence in the full thesis is unverified | **Moderate** for workload scope; **low** for asserting omitted experiments                                    | Build a reproducible benchmark comparing identical native blocking routines exposed through JNI and FFM, alongside Java blocking controls.        |
| **“Analysis of Virtual Threads in Spring Applications” (ECMS 2025)** — conference paper. [[scs-europe](https://scs-europe.net/dlib/2025/ecms2025acceptedpapers/0555_dis_ecms2025_0034.pdf)] | Reported socket-allocation errors under extreme load introduce a competing explanation for degraded performance: resource exhaustion rather than carrier pinning. [[scs-europe](https://scs-europe.net/dlib/2025/ecms2025acceptedpapers/0555_dis_ecms2025_0034.pdf)]  | Separate socket-budget saturation from carrier saturation; measure both and include controlled admission limits.                             | Internal validity; resource-budget confounding           | Socket constraints **explicit**; causal-isolation requirement **inferred**  | **Moderate**: the reported failure mode is visible, but its complete experimental treatment was not inspected | Determine when throughput collapse arises from sockets, connection limits, or occupied carriers using a minimal server plus a Spring replication. |
| **“Energy-Aware Decision Making in Software Stack Upgrades” (2026)** — arXiv manuscript. [[arxiv](https://arxiv.org/pdf/2605.26609.pdf)]                                                    | The retrieved virtual-thread comparison uses JVM 21 and 23, so those particular experiments cannot establish behavior after the JDK 24 monitor change. [[arxiv](https://arxiv.org/pdf/2605.26609.pdf)][[openjdk](https://openjdk.org/jeps/491)]                       | Repeat matched workloads across pre- and post-JEP-491 JVMs, measuring energy alongside latency and carrier occupancy.                        | Temporal validity; missing version populations           | Versions **explicit**; generalization limitation **inferred**               | **Moderate** for the version mismatch; native-boundary coverage remains unverified                            | Investigate whether reduced monitor pinning changes energy efficiency differently from JNI/FFM blocking.                                          |
| **“Minimize Your Critical Path with Combine-and-Exchange…” (2025)** — arXiv manuscript. [[arxiv](https://arxiv.org/html/2511.09194v1)]                                                      | Its virtual-thread comparison concerns `ReentrantLock`, a scheduling adaptation, and a CES mutex; this evidence does not directly answer native-boundary behavior. [[arxiv](https://arxiv.org/html/2511.09194v1)]                                                     | Cross scheduling/locking choices with native blocking and callback workloads rather than extrapolating from lock throughput alone.           | External validity; workload-population gap               | Scope **explicit**; transfer limitation **inferred**                        | **Moderate** for scope; **low** for conclusions about JNI/FFM                                                 | Test whether lock-scheduling improvements survive when a controlled fraction of tasks occupy carriers in native code.                             |
| **JEP 491, _Synchronize Virtual Threads without Pinning_*** — primary engineering specification, **not a scholarly experiment**. [[openjdk](https://openjdk.org/jeps/491)]                  | Establishes a changed monitor mechanism, but is not itself comparative experimental evidence ranking JNI, FFM, file I/O, sockets, and sleep under equal budgets. [[openjdk](https://openjdk.org/jeps/491)]                                                            | Treat the version boundary as an experimental factor; retain monitor workloads as controls rather than combining them with native callbacks. | Version confounding; missing causal benchmark            | Monitor change **explicit**; benchmark gap **inferred**                     | **High** for intended JVM behavior; **insufficient** for comparative performance                              | Conduct a pre-/post-JEP-491 replication with matched monitor-only, native-downcall, and native-callback cases.                                    |
| **Quarkus, _Virtual Thread Support Reference_*** — engineering documentation, **not scholarly evidence**. [[quarkus](https://quarkus.io/guides/virtual-threads/)]                           | Identifies JNI/FFM callbacks into blocking Java code as a pinning case, but provides no controlled comparative effect size in the retrieved material. [[quarkus](https://quarkus.io/guides/virtual-threads/)]                                                         | Separate direct native blocking from native-to-Java callbacks; vary blocking operation and duration independently.                           | Mechanism-to-measurement gap; missing callback benchmark | Callback concern **explicit**; experimental direction **inferred**          | **Strong** for identifying a practical concern; **low** for estimating its performance impact                 | Implement a callback-topology benchmark: Java → native → Java, using the same native library through JNI and FFM.                                 |

## Interpreting apparent conflicts

The thesis reports improved I/O performance with virtual threads, whereas the Spring study reports socket-resource constraints at extreme load; these are **not demonstrated conflicting findings**, because their workloads and limiting resources are not established as equivalent. Likewise, improved monitor behavior and remaining native-callback concerns describe different mechanisms, not contradictory accounts of the same condition.[[norma.ncirl](https://norma.ncirl.ie/8134/)][[scs-europe](https://scs-europe.net/dlib/2025/ecms2025acceptedpapers/0555_dis_ecms2025_0034.pdf)][[openjdk](https://openjdk.org/jeps/491)][[quarkus](https://quarkus.io/guides/virtual-threads/)]

## Strongest Master's study

**Proposed question:** _Under fixed resource budgets, when do JNI and FFM blocking paths cause carrier starvation, and how does this differ from Java file/socket operations and synthetic blocking across JVM versions?_

A manageable design would use a staged experiment rather than an unrestricted full factorial:

- **Version strata:** Include pre- and post-JDK-24 configurations, because monitor behavior changed at that boundary; use a common supported FFM API where possible and document compatibility adaptations.[[openjdk](https://openjdk.org/jeps/491)][[quarkus](https://quarkus.io/guides/virtual-threads/)]
- **Operation strata:** Compare JNI and FFM direct native blocking, JNI and FFM callbacks into blocking Java, file operations, socket operations, and synthetic sleep/park controls.
- **Pressure factors:** Vary configured carrier parallelism, concurrency relative to that parallelism, and blocking duration; record actual carrier counts rather than assuming configuration equals occupancy.
- **Fairness controls:** Hold useful work, payload size, offered load, CPU quota, heap, connection/file budgets, and native implementation constant wherever semantically possible.
- **Outcomes:** Measure throughput, tail latency, deadline misses, carrier occupancy, CPU consumption, and starvation/recovery—not merely mean completion time.
- **Validity safeguards:** Use independent JVM forks, warm-up, randomized run order, uncertainty intervals, and instrumented versus minimally instrumented runs; distinguish open-loop overload from fixed-concurrency behavior.
- **Missing artifacts to contribute:** Publish the benchmark harness, native library, JVM configurations, raw per-run measurements, and traces; these would make the proposed comparison reproducible rather than supplying another aggregate performance claim.

The defensible thesis claim is therefore **“a controlled, version-stratified comparison is missing from the evidence examined,”** not “JNI/FFM pinning has never been studied.”