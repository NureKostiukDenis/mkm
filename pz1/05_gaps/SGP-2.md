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
  - "[[GP-2]]"
---
	
# PROMPT

```
A review or earlier study suggests:
Jitter propagation has mature formal treatments, while big.LITTLE energy-aware scheduling is separately developed; the retrieved survey and adjacent studies do not bridge them with a common experimental design. [dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)

Energy-aware placement may influence timing variability, and jitter may influence scheduling and energy behavior, but no retrieved 2024–2026 study measures that reciprocal relationship on big.LITTLE hardware. [lup.lub.lu](https://lup.lub.lu.se/search/files/235446236/964200a096.pdf)


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

## Current status of the gap

The search found **no 2025–2026 peer-reviewed study that jointly measures the reciprocal relationship**—how energy-aware placement changes timing jitter, and how jitter in turn changes scheduling and energy behavior—on ARM big.LITTLE hardware. The closest work advances one side of the problem (formal jitter propagation or energy-aware big.LITTLE scheduling), but does not bridge them in a common experimental design.[[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)][[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103740)][[dl.acm](https://dl.acm.org/doi/10.1145/3716368.3735195)][[arxiv](https://arxiv.org/pdf/2502.10000.pdf)]

## Later studies found

|Study|What it addresses|What remains unresolved|Classification|
|---|---|---|---|
|**Wang, Bini, Deng & Maggio, “Jitter Propagation in Task Chains,” IEEE RTSS 2025** [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|Provides a formal, compositional model of read/write jitter in task chains and analyzes its propagation into reaction time, data age, and end-to-end latency; explicitly supports ROS 2-style systems. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|It treats jitter as an input to timing analysis rather than measuring how core placement, migration, DVFS, or energy-aware scheduling generate jitter. It does not evaluate big.LITTLE hardware, energy consumption, or a closed-loop placement–jitter–energy experiment. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|**PARTIALLY CLOSED**|
|**Rahim et al., “A survey of machine learning-driven task scheduling approaches for multiprocessor systems,” _Journal of Systems Architecture_, 2026** [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|Surveys ML/RL scheduling for multiprocessors, including heterogeneous architectures, energy efficiency, real-time responsiveness, and reliability; it identifies scheduling objectives and evaluation needs. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|It is a survey, not an experimental study; it does not establish or measure a causal reciprocal relationship between jitter and energy-aware placement on big.LITTLE. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|**OPEN**|
|**“Energy-saving scheduling strategy for real-time applications on big.LITTLE architectures,” _IEEE Internet of Things Journal_, 2025** [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|Develops energy-saving scheduling specifically for real-time applications on big.LITTLE architectures, addressing the energy/placement side of the gap. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|The available evidence does not indicate that it measures jitter propagation or models jitter as a scheduling input/output; it therefore does not close the reciprocal timing–energy coupling. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]|**PARTIALLY CLOSED**|
|**“Optimizing Reliability and Energy Efficiency in Heterogeneous …,” ACM, 2025** [[dl.acm](https://dl.acm.org/doi/10.1145/3716368.3735195)]|Targets reliability and energy efficiency on heterogeneous platforms, explicitly invoking ARM big.LITTLE/DynamIQ-style architectures. [[dl.acm](https://dl.acm.org/doi/10.1145/3716368.3735195)]|No evidence that it measures jitter as both a consequence of placement and a cause of scheduling/energy variation; reliability and energy objectives remain separate from a formal jitter-propagation treatment. [[dl.acm](https://dl.acm.org/doi/10.1145/3716368.3735195)]|**PARTIALLY CLOSED**|
|**“DFTS-MCS: Dynamic fault-tolerant scheduling for mixed-criticality systems,” _Journal of Systems Architecture_, 2026** [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103740)]|Presents dynamic fault-tolerant scheduling for ARM big.LITTLE, combining real-time reliability with the platform’s performance/energy trade-offs. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103740)]|Its focus is fault tolerance and mixed criticality, not jitter propagation or an experimental reciprocal jitter–energy analysis. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103740)]|**OPEN**|
|**“CFSECC: Cyclic feedback scheduling for energy-constrained real-time applications in heterogeneous distributed systems,” _Journal of Systems Architecture_, 2026** [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103906)]|Addresses energy-constrained real-time scheduling in heterogeneous distributed systems and cites prior big.LITTLE real-time scheduling work. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103906)]|It concerns heterogeneous distributed systems rather than a controlled big.LITTLE hardware study of placement-induced jitter and jitter-induced energy effects. [[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103906)]|**OPEN**|
|**“Energy-Aware Scheduling Strategies for Partially-Replicable Task Chains on Heterogeneous Processors,” arXiv 2025** [[arxiv](https://arxiv.org/pdf/2502.10000.pdf)]|Optimizes throughput/period and power by scheduling partially replicable task chains on heterogeneous multicore processors, using as many LITTLE cores as necessary. [[arxiv](https://arxiv.org/pdf/2502.10000.pdf)]|It is adjacent but does not measure jitter propagation or reciprocal timing–energy effects; it also appears to be a preprint rather than established peer-reviewed work. [[arxiv](https://arxiv.org/pdf/2502.10000.pdf)]|**REFORMULATED**|

## Why the gap remains

The 2025 RTSS paper supplies the missing formal machinery for jitter: it models bounded read/write jitter, derives how uncertainty propagates through cause-effect chains, and connects it to reaction time, data age, and end-to-end latency. But its analysis is deliberately decoupled from a particular scheduling policy and does not experimentally link that jitter to energy-aware big.LITTLE placement decisions.[[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)]

Conversely, the 2025–2026 big.LITTLE scheduling literature advances energy-aware assignment, reliability, and fault tolerance, but the retrieved titles do not report a shared experimental protocol that varies placement and observes both jitter and energy, then feeds measured jitter back into scheduling. The survey likewise treats energy efficiency, real-time responsiveness, and reliability as objectives, but not as a measured bidirectional jitter–energy feedback loop.[[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)][[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103740)][[dl.acm](https://dl.acm.org/doi/10.1145/3716368.3735195)][[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103906)]

## Final assessment

**Current status of the gap: OPEN, with important partial progress.** Formal jitter-propagation analysis is now mature and directly relevant to task chains, while 2025–2026 work continues to develop energy-aware scheduling on big.LITTLE; however, no retrieved peer-reviewed 2025–2026 study closes the loop by experimentally measuring how energy-aware placement affects jitter and how resulting jitter affects scheduling and energy on big.LITTLE hardware.[[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2025.103628)][[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103740)][[dl.acm](https://dl.acm.org/doi/10.1145/3716368.3735195)][[dl.acm](https://dl.acm.org/doi/10.1016/j.sysarc.2026.103906)]