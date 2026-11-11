---
Date: 2026-11-10
tags:
  - AI
Service: Perplexity
Model: Auto
Relevance:
Additional:
  - "cross-memory: off"
Related:
  - "[[CT-2]]"
---

# PROMPT 1

```
Analyze recent scholarly sources about:
Virtual threads may reduce energy in the tested Spring/JVM configuration, while carrier pinning and starvation remain credible scheduling-fragility risks under residual pinning conditions; whether those risks erode the energy benefit is unknown. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

**Tail-latency relevance:** The controlled benchmark shows that virtual threads can improve p99 latency in I/O-bound scenarios, but also that bottleneck relocation can leave error rates unchanged despite large throughput gains.

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

The evidence supports a **conditional, unresolved tradeoff**: virtual threads can reduce energy in a specific Spring/JVM configuration, while pinning and carrier starvation remain credible fragility mechanisms—but no retrieved study jointly measures whether those mechanisms consume or reverse the energy benefit. The strongest available result is therefore an **energy-only finding** beside separate **latency/fragility findings**, not a demonstrated energy–fragility tradeoff.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]

## Evidence synthesis

|Source|Limitation|Future work|Gap type|Explicit/Inferred|Evidence strength|Potential Master's direction|
|---|---|---|---|---|---|---|
|**Stocker & Wahler (2026), _J. Syst. Softw._*** — energy-aware software-stack upgrades|Uses one Spring Petclinic REST case study; evaluates Spring Boot, JVM, and execution-platform combinations, but the abstract/highlights do not report carrier starvation, pinning events, pin duration, queue depth, or tail-latency degradation. The energy result is therefore not interpretable as a fragility-safe result.|Extend the benchmark matrix with JFR `jdk.VirtualThreadPinned`, carrier occupancy, scheduler queue depth, p99/p999 latency, and error rate; test whether energy savings persist under pinning-inducing workloads.|**Missing outcome measures**: scheduling fragility absent from an energy study|**Explicit**: energy is measured; **inferred**: fragility is not measured|**Moderate for energy**; **insufficient for energy–fragility coupling**|Build an energy-plus-fragility benchmark for Spring Boot virtual threads: measure joules/request alongside pinning count, carrier starvation duration, p99/p999 latency, and error rate.|
|**Stocker & Wahler (2026)** — external validity|The case study is a single REST application; the abstract does not establish whether the virtual-thread benefit generalizes across request patterns, database-bound workloads, native calls, file I/O, or production traffic mixes.|Replicate across diverse Spring services: CPU-bound, blocking-I/O, database-heavy, native-call, and mixed workloads.|**Missing populations / applications**|**Inferred**|**Moderate for the tested configuration; low for generalization**|Create a multi-application benchmark suite with controlled workload classes and report per-class energy and fragility effects.|
|**Stocker & Wahler (2026)** — benchmark design and statistical validity|The available record describes automated benchmarking but does not establish repeated-trial counts, confidence intervals, effect sizes, multiple-comparison correction, or statistical power for the virtual-thread energy effect.|Pre-register a repeated-measures design with power analysis, randomized run order, warm-up/cooldown control, and nonparametric or robust effect-size reporting.|**Methodological weakness / statistical power**|**Inferred**|**Moderate for direction; low for inferential certainty**|Conduct a power-planned factorial experiment: JDK version × Spring Boot version × virtual threads × workload × concurrency.|
|**Stocker & Wahler (2026)** — duration and operational realism|The abstract does not report sustained-load, burst-recovery, thermal, GC, or cold-start behavior; short benchmarks may miss slow carrier exhaustion, connection-pool saturation, or delayed tail-latency effects.|Run soak tests and burst/recovery scenarios over hours, while recording energy, GC, connection-pool saturation, and scheduler telemetry.|**Missing duration / operational realism**|**Inferred**|**Moderate for short-run energy; low for long-run fragility**|Compare steady-state, ramp-up, burst, and recovery phases under identical request profiles.|
|**Bharadwaj (2026), “Virtual Threads after JDK 24”** — controlled performance benchmark|Shows virtual threads improved throughput and p99 latency in ThreadLocal and JDBC scenarios, but did not measure energy; its 60-second runs, one 8-vCPU host, and limited workload family limit generalization.|Add energy instrumentation and longer, production-like runs; vary concurrency, downstream pool size, CPU quota, and GC configuration.|**Missing metric**: energy absent from a fragility/latency benchmark|**Explicit**: latency and throughput measured; **inferred**: energy not measured|**Moderate for latency/throughput; insufficient for energy**|Pair the same benchmark with RAPL or external power measurement, then model energy per successful request and per tail-latency percentile.|
|**Bharadwaj (2026)** — bottleneck relocation|Virtual threads improved throughput by 107% and 147% and reduced p99 latency by 64% and 55%, but both pool configurations saturated and produced approximately 37% errors in the JDBC scenario; gains can relocate rather than eliminate the bottleneck.|Instrument the full request path—Tomcat, virtual-thread scheduler, HikariCP, database, network—and identify which resource becomes the new constraint.|**Conflicting/context-dependent performance finding**|**Explicit**|**Moderate**|Develop a bottleneck-relocation detection method that combines scheduler, connection-pool, database, and host telemetry.|
|**Bharadwaj (2026)** — tail-latency interpretation|The p99 improvement does not establish tail-latency robustness: saturation and error behavior can dominate reliability even when median or p99 latency improves.|Report full latency distributions, p99.9, timeout rate, retry amplification, and saturation behavior—not p99 alone.|**Metric limitation / tail-latency validity**|**Inferred**|**Moderate**|Evaluate virtual threads using percentile curves, overload curves, and error-budget consumption rather than a single p99 point.|
|**OpenJDK JEP 491 / virtual-thread runtime behavior (2024–2026)**|Monitor-related carrier pinning was removed, but residual pinning remains for native frames, class loading, and Linux local file I/O; this is a documented mechanism, not a measured energy–latency tradeoff.|Quantify residual pinning frequency, duration, carrier occupancy, and resulting energy cost across JDK versions and native/I-O workloads.|**Mechanism–outcome gap**|**Explicit**|**High for mechanism; low for quantitative impact**|Build a pinning taxonomy and measure the marginal energy and latency cost of each residual pinning class.|
|**Kora production guidance (2026)**|Defines carrier starvation as runnable virtual-thread work existing while too few carriers are available; identifies frequent, long-lived pinning as the risk condition. It is practitioner guidance, not a controlled study, and does not measure energy.|Operationalize starvation as a measurable state: runnable virtual threads waiting while carrier availability falls below a threshold.|**Missing empirical validation / missing metric**|**Explicit definition; inferred measurement need**|**Low–moderate**|Create a carrier-starvation detector using JFR events, scheduler queue depth, and runnable-thread counts; validate it against injected pinning.|
|**JobRunr benchmark (2026)** — pinning stress test|On JDK 21, a `synchronized` block around a blocking call reduced virtual-thread throughput from 462 to 33 jobs/s and raised p99 latency from 253 ms to 6,799 ms; JDK 25 eliminated pinning events in that workload. This demonstrates severe fragility, but does not report energy. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|Repeat the same pinning workload with energy measurement and compare JDK 21, JDK 24, and JDK 25 under matched hardware and load. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|**Conflicting/context-dependent finding; missing energy metric**|**Explicit**|**Moderate for latency/throughput; insufficient for energy**|Test whether removing pinning changes energy per job, energy per successful job, and tail latency under identical work.|
|**JobRunr benchmark (2026)** — version dependence|The result is strongly version-dependent: JDK 21 exhibits catastrophic pinning effects, while JDK 25 reports zero pinning events for the tested workload. This prevents a single “virtual threads are fragile” or “virtual threads are safe” conclusion. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|Test JDK versions as a first-class factor, including JEP 491-era and later runtimes, with identical code and workload. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|**Context dependence / version sensitivity**|**Explicit**|**Moderate**|Construct a JDK-version sensitivity study that separates virtual-thread effects from JVM, GC, JIT, and library-version effects.|
|**Spring Boot virtual-thread benchmark (2026), tucanoo**|Measures throughput, tail latency, bottleneck movement, and JFR pinning, but uses WSL2 rather than bare metal and is a narrow, non-peer-reviewed experiment; virtualization and host sharing can distort timing and energy measurements. [[github](https://github.com/tucanoo/springboot-virtualthreads/blob/main/README.md)][[github](https://github.com/tucanoo/springboot-virtualthreads)]|Replicate on bare metal with isolated CPU cores, controlled frequency scaling, and calibrated power measurement. [[github](https://github.com/tucanoo/springboot-virtualthreads)]|**Threat to validity / environmental control**|**Explicit**|**Low–moderate**|Compare containerized/VM, WSL2, and bare-metal environments to quantify measurement-environment bias.|
|**Spring Boot virtual-thread benchmark (2026)** — bottleneck relocation|The experiment explicitly tracks movement of the bottleneck from the Tomcat thread pool to the HikariCP connection pool, illustrating that thread-model gains may expose a downstream constraint. [[github](https://github.com/tucanoo/springboot-virtualthreads/blob/main/README.md)]|Add adaptive downstream-capacity policies and evaluate whether they preserve energy savings without increasing tail latency. [[github](https://github.com/tucanoo/springboot-virtualthreads/blob/main/README.md)]|**Open challenge / system-level coupling**|**Explicit**|**Moderate**|Design an energy- and latency-aware capacity controller for virtual-thread services with database pools, HTTP clients, and message brokers.|

## Limitations and threats

- **Single-application external validity:** The peer-reviewed energy result rests on Spring Petclinic; it cannot yet establish a general virtual-thread energy effect across service architectures, request mixes, or dependency stacks.
- **Metric incompleteness:** The energy study measures energy but not fragility; the latency benchmarks measure fragility or latency but not energy. No source closes the loop.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
- **Version confounding:** JDK, Spring Boot, GC, JIT, libraries, and virtual-thread behavior can change together. The JobRunr result shows why JDK version must be isolated rather than treated as a single “upgrade” variable.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
- **Short-duration bias:** Sixty-second benchmark windows may fail to expose gradual carrier exhaustion, connection-pool saturation, thermal throttling, or delayed tail-latency effects.
- **Environment bias:** WSL2 and shared-host virtualization can alter scheduling, CPU isolation, power measurement, and tail behavior; bare-metal replication is needed before operational recommendations.[[github](https://github.com/tucanoo/springboot-virtualthreads)]
- **Tail-latency reductionism:** p99 alone is insufficient because p99.9, timeout rate, retry amplification, queue depth, and error rate may deteriorate even when p99 improves.
- **No causal identification:** Existing results cannot determine whether energy savings arise from fewer platform threads, reduced context switching, altered GC behavior, reduced CPU utilization, or a change in request completion rate.

## Open questions

1. Does the virtual-thread energy benefit persist when residual pinning is deliberately induced through native calls, class loading, or local file I/O?
2. Does carrier starvation increase energy through longer queue residence, retries, wasted CPU work, or reduced batching efficiency?[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
3. Is energy per request, energy per successful request, or total energy the appropriate sustainability metric when error rates rise under saturation?
4. At what carrier-pinning frequency and duration does the energy benefit become statistically and practically negligible?[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
5. Do JDK 24+ improvements eliminate the fragility risk, or merely relocate it to less common native, class-loading, and file-I/O paths?
6. Does relocating a bottleneck from the web-thread pool to a database connection pool preserve, reduce, or reverse the energy gain?[[github](https://github.com/tucanoo/springboot-virtualthreads/blob/main/README.md)]
7. Can a single scheduling policy optimize energy, p99/p999 latency, throughput, and error rate simultaneously, or are these objectives inherently competing under saturation?[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]

## Missing evidence base

- **Missing populations:** CPU-bound services, mixed CPU/I/O workloads, native-call-heavy services, file-I/O-heavy services, streaming systems, and high-fanout microservice graphs.
- **Missing datasets:** Public datasets containing aligned time series for energy, request latency, pinning events, carrier occupancy, queue depth, GC, CPU frequency, and downstream-pool utilization.
- **Missing benchmarks:** A standardized benchmark that crosses Spring Boot version, JDK version, virtual-thread configuration, workload type, concurrency, carrier count, and downstream capacity.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
- **Missing statistical designs:** Pre-registered repeated-measures experiments with power analysis, confidence intervals, effect sizes, and correction for multiple comparisons.
- **Missing production validation:** Long-duration field studies on heterogeneous hardware, real traffic, and production dependency services.

## Master’s research direction

A strong Master’s project would use a **2 × 2 × 2 × 3 factorial design**: virtual threads versus platform threads; JDK 21 versus JDK 24/25; pinning-free versus pinning-inducing code path; and low, medium, and saturation-level concurrency. It should measure energy per successful request, p50/p99/p999 latency, error rate, `jdk.VirtualThreadPinned` count and duration, carrier occupancy, scheduler queue depth, connection-pool utilization, CPU frequency, and GC activity.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]

The central hypothesis would be: **virtual threads reduce energy in I/O-bound Spring workloads, but residual pinning and carrier starvation moderate or reverse that benefit as concurrency and downstream contention increase.** The current literature permits this as a hypothesis, but not yet as an established finding.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]