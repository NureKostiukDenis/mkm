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
  - "[[SK-4]]"
---

# PROMPT 

```

Act as an academic literature analyst.

RESEARCH AREA
Quantifying the Fragility of M:N Runtime Scheduling Under Mixed-Cooperative Execution: An Empirical Study of JVM Carrier-Thread Starvation Induced by Native (FFM/JNI) and Synthetic Blocking.
* **Automated Software Testing & Verification (ISSTA, ICSE, ASE):** Static bug finders, linting infrastructure (Error Prone, SpotBugs, SonarQube).
* **Compiler Construction (CGO, CC):** Call-graph construction in the presence of dynamic class loading and native boundaries.
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

**Search outcome:** I found **no 2024–2026 systematic literature review, systematic mapping study, scoping review, or meta-analysis** that specifically studies M:N JVM scheduling fragility, carrier-thread starvation, or pinning caused by FFM/JNI and synthetic blocking. The phrase “virtual threads” also collides with an unrelated fashion-design literature review, which is excluded as off-topic.[[dl.acm](https://dl.acm.org/doi/10.1145/3643834.3661575)][[dblp.uni-trier](https://dblp.uni-trier.de/pid/216/0024.html)]

The strongest available evidence is therefore a combination of primary JVM specifications, controlled benchmarks, production postmortems, and an empirical software-upgrade study—not a mature review base.

|#|Exact title|Authors|Year|Venue|DOI|Direct link|Study type|Research questions|Method|Dataset / sample|Findings|Limitations|Explicit future work|Possible gap|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|1|**Virtual Threads**|Ron Pressler, Alan Bateman|2023–2024|OpenJDK JEP 444|Not applicable|[Link](https://openjdk.org/jeps/444)|Primary technical specification|How should Java provide lightweight, JVM-managed threads that scale well for concurrent, mostly blocking workloads?|Design specification for virtual threads, including their M:N relationship to carrier threads and scheduling behavior. [[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)]|Not an empirical dataset; defines JVM runtime behavior.|Virtual threads are JVM-managed and scheduled onto carrier threads; they are intended for scalable blocking-style concurrency rather than CPU-bound work. [[github](https://github.com/akardapolov/software-atlas/blob/main/docs/languages/java/index.md)][[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)]|It is a specification, not an empirical fragility study; it does not quantify starvation under mixed native/blocking workloads.|JEP 444 is the foundational feature specification; later JEP 491 addresses a major pinning source. [[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)]|It establishes the M:N model but does not provide a measurable fragility model for carrier exhaustion.|
|2|**Synchronize Virtual Threads without Pinning**|OpenJDK authors|2024–2025|OpenJDK JEP 491|Not applicable|[Link](https://openjdk.org/jeps/491)|Primary technical specification / design change|How can monitor operations be implemented so virtual threads do not pin their carrier threads?|Redesigns monitor ownership so ownership follows the virtual thread rather than the carrier thread. [[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)]|JVM implementation and compatibility scope; no public benchmark sample in the retrieved record.|In JDK 24+, `synchronized`-based monitor pinning is removed for the main cases; native/foreign-function frames, class initialization, and certain waiting paths remain pinning-relevant. [[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)][[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)]|It does not measure the probability, duration, or system-level impact of remaining native-boundary pinning.|The JEP addresses `synchronized` pinning; remaining native-boundary cases are explicitly retained. [[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)]|Native/FFM/JNI-induced carrier pinning remains an explicit residual fragility surface.|
|3|**Java 21 Virtual Threads — Dude, Where’s My Lock?**|Netflix JVM Ecosystem Team|2024|Netflix Tech Blog|Not applicable|Not retrieved directly in search results; referenced by secondary coverage.|Production postmortem / practitioner case study|Why did virtual-thread-based production behavior degrade?|Production incident analysis using JVM diagnostics and operational evidence; the retrieved secondary source identifies it as a real-world account of pinning. [[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]|Netflix production workload; exact service, traffic volume, and instrumentation details are not exposed in the retrieved record.|It documents a production pinning incident involving virtual threads and locking behavior. [[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]|It is a postmortem rather than a controlled experiment; causal attribution and generalizability are limited.|Not stated in the retrieved record.|Demonstrates operational relevance but does not isolate FFM/JNI versus synthetic blocking or provide statistical effect sizes.|
|4|**Java Virtual Threads vs Thread Pools: We Benchmarked…**|JobRunr engineering team|2026|JobRunr engineering blog|Not applicable|[Link](https://www.jobrunr.io/en/blog/java-job-threading-options/)|Controlled benchmark / empirical engineering study|How do virtual threads compare with platform-thread pools when pinning is induced by blocking inside `synchronized`?|Runs the identical job with a blocking call inside a `synchronized` block, using 4,096 striped locks to isolate pinning from ordinary lock contention. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|One benchmark workload; JDK 21 and JDK 25 configurations; 4,096 locks. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|On JDK 21, throughput fell from 462 to 33 jobs/s and p99 latency rose from 253 ms to 6,799 ms; on JDK 25, the workload reached 477 jobs/s with zero pinning events. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|Single workload and vendor blog rather than peer-reviewed study; the result is specific to the benchmark’s blocking/locking configuration.|Not stated in the retrieved record.|Provides a useful controlled pinning benchmark, but does not vary native-call frequency, FFM usage, carrier-pool size, or mixed cooperative/native workloads.|
|5|**Energy-aware decision making in software stack upgrades**|Not fully listed in the retrieved record|2026|_Journal of Systems Architecture_|10.1016/j.jss.2026.112963|[Link](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)|Empirical case study|How do JVM/runtime upgrades, including virtual threads, affect energy consumption and related software qualities?|Case-study evaluation of software-stack upgrades; reports that newer JVM releases and virtual threads reduced energy consumption without application changes. [[arxiv](https://arxiv.org/html/2605.26609)][[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)]|Case-study application(s); exact workload and sample size not exposed in the retrieved record.|Virtual threads significantly reduced energy consumption in the case study. [[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)]|It evaluates energy benefits, not carrier starvation, pinning frequency, native-call interference, or tail-latency fragility.|Not stated in the retrieved record.|Energy savings may mask scheduling fragility; the study does not connect energy outcomes to M:N scheduling failure modes.|
|6|**On analyzing virtual threads – a structured concurrency model for scalable applications on the JVM**|D. Beronić, P. Pufek, B. Mihaljević, A. Radovan|2021|MIPRO 2021|Not retrieved|Not retrieved|Primary conference paper|How do virtual threads behave as a structured-concurrency model for scalable JVM applications?|Analysis of virtual threads as a structured concurrency model; identified through citation tracing in a 2026 empirical study. [[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)]|Not exposed in the retrieved record.|Provides early analysis of virtual threads as a JVM concurrency model. [[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)]|Predates JDK 21 GA and JEP 491; therefore it cannot reflect the current residual native-pinning behavior.|Not stated in the retrieved record.|Useful background, but outdated relative to the 2024–2026 pinning landscape.|
|7|**Awesome Copilot Java Development Skill: virtual threads and pinning guidance**|GitHub / community contributors|2025|Community documentation|Not applicable|[Link](https://github.com/github/awesome-copilot/blob/main/skills/java-development/SKILL.md)|Practitioner guidance / secondary documentation|What should developers know about virtual-thread pinning across JDK versions?|Documentation of JDK-version-dependent behavior and mitigation practices. [[github](https://github.com/github/awesome-copilot/blob/main/skills/java-development/SKILL.md)]|Not an empirical sample.|On JDK 21–23, blocking inside `synchronized` pins a virtual thread to its carrier; JEP 491 removes nearly all such pinning in JDK 24+. [[github](https://github.com/github/awesome-copilot/blob/main/skills/java-development/SKILL.md)]|Not peer reviewed; does not quantify native-boundary pinning or carrier starvation.|Not stated in the retrieved record.|Confirms that practitioners recognize version-dependent pinning, but lacks controlled evidence.|
|8|**Virtual Thread Pinning — Project Loom detector & fix**|ThreadMine|2026|Vendor documentation|Not applicable|[Link](https://threadmine.dev/en/resources/virtual-thread-pinning)|Practitioner guidance / tooling documentation|How can developers detect and address virtual-thread pinning?|Describes detection and remediation for pinning; states that on JDK 24+ the remaining pinning cause is native/foreign-function frames. [[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)]|Not an empirical sample.|After JEP 491, native/foreign-function frames are identified as the principal remaining pinning cause. [[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)]|Vendor documentation; no benchmark, statistical analysis, or peer review.|Not stated in the retrieved record.|Supports the premise that FFM/JNI is now the central residual pinning vector, but does not measure starvation.|

## B. Consensus map

- **Virtual threads use an M:N execution model.** JVM-managed virtual threads are multiplexed onto a smaller pool of carrier OS threads; this is the architectural precondition for carrier-thread starvation.[[github](https://github.com/akardapolov/software-atlas/blob/main/docs/languages/java/index.md)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[devproportal](https://devproportal.com/languages/java/java-virtual-threads-project-loom-performance-analysis-2025/)]
- **Pinning prevents a virtual thread from being unmounted.** When a virtual thread cannot unmount, its carrier cannot serve other virtual threads, creating a direct mechanism for starvation.[[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)][[stackoverflow](https://stackoverflow.com/questions/78318131/do-java-21-virtual-threads-address-the-main-reason-to-switch-to-reactive-single)][[backendbytes](https://backendbytes.com/articles/java-virtual-threads-concurrency-revolution/)]
- **`synchronized` was the dominant early pinning source.** JDK 21–23 documentation and practitioner guidance consistently identify blocking inside `synchronized` as a major carrier-pinning cause.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)][[github](https://github.com/github/awesome-copilot/blob/main/skills/java-development/SKILL.md)]
- **JEP 491 substantially reduces `synchronized` pinning.** From JDK 24 onward, monitor ownership is tied to the virtual thread rather than the carrier, removing the common `synchronized`-induced pinning case.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)][[howtodoinjava](https://howtodoinjava.com/java/multi-threading/virtual-threads/)]
- **Native boundaries remain a residual pinning risk.** Multiple sources identify JNI or foreign-function/native frames as pinning cases that remain after the `synchronized` fix.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)][[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)][[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]
- **Pinning has measurable performance consequences.** In one controlled benchmark, `synchronized`-induced pinning reduced throughput by roughly 93% and increased p99 latency by more than 26 times on JDK 21.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]

## C. Disagreement map

|Issue|Position / evidence|Counterposition / limitation|
|---|---|---|
|**Is pinning still a major concern after JDK 24?**|JEP 491 removes most `synchronized`-related pinning, and one benchmark reports zero pinning events on JDK 25 for its workload. [[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]|Native/foreign-function frames, class initialization, and some waiting paths can still pin carriers; therefore the problem is narrowed, not eliminated. [[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)][[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)]|
|**Are virtual threads suitable for all concurrency workloads?**|They are designed for scalable, blocking-oriented workloads and can reduce energy consumption in at least one case study. [[github](https://github.com/akardapolov/software-atlas/blob/main/docs/languages/java/index.md)][[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)]|Community guidance identifies them as unsuitable for CPU-bound work and susceptible to pinning during native system calls. [[github](https://github.com/akardapolov/software-atlas/blob/main/docs/languages/java/index.md)]|
|**Is carrier starvation primarily a lock problem or a native-boundary problem?**|Before JDK 24, `synchronized` was the headline pinning cause; the JobRunr benchmark demonstrates severe throughput collapse from that mechanism. [[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)][[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]|After JEP 491, the remaining documented cause emphasized by tooling is native/foreign-function execution, making FFM/JNI the more salient residual risk. [[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)][[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]|
|**Can production evidence establish causality?**|Netflix’s postmortem provides real-world evidence that pinning can affect production behavior. [[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]|A postmortem cannot isolate confounders or quantify the independent effect of JNI, FFM, synthetic blocking, lock contention, GC, or scheduler configuration.|

## D. Explicit gaps

These are gaps directly supported by the retrieved evidence:

- **No direct systematic review exists for JVM virtual-thread fragility.** The only “Virtual Threads” systematic review retrieved concerns VR/AR/MR adoption in fashion design, not Java concurrency.[[dl.acm](https://dl.acm.org/doi/10.1145/3643834.3661575)][[dblp.uni-trier](https://dblp.uni-trier.de/pid/216/0024.html)]
- **Native/FFM/JNI pinning remains explicitly unresolved.** JEP 491 removes the principal `synchronized` pinning path but retains native-boundary and class-initialization-related pinning cases.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)]
- **Existing benchmarks do not model mixed cooperative and native execution.** The retrieved benchmark isolates `synchronized`-based pinning with 4,096 locks, but does not vary FFM/JNI calls, synthetic blocking, carrier-pool saturation, or mixed workloads.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
- **Production evidence is anecdotal rather than experimentally controlled.** Netflix’s postmortem demonstrates operational relevance, but not a reproducible causal estimate of carrier starvation.[[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]
- **Energy studies do not measure scheduling fragility.** The 2026 energy-aware upgrade study finds energy benefits from virtual threads but does not report carrier starvation, pinning events, or tail-latency degradation.[[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)][[arxiv](https://arxiv.org/html/2605.26609)]

## E. Inferred gaps

These are gaps inferred from the evidence rather than explicitly stated by the sources:

- **No fragility metric exists in the retrieved evidence.** A study could define carrier-starvation probability, pinning duration distribution, time-to-first-starvation, blocked-virtual-thread queue depth, or deadline/SLA violation rate; none appears operationalized in the available sources.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)][[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
- **The FFM/JNI boundary is underexplored experimentally.** Although native frames are identified as a remaining pinning source, the retrieved evidence does not compare JNI, Panama/FFM, file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)][[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)]
- **Static analysis does not yet appear connected to pinning detection.** The search did not retrieve peer-reviewed Error Prone, SpotBugs, or SonarQube rules that detect virtual-thread pinning risk, native-boundary calls, or carrier-starvation patterns.[[github](https://github.com/github/awesome-copilot/blob/main/skills/java-development/SKILL.md)][[skillshub](https://skillshub.space/skills/java-development/)]
- **Call-graph construction across native boundaries is not linked to scheduling fragility.** The retrieved material does not connect dynamic class loading, JNI/FFM call graphs, or interprocedural native-call analysis to carrier-pinning prediction.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[mochi-lang](https://mochi-lang.dev/docs/research/0047/agent-streams)]
- **JDK-version sensitivity is acknowledged but not systematically benchmarked.** Sources distinguish JDK 21–23 from JDK 24+ behavior, but the retrieved evidence contains only one focused benchmark rather than a factorial comparison across JDK versions, workloads, and blocking types.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)][[github](https://github.com/github/awesome-copilot/blob/main/skills/java-development/SKILL.md)]
- **M:N scheduling theory and JVM implementation are not empirically reconciled.** The JEPs define the mechanism, while benchmarks and postmortems observe symptoms, but no retrieved study develops a predictive model linking workload structure to starvation risk.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)][[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]

## F. Open questions

1. **What workload mixture triggers carrier-thread starvation?** In particular, how do the proportions of cooperative Java blocking, FFM calls, JNI calls, CPU-bound segments, and lock-held sections determine the probability and duration of carrier exhaustion?[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)][[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]
2. **How does FFM differ from JNI in pinning severity?** Both may cross a native boundary, but their call frequency, frame duration, exception behavior, and interaction with JVM continuations may produce materially different starvation profiles.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[threadmine](https://threadmine.dev/en/resources/virtual-thread-pinning)]
3. **Can static analysis predict high-risk pinning sites?** A useful tool would combine call-graph reachability to native boundaries, dynamic-loading awareness, lock-held-region analysis, and virtual-thread context sensitivity; no such peer-reviewed tooling was retrieved.[[github](https://github.com/github/awesome-copilot/blob/main/skills/java-development/SKILL.md)][[skillshub](https://skillshub.space/skills/java-development/)]
4. **Does carrier-pool sizing mitigate or merely delay starvation?** Since the default carrier pool is commonly described as sized to available processors, increasing concurrency may expose rather than remove the bottleneck.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[devproportal](https://devproportal.com/languages/java/java-virtual-threads-project-loom-performance-analysis-2025/)]
5. **Do energy savings from virtual threads conceal latency fragility?** The energy study reports savings, but it does not establish whether those savings coexist with tail-latency spikes or starvation under native-heavy workloads.[[dl.acm](https://dl.acm.org/doi/10.1016/j.jss.2026.112963)][[arxiv](https://arxiv.org/html/2605.26609)]
6. **How should a benchmark separate pinning from ordinary contention?** The JobRunr design—striping locks across 4,096 locks to isolate pinning from lock contention—offers a useful template, but it needs extension to native boundaries and mixed workloads.[[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]

**Bottom line:** The technical mechanism is well established—virtual threads multiplex onto carrier threads, and unmountable native or locked execution can pin a carrier—but the empirical literature has not yet quantified **M:N scheduling fragility under mixed cooperative, FFM/JNI, and synthetic blocking workloads**. That absence is the central research gap.[[mochi-lang](https://mochi-lang.dev/docs/research/0047/runtime)][[javacodegeeks](https://www.javacodegeeks.com/2026/05/virtual-threads-two-years-in-production-war-stories-the-pinning-edge-cases-and-what-jdk-25-fixed.html)][[jobrunr](https://www.jobrunr.io/en/blog/java-job-threading-options/)]

# ЦІКАВЕ 

**Energy studies do not measure scheduling fragility.** The 2026 energy-aware upgrade study finds energy benefits from virtual threads but does not report carrier starvation, pinning events, or tail-latency degradation.