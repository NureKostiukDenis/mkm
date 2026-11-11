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
  - "[[PX-2]]"
---

# PROMPT 

```
Search scholarly literature from 2024–2026 concerning:
**No direct systematic review exists for JVM virtual-thread fragility.** The only “Virtual Threads” systematic review retrieved concerns VR/AR/MR adoption in fashion design, not Java concurrency.[[dl.acm](https://dl.acm.org/doi/10.1145/3643834.3661575)][[dblp.uni-trier](https://dblp.uni-trier.de/pid/216/0024.html)]

**The FFM/JNI boundary is underexplored experimentally.** Although native frames are identified as a remaining pinning source, the retrieved evidence does not compare JNI, Panama/FFM, file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure.

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

**D—insufficient evidence—is the defensible classification for the specific JNI/FFM carrier-pressure question; B—conditional agreement—best describes the broader virtual-thread performance evidence retrieved.** The studies report workload-dependent benefits, parity, and regressions, but the retrieved records do not establish a controlled comparison of JNI, FFM, file I/O, socket I/O, and synthetic blocking under matched carrier-pool pressure.[[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)][[norma.ncirl](https://norma.ncirl.ie/8134/)][[infoq](https://www.infoq.com/articles/java-virtual-threads-a-case-study/)]

## Scope and confidence

This is a **bounded literature assessment, not an exhaustive systematic review**: several findings below are available only through abstracts or indexed extracts, so unreported experimental details are marked “not established” rather than inferred. The retrieved material includes peer-reviewed studies, a master’s thesis, a preprint, and separately identified engineering evidence.[[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)][[norma.ncirl](https://norma.ncirl.ie/8134/)][[infoq](https://www.infoq.com/articles/java-virtual-threads-a-case-study/)][[arxiv](https://arxiv.org/html/2605.26609v1)]

The cited ACM review is indeed about **VR/AR/MR in fashion design**, not JVM concurrency; it must be excluded from a Java evidence synthesis. However, “no direct systematic review exists” is stronger than this search can demonstrate: the defensible wording is **“No directly relevant systematic review was identified in the retrieved literature.”**[[dl.acm](https://dl.acm.org/doi/10.1145/3643834.3661575)]

## Study-level evidence

“Sample” below means software systems, workloads, or configurations—not human participants. **Not established** means the retrieved abstract/extract does not supply enough information to assess the field.

|Study|Context|Sample|Method|Metric|Effect|Finding|Limitations|DOI/link|
|---|---|---|---|---|---|---|---|---|
|**Chirila & Sora, 2024**, _Java Single vs. Platform vs. Virtual Threads Runtime Performance Assessment in the Context of Key Class Detection_|Parallel software-analysis algorithms|Key-class-detection implementations; dataset size and repetitions not established|Comparison of single, platform, and virtual-thread implementations|Execution time|**Positive versus single-thread baseline; other contrasts unresolved**|Abstract reports virtual threads outperform single-thread implementations. [[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)]|One task family; no verified JNI/FFM manipulation, carrier-pressure design, uncertainty estimates, or power assessment in the retrieved abstract. [[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)]|[IEEE record](https://ieeexplore.ieee.org/document/10619722/)|
|**Pandita, 2024**, _Benchmarking the Performance of Java Virtual Threads in High-Throughput Workloads_; repository deposited 2025|High-throughput Java applications|CPU-intensive and blocking workloads; counts not established|Virtual versus platform-thread benchmarking|Throughput, latency, memory, stability|**Positive, descriptive null, context-dependent**|Abstract reports 60.79% higher throughput and 28.8% lower latency; CPU-intensive performance was similar, while platform threads were described as more stable. [[norma.ncirl](https://norma.ncirl.ie/8134/)]|Master’s thesis, not equivalent to peer-reviewed replication; percentages cannot be generalized across workloads; repetitions, intervals, and power not established. [[norma.ncirl](https://norma.ncirl.ie/8134/)]|[Repository](https://norma.ncirl.ie/8134/)|
|**Šimatović et al., 2025**, _Evaluating memory management and garbage collection algorithms…_|Virtual-thread execution across GC configurations|Three scenarios; fixed pool of 100 platform threads versus virtual-thread-per-task executor|Workload and GC benchmarking, including computational and I/O tasks|CPU, heap efficiency, latency, throughput|**Positive; configuration-dependent**|Extract reports latency and throughput benefits, with G1 and Generational ZGC highlighted. [[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)]|Fixed-size pool is a consequential comparator; native boundaries were not isolated in the retrieved description; complete title, repetitions, duration, intervals, and power were not established. [[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)]|[Institutional PDF](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)|
|**2026 Scientific Reports study**, _Impact of virtual threads and garbage collection on energy efficiency of Java applications for battery powered IoT devices_|Smartwatch/IoT workload|Two implementations of a realistic smartwatch workload|Controlled case study comparing legacy blocking/traditional-thread design with asynchronous virtual-thread/ZGC design|Energy efficiency; numerical outcomes not verified|**Uncertain from retrieved material**|Study design is relevant to deployment context, but no effect size was established from the retrieved extract. [[link.springer](https://link.springer.com/article/10.1038/s41598-026-40112-6)]|Multiple simultaneous changes—threading, application architecture, and GC—prevent clean attribution to virtual threads alone. [[link.springer](https://link.springer.com/article/10.1038/s41598-026-40112-6)]|[10.1038/s41598-026-40112-6](https://doi.org/10.1038/s41598-026-40112-6)|
|**2026 preprint**, _Energy-Aware Decision Making in Software Stack Upgrades_|Java/Spring software-stack changes|Benchmark configurations including JVM 21 and 23 with Spring Boot 3.4|Benchmark reruns examining virtual-thread execution semantics|Energy consumption|**Uncertain from retrieved material**|The extract establishes an investigation of virtual threads, not a verified direction or magnitude of effect. [[arxiv](https://arxiv.org/html/2605.26609v1)]|Preprint; retrieved material does not establish independent replication, native-boundary treatment, duration, or statistical power. [[arxiv](https://arxiv.org/html/2605.26609v1)]|[arXiv:2605.26609](https://arxiv.org/html/2605.26609v1)|

**Interpretation caution:** “similar performance” is a **descriptive null**, not evidence of statistical equivalence; the retrieved thesis abstract does not establish an equivalence margin or adequately powered equivalence test.[[norma.ncirl](https://norma.ncirl.ie/8134/)]

## Supporting cluster

**Supporting the narrower proposition that virtual threads can improve performance:** the key-class-detection study reports improvement over single-thread execution; the thesis reports throughput/latency gains and advantages for blocking operations; the GC study reports benefits across its tested configurations. These support conditional usefulness, not universal superiority or a demonstrated JNI/FFM mechanism.[[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)][[norma.ncirl](https://norma.ncirl.ie/8134/)]

**Supporting the plausibility of fragility:** OpenJDK identifies carrier capture from prolonged pinning as a scalability risk, and an issue reproducer describes deadlock when pinned virtual threads await another unscheduled virtual thread, including a native-call/callback variant. These are mechanism and engineering evidence—not population-level estimates of failure frequency.[[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8337395)][[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8334304)]

## Contradicting cluster

**Contradicting unconditional performance superiority:** a 2024 Open Liberty engineering case study reports no clear advantage for typical tested cloud-native workloads and 10–40% lower throughput in some configurations. It is useful counterevidence but should not be counted as an independent peer-reviewed experiment.[[infoq](https://www.infoq.com/articles/java-virtual-threads-a-case-study/)]

**Contradicting an unqualified, version-invariant pinning narrative:** JEP 491 and its implementation work remove the `synchronized` pinning mechanism in supported configurations; therefore, older monitor-heavy results cannot automatically characterize later JVM behavior. This does **not** establish that native-boundary risks disappear.[[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8337395)][[mail.openjdk](https://mail.openjdk.org/pipermail/hotspot-dev/2024-November/097368.html)]

These findings contradict broad claims such as “virtual threads always improve throughput” or “all blocking is equally fragile”; they do **not** directly contradict the narrower claim that JNI/FFM behavior lacks adequate comparative experimentation.[[infoq](https://www.infoq.com/articles/java-virtual-threads-a-case-study/)][[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8337395)][[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8334304)]

## Null/uncertain cluster

The thesis’s CPU-intensive comparison supplies a descriptive null, while the retrieved 2026 energy studies cannot be assigned a verified positive, negative, or null outcome from the available extracts.[[norma.ncirl](https://norma.ncirl.ie/8134/)][[arxiv](https://arxiv.org/html/2605.26609v1)][[link.springer](https://link.springer.com/article/10.1038/s41598-026-40112-6)]

Most importantly, none of the retrieved study descriptions establishes the requested **five-way, matched carrier-pressure experiment**; this is absence of an identified test, not evidence that JNI and FFM are equivalent or harmless.[[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)][[norma.ncirl](https://norma.ncirl.ie/8134/)][[arxiv](https://arxiv.org/html/2605.26609v1)][[link.springer](https://link.springer.com/article/10.1038/s41598-026-40112-6)]

## Classification by proposition

|Proposition|Classification|Reason|
|---|---|---|
|Virtual threads generally improve every Java workload|**C—contradictory evidence**|Benefits coexist with CPU-workload parity and deployment-specific regressions. [[norma.ncirl](https://norma.ncirl.ie/8134/)][[infoq](https://www.infoq.com/articles/java-virtual-threads-a-case-study/)]|
|Virtual threads benefit suitable blocking/concurrent workloads|**B—conditional agreement**|Positive results depend on workload, baseline, and configuration. [[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[norma.ncirl](https://norma.ncirl.ie/8134/)]|
|Pinning can capture carriers and threaten progress|**B—conditional agreement**, supported chiefly by engineering evidence|Mechanism and reproducer support the risk; JVM version and blocking path constrain applicability. [[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8337395)][[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8334304)][[mail.openjdk](https://mail.openjdk.org/pipermail/hotspot-dev/2024-November/097368.html)]|
|JNI versus FFM fragility is experimentally characterized under matched carrier pressure|**D—insufficient evidence**|No retrieved study description establishes that design. [[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)][[norma.ncirl](https://norma.ncirl.ie/8134/)][[link.springer](https://link.springer.com/article/10.1038/s41598-026-40112-6)][[arxiv](https://arxiv.org/html/2605.26609v1)]|
|A JVM-fragility systematic review demonstrably does not exist|**D—insufficient evidence for categorical absence**|The supplied review is a verified topic mismatch, not proof of exhaustive absence. [[dl.acm](https://dl.acm.org/doi/10.1145/3643834.3661575)]|

## What the gap requires

A decisive study should vary **JVM version, JNI versus FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration**, while holding task semantics and resource budgets constant. Version stratification is particularly important because monitor-pinning behavior changed, whereas native-callback pinning remains a distinct concern in the retrieved engineering evidence.[[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8337395)][[bugs.openjdk](https://bugs.openjdk.org/browse/JDK-8334304)][[mail.openjdk](https://mail.openjdk.org/pipermail/hotspot-dev/2024-November/097368.html)]

It should report throughput, tail latency, carrier occupancy, pinning duration, starvation/deadlock incidence, CPU and memory, with independent process runs, warm-up, sustained-load duration, uncertainty intervals, and predefined practically meaningful effect sizes. This would address the attribution and generalizability weaknesses apparent in fixed-pool comparisons and bundled architecture/GC changes.[[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[link.springer](https://link.springer.com/article/10.1038/s41598-026-40112-6)]

**The contradictory-evidence gap can currently be defended because...** the retrieved evidence contains positive, null, and negative **general performance** results, but no verified matched JNI–FFM–I/O–synthetic-blocking experiment that establishes or refutes native-boundary fragility under controlled carrier pressure; this remains a bounded finding, not proof that no such study exists.[[rit](https://www.rit.edu/croatia/sites/rit.edu.croatia/files/docs/Evaluating%20memory%20management%20and%20garbage%20collection%20algorithms...,%20Simatovic%20et%20al.,%202025.pdf)][[ieeexplore.ieee](https://ieeexplore.ieee.org/document/10619722/)][[norma.ncirl](https://norma.ncirl.ie/8134/)][[infoq](https://www.infoq.com/articles/java-virtual-threads-a-case-study/)][[arxiv](https://arxiv.org/html/2605.26609v1)][[link.springer](https://link.springer.com/article/10.1038/s41598-026-40112-6)]