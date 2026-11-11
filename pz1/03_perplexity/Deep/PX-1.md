---
Date: 2026-11-10
tags:
  - AI
Service: Perplexity
Model: Auto-Thinking
Relevance:
Additional:
  - "cross-memory: off"
Related:
  - "[[SK-8]]"
---

# PROMPT 

```

Act as an academic literature analyst.

RESEARCH AREA
**Real-Time and Embedded Systems (RTSS, EMSOFT, RTAS):** Frame deadline misses, scheduling jitter, and worst-case execution time (WCET) on big.LITTLE architectures.


SEARCH PERIOD
Prioritize 2024–2026.

SEARCH PRIORITY
1. systematic literature reviews;
2. systematic mapping studies;
3. scoping reviews;
4. meta-analyses;
5. high-quality empirical studies after the newest review.

Search using:
("[TERM A]" OR "[TERM B]")
AND
("[TERM C]" OR "[TERM D]")
AND
("systematic review" OR "systematic literature review" OR "mapping study" OR "scoping review" OR "meta-analysis")

For every source provide:
- exact title;
- authors;
- year;
- venue;
- DOI;
- direct link;
- study type;
- research questions;
- method;
- dataset/sample;
- findings;
- limitations;
- explicit future work;
- possible gap.

RULES
- Do not invent DOI.
- Separate EXPLICIT gaps from INFERRED gaps.
- Prefer primary scholarly sources.
- Cite every factual claim.

OUTPUT
A. Source table
B. Consensus map
C. Disagreement map
D. Explicit gaps
E. Inferred gaps
F. Open questions

```

# ANSWER

## A. Source table

The search found **no 2024–2026 systematic review, mapping study, scoping review, or meta-analysis that specifically examines userspace cooperative scheduling versus kernel scheduling on energy-aware heterogeneous mobile SoCs**. The closest evidence comes from broad scheduling reviews, heterogeneous real-time scheduling surveys, and recent empirical studies on big.LITTLE-style platforms. [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8)

| # | Exact title | Authors | Year | Venue | DOI | Direct link | Study type | Research questions | Method | Dataset / sample | Findings | Limitations | Explicit future work | Possible gap |
|---|---|---|---:|---|---|---|---|---|---|---|---|---|---|---|
| 1 | **CPU scheduling from classical heuristics to learning-based and multicore paradigms: a systematic review, comparative analysis, and research roadmap** | Not fully listed in the retrieved record | 2026 | *Computing* (Springer) | 10.1007/s00607-026-01736-8 | [Link](https://link.springer.com/10.1007/s00607-026-01736-8) | Systematic review | How have CPU-scheduling approaches evolved across classical, OS, real-time, multicore/NUMA/heterogeneous, energy-aware, cloud, and learning-based paradigms? | Structured search and screening protocol covering literature through 2025; synthesis of 85 primary and foundational works across seven strands.  [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8) | 85 primary and foundational works.  [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8) | Scheduling affects throughput, interactive latency, fairness, energy consumption, and real-time predictability; the review explicitly includes heterogeneous and energy-aware scheduling as strands.  [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8) | The retrieved abstract does not report a mobile-SoC-specific corpus, protocol details, risk-of-bias assessment, or quantitative meta-analysis. | The review provides a “research roadmap,” but the retrieved record does not expose its specific future-work items. | It treats heterogeneous and energy-aware scheduling broadly; it does not appear to isolate userspace cooperative schedulers, mobile big.LITTLE platforms, or frame-deadline/jitter interactions. |
| 2 | **A Survey of Real-time Scheduling on Accelerator-based Heterogeneous Architecture for Time Critical Applications** | Not fully listed in the retrieved record | 2025 | arXiv preprint | Not retrieved | [Link](https://arxiv.org/abs/2505.11970) | Survey / literature review | What real-time scheduling methods exist for accelerator-based heterogeneous platforms, including timing, energy, thermal, vendor, and application-specific approaches? | Narrative survey organized around soft and hard real-time approaches, vendor support, timing-critical scheduling, energy efficiency, thermal awareness, and application scenarios.  [arxiv](https://arxiv.org/abs/2505.11970) | Literature corpus on accelerator-based heterogeneous platforms; exact inclusion criteria and study count not exposed in the retrieved record.  [arxiv](https://arxiv.org/abs/2505.11970) | Heterogeneous platforms require timing constraints in domains such as robotics and autonomous vehicles; the survey covers both soft- and hard-real-time scheduling and energy/thermal-aware strategies.  [arxiv](https://arxiv.org/abs/2505.11970) | It is a survey rather than a protocol-driven SLR; its focus is accelerator-based heterogeneity, not CPU-cluster big.LITTLE mobile scheduling. | The retrieved abstract does not state explicit future-work recommendations. | It does not appear to evaluate userspace cooperative runtimes or cross-layer interactions between userspace schedulers, Linux/EAS, DVFS, and mobile SoC power management. |
| 3 | **Energy-aware real-time task partitioning on multi-core processors** | Not fully listed in the retrieved record | 2025 | *Journal of Systems Architecture* / SpringerOpen record | 10.1186/s13677-025-00790-5 | [Link](https://dl.acm.org/doi/10.1186/s13677-025-00790-5) | Primary empirical / algorithmic study | How can energy consumption be reduced while scheduling dependent real-time tasks on multicore processors? | Proposes and evaluates energy-aware task partitioning for dependent real-time tasks; positions the work against prior partitioning approaches that mostly address independent tasks.  [dl.acm](https://dl.acm.org/doi/10.1186/s13677-025-00790-5) | Real-time task models and multicore scheduling experiments; the retrieved record does not expose the exact platform, workload suite, or sample size.  [dl.acm](https://dl.acm.org/doi/10.1186/s13677-025-00790-5) | The paper identifies limited prior research on synchronization-aware energy-aware partitioning and addresses dependent real-time tasks.  [dl.acm](https://dl.acm.org/doi/10.1186/s13677-025-00790-5) | The retrieved record does not report hardware validation on a mobile big.LITTLE SoC, WCET bounds, jitter distributions, or frame-deadline-miss rates. | Not stated in the retrieved record. | It addresses multicore energy-aware partitioning but not the userspace/kernel boundary or mobile heterogeneous architecture-specific scheduling dissonance. |
| 4 | **Energy-saving scheduling strategy for real-time applications on big.LITTLE architectures** | M. Zhao, L. Mo, J. Liu, H. Niu | 2025 | *IEEE Internet of Things Journal*, vol. 12, no. 15, pp. 29460–29471 | Not retrieved | Not retrieved from search results | Primary empirical / algorithmic study | How can real-time applications be scheduled energy-efficiently on big.LITTLE architectures? | Energy-saving scheduling strategy for real-time applications on big.LITTLE; identified through citation tracing in a 2026 scheduling survey.  [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628) | Not exposed in the retrieved record. | It directly targets energy-efficient real-time scheduling on big.LITTLE architectures.  [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628) | The retrieved record does not expose whether it models userspace cooperative scheduling, frame-level jitter, WCET, or mobile power-management interactions. | Not stated in the retrieved record. | A promising direct big.LITTLE real-time study, but apparently not framed around userspace cooperative scheduling or cross-layer dissonance. |
| 5 | **Jitter Propagation in Task Chains** | Shumo Wang, Enrico Bini, Qingxu Deng, Martina Maggio | 2025 | IEEE Real-Time Systems Symposium (RTSS 2025) | 10.1109/RTSS66672.2025.00017 | [Link](https://2025.rtss.org/program/index.html) | Primary conference paper | How does jitter propagate through task chains? | Real-time scheduling analysis of jitter propagation in task chains; presented in RTSS 2025’s Real-Time Scheduling session.  [2025.rtss](https://2025.rtss.org/program/index.html) | Not exposed in the retrieved program record. | Addresses jitter propagation, a core phenomenon relevant to frame timing and end-to-end latency in real-time pipelines.  [2025.rtss](https://2025.rtss.org/program/index.html) | The program record does not expose whether the evaluation includes heterogeneous mobile SoCs, energy management, or userspace schedulers. | Not stated in the retrieved record. | Provides timing-jitter theory but does not, from the available record, connect it to energy-aware heterogeneous mobile scheduling. |
| 6 | **A WCET Estimation Model of Programs on Real-Time GPUs** | Hadjer Bendellaa, Liliana Cucu-Grosjean | 2025 | RTSS 2025 Work-in-Progress | 10.1109/RTSS66672.2025.00068 | [Link](https://2025.rtss.org/program/index.html) | Work-in-progress / primary research | How can WCET be estimated for programs running on real-time GPUs? | WCET estimation model for GPU programs; presented as RTSS 2025 work-in-progress.  [2025.rtss](https://2025.rtss.org/program/index.html) | Not exposed in the retrieved record. | Extends WCET analysis toward GPU execution, relevant to heterogeneous mobile systems that combine CPUs and accelerators.  [2025.rtss](https://2025.rtss.org/program/index.html) | Work-in-progress status; the retrieved record does not provide results, validation platform, or mobile big.LITTLE relevance. | Not stated in the retrieved record. | GPU WCET is adjacent to, but distinct from, CPU-cluster big.LITTLE WCET and userspace scheduling dissonance. |
| 7 | **RTSS 2024 Industry Session: Linux, Real-Time, and Hybrid Architectures** | RTSS 2024 industry-session contributors | 2024 | IEEE Real-Time Systems Symposium, Industry Session | Not applicable | [Link](https://2024.rtss.org/industry-session/index.html) | Position / practitioner-oriented session | What practical Linux real-time scheduling problems arise on hybrid architectures with power management? | Practitioner discussion of Linux scheduling-model mismatches, hybrid architectures, power management, and co-scheduling.  [2024.rtss](https://2024.rtss.org/wp-content/uploads/2024/12/rtss2024_industry.pdf) | Linux kernel scheduling classes and real-world hybrid-architecture deployment concerns; not a formal empirical sample.  [2024.rtss](https://2024.rtss.org/wp-content/uploads/2024/12/rtss2024_industry.pdf) | Identifies sustained QoS on big.LITTLE-like hybrid architectures under power management and power capping, plus co-scheduling of workloads with conflicting performance goals, as open practical problems.  [2024.rtss](https://2024.rtss.org/industry-session/index.html) | It is not a peer-reviewed empirical study or systematic review; it does not quantify deadline misses, jitter, or WCET. | The session aims to connect researchers and practitioners around Linux scheduling-model limitations.  [2024.rtss](https://2024.rtss.org/industry-session/index.html) | Strong evidence that the cross-layer userspace–kernel–power-management mismatch is recognized in practice, but not systematically measured. |
| 8 | **Task Scheduling for Heterogeneous Multi-Core Systems** | Not fully listed in the retrieved record | 2025 | Wiley / *International Journal of Networked and Distributed Computing* record | Not retrieved | [Link](https://onlinelibrary.wiley.com/doi/10.1155/int/7562400) | Primary study | How should tasks be scheduled on heterogeneous multicore systems under real-time constraints? | Scheduling approach for heterogeneous multicore systems; the retrieved snippet indicates a latency-priority parameter in high-real-time scenarios.  [onlinelibrary.wiley](https://onlinelibrary.wiley.com/doi/10.1155/int/7562400) | Not exposed in the retrieved record. | Addresses heterogeneous multicore scheduling with real-time/latency considerations.  [onlinelibrary.wiley](https://onlinelibrary.wiley.com/doi/10.1155/int/7562400) | The retrieved record does not establish mobile-platform validation, energy-awareness, userspace scheduling, or WCET analysis. | Not stated in the retrieved record. | Heterogeneous scheduling is studied, but not necessarily under mobile energy-aware architecture constraints. |

## B. Consensus map

- **Heterogeneous scheduling affects both energy and timing.** Recent scheduling literature consistently treats core assignment, task placement, and energy consumption as coupled concerns; the 2026 systematic review explicitly includes heterogeneous and energy-aware scheduling among its core strands. [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8)
- **big.LITTLE is a recognized real-time challenge.** The RTSS 2024 industry session identifies sustained quality of service on hybrid architectures under power management and capping as an unresolved practical issue. [2024.rtss](https://2024.rtss.org/industry-session/index.html)
- **Energy-aware real-time partitioning remains active.** A 2025 study argues that prior energy-aware real-time partitioning work has concentrated on independent tasks, leaving dependent/synchronized tasks comparatively underexplored. [dl.acm](https://dl.acm.org/doi/10.1186/s13677-025-00790-5)
- **Jitter is treated as a first-class real-time concern.** RTSS 2025 includes a dedicated paper on jitter propagation in task chains, indicating continued community attention to timing variability beyond simple deadline feasibility. [2025.rtss](https://2025.rtss.org/program/index.html)
- **WCET remains central to predictable real-time execution.** RTSS 2024 includes an LLVM-based WCET analysis tool, while RTSS 2025 includes work on WCET estimation for real-time GPUs. [2025.rtss](https://2025.rtss.org/program/index.html)

## C. Disagreement map

| Issue | Position / evidence | Counterposition / limitation |
|---|---|---|
| **Can energy-aware heterogeneous scheduling preserve hard real-time guarantees?** | Energy-aware methods are actively developed for real-time multicore and heterogeneous systems, including partitioning and big.LITTLE-specific strategies.  [dl.acm](https://dl.acm.org/doi/10.1186/s13677-025-00790-5) | The available records do not demonstrate that these methods simultaneously bound WCET, jitter, and frame deadline misses on production mobile SoCs.  [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628) |
| **Is heterogeneity mainly a CPU-cluster problem?** | big.LITTLE-style CPU heterogeneity is explicitly discussed in real-time and Linux practitioner contexts.  [2024.rtss](https://2024.rtss.org/industry-session/index.html) | The 2025 heterogeneous-scheduling survey centers on accelerator-based platforms, implying a broader and partly separate notion of heterogeneity.  [arxiv](https://arxiv.org/abs/2505.11970) |
| **Should scheduling decisions reside in the kernel or userspace?** | Linux real-time discussion highlights kernel scheduling classes, runqueues, migrations, `SCHED_DEADLINE`, and the mismatch between Linux’s scheduling model and real-time theory.  [2024.rtss](https://2024.rtss.org/wp-content/uploads/2024/12/rtss2024_industry.pdf) | The retrieved 2024–2026 evidence does not establish a consensus on where cooperative userspace scheduling should sit relative to kernel scheduling and power management. |
| **Is jitter primarily an analysis problem or a systems problem?** | RTSS 2025 treats jitter propagation as a formal scheduling-analysis topic.  [2025.rtss](https://2025.rtss.org/program/index.html) | The industry session frames jitter-adjacent QoS problems as practical Linux/hybrid-architecture issues involving power management and co-scheduling.  [2024.rtss](https://2024.rtss.org/industry-session/index.html) |

## D. Explicit gaps

These are gaps stated or directly implied by the retrieved sources:

- **No topic-specific systematic review.** The closest 2026 SLR covers CPU scheduling broadly, including heterogeneous and energy-aware scheduling, but does not appear to isolate userspace cooperative scheduling on energy-aware heterogeneous mobile architectures. [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8)
- **Userspace cooperative scheduling is absent from the retrieved real-time heterogeneous-scheduling survey.** The 2025 survey covers accelerator-based heterogeneous platforms, timing, energy, and thermal concerns, but its retrieved scope does not include userspace cooperative runtimes. [arxiv](https://arxiv.org/abs/2505.11970)
- **Dependent-task energy-aware scheduling is underexplored.** The 2025 partitioning paper explicitly states that relatively limited research addresses task synchronization in energy-aware real-time task partitioning. [dl.acm](https://dl.acm.org/doi/10.1186/s13677-025-00790-5)
- **Linux hybrid-architecture QoS remains unresolved in practice.** RTSS 2024’s industry session explicitly names sustained QoS on big.LITTLE-like hybrid architectures under power management and power capping as a challenge. [2024.rtss](https://2024.rtss.org/industry-session/index.html)
- **Linux’s scheduling model and real-time theory are misaligned.** The RTSS 2024 industry material identifies a mismatch between Linux’s scheduling model and established theoretical results. [2024.rtss](https://2024.rtss.org/wp-content/uploads/2024/12/rtss2024_industry.pdf)

## E. Inferred gaps

These are gaps inferred from the evidence, not explicitly claimed by the sources:

- **Cross-layer dissonance is not operationalized.** No retrieved source appears to define or measure a mismatch among userspace cooperative scheduling decisions, kernel scheduling, DVFS/frequency selection, core migration, and thermal/power constraints on mobile big.LITTLE systems. [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8)
- **Frame-level deadline misses are not connected to cooperative scheduling.** RTSS covers deadline failure probability and elastic scheduling, while the retrieved big.LITTLE work targets energy savings, but none of the retrieved records explicitly links userspace cooperative scheduling to frame-deadline misses. [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)
- **Jitter analysis is not coupled to energy-aware heterogeneous placement.** Jitter propagation is studied as a scheduling-analysis problem, while big.LITTLE energy scheduling is studied separately; their intersection appears unexamined in the retrieved record. [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)
- **WCET under userspace cooperative scheduling is unclear.** WCET work addresses LLVM-based analysis and GPU programs, but no retrieved source evaluates how userspace cooperative runtimes alter WCET, cache behavior, migration costs, or timing predictability on heterogeneous mobile CPUs. [2025.rtss](https://2025.rtss.org/program/index.html)
- **Mobile SoC external validity is limited.** Much heterogeneous real-time work is generic multicore, accelerator-based, or simulation/model oriented; direct evaluation on representative mobile big.LITTLE/DynamIQ SoCs under realistic Android or embedded workloads is not demonstrated in the retrieved records. [arxiv](https://arxiv.org/abs/2505.11970)
- **Energy metrics may not capture user-perceived timing.** Energy-saving big.LITTLE work exists, but the retrieved evidence does not show whether energy optimization preserves frame pacing, tail latency, or deadline-miss distributions. [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)

## F. Open questions

1. **Does userspace cooperative scheduling improve or degrade worst-case timing on big.LITTLE?** Specifically, how do userspace affinity, yield, priority, and synchronization decisions interact with kernel migration and `SCHED_DEADLINE` reservations? The Linux practitioner evidence identifies a model mismatch but does not resolve it empirically. [2024.rtss](https://2024.rtss.org/wp-content/uploads/2024/12/rtss2024_industry.pdf)

2. **How much additional jitter arises when a cooperative scheduler changes core placement or yields under DVFS?** Jitter propagation is formally studied, but its interaction with heterogeneous core placement and power-state transitions is not established in the retrieved evidence. [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)

3. **Can energy-aware big.LITTLE scheduling preserve frame deadlines without inflating WCET?** Energy-saving big.LITTLE scheduling exists, but its effect on WCET, deadline misses, and frame pacing is not exposed in the available record. [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)

4. **What is the proper evaluation workload for “scheduling dissonance”?** A rigorous study would need frame-based mobile workloads, controlled core-placement policies, kernel trace data, power/thermal telemetry, and deadline-miss/jitter distributions; none of the retrieved sources reports such a combined protocol. [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8)

5. **Should cooperative scheduling be aware of kernel power management, or should the kernel expose a real-time-aware contract to userspace?** The RTSS 2024 industry discussion suggests that power management, capping, and hybrid-architecture QoS are intertwined, but does not prescribe an architectural boundary. [2024.rtss](https://2024.rtss.org/industry-session/index.html)

6. **Do dependent real-time task graphs behave differently from independent tasks under energy-aware heterogeneous partitioning?** The 2025 partitioning study identifies synchronization as an underexplored dimension, making DAG- or pipeline-style mobile frame workloads a natural next target. [dl.acm](https://dl.acm.org/doi/10.1186/s13677-025-00790-5)

**Bottom line:** The literature supports the premise that energy-aware heterogeneous scheduling and real-time predictability are in tension, but it does **not** yet provide a focused, systematic account of how userspace cooperative scheduling creates or mitigates cross-layer scheduling dissonance on mobile big.LITTLE architectures. That absence is itself the principal research gap. [link.springer](https://link.springer.com/10.1007/s00607-026-01736-8)

# ЦІКАВЕ

#### B. Consensus map
**Jitter is treated as a first-class real-time concern.** RTSS 2025 includes a dedicated paper on jitter propagation in task chains, indicating continued community attention to timing variability beyond simple deadline feasibility.