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
  - "[[PX-1]]"
---

# PROMPT 

```
Search scholarly literature from 2024–2026 concerning:
 **Energy studies do not measure scheduling fragility.** The 2026 energy-aware upgrade study finds energy benefits from virtual threads but does not report carrier starvation, pinning events, or tail-latency degradation.[[dl.acm]

Determine whether literature shows:
A. broad agreement;
B. conditional agreement;
C. contradictory evidence;
D. insufficient evidence.

Find:
- positive effects;
- negative effects;
- null effects;
- context-dependent effects.

For each study:
Study | Context | Sample | Method | Metric | Effect | Finding | Limitations | DOI/link

Then create:
SUPPORTING cluster
CONTRADICTING cluster
NULL/UNCERTAIN cluster

Consider population, model, dataset, task, metric, design, duration, statistical power.

Finish:
"The contradictory-evidence gap can/cannot currently be defended because..."
```

# ANSWER

**Verdict: D — insufficient evidence.** The 2026 energy-aware upgrade study reports that virtual threads reduced energy consumption, but it does **not** report carrier starvation, pinning events, or tail-latency degradation; the broader literature documents those fragility mechanisms separately, under different workloads and without energy measurement. Thus, the claim is **conditionally plausible but not empirically established**. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

## What the record shows

Stocker and Wahler’s 2026 study benchmarks Spring Boot/JVM/software-stack combinations using an automated benchmark of the Spring Petclinic REST application. It finds substantial energy variation across versions and reports that newer JVM releases and Java 21 virtual threads yielded significant energy savings without application changes. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

However, its stated focus and reported findings concern energy consumption—not scheduler fragility. The abstract and highlights do not identify carrier starvation, `jdk.VirtualThreadPinned` events, pinning frequency/duration, queue depth, or tail-latency degradation as measured outcomes. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

## Study-level evidence

| Study | Context | Sample | Method | Metric | Effect | Finding | Limitations | DOI/link |
|---|---|---|---|---|---|---|---|---|
| Stocker & Wahler (2026), *J. Syst. Softw.* | Energy consequences of Spring Boot, JVM, and execution-platform upgrades | Spring Petclinic REST case study; combinations of framework versions, JVM versions, and execution platforms | Automated benchmarking across software-stack configurations | Energy consumption | **Positive for energy; null/unreported for fragility** | Newer JVM releases and virtual threads significantly reduced energy consumption without application changes. | Does not report carrier starvation, pinning events, pin duration, scheduling stalls, or tail-latency degradation; single case-study application; no stated fragility hypothesis or power analysis. | [10.1016/j.jss.2026.112963](https://doi.org/10.1016/j.jss.2026.112963)  [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963) |
| Bharadwaj (2026), “Virtual Threads after JDK 24” | High-throughput, I/O-intensive Spring services; virtual-thread adoption risk | Controlled benchmark on an 8-vCPU c7i.2xlarge host; 500 concurrent users; 60-second runs; ThreadLocal and JDBC scenarios | Controlled A/B benchmark comparing platform threads and virtual threads; JFR and structured thread dumps | Throughput, p99/p999 latency, errors, GC pressure, ThreadLocal initializations, pending connection acquisitions | **Context-dependent** | Virtual threads improved throughput (+107% in ThreadLocal scenario; +147% in JDBC scenario) and reduced p99 latency (−64% and −55%), but shifted bottlenecks to downstream resources; both pool configurations saturated and produced roughly 37% errors in the JDBC scenario. | Technical benchmark/article rather than a peer-reviewed energy study; no energy/power measurement; short 60-second runs; one host and workload family; no statistical power reporting. | [Article](https://www.infoq.com/articles/virtual-threads-after-jdk24/)  [infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/) |
| OpenJDK JEP 491 / virtual-thread documentation (2024–2026) | JVM runtime behavior under monitor, native-frame, class-loading, and file-I/O pinning | JVM runtime and documented residual pinning scenarios | Specification, implementation change, and diagnostic guidance | Carrier availability, `jdk.VirtualThreadPinned`, scheduling stalls | **Negative mechanism; not an energy outcome** | JDK 24 removed monitor-related carrier pinning, but residual pinning remains for native frames, class loading, and local file I/O; frequent/long pinning can make carriers unavailable and cause runnable virtual threads to queue. | Not an empirical energy study; mechanism-oriented rather than a controlled evaluation of energy–fragility tradeoffs. | [JEP 491 / InfoQ synthesis](https://www.infoq.com/articles/virtual-threads-after-jdk24/)  [infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/) |
| Kora production guidance (2026) | Production virtual-thread deployments | Operational production scenarios | Practitioner diagnosis and operational guidance | Carrier availability, queued runnable virtual threads, pinning events | **Negative mechanism; not an energy outcome** | Defines carrier starvation as runnable virtual-thread work existing while too few carriers are available; identifies frequent, long-lived pinning as the production risk condition. | Practitioner documentation, not peer-reviewed evidence; no energy measurement or controlled comparison. | [Kora guidance](https://kora-projects.github.io/kora-docs/v2/en/blog/virtual-thread-in-production/)  [kora-projects.github](https://kora-projects.github.io/kora-docs/v2/en/blog/virtual-thread-in-production/) |

## Effect clusters

### SUPPORTING cluster

The supporting evidence is **indirect and conditional**: it establishes that virtual threads can improve energy or throughput, while separately establishing that they can create scheduling fragility under particular code and load conditions.

- **Energy benefit:** Stocker and Wahler find significant energy savings from newer JVM releases and virtual threads in their Spring Petclinic benchmark. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)
- **Fragility mechanism:** Before JDK 24, synchronized blocking could pin a virtual thread to its carrier; enough simultaneous pins could exhaust carriers and stall scheduling. [infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)
- **Residual fragility:** Even after JEP 491, native frames, class loading, and Linux local file I/O can still pin carriers; JFR `jdk.VirtualThreadPinned` remains the recommended detection mechanism. [infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)
- **Tail-latency relevance:** The controlled benchmark shows that virtual threads can improve p99 latency in I/O-bound scenarios, but also that bottleneck relocation can leave error rates unchanged despite large throughput gains. [infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)

### CONTRADICTING cluster

**No directly contradicting peer-reviewed study was identified.** No retrieved 2024–2026 study reports that virtual-thread energy savings are accompanied by measured carrier starvation, increased pinning, or tail-latency degradation in the same experimental setting. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

This absence does **not** show that fragility is absent. It shows that the energy study did not measure the fragility outcomes, while the fragility literature did not measure energy. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

### NULL/UNCERTAIN cluster

- **Stocker & Wahler (2026):** Energy improved, but fragility metrics were absent; therefore, the result is **null with respect to fragility**, not evidence that fragility is absent. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)
- **Bharadwaj benchmark (2026):** Tail latency improved in the tested I/O-bound scenarios, but the study did not measure energy; its JDBC scenario also showed persistent saturation and about 37% errors, making a blanket “virtual threads improve tail latency” claim unsupported. [infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)
- **JEP 491 / runtime documentation:** Establishes that monitor-related pinning was removed, but residual pinning remains; this is a context-dependent risk, not a universal negative effect. [infoq](https://www.infoq.com/articles/virtual-threads-after-jdk24/)
- **Production guidance:** Defines carrier starvation and recommends pinning observability, but provides no controlled energy–fragility experiment. [kora-projects.github](https://kora-projects.github.io/kora-docs/v2/en/blog/virtual-thread-in-production/)

## Population, model, and validity

| Dimension | What is established | What is missing for the coupling claim |
|---|---|---|
| Population | Spring Petclinic REST application; I/O-intensive Spring services | Production or representative services with synchronized/native/file-I/O paths and downstream resource contention |
| Model | JVM/Spring version matrix; virtual-thread versus platform-thread execution | Joint model linking virtual-thread scheduling, carrier occupancy, energy, and tail latency |
| Dataset | Petclinic benchmark configurations; controlled benchmark profiles | Multi-service, multi-workload dataset with per-request energy and scheduler telemetry |
| Task | REST request handling; I/O-bound request paths; JDBC access | Workloads that deliberately trigger residual pinning and carrier contention |
| Metric | Energy consumption; throughput; p99/p999 latency; errors; GC; pinning events | Joint endpoints: energy, carrier-starvation duration, pin count/duration, queue depth, p99/p999 latency, and SLA violations |
| Design | Automated benchmarking; controlled A/B benchmark | Factorial design crossing JDK version, virtual-thread use, pinning-inducing code, carrier count, and load |
| Duration | Benchmark runs; 60-second controlled benchmark windows | Sustained soak tests, burst/recovery tests, and long-duration production-like traces |
| Statistical power | Not reported in the available record for either energy or fragility outcomes | Pre-specified effect sizes, repeated trials, confidence intervals, and multiple-comparison correction |

## Interpretation

The record supports a **measurement-gap claim**, not a demonstrated tradeoff. The energy study establishes an energy benefit but leaves scheduler fragility unmeasured; the virtual-thread fragility literature establishes plausible failure mechanisms but generally does not quantify their energy cost. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

The strongest defensible formulation is **conditional agreement**: virtual threads may reduce energy in the tested Spring/JVM configuration, while carrier pinning and starvation remain credible scheduling-fragility risks under residual pinning conditions; whether those risks erode the energy benefit is unknown. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)

**The contradictory-evidence gap cannot currently be defended because** no retrieved 2024–2026 study jointly measures energy consumption and scheduling fragility—carrier starvation, pinning events, and tail-latency degradation—for virtual-thread adoption. The energy result and the fragility mechanisms come from non-overlapping studies, workloads, metrics, and experimental designs, so neither confirmation nor contradiction of an energy–fragility tradeoff is currently supported. [dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)