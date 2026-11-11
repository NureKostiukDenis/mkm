---
tags:
  - source
Date: 2026-11-12
Related:
  - "[[T-3]]"
Title: "eBPF jAgent: Transaction-level Resource Demand Tracing for Java Applications Using eBPF and OpenTelemetry"
Authors:
  - Bryan Liegsalz
  - Andreas Brunnert
Study type: Empirical systems evaluation & runtime observability study
Venue: 16th Symposium on Software Performance (SSP 2026) / Preprint
DOI: 
link: https://github.com/hm-green-it-lab/ssp2026
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The authors present and evaluate *eBPF jAgent*, an open-source tool utilizing Linux eBPF and OpenTelemetry to measure transaction-level CPU (`se.sum_exec_runtime`), memory (HotSpot `object_alloc` USDT probe), storage, and network demands for Java applications running on OpenJDK 25 without application code modification. Evaluated on a bare-metal dual-socket server across 72 randomized Latin-square runs, the study documents severe observer effect and runtime perturbation: passive HotSpot DTrace scaffolding increases median request latency by 10.7%, while active eBPF method tracing raises latency 6.1-fold (+507%). Crucially, a control experiment with empty eBPF handlers reveals that 93% of this overhead is incurred by the trap mechanism and probe firing itself rather than the agent's logic. Furthermore, probe dispatch traps inflate measured CPU demand 7.44-fold (118.99 ms vs 15.99 ms) compared to in-process instrumentation (OTJAE), demonstrating that naive method-level eBPF tracing severely distorts performance measurements and is strictly limited to offline pre-production characterization.

# Limitation
The tracing mechanism strictly depends on the classic thread-per-request execution model where each transaction remains bound to a single platform thread (Linux `task_struct`). Crucially, the authors explicitly acknowledge that their approach fails under Java Virtual Threads (Project Loom), asynchronous executor hand-offs, and distributed reactive contexts, because $M:N$ user-space scheduling decouples logical execution units from kernel tasks. Additionally, the approach incurs prohibitive execution overhead (+507% latency), does not track native execution boundaries (JNI or Panama FFM), does not evaluate carrier pinning, and lacks surrogate modeling to predict saturation.

# Gap signal
The paper provides direct empirical proof of the fundamental cross-layer observability gap in modern JVM runtimes: existing kernel-level eBPF instrumentation cannot attribute execution metrics to virtual threads due to the decoupling between user-space schedulers and kernel tasks. Furthermore, the massive 6.1-fold latency penalty of HotSpot USDT method probes proves that cross-layer telemetry cannot rely on high-frequency bytecode interception, but instead requires non-intrusive, low-overhead synchronization between JVM-native events (such as Java Flight Recorder `jdk.VirtualThreadPinned`) and selective Linux kernel scheduler tracepoints (`sched:sched_switch`, `futex`).
