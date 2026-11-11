---
Date: 2026-11-11
tags:
  - AI
Service: Gemini
Model: gemini-4-argon-high
Additional:
  - "cross-memory: off"
Related:
  - "[[SGP-3]]"
  - "[[GP-3]]"
  - "[[GEC-3]]"
---

# PROMPT

```
ROLE
Act as a Master's thesis research design advisor.

INPUT
Research problems:
The FFM/JNI boundary is underexplored experimentally.  

Verified gaps:
Although native frames are identified as a remaining pinning source, the retrieved evidence does not compare JNI, Panama/FFM, file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure.

Evidence:
A decisive study should vary **JVM version, JNI versus FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration**, while holding task semantics and resource budgets constant. Version stratification is particularly important because monitor-pinning behavior changed, whereas native-callback pinning remains a distinct concern in the retrieved engineering evidence.

Constraints:
time: 6 month, 4 hour per day
compute: i5 10400f + 32gb Ram
API: free

TASK
Create exactly three substantially different thesis candidates.

Candidate A:
Deep-theoretical / analytical.

Candidate B:
Applied / engineering.

Candidate C:
Interdisciplinary / frontier.

For each provide:
1. Ukrainian title;
2. English title;
3. research problem;
4. verified gap;
5. object;
6. subject;
7. RQ;
8. hypothesis;
9. aim;
10. tasks;
11. anticipated novelty;
12. practical value;
13. methodology;
14. data;
15. baseline;
16. metrics;
17. minimum viable research;
18. stretch goal;
19. compute/resources;
20. risks;
21. threats to validity;
22. key evidence;
23. what could falsify novelty;
24. feasibility 0–100.

CRITICAL
The three topics must not be paraphrases.
Do not invent references.
Do not claim novelty beyond evidence.

```

# ANSWER

| Dimension | Candidate A: Deep-Theoretical / Analytical | Candidate B: Applied / Engineering | Candidate C: Interdisciplinary / Frontier |
| --- | --- | --- | --- |
| **Core Focus** | Formal queuing theory and state-transition modeling of carrier-pool starvation under mixed native/non-native pinning regimes. | Empirical benchmarking harness, profiling diagnostics, and adaptive bulkhead/mitigation patterns for JNI vs. FFM workloads. | Cross-layer JVM-to-OS kernel observability (JFR + Linux `perf`/eBPF) and statistical response-surface surrogate modeling of native boundary stalls. |
| **Primary Deliverable** | Analytical multi-class queuing model of virtual thread pinning validated against multi-version JVM empirical traces. | Reproducible multi-factor benchmark suite and an engineering decision matrix / runtime concurrency limiter for FFM vs. JNI migration. | Cross-layer telemetry dataset and an interpretable surrogate predictor for detecting silent carrier-pool saturation across JVM and OS boundaries. |
| **Academic Style** | Mathematical computer science & performance evaluation (Спеціальність 122 — Комп'ютерні науки). | Software systems engineering & runtime optimization (Спеціальність 121 — Інженерія програмного забезпечення). | Systems telemetry, OS kernel interaction, and statistical performance modeling (Спеціальність 122 / 126). |

---

## Candidate A: Deep-Theoretical / Analytical

1. **Ukrainian title:** Аналітичне моделювання та експериментальна верифікація блокування пулу потоків-носіїв віртуальних потоків на межі взаємодії FFM та JNI у різних версіях JVM.
2. **English title:** Analytical Modeling and Experimental Verification of Virtual Thread Carrier-Pool Pinning Across the FFM and JNI Boundary Under Stratified JVM Versions.
3. **Research problem:** The transition from the Java Native Interface (JNI) to the Foreign Function and Memory (FFM) API alters how Java interacts with native code, yet the FFM/JNI boundary remains experimentally and analytically underexplored with respect to virtual thread carrier-pool starvation. While virtual threads unmount during standard cooperative blocking, native frames on the call stack force carrier thread pinning, creating non-linear throughput degradation whose mathematical relationship to carrier parallelism, blocking duration, and JVM version evolutions is not formally characterized.
4. **Verified gap:** Although native stack frames are recognized as a persistent source of virtual thread pinning, existing research and engineering evidence do not systematically compare or formally model JNI, Panama/FFM, native callbacks (upcalls), file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure across JVM versions where monitor-pinning semantics have changed.
5. **Object:** The process of scheduling, unmounting, and carrier-thread pinning of virtual threads during mixed native and managed blocking operations within the Java Virtual Machine.
6. **Subject:** Mathematical queuing models and empirical latency-throughput distributions of the JVM virtual thread scheduler across JNI, FFM, native callbacks, and I/O primitives under controlled carrier-pool parallelism and concurrency constraints.
7. **RQ (Research Questions):**
* **RQ1:** How accurately can a multi-class queuing model represent carrier-pool utilization and queue wait times when virtual threads execute a mix of unmountable operations (socket I/O, synthetic sleep), compensator-assisted operations (file I/O), and non-unmountable native frames (JNI and FFM downcalls/upcalls)?
* **RQ2:** To what extent does the architectural mechanism of FFM versus JNI shift the analytical threshold of carrier-pool exhaustion as blocking duration and concurrency scale relative to fixed carrier parallelism?
* **RQ3:** How does JVM version stratification (comparing runtimes prior to and following monitor-pinning elimination) isolate the residual theoretical bottleneck of native-callback pinning from legacy monitor pinning?


8. **Hypothesis:** Under identical task semantics and resource budgets, carrier-pool queuing delay during native execution follows a predictable phase transition governed by the product of concurrency, blocking duration, and inverse carrier parallelism; furthermore, while FFM reduces invocation overhead compared to JNI at short blocking durations, both converge to identical carrier-starvation asymptotes during native callbacks once pinned native frames exceed the active carrier thread count, independent of JVM monitor-pinning improvements.
9. **Aim:** To formulate and experimentally validate an analytical performance model of virtual thread carrier-pool saturation across the JNI and FFM boundaries under varying I/O modalities, blocking durations, and JVM versions.
10. **Tasks:**
11. Formalize the state-transition mechanics of the JVM virtual thread scheduler (`ForkJoinPool` carrier pool and blocker compensator) under cooperative unmounting, compensator thread expansion, monitor pinning, and native-frame pinning.
12. Derive an analytical queuing model (parameterized by carrier parallelism, task arrival/concurrency, blocking duration, and pinning probability) predicting throughput ceilings and tail queuing latencies.
13. Design a controlled factorial experiment holding task semantics and memory/CPU budgets constant while varying JVM version (e.g., JDK 21 vs. JDK 24+), native interface (JNI vs. FFM), native callbacks, file I/O, socket I/O, and synthetic blocking.
14. Execute the experimental matrix on a fixed hardware baseline and fit the empirical response curves to the theoretical model to quantify model prediction error.


15. **Anticipated novelty:** The formulation of an empirically calibrated analytical model that isolates the mathematical impact of native-frame and native-callback pinning (across both JNI and FFM) from cooperative unmounting and monitor pinning across stratified JVM versions.
16. **Practical value:** Provides runtime architects and capacity planners with closed-form capacity bounds and saturation thresholds, enabling them to calculate the maximum safe ratio of blocking native calls to carrier threads before service-level latency degrades—without running exhaustive stress tests for every deployment configuration.
17. **Methodology:** Analytical queuing theory (multi-class M/G/c queue with server reservation/holding and saturation constraints) paired with a full-factorial empirical validation protocol using Java Microbenchmark Harness (JMH) and Java Flight Recorder (JFR) event extraction.
18. **Data:** Primary empirical telemetry generated locally via JMH and JFR (`jdk.VirtualThreadPinned`, `jdk.VirtualThreadSubmitFailed`, scheduler queue depth, and invocation timestamps) across thousands of parameterized benchmark runs.
19. **Baseline:** Pure Java virtual threads executing synthetic cooperative blocking (`LockSupport.parkNanos` / `Thread.sleep`) and non-blocking native no-op invocations on the baseline LTS runtime (JDK 21) with default carrier parallelism.
20. **Metrics:** Mean absolute percentage error (MAPE) and coefficient of determination ($R^2$) between analytical predictions and empirical measurements; p50, p95, p99, and p99.9 task completion latency; effective throughput (operations per second); carrier thread utilization ratio; and pinning duration per operation.
21. **Minimum viable research (MVR):** A two-class analytical queuing model (unmountable blocking vs. pinned native blocking) validated across two JVM versions (JDK 21 and JDK 24+), comparing JNI vs. FFM downcalls/callbacks against synthetic sleep and socket I/O across three carrier parallelism levels and three blocking durations.
22. **Stretch goal:** Extend the analytical model to account for dynamic thread-pool expansion in the JVM `Blocker` compensator during mixed file I/O and recursive native-to-Java-to-native callback chains.
23. **Compute/resources:** Fully executable on the Intel Core i5-10400F (6 physical cores / 12 logical threads) with 32 GB RAM using open-source OpenJDK distributions, GCC/Clang for compiling C test libraries, JMH, and Python (`scipy`, `statsmodels`, `matplotlib`) for mathematical fitting. Pinning benchmarks specifically benefit from a constrained core count (e.g., pinning 2, 4, 6, or 8 carrier threads via `-Djdk.virtualThreadScheduler.parallelism`), leaving remaining cores for the OS and load generator.
24. **Risks:** OS-level scheduler jitter on a single 6-core machine may introduce noise into microsecond-scale analytical validations; analytical queuing equations may become intractable in closed form for non-exponential blocking distributions, requiring numerical approximation.
25. **Threats to validity:**
* *Internal:* JIT warmup artifacts, garbage collection pauses, or thermal throttling on the i5-10400F skewing latency distributions (mitigated via CPU frequency locking, isolated core affinity via `taskset`, and fixed heap sizing).
* *Construct:* Synthetic C library callbacks may not capture complex cache-thrashing of large production native libraries (mitigated by strictly holding task semantics constant as required by the experimental design).
* *External:* Results gathered on a 6-core x86_64 architecture may exhibit different memory-barrier costs than high-core-count NUMA servers.


22. **Key evidence:** The study directly operationalizes the requirement to vary JVM version, JNI vs. FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration under constant task semantics and resource budgets, explicitly testing the version shift where monitor pinning changed while native-callback pinning remained intact.
23. **What could falsify novelty:** Discovering an existing published queuing model that already mathematically parameterizes and empirically validates FFM vs. JNI native-callback pinning against JDK 24+ monitor-unpinned virtual threads under controlled carrier parallelism.
24. **Feasibility (0–100):** **88/100** (High feasibility: zero external data dependencies, small native C footprint, and analytical modeling requires intellectual rigor rather than massive cluster compute).

---

## Candidate B: Applied / Engineering

1. **Ukrainian title:** Експериментальне дослідження продуктивності та розробка патернів ізоляції пулу носіїв віртуальних потоків при взаємодії через FFM та JNI під контрольованим навантаженням.
2. **English title:** Empirical Performance Evaluation and Carrier-Pool Isolation Patterns for Virtual Threads Across the FFM and JNI Boundary Under Controlled Pressure.
3. **Research problem:** Software engineering teams migrating performance-critical applications to virtual threads and replacing JNI with the Panama/FFM API lack empirical engineering guidance on how native downcalls, native callbacks, and mixed I/O interact under carrier-pool pressure. Unmitigated native pinning can silently stall unrelated socket or file I/O workloads sharing the same carrier pool.
4. **Verified gap:** Although native frames are known to pin carrier threads, current engineering literature lacks a controlled, head-to-head empirical benchmark comparing JNI, FFM, native callbacks, file I/O, socket I/O, and synthetic blocking under varying carrier parallelism, concurrency, and JVM versions with identical task semantics.
5. **Object:** High-concurrency JVM software systems executing mixed native (JNI/FFM) and I/O-bound workloads on virtual threads.
6. **Subject:** Empirical throughput/tail-latency degradation profiles and software engineering mitigation patterns (carrier-pool configuration, semaphore bulkheading, and asynchronous native offloading) across JVM versions.
7. **RQ (Research Questions):**
* **RQ1:** Under identical task semantics and resource budgets, how do JNI and FFM compare in throughput, CPU overhead, and tail latency across varying blocking durations, concurrency levels, and native callback depths?
* **RQ2:** How severely do pinned JNI and FFM calls degrade concurrent, non-pinned virtual thread workloads (socket I/O, file I/O, synthetic blocking) sharing a constrained carrier pool across different JVM versions?
* **RQ3:** Can lightweight application-level engineering wrappers (such as adaptive semaphore bulkheads or dedicated carrier offloading before FFM/JNI transitions) prevent carrier-pool starvation with lower overhead than global carrier-pool over-provisioning?


8. **Hypothesis:** FFM exhibits significantly lower invocation overhead than JNI for short-duration calls, but under sustained blocking durations and native callbacks with synchronize/blocking semantics, both JNI and FFM induce severe tail-latency spikes in co-located socket I/O workloads when concurrency exceeds carrier parallelism—even on newer JVM versions that resolve `synchronized` monitor pinning; applying a bounded concurrency bulkhead specifically at the native boundary restores co-located I/O tail latency while maintaining lower memory overhead than expanding `maxPoolSize`.
9. **Aim:** To build a reproducible multi-factor benchmarking suite that quantifies the exact operational failure boundaries of JNI and FFM under virtual thread carrier-pool pressure, and to engineer a verified runtime isolation pattern that prevents cross-workload starvation.
10. **Tasks:**
11. Develop an automated, containerized/reproducible benchmark harness in Java and C implementing semantically identical workloads across JNI, FFM, native callbacks (upcalls into Java blocking methods), file I/O, loopback socket I/O, and synthetic blocking.
12. Conduct a systematic multi-factor experimental sweep across JVM versions (JDK 21 LTS vs. JDK 24+), carrier parallelism settings, concurrency levels, and blocking durations.
13. Quantify the "blast radius" (tail-latency contamination) of JNI/FFM native pinning on co-located virtual threads performing cooperative socket I/O.
14. Implement and evaluate an engineering mitigation library (comparing `Semaphore`-guarded native wrappers, dedicated platform-thread offload executors for long-blocking native calls, and scheduler parallelism tuning) and synthesize an actionable decision matrix for developers.


15. **Anticipated novelty:** First comprehensive, head-to-head empirical characterization of cross-workload interference across JNI, FFM, native callbacks, file I/O, socket I/O, and synthetic blocking across pre- and post-JEP 491 JVM versions, paired with a quantified evaluation of boundary isolation patterns under fixed resource budgets.
16. **Practical value:** Delivers an open-source benchmarking harness, a lightweight Java mitigation wrapper library, and an evidence-based engineering decision tree that tells practitioners exactly when FFM can be called directly from a virtual thread and when it must be guarded or offloaded.
17. **Methodology:** Experimental systems engineering: controlled laboratory benchmarking (JMH for microbenchmarks, custom closed/open-loop load harness for mixed-workload interference testing), low-overhead runtime profiling (JFR + `async-profiler`), and comparative architectural pattern evaluation.
18. **Data:** Time-series latency histograms (HdrHistogram), throughput logs, JFR pinning events, carrier thread state dumps, and heap/RSS memory footprints collected across experimental matrix cells.
19. **Baseline:** Unmitigated default virtual thread execution (`Executors.newVirtualThreadPerTaskExecutor()`) with standard carrier parallelism across JNI and FFM without bulkheading or offloading.
20. **Metrics:** Throughput (ops/sec), tail latency (p95, p99, p99.9, p99.99 in microseconds/milliseconds), cross-workload latency amplification factor (ratio of socket I/O p99 latency with concurrent native load vs. isolated socket I/O), heap/native memory consumption (MB), and JFR pinning event frequency.
21. **Minimum viable research (MVR):** Complete implementation of the benchmark suite covering all required factors (JVM version, JNI vs. FFM, native callbacks, file/socket I/O, synthetic blocking, carrier parallelism, concurrency, blocking duration), producing full empirical comparison tables and evaluating one primary mitigation pattern (semaphore bulkhead vs. scheduler tuning).
22. **Stretch goal:** Develop an adaptive, JFR-feedback-driven runtime guard (using the `jdk.jfr.consumer.RecordingStream` API) that dynamically adjusts native concurrency permits in real time when `jdk.VirtualThreadPinned` durations exceed a target SLA threshold.
23. **Compute/resources:** Intel Core i5-10400F + 32 GB RAM running Linux (e.g., Ubuntu 24.04 LTS) with `cpupower` and `taskset` to partition cores (e.g., 4 cores pinned to the JVM carrier pool, 2 cores pinned to loopback socket/load generators), OpenJDK 21 and 24+, GCC, JMH, HdrHistogram, and async-profiler. All tools are 100% free and open-source.
24. **Risks:** Loopback socket I/O and local NVMe/SSD file I/O on a single host can compete for kernel interrupts or disk bandwidth if not carefully rate-limited; wide multi-factor matrices can explode total run time if each run takes too long.
25. **Threats to validity:**
* *Internal:* Coordinated omission in load generation (mitigated by using HdrHistogram with coordinated-omission correction or open-loop arrival schedules).
* *Construct:* File I/O behavior is heavily affected by OS page cache warmness (mitigated by explicitly testing both cached tmpfs/page-cache reads and `O_DIRECT`/fsync-bound writes, or holding the caching regime strictly constant).
* *External:* Application-specific FFM memory layout marshaling costs vary by struct complexity (mitigated by fixing the exact payload size and task semantics across JNI and FFM).


22. **Key evidence:** Directly implements the full empirical matrix specified in the evidence—varying JVM version, JNI vs. FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration while holding task semantics and resource budgets constant.
23. **What could falsify novelty:** Publication of an identical open-source benchmark study covering the exact same factor matrix (specifically including FFM callbacks, file/socket I/O, and JDK 24+ version stratification under carrier pressure) prior to thesis defense.
24. **Feasibility (0–100):** **92/100** (Very high feasibility: concrete software engineering deliverables, straightforward C/Java implementation, and highly predictable execution within 720 hours on the available desktop hardware).

---

## Candidate C: Interdisciplinary / Frontier

1. **Ukrainian title:** Міжрівнева діагностика та сурогатне моделювання станів блокування віртуальних потоків на межі JVM та ядра ОС при виконанні нативних викликів FFM і JNI.
2. **English title:** Cross-Layer Observability and Surrogate Performance Modeling of Virtual Thread Pinning Across the JVM and OS Kernel Boundary in FFM and JNI Workloads.
3. **Research problem:** Virtual thread pinning at the FFM/JNI boundary is a cross-layer phenomenon: the JVM scheduler manages virtual-to-carrier thread mapping in user space, while native downcalls, callbacks, file I/O, and socket I/O transition execution into unmanaged C frames and OS kernel syscalls (`futex`, `epoll_wait`, `read`/`write`, `nanosleep`). Viewing this boundary solely through JVM-level metrics or solely through OS-level metrics obscures how native frames interact with kernel scheduling under controlled carrier-pool pressure, and exhaustive benchmarking of every factor combination is computationally expensive.
4. **Verified gap:** Existing evidence does not compare JNI, Panama/FFM, native callbacks, file I/O, socket I/O, and synthetic blocking under controlled carrier-pool pressure across JVM versions, nor does it unify user-space JVM runtime telemetry with OS kernel syscall/scheduler observability to model and predict saturation regimes across this multi-dimensional parameter space.
5. **Object:** The cross-layer execution lifecycle of hybrid Java/native workloads spanning the JVM virtual thread scheduler, the JNI/FFM native interface, and the operating system kernel scheduler.
6. **Subject:** Synchronized cross-layer telemetry (combining JVM Flight Recorder with Linux kernel observability via `perf`/eBPF) and statistical/machine-learning surrogate models (Response Surface Methodology and gradient-boosted decision trees) predicting carrier-pool starvation across the multi-dimensional factor space.
7. **RQ (Research Questions):**
* **RQ1:** What distinct OS kernel scheduling signatures (context switches, kernel-mode residency, `futex` contention, and thread-state transitions) differentiate JNI vs. FFM native-frame pinning from cooperative virtual thread unmounting and file/socket I/O blocking across JVM versions?
* **RQ2:** How do native callbacks (Java-to-native-to-Java transitions that block) manifest across combined JVM and OS telemetry in versions where monitor pinning is resolved versus legacy versions?
* **RQ3:** Can an interpretable statistical surrogate model trained on a Latin Hypercube / fractional factorial sample of the parameter space (JVM version, JNI vs. FFM, callback presence, I/O type, carrier parallelism, concurrency, and blocking duration) accurately predict the non-linear onset of carrier-pool starvation and p99 latency cliffs on unseen configurations?


8. **Hypothesis:** Combining JVM-level pinning telemetry with OS-level kernel thread-state telemetry reveals regime boundaries (such as hidden native mutex contention vs. cooperative epoll unmounting) that JVM metrics alone cannot distinguish; furthermore, tree-based ensemble surrogates (e.g., LightGBM/XGBoost with SHAP feature attribution) can predict p99 latency degradation and identify the dominant interaction terms (specifically the three-way interaction between native callback presence, blocking duration, and concurrency-to-carrier ratio) with high accuracy using a fraction of the full combinatorial benchmark budget.
9. **Aim:** To construct a unified JVM-to-OS observability pipeline and train an interpretable surrogate performance model that maps and predicts virtual thread performance degradation across the JNI/FFM boundary under multi-dimensional workload and runtime variations.
10. **Tasks:**
11. Build a synchronized cross-layer telemetry harness correlating JVM JFR events with Linux kernel tracepoints (`sched:sched_switch`, `syscalls:sys_enter_*`, CPU cycle counters via `perf_event_open` / `bpftrace`) for JNI, FFM, native callbacks, file I/O, socket I/O, and synthetic blocking.
12. Execute a structured experimental design (combining a core full-factorial grid with Latin Hypercube Sampling for continuous parameters like concurrency, carrier parallelism, and blocking duration) across stratified JVM versions while holding task semantics and hardware budgets constant.
13. Perform cross-layer causal and statistical interaction analysis (ANOVA / Sobol sensitivity indices / SHAP values) to rank the exact contribution of each experimental factor (JVM version, FFM vs. JNI, callback depth, I/O modality, carrier parallelism, concurrency, blocking duration) to tail-latency collapse.
14. Train and validate interpretable surrogate models (Polynomial Response Surface Models vs. Gradient Boosted Trees) to predict throughput and p99 latency cliffs on held-out factor combinations.


15. **Anticipated novelty:** An interdisciplinary synthesis of runtime systems engineering, OS kernel tracing, and statistical surrogate modeling that quantifies the exact multi-factor sensitivity and cross-layer kernel mechanics of the FFM vs. JNI boundary under controlled virtual thread carrier-pool pressure.
16. **Practical value:** Provides systems researchers and performance engineers with both a low-overhead cross-layer diagnostic methodology for debugging opaque native-boundary stalls in production Linux environments and a fast predictive surrogate model for automated runtime parameter tuning.
17. **Methodology:** Design of Experiments (DoE: Full Factorial + Latin Hypercube Sampling), cross-layer systems tracing (JFR + Linux `perf`/eBPF), variance-based global sensitivity analysis, and supervised statistical/ML surrogate modeling with k-fold and out-of-distribution cross-validation.
18. **Data:** A curated, open multi-modal tabular dataset constructed from benchmark runs, where each row represents a controlled experimental configuration (8 independent variables) paired with JVM runtime metrics, OS kernel hardware/software counters, and latency/throughput target variables.
19. **Baseline:** Single-layer JVM-only linear regression / univariate heuristics and baseline JDK 21 JNI/FFM empirical measurements without kernel-level covariates.
20. **Metrics:** Surrogate model predictive accuracy ($R^2$, RMSE, MAPE on log-p99 latency, and F1-score for classifying "starvation cliff" regimes); Sobol sensitivity indices / SHAP interaction values for factor ranking; OS context-switch rates, kernel-to-user CPU time ratios, and JFR pinning durations.
21. **Minimum viable research (MVR):** A complete empirical dataset covering the 8 evidence factors (JVM version, JNI vs. FFM, native callbacks, file/socket I/O, synthetic blocking, carrier parallelism, concurrency, blocking duration) correlated with Linux `perf stat` / tracepoint metrics, global sensitivity analysis ranking factor importance, and a validated surrogate model predicting p99 latency and starvation cliffs.
22. **Stretch goal:** Package the trained surrogate model into a lightweight automated concurrency advisor CLI tool that inspects an application's short 10-second JFR + `perf` profile and warns if its current FFM/JNI callback rate and carrier parallelism place it within 15% of a carrier-starvation cliff.
23. **Compute/resources:** Intel Core i5-10400F + 32 GB RAM running standard Linux with root/sudo privileges (required for `perf` and `bpftrace`/`ebpf` tracepoints, which are built into the Linux kernel at zero cost). Training tabular surrogate models (XGBoost/LightGBM/scikit-learn/SHAP) on several thousand benchmark rows takes less than 60 seconds on a 6-core CPU.
24. **Risks:** High-frequency eBPF/perf tracing can introduce observer overhead if every single nanosecond syscall is logged to disk (mitigated by using in-kernel eBPF maps/histograms and `perf stat` hardware counters rather than per-event disk dumping); splitting focus between systems benchmarking and statistical modeling requires disciplined time boxing.
25. **Threats to validity:**
* *Internal:* Observer effect (probe overhead) from simultaneous JFR and OS kernel tracing altering the JNI/FFM call overhead (mitigated by measuring baseline throughput with and without tracers enabled to quantify and bound probe overhead below 2%).
* *Construct:* Surrogate model overfitting to specific grid points (mitigated by evaluating on strictly held-out interpolation and extrapolation parameter combinations).
* *External:* Kernel syscall behavior is specific to the Linux kernel version and filesystem tested (must be explicitly scoped to the Linux kernel in the thesis claims).


22. **Key evidence:** Directly incorporates every factor required by the evidence (JVM version stratification, JNI vs. FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration under constant task semantics and resource budgets) and uses statistical Design of Experiments and cross-layer telemetry to explain their high-dimensional interactions.
23. **What could falsify novelty:** If multi-factor interaction effects across JNI/FFM, callbacks, and JVM versions turn out to be strictly additive/trivial with zero non-linear cliffs, or if an identical cross-layer JFR+eBPF surrogate study of the FFM/JNI virtual thread boundary is published first.
24. **Feasibility (0–100):** **84/100** (Strong feasibility on an i5-10400F with Linux: tabular ML/statistical modeling requires minimal compute, though setting up clean `perf`/eBPF tracepoint scripts alongside JMH/JFR requires solid Linux systems competence).