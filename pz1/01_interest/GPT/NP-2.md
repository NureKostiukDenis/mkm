---
Date: 2026-11-08
tags:
  - AI
Service: ChatGPT
Model: Auto-Thinking
Relevance:
Additional:
  - "cross-memory: off"
Related:
---

# PROMPT 2

```
ROLE
Act as a senior research methodologist, software engineering researcher, and Master's thesis supervisor.

CONTEXT
I am a Master's student in Software Engineering.
I need to define a defensible research topic for my Master's thesis.

MY INTEREST PROFILE
1. What areas interest me?
Java/Kotlin, Python, concurrency, optimization, static program analysis, bug detection 

2. What problems do I see?
Nothing

3. What systems have I worked with before?
Android, Web.

4. What data or users are available?
Nothing

5. What type of work am I looking for: theoretical, experimental, engineering, interdisciplinary?
Experimental

6. What topics am I not interested in?
- Comparing GC-s 
- Web 
- generative AI
- Energy efficiency 

7. What are my constraints: time, GPU, API budget, access to respondents, data?
Time: 6 months, 4 hours per day
Free API
My own workstation (i5 10400f + 32gb ram + rtx 3060 12gb)

TASK
Map the current research landscape around my interests.

Do NOT generate final thesis topics yet.

Please:
1. identify 5–8 research subdomains;
2. identify 10–15 important current problems;
3. distinguish scientific problems from ordinary implementation tasks;
4. identify emerging trends relevant to 2024–2026;
5. identify stakeholders;
6. identify typical datasets, benchmarks and experimental settings;
7. provide academic terminology and synonyms;
8. identify adjacent research communities;
9. propose 8–12 hypotheses about possible research gaps;
10. for each gap hypothesis state what evidence would verify it.

RULES
- Do not claim a gap exists without evidence.
- Do not invent references.
- If you mention a possible paper, label it UNVERIFIED.
- Do not expose hidden chain-of-thought.
- Provide concise evidence-oriented rationales.

OUTPUT
A. Landscape map
B. Problem list
C. Terminology matrix
D. Emerging directions
E. Candidate gap hypotheses
F. Search terms
G. Questions before topic selection
```

# ANSWER 2

> DATE: 10.11.2026  

Target level: Master's in Software Engineering  
Research mode: Experimental  
Available time: Six months, approximately four hours per day  
Primary technologies: Java, Kotlin, Python  
Excluded directions: Garbage-collector comparisons, web development, generative AI, and energy efficiency.

## Preliminary research profile

Your interests sit at the intersection of three substantial research areas:

1. Program analysis: determining properties of programs without executing all possible behaviors.
    
2. Concurrent software correctness: identifying defects caused by interaction between threads, tasks, shared state, and execution order.
    
3. Empirical software engineering: evaluating tools, methods, and defects using real repositories and controlled experiments.
    

A particularly relevant intersection is:

\[ \text{Static analysis} + \text{Concurrency} + \text{Experimental evaluation} \]

There is one important distinction: implementing a detector is not automatically a research contribution. The scientific contribution needs to establish something about detection capability, limitations, precision, generalizability, performance, or an improved analysis method.

An important finding already visible in the literature: Kotlin coroutine concurrency is an established empirical research area. Brockbernd et al. published an ECOOP 2024 study analyzing 55 concurrency bug cases from seven open-source repositories. Therefore, a broad claim that Kotlin coroutine bugs have not been studied would be incorrect. More specific questions about their detection, reproducibility, or generalizability still deserve investigation.

drops.dagstuhl.de

Similarly, static analyzer reliability is an active research subject. A 2024 study examined 350 historical false-positive and false-negative issues in PMD, SpotBugs, and SonarQube, and a 2025 FSE study investigated suppressed static-analysis warnings. These findings make analyzer reliability and evaluation methodology relevant research territory, rather than merely tool configuration.

arxiv.org+1

The analysis below distinguishes verified evidence, interpretation, and research-gap hypotheses. None of the hypotheses should be considered a confirmed gap or an approved thesis topic.

# A. Landscape map

## A1. Eight research subdomains

The following eight subdomains are relevant to your interest profile.

|#|Research subdomain|Main scientific focus|Relevance|
|---|---|---|---|
|1|Static program analysis|Finding defects without executing programs|Very high|
|2|Concurrent program correctness|Data races, deadlocks, atomicity, thread safety|Very high|
|3|Concurrency testing and model checking|Exploring execution schedules and reproducing concurrency failures|Very high|
|4|Kotlin coroutines and asynchronous programming|Detecting defects related to suspension, cancellation, dispatchers, and coroutine lifecycles|Very high|
|5|Android concurrency and lifecycle analysis|Correctness of asynchronous operations within mobile application lifecycles|High|
|6|Empirical evaluation of bug-detection tools|False positives, false negatives, reliability, and warning quality|Very high|
|7|JVM performance analysis and optimization|Finding performance problems and evaluating optimizations in concurrent JVM applications|High|
|8|Repository mining and software defect benchmarks|Mining real defects, understanding their causes, and evaluating detection methods|Very high|

### 1. Static program analysis

Strong fit

Static analysis examines source code or compiled representations to infer program properties without executing every possible program execution.

Important subareas:

- Data-flow analysis.
    
- Control-flow analysis.
    
- Interprocedural analysis.
    
- Pointer and alias analysis.
    
- Taint analysis.
    
- Symbolic execution.
    
- Abstract interpretation.
    
- Program slicing.
    
- Path-sensitive analysis.
    
- Typestate analysis.
    

Representative tools and frameworks:

- Facebook Infer.
    
- SpotBugs.
    
- PMD.
    
- SonarQube.
    
- SootUp.
    
- CodeQL.
    

An important research question is not simply whether a tool produces warnings, but whether its underlying analysis captures the program behaviors that lead to real defects.

For example, Infer's RacerD checker explicitly describes a trade-off: it focuses on high-confidence data-race detection rather than attempting to prove the absence of all concurrency defects. Its documentation also identifies limitations involving aliasing, object escape, and different locks protecting different accesses.

Infer

### 2. Concurrent program correctness

Strong fit

This area studies whether software behaves correctly when multiple threads or tasks execute concurrently.

Core research concepts:

|Concept|Meaning|
|---|---|
|Data race|Conflicting concurrent accesses to shared state without adequate synchronization|
|Race condition|Incorrect behavior caused by execution ordering or timing|
|Deadlock|Participants wait indefinitely for one another|
|Livelock|Participants continue executing without making useful progress|
|Starvation|A task is repeatedly denied necessary resources|
|Atomicity violation|A group of operations does not behave as one indivisible operation|
|Linearizability violation|A concurrent implementation violates its specified sequential behavior|
|Check-then-act bug|A condition changes between checking it and performing an operation|
|Thread-safety violation|An object does not preserve its correctness under concurrent access|

The distinction between a data race and a broader race condition is important. A program may exhibit incorrect concurrent behavior without a conventional low-level data race.

This creates an important classification problem: different analyzers detect different subsets of concurrency defects.

### 3. Concurrency testing and model checking

This domain focuses on systematically finding problematic execution orders.

Useful concepts include:

- Schedule exploration.
    
- Systematic concurrency testing.
    
- Partial-order reduction.
    
- State-space exploration.
    
- Model checking.
    
- Stress testing.
    
- Deterministic replay.
    
- Linearizability testing.
    
- Java Memory Model verification.
    

Two particularly relevant JVM tools are:

Lincheck

Lincheck explores possible thread interleavings and can use model checking or stress testing. It is relevant to both Java and Kotlin JVM code. Its documentation also explains an important limitation: its model-checking strategy assumes sequential consistency and does not simulate every relevant JVM/library behavior.

Kotlin Documentation+1

jcstress

An OpenJDK experimental harness for testing the correctness of concurrency support in the JVM, class libraries, and hardware. It includes tests involving Java Memory Model behavior and synchronization.

GitHub

These tools are useful experimental instruments, not interchangeable substitutes for a static analyzer.

### 4. Kotlin coroutines and asynchronous programming

Particularly relevant

Kotlin introduces additional concurrency semantics beyond conventional Java threads.

Important concepts:

- Coroutine lifecycle.
    
- Structured concurrency.
    
- Coroutine cancellation.
    
- Suspension and resumption.
    
- Coroutine context.
    
- Dispatcher selection.
    
- Job hierarchy.
    
- Exception propagation.
    
- Channels and shared state.
    
- Blocking versus suspending execution.
    
- Coroutine scope management.
    

The ECOOP 2024 study by Brockbernd et al. is especially important here. Its 55 cases included defects associated with coroutine semantics, not just conventional data races and deadlocks. One reported pattern was calling `runBlocking` from an existing coroutine, potentially blocking the dispatcher thread and leading to deadlock.

nikitakoval.org+1

Kotlin's structured concurrency documentation also makes clear that task lifecycles and parent-child relationships are part of the programming model, not just implementation details.

Kotlin Documentation

### 5. Android concurrency and lifecycle analysis

This subdomain combines concurrency, event-driven programming, and mobile application lifecycle management.

Research concepts:

- Main-thread confinement.
    
- Background task execution.
    
- Activity and Fragment lifecycle.
    
- Lifecycle-aware coroutines.
    
- Cancellation of asynchronous operations.
    
- UI state consistency.
    
- Callback ordering.
    
- Shared state between UI and background execution.
    
- Configuration changes and process recreation.
    

There is a methodological advantage here: Android applications have public repositories, issue trackers, bug reports, and reproducible bug datasets.

However, a general Android bug dataset is not automatically a concurrency benchmark. Defects must be classified and validated before being used for concurrency experiments.

### 6. Empirical evaluation of bug-detection tools

This domain is particularly suitable for experimental Master's research.

Potential research questions concern:

- Detection precision.
    
- Detection recall.
    
- False-positive rates.
    
- False-negative rates.
    
- Warning severity.
    
- Detection stability across tool versions.
    
- Sensitivity to configuration.
    
- Analysis time and resource requirements.
    
- Reproducibility of reported results.
    
- Differences between synthetic benchmarks and real-world defects.
    

The 2024 historical-issues study and the 2025 suppressed-warnings study demonstrate that tool quality remains an active empirical research subject.

arxiv.org+1

### 7. JVM performance analysis and optimization

This is the appropriate branch for your interest in optimization, without involving garbage-collector comparisons or energy efficiency.

Relevant research concepts:

- Lock contention.
    
- Thread-pool saturation.
    
- Excessive synchronization.
    
- Task granularity.
    
- Unnecessary context switching.
    
- Blocking operations in asynchronous execution.
    
- Parallel scalability.
    
- Throughput and latency.
    
- Performance regression detection.
    
- Correctness-preserving optimization.
    

Relevant infrastructure includes JMH and the Renaissance and DaCapo benchmark suites. JMH is a measurement harness, while Renaissance and DaCapo supply JVM workloads.

GitHub+2

The key scientific distinction is between finding a suspicious code pattern and establishing that it causes measurable performance degradation under controlled conditions.

### 8. Repository mining and software defect benchmarks

This domain studies real software changes, bug reports, failure-inducing commits, and bug-fixing commits.

Important methods:

- Mining software repositories.
    
- Mining issue trackers.
    
- Bug-inducing commit identification.
    
- Patch analysis.
    
- Root-cause classification.
    
- Defect reproduction.
    
- Bug benchmark construction.
    
- Empirical replication.
    

It is particularly valuable given that you do not currently have access to private datasets, company systems, or respondents.

Public repository mining can provide empirical data without requiring human participants or paid APIs.

## A2. Relationship between the subdomains

The research landscape can be represented as follows:

Software defect and correctness research

Overall research problem

Static analysis

Infer defects from program structure

Dynamic testing

Observe program executions

Concurrency semantics

Reason about execution ordering

Empirical evaluation

Measure effectiveness and limitations

Experimental evidence

Real defects · controlled executions · reproducible measurements

Your strongest potential research area is where static analysis and concurrency testing can be evaluated against real defects. Kotlin coroutines and Android provide useful application contexts, while JVM analysis frameworks provide a technical foundation.

This is a map of promising research territory, not a recommendation to select any particular branch yet.

# B. Problem list

The following are 14 important research problems. They are not 14 thesis topics: they are unresolved or actively investigated technical questions that may support multiple research directions.

I distinguish scientific problems from ordinary implementation work.

## B1. Concurrency and program-analysis problems

|#|Problem|Scientific question|Classification|
|---|---|---|---|
|P1|False positives in static analysis|How can an analyzer distinguish real defects from safe but suspicious code?|Scientific|
|P2|False negatives|Which defect patterns are systematically missed by existing analyzers?|Scientific|
|P3|Incomplete concurrency modeling|How accurately can an analysis model synchronization, thread interaction, and shared state?|Scientific|
|P4|Aliasing and object escape|How do aliases, ownership, and object escape affect race detection?|Scientific|
|P5|Atomicity violations|How can incorrect multi-operation behavior be detected when individual accesses appear synchronized?|Scientific|
|P6|Deadlock detection|How can cyclic dependencies and blocking behavior be detected without executing every possible schedule?|Scientific|
|P7|Rare concurrency failures|How can problematic execution schedules be discovered and reproduced reliably?|Scientific|
|P8|Weak-memory behavior|How do memory-model assumptions affect the correctness of concurrency analysis?|Scientific|
|P9|Coroutine-specific defects|How can tools reason about suspension, cancellation, dispatchers, and structured concurrency?|Scientific|
|P10|Android lifecycle interaction|How can asynchronous execution be checked against the lifecycle of mobile components?|Scientific|
|P11|Analysis scalability|How does analysis precision change when examining larger, more interconnected projects?|Scientific|
|P12|Benchmark representativeness|Do existing test cases reflect actual defects found in production software?|Scientific|
|P13|Warning usability|Which warnings are actionable, and which ones developers repeatedly suppress or ignore?|Scientific|
|P14|Performance regressions from concurrency changes|Do synchronization and scheduling changes improve or degrade real application performance?|Scientific|

### P2. Important distinctions within these problems

P1 and P2: False positives versus false negatives

These represent different failure modes.

- False positive: the analyzer reports a defect where no defect exists.
    
- False negative: the analyzer fails to report an actual defect.
    

A tool may achieve high precision by reporting only easy-to-identify cases, while missing many serious defects.

Consequently, precision alone is insufficient.

Useful metrics include:

\[ Precision = \frac{TP}{TP+FP} \]

\[ Recall = \frac{TP}{TP+FN} \]

\[ F1 = 2 \cdot \frac{Precision \cdot Recall}{Precision+Recall} \]

A 2024 empirical study of PMD, SpotBugs, and SonarQube investigated historical analyzer defects and used metamorphic testing to uncover additional false-positive and false-negative problems. This provides a concrete precedent for studying analyzer quality experimentally.

arxiv.org

P3–P6: Incomplete concurrency reasoning

A particularly important issue is that detecting unsynchronized access does not mean detecting all concurrent defects.

For example:

```
if (account.getBalance() >= amount) {
    account.withdraw(amount);
}
```

Even when both methods are individually synchronized, their combined use may violate the intended atomicity requirement.

Research questions include whether the analysis can identify:

- Missing synchronization.
    
- Incorrect synchronization.
    
- Incorrect lock selection.
    
- Lock-order inconsistencies.
    
- Unsafe object sharing.
    
- Multi-operation atomicity violations.
    

RacerD provides a useful example of a deliberately limited detection scope. Its documentation identifies missed cases involving aliasing, object escape, and different locks guarding conflicting accesses.

GitHub

P7–P8: Execution schedules and memory models

Finding a concurrency bug is often difficult because the defect may require a specific execution interleaving.

Two execution strategies have different strengths:

|Strategy|Strength|Limitation|
|---|---|---|
|Stress testing|Exercises real scheduler behavior|Failure may be difficult to reproduce|
|Model checking|Systematically explores modeled executions|State-space growth and modeling assumptions|

The distinction is explicitly documented by Lincheck. Its model-checking and stress-testing strategies are not equivalent, particularly regarding reproducibility and memory-model assumptions.

Kotlin Documentation

Weak-memory testing is also an active formal-methods problem. A 2024 POPL article examined the computational complexity of consistency testing under several weak-memory models. This is an important adjacent research direction, although its results should not automatically be transferred to JVM-specific analysis.

TU Delft Research Portal

P9: Kotlin coroutine-specific concurrency defects

This is a particularly interesting boundary between conventional concurrency analysis and language-specific semantics.

Potential defect mechanisms include:

- Blocking a dispatcher thread.
    
- Incorrect coroutine cancellation.
    
- Incorrect propagation of exceptions.
    
- Unsafe coroutine scope management.
    
- Unexpected execution-context switching.
    
- Incorrect interactions between structured and unstructured concurrency.
    
- Shared mutable state across coroutines.
    

The ECOOP 2024 research establishes that these are legitimate empirical subjects. A next study would need to investigate a more specific question, such as detection effectiveness or behavior across different application contexts.

drops.dagstuhl.de

## B2. What is not automatically a scientific problem?

This distinction is essential for your thesis.

|Activity|Usually an implementation task|What would make it scientific?|
|---|---|---|
|Create a Java race detector|Yes|Evaluate a novel detection method against controlled baselines|
|Add a SpotBugs rule|Yes|Establish a new defect-detection method and evaluate its effectiveness|
|Convert callbacks into coroutines|Yes|Experimentally determine whether a class of transformations changes defect likelihood or behavior|
|Configure Infer|Yes|Compare its detection limitations under controlled defect categories|
|Build a static-analysis dashboard|Yes|Investigate and measure a research question about warning prioritization or developer decision-making|
|Add more synchronization|Yes|Evaluate correctness and performance trade-offs across controlled concurrent workloads|
|Run Lincheck on a project|Yes|Establish what types of defects its exploration finds or misses compared with alternatives|
|Mine GitHub issues|Not by itself|Conduct a reproducible empirical study with a defined sampling and classification methodology|

A useful test: Could another researcher obtain meaningful findings from your experiment even if they never used your software implementation?

If yes, you are more likely to have a defensible scientific contribution.

# C. Terminology matrix

Terminology is important because different communities use different words for closely related problems. Searching only for `static analysis bug detection` would miss a substantial portion of the literature.

## C1. Core concepts and academic synonyms

|Main concept|Academic terminology|Synonyms and search variants|
|---|---|---|
|Static analysis|Static program analysis|Static code analysis, compile-time analysis|
|Bug detection|Defect detection|Fault detection, bug finding, defect identification|
|False positives|False alarm problem|FP reduction, warning precision, alarm filtering|
|False negatives|Missed defects|Detection incompleteness, recall problem|
|Data races|Data race detection|Race detection, shared-memory race analysis|
|Race conditions|Concurrency defects|Timing-dependent defects, order-dependent failures|
|Deadlocks|Deadlock detection|Wait-for cycles, lock-order analysis|
|Atomicity|Atomicity violation detection|Non-atomic execution, transaction interference|
|Thread safety|Thread-safety analysis|Concurrency safety, synchronization correctness|
|Object sharing|Shared-state analysis|Data sharing, ownership, aliasing|
|Interprocedural analysis|Whole-program analysis|Cross-procedural analysis, call-graph-based analysis|
|Program slicing|Static slicing|Dynamic slicing, concurrent slicing|
|Model checking|State-space exploration|Explicit-state verification, schedule exploration|
|Concurrency testing|Systematic concurrency testing|Schedule-controlled testing, stress testing|
|Reproducibility|Deterministic replay|Failure reproduction, execution replay|
|Coroutine analysis|Asynchronous program analysis|Coroutine correctness, async/await analysis|
|Performance analysis|Performance bug detection|Performance anti-pattern detection, bottleneck analysis|

## C2. Java and Kotlin concurrency vocabulary

|Area|Terms worth knowing|
|---|---|
|Java Memory Model|JMM, happens-before, sequential consistency, volatile semantics, safe publication|
|Java synchronization|Monitors, intrinsic locks, ReentrantLock, synchronized blocks|
|JVM concurrency|ExecutorService, ForkJoinPool, CompletableFuture, concurrent collections|
|Kotlin coroutines|CoroutineScope, Job, Dispatcher, launch, async, suspend, cancellation|
|Structured concurrency|Parent-child task hierarchy, lifecycle propagation, cancellation propagation|
|Coroutine synchronization|Mutex, Channel, StateFlow, SharedFlow, atomic operations|
|Android concurrency|Main-thread confinement, lifecycle-aware concurrency, UI-thread violations|
|Concurrent correctness|Linearizability, sequential specification, atomicity, progress guarantees|

## C3. Methodological terminology

These terms are particularly important when designing an experimental thesis.

|Term|Why it matters|
|---|---|
|Ground truth|Establishes which examples genuinely contain defects|
|Mutation testing|Introduces controlled changes to test detection capabilities|
|Metamorphic testing|Tests expected relationships between transformed inputs and analyzer results|
|Ablation study|Measures the contribution of individual components of a method|
|Controlled experiment|Isolates the effects of different analysis approaches|
|Benchmark contamination|Occurs when test cases are not independent or are too familiar to the evaluated method|
|Ecological validity|Measures how well experimental conditions represent real development environments|
|Reproducibility|Allows another researcher to repeat the experiment|
|External validity|Concerns whether results generalize beyond the experimental sample|
|Construct validity|Concerns whether measurements actually represent the intended concept|
|Inter-rater agreement|Measures agreement when humans classify defects|
|Statistical significance|Evaluates whether observed differences are compatible with chance|
|Effect size|Measures the magnitude of an observed difference|

## C4. Search vocabulary by research community

An important practical observation: researchers in programming languages, software engineering, and software testing may study similar underlying problems but describe them differently.

For example:

- Software engineering: concurrency bug detection.
    
- Programming languages: verification of concurrent programs.
    
- Formal methods: linearizability checking.
    
- Software testing: systematic concurrency testing.
    
- Static analysis: thread-safety analysis.
    
- Empirical software engineering: empirical study of concurrency defects.
    

Searching across all these vocabularies will produce a substantially better evidence base.

# D. Emerging research directions, 2024–2026

These directions reflect identifiable developments in research and tooling. They are trends, not proof that any specific gap exists.

## D1. More attention to language-specific concurrency semantics

Strong evidence

Kotlin coroutine usage introduces concurrency behaviors that do not fit neatly into traditional thread-based defect categories.

The ECOOP 2024 study is a useful milestone because it examined real Kotlin applications rather than relying exclusively on synthetic concurrency examples.

Research implication: Traditional race detectors and coroutine-aware analyses should not be assumed to offer equivalent defect coverage.

Source: Brockbernd et al., Understanding Concurrency Bugs in Real-World Programs with Kotlin Coroutines, ECOOP 2024.

drops.dagstuhl.de

## D2. Evaluation of static analyzers using historical defects

Strong evidence

The 2024 study by Cui et al. examined historical false-positive and false-negative issues in three established analyzers. It also demonstrated metamorphic testing as a way to uncover additional analyzer defects.

The important change in research perspective is moving beyond asking whether a tool produces warnings.

Researchers can instead investigate:

- Why an analyzer misses a defect.
    
- What code characteristics trigger incorrect warnings.
    
- Whether analyzer weaknesses are systematic.
    
- Whether transformed examples expose those weaknesses.
    

Source: An Empirical Study of False Negatives and Positives of Static Code Analyzers From the Perspective of Historical Issues, 2024.

arXiv

## D3. Warning suppression and warning maintenance

Strong evidence

A 2025 FSE study investigated suppressed static-analysis warnings across projects written in three languages.

It reported 7,357 suppressions in 46 Python projects and found that 50.8% of the studied suppressions did not affect any warning.

The results show that warnings have a lifecycle: a warning can be introduced, suppressed, become obsolete, or potentially hide future findings.

FSE 2025

Research implication: Static-analysis reliability is not limited to detection algorithms. How projects maintain analyzer warnings is also a scientific subject.

## D4. Explainability and relationships between errors

Emerging method

A 2024 study introduced the concept of error chains to static analysis.

The motivation was that an analyzer may report where a problem manifests rather than the location where it needs to be fixed.

In a case study involving 471 GitHub repositories, the researchers found that 50% of projects with a report had at least one error chain. Their proposed improvement incurred less than 4% runtime overhead in the reported benchmark.

aXi

Research implication: The relationship between detection precision, root-cause localization, and warning usefulness deserves attention.

## D5. More advanced verification under relaxed memory models

Strong theoretical development

Research in 2024–2025 continued examining the complexity and correctness of concurrent execution under weak-memory models.

Two useful examples:

- How Hard Is Weak-Memory Testing?, 2024.
    
- RELINCHE: Automatically Checking Linearizability under Relaxed Memory Consistency, POPL 2025.
    

RELINCHE investigates automatic verification of concurrent libraries under relaxed memory consistency and reports verification of bounded client executions.

TU Delft Research Portal+1

This is theoretically interesting, but a Master's experiment should be careful about scope. Implementing a new general-purpose memory-model checker would likely be too ambitious.

## D6. Movement toward real and reproducible concurrency benchmarks

Emerging infrastructure trend

Benchmark design is itself becoming more sophisticated.

A particularly current example is ConcurBugBench, listed as under development in July 2026. Its purpose is to evaluate concurrency bug discovery and repair using nearly 200 real bugs, with bug-specific oracles. Its listed languages are Go, Rust, C, and C++, not Java or Kotlin.

DAPLab

This distinction is important:

- It demonstrates interest in realistic concurrency evaluation.
    
- It does not establish that the Java/Kotlin benchmark space has the same characteristics.
    
- It cannot be treated as a ready-made Java/Kotlin benchmark for your experiment.
    

Another relevant example is kBench and kGym, which combine real Linux kernel bugs with deterministic reproduction infrastructure. Again, this is evidence from an adjacent systems community, not a direct JVM solution.

DAPLab

## D7. More disciplined JVM performance measurement

Performance experiments are highly sensitive to workload construction, JVM warm-up, measurement configuration, and environmental variability.

Three useful developments in the relevant infrastructure are:

- JMH: JVM-specific benchmark harness.
    
- Renaissance: modern JVM benchmark workloads.
    
- DaCapo Chopin: a newer generation of the DaCapo benchmark suite, with a 2025 ASPLOS publication.
    

These are relevant for evaluating performance optimization, but should not be confused with datasets of known concurrency defects.

GitHub+2

## D8. Trends I would not prioritize under your constraints

Some current research uses generative AI to classify or detect static-analysis warnings and concurrency defects.

That is an active area, but I would not treat it as an eligible research direction given your explicit exclusion.

Likewise, I would not prioritize garbage-collector comparisons, energy-based optimizations, or web-system performance studies.

### Overall assessment of trends

|Direction|2024–2026 signal|Fit with your constraints|
|---|---|---|
|Kotlin coroutine defect analysis|Direct empirical research|Excellent|
|Static analyzer evaluation|Multiple empirical studies|Excellent|
|Concurrency testing/model checking|Strong methodological activity|Excellent|
|Warning quality and suppression|Recent empirical evidence|Very good|
|Real-world benchmark construction|New benchmark initiatives|Very good|
|Weak-memory formal verification|Strong theoretical work|Good, but scope-sensitive|
|JVM performance optimization|Updated measurement infrastructure|Good|
|Android lifecycle-aware concurrency|Relevant established research area|Good|
|Generative-AI-assisted analysis|Active but excluded|Not suitable|

# E. Candidate research-gap hypotheses

This section is the most important part of the landscape analysis.

A gap hypothesis is a statement worth investigating. It does not mean that the gap has already been demonstrated.

I use three evidence classifications:

- Direct evidence
    

    Existing research or documentation explicitly demonstrates a limitation or a bounded area of investigation.

    
- Inferred
    

    Multiple findings suggest a possible opportunity, but the existence and significance of the gap need testing.

    
- Exploratory
    

    The research question is plausible, but the current search has not established sufficient supporting evidence.

    

## E1. Ten gap hypotheses

### G1. Detection of Kotlin coroutine-specific defects by existing static-analysis tools

Direct evidence for the problem; gap unverified

Hypothesis

Static-analysis tools designed primarily around conventional Java thread-safety patterns may not adequately capture defects associated with Kotlin coroutine semantics.

Rationale

The ECOOP 2024 study identifies coroutine-specific concurrency bugs, while Infer documents its Java-focused RacerD analysis. These provide a reason to investigate the alignment between the defect patterns and available analyzer capabilities.

drops.dagstuhl.de+1

Evidence needed to verify the hypothesis

1. Collect the 55 cases studied in the ECOOP paper, subject to case availability.
    
2. Identify their actual root-cause categories.
    
3. Establish whether each case can be reproduced.
    
4. Select analyzers that genuinely support the relevant source or bytecode representation.
    
5. Evaluate detection coverage.
    
6. Manually validate all findings.
    

Measurements

- Precision.
    
- Recall.
    
- F1.
    
- Detection by bug category.
    
- Analysis execution time.
    

### G2. Generalizability of the known Kotlin coroutine bug classifications

Direct evidence for a bounded sample; gap unverified

Hypothesis

The distribution of coroutine-specific defects reported in the ECOOP 2024 study may not represent the wider population of Kotlin applications.

Rationale

The study analyzed 55 cases from seven repositories. That is meaningful empirical evidence, but it does not automatically establish that the same distributions occur in different ecosystems or application categories.

drops.dagstuhl.de

Evidence needed to verify the hypothesis

- Collect Kotlin repositories across several application categories.
    
- Mine issue trackers and fixing commits.
    
- Identify concurrency-related defects.
    
- Manually validate and categorize the defects.
    
- Compare the new classification with the published findings.
    
- Measure agreement between independent defect classifiers where feasible.
    

A meaningful finding could be the confirmation, refinement, or rejection of existing classifications.

### G3. Insufficient analysis of coroutine cancellation-related defects

Inferred

Hypothesis

Certain defects caused by incorrect cancellation handling or exception propagation may not be systematically detected by existing concurrency analysis approaches.

Rationale

Coroutine cancellation and exception propagation have explicit semantic rules in Kotlin. Existing concurrency checks should not be assumed to cover these behaviors automatically.

Kotlin Documentation+1

Evidence needed to verify the hypothesis

1. Identify real defects related to cancellation and exception propagation.
    
2. Construct minimal reproducible examples.
    
3. Evaluate existing static and dynamic tools.
    
4. Distinguish unsupported behavior from genuine missed detection.
    
5. Establish whether the missed defects represent a recurring pattern.
    

### G4. Complementarity of static and dynamic concurrency analysis

Direct evidence for different capabilities; gap unverified

Hypothesis

Static and dynamic concurrency analysis methods may detect substantially different classes of defects, and their combined use could improve coverage.

Rationale

RacerD analyzes program structure and synchronization properties, while Lincheck explores execution interleavings. Their assumptions and detection mechanisms differ.

Infer+1

Evidence needed to verify the hypothesis

Compare:

- Static analysis only.
    
- Model checking only.
    
- Stress testing only.
    
- Combined approaches.
    

Use the same defect set and verify every result against ground truth.

Measurements

- Unique defects detected.
    
- Recall.
    
- Precision.
    
- Execution time.
    
- Reproducibility.
    
- Overlap between detected defects.
    

The important question is whether combining approaches produces meaningful improvements rather than simply additional reports.

### G5. Effect of aliasing and object escape on concurrency detector effectiveness

Directly documented tool limitations

Hypothesis

Aliasing and object escape contribute to missed concurrency defects in some static-analysis configurations, and their impact may be quantifiable on real Java projects.

Rationale

Infer's RacerD documentation explicitly identifies these limitations, alongside limitations involving distinct locks and weak-memory reasoning.

GitHub

Evidence needed to verify the hypothesis

- Construct controlled positive and negative examples.
    
- Introduce aliasing and object-escape variants.
    
- Execute the analyzer on each variant.
    
- Compare detection results.
    
- Validate the behavior against actual concurrency semantics.
    
- Repeat on representative real Java code where possible.
    

This is a relatively concrete hypothesis because the baseline limitations are documented.

### G6. General static-analysis false-positive findings may not transfer to concurrency analyzers

Inferred

Hypothesis

The factors responsible for false positives in general-purpose Java static analyzers may differ from those responsible for false positives in concurrency-specific analyzers.

Rationale

The 2024 historical-issues study addresses general static analyzers. RacerD addresses a narrower concurrency-specific problem. Applying findings from one class of tools to another without testing would be methodologically weak.

arXiv+1

Evidence needed to verify the hypothesis

- Collect real warnings from selected tools.
    
- Label warnings through manual inspection.
    
- Classify false-positive causes.
    
- Compare results across analyzer categories.
    
- Test whether the historical issue taxonomy explains concurrency-specific warning failures.
    

### G7. Warning suppression behavior in Java/Kotlin concurrency analysis

Direct evidence for general suppressions; concurrency-specific gap inferred

Hypothesis

The relationship between warning suppression, analyzer configuration, and future defect detection may behave differently for concurrency-related warnings than for general static-analysis warnings.

Rationale

The 2025 FSE study demonstrates that suppression behavior is an important aspect of static-analysis maintenance. Whether the same observations hold for Java/Kotlin concurrency checks remains to be verified.

FSE 2025

Evidence needed to verify the hypothesis

- Mine public Java/Kotlin repositories.
    
- Identify concurrency-specific warning suppressions.
    
- Track their introduction and removal.
    
- Determine whether they correspond to active warnings.
    
- Investigate whether suppressions conceal later warnings.
    
- Categorize the reasons for suppression.
    

### G8. Lack of established coverage for realistic Kotlin coroutine concurrency benchmarks

Exploratory

Hypothesis

Available evaluation resources may not provide sufficient coverage of reproducible, real-world Kotlin coroutine defects across multiple defect categories.

Rationale

The ECOOP study supplies empirical cases, Lincheck supplies JVM concurrency testing infrastructure, and current concurrency benchmark initiatives exist in other languages. However, this does not establish whether an adequate Kotlin-specific benchmark already exists.

drops.dagstuhl.de+2

Evidence needed to verify the hypothesis

1. Systematically search published Kotlin concurrency testing research.
    
2. Identify publicly available artifacts and datasets.
    
3. Examine which bug classes are covered.
    
4. Check whether examples are reproducible.
    
5. Check whether they have reliable expected outcomes.
    
6. Compare existing collections against real defect classifications.
    

A gap would be supported by demonstrated coverage limitations, not simply by finding a small number of benchmark repositories.

### G9. Applicability of existing Android bug datasets to concurrency research

Exploratory

Hypothesis

General Android bug datasets may contain concurrency-related defects, but their usefulness for concurrency research may be limited by the absence of sufficiently precise concurrency labels or reproducible execution scenarios.

Rationale

AndroR2 provides manually reproduced Android bug reports, APKs, metadata, and reproduction scripts. It includes 90 reproduced bug reports and a much larger issue collection. Its reports include crashes, incorrect outputs, and GUI-related failures. These properties make it useful for investigating the feasibility of extracting concurrency-relevant cases.

MSR 2021+1

Evidence needed to verify the hypothesis

- Inspect the dataset's bug reports.
    
- Classify concurrency-related failures.
    
- Check whether the relevant code and reproduction scripts remain executable.
    
- Determine the proportion that actually involve concurrency rather than ordinary lifecycle or UI defects.
    

This hypothesis should not assume that all asynchronous Android defects are concurrency defects.

### G10. Relationship between concurrency optimization and correctness

Exploratory

Hypothesis

Some performance optimizations in concurrent JVM programs may introduce correctness problems or trade-offs that cannot be identified through performance measurement alone.

Rationale

JMH and JVM benchmark suites enable controlled performance experiments, while concurrency testing tools provide separate correctness evidence. Combining the two measurement dimensions is a plausible opportunity, but the specific research gap remains unverified.

GitHub+2

Evidence needed to verify the hypothesis

- Select real concurrent implementations.
    
- Identify performance-oriented code changes.
    
- Test correctness before and after changes.
    
- Measure throughput and latency under controlled workloads.
    
- Check for regressions under multiple thread counts.
    
- Separate genuine improvements from benchmark noise.
    

## E2. Gap hypothesis summary

|ID|Gap hypothesis|Evidence status|Most useful verification method|
|---|---|---|---|
|G1|Kotlin coroutine detector coverage|Direct problem evidence|Tool evaluation|
|G2|Generalizability of coroutine bug classifications|Direct bounded-sample evidence|Repository mining and replication|
|G3|Cancellation-related defect detection|Inferred|Bug classification and tool testing|
|G4|Static/dynamic analysis complementarity|Inferred|Controlled comparison|
|G5|Aliasing and object escape in race detection|Direct tool limitation|Mutation-based experiments|
|G6|False positives in concurrency analyzers|Inferred|Warning analysis|
|G7|Concurrency warning suppression behavior|Inferred|Repository mining|
|G8|Kotlin concurrency benchmark coverage|Exploratory|Benchmark mapping study|
|G9|Android dataset suitability for concurrency research|Exploratory|Dataset audit|
|G10|Correctness/performance optimization trade-offs|Exploratory|Controlled performance and correctness testing|

My interpretation: G1, G2, G4, and G5 provide the most immediately defensible starting points for deeper literature review. G8 and G9 offer empirical data-oriented possibilities. G10 is relevant but needs more focused literature investigation.

None is sufficiently validated to be called a confirmed research gap.

# A. Landscape map — continued

## A3. Stakeholders

The research has several stakeholder groups. Understanding them helps explain why particular technical problems matter.

|Stakeholder|Primary concerns|Research relevance|
|---|---|---|
|Java/Kotlin developers|Incorrect concurrent behavior, crashes, data corruption|Defect types and practical detection|
|Android developers|UI responsiveness, lifecycle correctness, asynchronous tasks|Coroutine and lifecycle defects|
|QA and test engineers|Reproducing rare failures, improving test coverage|Systematic concurrency testing|
|Static-analysis tool developers|Detection accuracy, scalability, warning quality|Analyzer evaluation and improvement|
|Kotlin language and library maintainers|Coroutine semantics, cancellation, dispatching|Language-specific correctness|
|JVM and Android runtime engineers|Scheduling, synchronization, memory-model behavior|Runtime-level concurrency correctness|
|Open-source maintainers|Reproducing and fixing real defects|Repository mining and bug validation|
|Performance engineers|Throughput, latency, contention, scalability|Performance optimization|
|Academic researchers|Reliable methods, benchmarks, reproducible evidence|Scientific contribution|

The most relevant stakeholders for your experimental research are tool developers, application developers, QA engineers, and maintainers of concurrent libraries.

A human-participant study is not necessary to investigate many of these concerns.

## A4. Datasets, benchmarks, and experimental resources

This is an important consideration because you currently have no private datasets or access to respondents.

Fortunately, several public resources are relevant.

### 1. Real defect datasets

|Resource|Language/domain|What it provides|Suitability|
|---|---|---|---|
|Defects4J|Java|Real defects, buggy/fixed versions, test suites|High for general Java defect evaluation|
|BugSwarm|Java, Python|Reproducible failing CI builds and fixes|High for empirical defect studies|
|AndroR2|Android|Reproduced bugs, APKs, scripts, issue metadata|High for Android studies|
|ECOOP 2024 coroutine bug collection|Kotlin|55 concurrency bug cases from seven repositories|Very high for coroutine-related research|
|Juliet Test Suite|Java, C, C++|Large collection of synthetic programs with known weaknesses|Useful for controlled static-analysis evaluation|

Important characteristics:

- Defects4J is particularly useful when the experiment requires a reproducible Java bug and a test suite to distinguish buggy and fixed versions.
    
- BugSwarm provides real CI failures and fixes, making it useful for software engineering experiments.
    
- AndroR2 provides actual reproduction artifacts, not merely descriptions of bugs.
    
- The Kotlin coroutine collection offers a direct starting point for concurrency-specific empirical work, although access to all cases and reproduction environments must be checked.
    
- Juliet is synthetic. Its examples cannot automatically be treated as representative of production code.
    

Sources: BugSwarm's official dataset description, AndroR2's repository and MSR 2021 publication, NIST's Juliet description, and the ECOOP paper.

bugswarm.org+3

### 2. Concurrency testing resources

|Resource|Purpose|Language applicability|
|---|---|---|
|Lincheck|Explore concurrent execution schedules|JVM, Java/Kotlin|
|jcstress|Test JVM concurrency and memory-model behavior|Java/JVM|
|DataRaceBench|Evaluate data-race detectors|OpenMP, C/C++ and Fortran|
|Java Pathfinder|Model-check Java programs|Java|

Two qualifications matter:

DataRaceBench is not a Java/Kotlin concurrency benchmark. It is based on OpenMP. It can provide methodological inspiration, but using it directly to establish Java analyzer effectiveness would be inappropriate.

GitHub

Lincheck and jcstress serve different purposes. Lincheck systematically explores concurrent scenarios, while jcstress is designed to investigate behaviors relevant to JVM concurrency correctness. They can complement each other in experimental settings.

Kotlin Documentation+1

### 3. Performance benchmarks and measurement tools

|Resource|Purpose|Research use|
|---|---|---|
|JMH|JVM microbenchmark measurement|Controlled method-level experiments|
|Renaissance|Modern JVM workloads|Application and runtime performance|
|DaCapo Chopin|Java application benchmark workloads|Performance comparisons|
|Android Macrobenchmark|End-user Android performance measurements|Application-level performance evaluation|

JMH is especially relevant when evaluating performance differences in concurrent data structures or algorithms. Its documentation emphasizes correct benchmark setup because executing benchmarks directly inside an ordinary development environment can produce less reliable measurements.

GitHub

### 4. Public program-analysis infrastructure

|Framework/tool|Research use|
|---|---|
|SootUp|Transforming and analyzing Java bytecode and Android APKs|
|Infer|Static analysis, including Java thread-safety checking|
|SpotBugs|Java static bug detection|
|PMD|Java static code analysis|
|SonarQube|Static analysis and code-quality findings|
|CodeQL|Program querying and security analysis|

SootUp is interesting because it provides a structured representation of Java bytecode and supports analysis of APKs. Its documentation describes translating input into an intermediate representation called Jimple.

Soot OSS

One technical consideration for Kotlin research: compiled Kotlin code may contain compiler-generated structures for coroutine execution. A bytecode-based analysis may therefore need additional interpretation to recover useful source-level coroutine semantics.

This is a technical consideration to investigate, not a claim that all bytecode analysis tools necessarily fail on Kotlin.

## A5. Experimental settings suitable for these resources

You have several possibilities that do not require paid APIs, respondents, or cloud GPUs.

|Experimental setting|Input|Independent variable|Dependent variables|
|---|---|---|---|
|Static analyzer evaluation|Java/Kotlin repositories with known defects|Tool, configuration, analyzer version|Precision, recall, F1|
|Concurrency detector evaluation|Controlled concurrent examples|Bug type, synchronization pattern|Detection rate, false positives|
|Schedule exploration|Concurrent JVM tests|Number of threads, schedule strategy|Failures discovered, execution time|
|Historical defect reproduction|Buggy and fixed commits|Execution environment, test strategy|Reproduction success|
|Static versus dynamic comparison|Identical programs|Analysis method|Defect coverage, time|
|Repository mining|Public Git repositories|Language, project type, defect category|Defect distributions|
|Performance experiments|Concurrent JVM programs|Thread count, synchronization strategy|Throughput, latency, scalability|
|Android experiments|APKs and reproducible bug reports|Lifecycle and execution scenarios|Failure reproduction, correctness|

### Recommended measurement categories

For detection experiments:

- Precision.
    
- Recall.
    
- F1 score.
    
- False-positive rate.
    
- False-negative rate.
    
- Defects detected per category.
    

For performance experiments:

- Throughput.
    
- Mean latency.
    
- Median latency.
    
- p95 and p99 latency.
    
- Scaling with thread count.
    
- Execution-time variability.
    

For analysis cost:

- Analysis time.
    
- Peak memory usage.
    
- Analysis failures.
    
- Number of warnings.
    
- Project size and complexity.
    

For reproducibility:

- Percentage of defects reproduced.
    
- Number of repeated executions.
    
- Time required to reproduce a defect.
    
- Stability of execution traces.
    

You should select metrics according to the research question, rather than measuring everything.

## A6. Practical constraints and feasibility

Your hardware is adequate for a focused experimental Master's thesis.

Available workstation

# 6

CPU cores — i5-10400F

# 32 GB

System RAM

# 12 GB

RTX 3060 VRAM

# 6 months

Project duration

Feasibility assessment

Public repository mining

Suitable

Small/medium Java static-analysis experiments

Suitable

Kotlin/JVM concurrency testing

Suitable

Controlled JVM benchmarks

Suitable

Small Android reproducibility experiments

Suitable

Exhaustive whole-program state-space exploration

Scope-sensitive

Large-scale analysis of thousands of applications

Resource-sensitive

The GPU is not a significant requirement for the research directions prioritized here. Most of the work is CPU-, memory-, and I/O-dependent.

Your six-month schedule also suggests avoiding experiments that depend on:

- Building a new general-purpose static analyzer from scratch.
    
- Collecting private enterprise data.
    
- Recruiting large numbers of developers.
    
- Reproducing hundreds of complicated Android environments.
    
- Exploring an unbounded concurrency state space.
    

A more manageable project would use existing tools, a defined set of repositories, controlled experiments, and a carefully constructed evaluation dataset.

# F. Search terms and literature-search strategy

The search strategy should combine three approaches:

1. Search for the core technical problem.
    
2. Search for particular languages and frameworks.
    
3. Search for empirical evaluations and known limitations.
    

Do not search only for proposed thesis ideas. Search for papers that investigate the underlying problems, even when they use different terminology.

## F1. High-priority search queries

These are ready to use in Google Scholar, ACM Digital Library, IEEE Xplore, Scopus, and Semantic Scholar.

### Static analysis and bug detection

```
"static analysis" AND "false positives" AND Java

"static code analysis" AND "false negatives"

"empirical evaluation" AND "static analyzers" AND Java

"static analysis" AND "historical bugs" AND software engineering

"interprocedural analysis" AND "bug detection" AND JVM

"alias analysis" AND "concurrency bug detection"
```

### Concurrency analysis

```
"concurrency bug detection" AND Java

"data race detection" AND JVM

"thread safety analysis" AND Java

"atomicity violation" AND concurrent programs

"deadlock detection" AND static analysis AND Java

"systematic concurrency testing" AND JVM

"model checking" AND concurrent Java programs
```

### Kotlin coroutines

```
"Kotlin coroutines" AND "concurrency bugs"

"Kotlin" AND "static analysis" AND coroutines

"Kotlin coroutines" AND cancellation AND bugs

"structured concurrency" AND software defects

"coroutine bug detection" AND Kotlin

"coroutine testing" AND "model checking"

"asynchronous program analysis" AND Kotlin
```

### Android

```
"Android concurrency bugs" AND static analysis

"Android lifecycle" AND coroutine bugs

"Android asynchronous programming" AND bug detection

"Android thread safety" AND static analysis

"Android bug reproduction" AND benchmark
```

### Evaluation methodology and datasets

```
"concurrency bug benchmark" AND Java

"real-world concurrency bugs" AND empirical study

"software bug benchmark" AND reproducibility

"static analysis warning suppression" AND Java

"static analyzer" AND "ground truth" AND evaluation

"concurrency bug reproduction" AND repository mining

"bug-inducing commits" AND concurrency
```

### Optimization and performance

```
"Java concurrency performance" AND static analysis

"lock contention detection" AND Java

"concurrent program optimization" AND JVM

"performance regression" AND concurrent Java programs

"JMH" AND concurrency AND scalability

"Kotlin coroutines" AND performance bottlenecks
```

## F2. Recommended research venues

These venues will give you a broader and more rigorous literature base than searching only for papers containing the exact phrase "static analysis."

|Venue|Main research focus|
|---|---|
|ICSE|Software engineering methods and tools|
|FSE|Empirical software engineering and analysis|
|ISSTA|Software testing and analysis|
|ASE|Automated software engineering|
|MSR|Mining software repositories|
|ECOOP|Object-oriented languages and software analysis|
|OOPSLA|Programming languages and software systems|
|PLDI|Programming languages and compiler research|
|POPL|Programming languages and formal methods|
|ICST|Software testing|
|TACAS|Formal methods and verification|

### Important search strategy

I recommend starting with 2024–2026 publications, then following the references backward to foundational work.

However, do not exclude older work. Much of the fundamental literature on abstract interpretation, race detection, model checking, and Java Memory Model semantics predates 2024.

Use backward and forward citation searching:

- Backward: Which foundational papers does a recent paper cite?
    
- Forward: Which later papers cite that paper?
    
- Replication: Have other researchers reproduced or challenged its findings?
    
- Artifacts: Is the dataset, benchmark, or implementation publicly available?
    

## F3. A useful search prioritization

Search query builder

Select a research area to copy its initial search query.

Kotlin coroutine bug detection

Kotlin coroutine concurrency bugs static analysis detection

Copy search query

## F4. Search coverage and evidence limitations

This report is a targeted landscape scan, not a systematic literature review.

Search period: Primarily 2024–2026, with older foundational resources included where necessary.

Sources consulted: Academic publication records and proceedings, Dagstuhl/DROPS, arXiv, university repositories, official project documentation, NIST, and open-source dataset repositories.

Evidence inspected: Publication abstracts, bibliographic records, official documentation, repository descriptions, and some accessible full-text material.

Limitations:

1. The search was not exhaustive across Scopus, Web of Science, or every relevant conference proceeding.
    
2. Some publications were assessed using abstracts or metadata rather than independently inspected full texts.
    
3. Benchmark availability and reproducibility have not been experimentally tested on your workstation.
    
4. Some current benchmark initiatives are still in development.
    
5. Kotlin-specific tool compatibility must be verified against actual source code and compiled artifacts.
    
6. Search results may not cover unpublished research, recent work not indexed by the searched systems, or industry-only datasets.
    

Therefore, the hypotheses in section E are preliminary opportunities, not confirmed novelty claims.

# G. Questions before topic selection

Your current profile is sufficient to establish the research landscape. I would not ask you to repeat the information already provided.

However, five decisions will materially affect which research opportunities are suitable.

## G1. Which concurrency area interests you most?

Java threads, synchronization, locks, and shared memory

Kotlin coroutines, cancellation, dispatchers, and structured concurrency

Android lifecycle and asynchronous execution

General concurrent algorithms and JVM concurrency

No preference yet

## G2. Which scientific contribution sounds most interesting?

Compare existing tools and evaluate their limitations

Develop and evaluate a better detection method

Investigate real defects in open-source repositories

Experiment with different concurrency testing techniques

Investigate correctness and performance trade-offs

## G3. How much implementation do you want?

Minimal — primarily experimental evaluation

Moderate — modify an existing tool or framework

Substantial — develop a new prototype

No preference

## G4. Which data source would you prefer?

Public repositories and real defects

Existing research benchmarks

Controlled synthetic concurrent programs

Combination of real defects and synthetic examples

No preference

## G5. Does your university expect a working software artifact?

A working software implementation is mandatory

A prototype is desirable but not mandatory

Experimental research and evaluation are sufficient

I need to check with my supervisor

Submit preferences

## Overall research-methodology assessment

Based on the evidence collected, I see three particularly promising research territories for further investigation.

|Research territory|Main scientific emphasis|Experimental feasibility|
|---|---|---|
|Static analysis of concurrency defects|Detection precision, missed defects, analysis limitations|High|
|Kotlin coroutine correctness|Language-specific defect patterns and detection coverage|High, subject to reproducible cases|
|Empirical evaluation of concurrency testing|Schedule exploration, reproducibility, and tool complementarity|High|

A further possibility is repository-based empirical research, particularly if you prefer understanding the causes and distributions of real defects over developing a new analyzer.

My methodological recommendation: prioritize a study where you can compare approaches against the same independently validated set of defects. This gives you a clearer scientific argument than simply implementing a tool and demonstrating that it works on a handful of examples.

### Selected academic and technical sources

These are verified starting points for a deeper literature review:

|Source|Year|Why it matters|
|---|---|---|
|Brockbernd et al., Understanding Concurrency Bugs in Real-World Programs with Kotlin Coroutines, ECOOP|2024|Directly relevant Kotlin concurrency study. [DOI](https://doi.org/10.4230/LIPIcs.ECOOP.2024.8?utm_source=chatgpt.com)|
|Cui et al., An Empirical Study of False Negatives and Positives of Static Code Analyzers From the Perspective of Historical Issues|2024|Analyzer reliability and metamorphic testing. [arXiv](https://arxiv.org/abs/2408.13855?utm_source=chatgpt.com)|
|Wickert et al., Supporting Error Chains in Static Analysis for Precise Evaluation Results and Enhanced Usability|2024|Analysis precision and warning usefulness. [arXiv](https://arxiv.org/abs/2403.07808?utm_source=chatgpt.com)|
|Chakraborty et al., How Hard Is Weak-Memory Testing?|2024|Formal foundations of concurrency testing. [DOI](https://doi.org/10.1145/3632908?utm_source=chatgpt.com)|
|Hu et al., An Empirical Study of Suppressed Static Analysis Warnings, FSE|2025|Static-analysis warning maintenance. [DOI](https://doi.org/10.1145/3715729?utm_source=chatgpt.com)|
|Golovin et al., RELINCHE: Automatically Checking Linearizability under Relaxed Memory Consistency, POPL|2025|Concurrent library verification. [DOI](https://doi.org/10.1145/3704906?utm_source=chatgpt.com)|
|OpenJDK jcstress|Current project documentation|JVM concurrency correctness experiments. [Project](https://openjdk.org/projects/code-tools/jcstress?utm_source=chatgpt.com)|
|Kotlin Lincheck|Current project documentation|Systematic JVM concurrency testing. [Documentation](https://kotlinlang.org/docs/lincheck-guide.html?utm_source=chatgpt.com)|

### Final observations

There are three things I would avoid at this stage:

1. Assuming that an existing tool's documented limitation is automatically a research gap. You need to measure its impact and establish that it matters.
    
2. Choosing a topic merely because it uses Kotlin or Java. The research question must be more specific than the technology.
    
3. Developing a complex new analyzer before establishing that existing approaches have a measurable limitation.
    

The next academic step should be research-gap validation, not thesis-title generation. In particular, G1, G2, G4, and G5 deserve closer examination, with G8 worth investigating as a possible dataset/benchmark contribution.

Final topic approval will still require a deeper literature review and discussion with your Master's supervisor.

For ongoing preparation, monthly monitoring of new Java/Kotlin concurrency and static-analysis papers could help keep the eventual literature review current.

# PROMPT 3

> DATE: 10.11.2026

```
My preferences before thesis topic selection:
1. Main concurrency area: General concurrency
2. Preferred contribution: Testing and model checking
3. Implementation level: Moderate — modify an existing tool or framework
4. Preferred data source: No preference
5. Software artifact requirement: A prototype is desirable but not mandatory
Use these preferences to prioritize and validate research-gap hypotheses. Do not assume a gap exists without additional evidence.
```

# ANSWER 3

## 1. Updated research profile

Your preferences significantly narrow the search space.

| Dimension         | Your preference            | Research implication                                                   |
| ----------------- | -------------------------- | ---------------------------------------------------------------------- |
| Concurrency       | General concurrency        | Avoid restricting the study to Kotlin coroutines or Android            |
| Research method   | Testing and model checking | Focus on schedule exploration, execution control, and bug reproduction |
| Implementation    | Moderate                   | Modify an existing testing framework                                   |
| Data              | No preference              | Select whichever public benchmark is most suitable                     |
| Software artifact | Optional                   | Empirical findings can be the primary contribution                     |

The best methodological fit is now:
$\text{Concurrent program} \rightarrow \text{Schedule exploration} \rightarrow \text{Failure detection} \rightarrow \text{Reproducible evidence}$

This changes the priority of the earlier ten hypotheses.

However, an important development in 2025–2026 makes it necessary to revise the previous assessment.

# 2. Important new evidence

## 2.1 Fray: a particularly important research development

[Fray Detects Concurrency Issues in JVM Languages - InfoQ](https://images.openai.com/static-rsc-4/MNNl7UvL5yMEzoA-DwD8133o6c31pdjBvXmwW9rDHKaubTSLhDhA8wXw0XoEb0Aiad20wcRje7rlpHRP208_0O8fyb8_QRHEypiL7hcyH3FMTGoKAr44134y32IoV924EiQd9D7d9vX2qG886JIjm3hFGOZMuKx_krRGZHM1eAk?purpose=inline)

Fray

OOPSLA 2025 · Carnegie Mellon University

[GitHub repository](https://github.com/cmu-pasta/fray?utm_source=chatgpt.com) · [Research paper](https://doi.org/10.1145/3764119?utm_source=chatgpt.com)

Fray is a general-purpose controlled concurrency testing platform for JVM programs.

Its main idea is to control thread interleavings without replacing the application's original concurrency primitives. It uses a mechanism called shadow locking.

The paper reports:

- Evaluation on 53 known-bug benchmark programs from SCTBench and JaConTeBe.
- Testing of approximately 2,664 real-world tests from Kafka, Lucene, and Guava.
- Discovery and reporting of 18 distinct real-world concurrency bugs, 16 of which were confirmed by developers at the time of publication.
- Support for randomized and more sophisticated schedule-search strategies, including PCT and POS.

These are substantial results. A project simply implementing a general-purpose JVM concurrency tester would overlap heavily with existing work.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://arxiv.org\&sz=32)

arXiv+1

There are also documented limitations:

1. Fray assumes data-race-free programs.
2. It cannot interleave multiple logical Kotlin coroutines running on a single user-space thread.
3. Timed waits and sleep operations can generate schedules that are valid according to Java semantics but highly improbable in practical executions.

The authors explicitly discuss the last problem as an area for future improvement.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://arxiv.org\&sz=32)

arXiv+1

Why this matters: Fray provides an existing research-grade platform on which you could conduct experiments without implementing concurrency control from scratch.

## 2.2 Lincheck has changed considerably

[GitHub - JetBrains/lincheck: Framework for testing concurrent code on JVM languages · GitHub](https://images.openai.com/static-rsc-4/M3SAhqL-gjw1lAa8VWZrpqJ7KqjQxqu29H7kS_Vd-tBooYPtnxVq7pdRMiiGGM4HyP2y97_JwX-BpXdDnWMaoqTu742lrQiebXhu6xiwGJq0INMZjPDqmGmeNr3RXkikiXAMMlAyNtB0zWrOmcyrhY5GUY8rzvin03jXbatcVZE?purpose=inline)

Lincheck

JetBrains · CAV 2023, subsequent major update in 2026

[GitHub repository](https://github.com/JetBrains/lincheck?utm_source=chatgpt.com) · [Official documentation](https://kotlinlang.org/docs/lincheck-guide.html?utm_source=chatgpt.com)

This is a particularly important update.

The original Lincheck publication concentrated on concurrent data structures. The Fray paper consequently treated Lincheck as a specialized tool and compared it with Fray primarily on data-structure tests.

However, Lincheck 3.0 introduced general-purpose model checking.

The current repository documentation advertises version 3.7, and its `runConcurrentTest()` API supports arbitrary concurrent code. The official documentation describes model checking that explores possible execution schedules and generates reproducible traces when errors are found.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub+2

This produces an important research opportunity:

The Lincheck version evaluated in the Fray paper is not an adequate substitute for evaluating the current general-purpose Lincheck implementation.

That does not automatically establish a research gap, but it provides a concrete reason to revisit the comparison.

## 2.3 Feedback-guided adaptive scheduling

Another important development is Feedback-guided Adaptive Testing of Distributed Systems Designs, published at USENIX NSDI 2026.

The paper introduces Fest, which uses feedback about previously explored behavior to guide the generation of subsequent execution schedules.

Its evaluation used 94 distributed-system model configurations and reported improvements in behavioral coverage and bug discovery compared with existing schedule-sampling approaches. These results concern models implemented using the P framework, not ordinary JVM application tests.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://www.usenix.org\&sz=32)

Usenix

Connection to Fray

The current Fray documentation also describes a Fest scheduler that uses feedback-guided adaptive scheduling.

It exposes two timeline-coverage approaches:

- Resource ordering: tracks the order in which threads access shared resources.
- Thread ordering: tracks ordering relationships between operations within individual threads.

The documentation characterizes timeline coverage as an approximate indicator of testing progress, not a guarantee that different behaviors or defects have been found. It also notes that thread-ordering coverage has higher overhead.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub+1

This creates an especially interesting intersection:

\\[ \text{Feedback-guided scheduling} + \text{JVM concurrency} + \text{Coverage measurement} \\]

It is more specific than simply experimenting with different schedule-search algorithms.

# 3. Reprioritization of the original ten hypotheses

Here is how I would change the earlier ranking.

| Original hypothesis                                | New priority | Reason                                                             |
| -------------------------------------------------- | ------------ | ------------------------------------------------------------------ |
| G1. Kotlin coroutine detector coverage             | Low          | Too language-specific for your current preference                  |
| G2. Generalizability of Kotlin bug classifications | Low          | Same issue                                                         |
| G3. Coroutine cancellation defects                 | Low          | Specific asynchronous-programming semantics                        |
| G4. Static/dynamic analysis complementarity        | Medium       | Reframe around current concurrency-testing frameworks              |
| G5. Aliasing and object escape                     | Low          | Primarily a static-analysis investigation                          |
| G6. False positives in concurrency analyzers       | Low          | Less aligned with model checking                                   |
| G7. Warning suppression                            | Low          | A different empirical research direction                           |
| G8. Concurrency benchmark coverage                 | Medium       | Existing Java benchmarks make a broad benchmark-absence claim weak |
| G9. Android dataset suitability                    | Very low     | Not aligned with general concurrency                               |
| G10. Correctness/performance optimization          | Low–medium   | Testing is more central to your preferences                        |

Two important conclusions follow.

First: I would reject the broad hypothesis that existing Java concurrency benchmarks are insufficient simply because few were found. SCTBench, JaConTeBe, and the Fray artifact already provide evaluation resources.

Second: I would replace the broad static-versus-dynamic comparison with research on the effectiveness and limitations of contemporary controlled-concurrency testing frameworks.

# 4. Three highest-priority research-gap hypotheses

These are research directions, not proposed thesis titles.

## Priority 1 — Validity of coverage-guided schedule exploration in JVM testing

Best alignment with your preferences

Hypothesis H11

The coverage feedback used by Fray's adaptive scheduling may not reliably represent the ability of a schedule-search strategy to discover new concurrency defects in real JVM applications.

### Evidence supporting this hypothesis

There are three relevant observations:

1. NSDI 2026 demonstrates the potential of feedback-guided schedule generation in formal distributed-system models.
2. Fray has incorporated a Fest scheduler and timeline-coverage mechanisms.
3. Fray's documentation explicitly describes coverage as an approximate progress indicator.

These observations establish a reason to investigate the relationship between measured coverage and actual defect discovery. They do not establish that the feedback is inadequate.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://www.usenix.org\&sz=32)

Usenix+1

### What would verify the hypothesis?

Run controlled experiments with different schedule-search configurations.

| Independent variable  | Possible experimental values       |
| --------------------- | ---------------------------------- |
| Scheduler             | Random, PCT, POS, Fest             |
| Feedback metric       | Resource ordering, thread ordering |
| Search budget         | Fixed execution time               |
| Number of repetitions | Multiple random seeds              |
| Target program        | Known-bug JVM tests                |

Measure:

- Number of distinct known defects discovered.
- Time to first failure.
- Number of reproducible failures.
- Unique schedules or coverage fingerprints.
- Executions per second.
- Runtime overhead.

One particularly important methodological issue: do not compare raw coverage counts between resource-ordering and thread-ordering modes as though they measure the same thing. Evaluate their ability to predict independent outcomes, such as defect discovery, instead.

### Potential contribution

An empirical assessment of whether coverage feedback actually improves bug discovery in JVM concurrency testing, which coverage representation works best, and what performance cost it introduces.

### Evidence status

Inferred research opportunity

The individual techniques exist. The specific validity and effectiveness of their use in current JVM application testing need further verification.

Feasibility: High, provided the Fray benchmark and scheduler configuration work in your environment.

## Priority 2 — Comparative effectiveness of Fray and modern Lincheck

Strong empirical opportunity

Hypothesis H12

The effectiveness, scalability, and defect coverage of Fray and current Lincheck may differ substantially when applied to the same general-purpose JVM concurrency tests.

### Evidence supporting this hypothesis

Fray's OOPSLA paper compares different concurrency-testing approaches and includes an evaluation against Lincheck on concurrent data structures.

But this comparison predates Lincheck's transition to general-purpose model checking.

Current Lincheck supports arbitrary concurrent code through `runConcurrentTest()`. A JavaZone 2026 presentation also discusses comparing Lincheck and Fray, demonstrating current practitioner interest, although a presentation does not substitute for a controlled academic evaluation.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://rohan.padhye.org\&sz=32)

rohan.padhye.org+2

### What would verify the hypothesis?

Use an identical collection of bug reproductions and test oracles.

Compare:

| Evaluation dimension             | Fray    | Lincheck |
| -------------------------------- | ------- | -------- |
| Bug detection                    | Measure | Measure  |
| Deadlock detection               | Measure | Measure  |
| Assertion violations             | Measure | Measure  |
| Reproducibility                  | Measure | Measure  |
| Time to failure                  | Measure | Measure  |
| Execution throughput             | Measure | Measure  |
| Compatibility with real projects | Measure | Measure  |

A conventional stress-testing baseline could also be included.

A reasonable initial scope would be 15–25 reproducible Java concurrency bugs, selected after a feasibility pilot. The Fray artifact repository is publicly available and intended to reproduce the paper's evaluation.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

cmu-pasta/fray-benchmark · GitHub

### Important methodological issue

The tools have different execution mechanisms and assumptions. Fray assumes data-race-free programs. Their detection coverage must therefore be compared only on a clearly defined common subset.

You should not claim that one tool is universally superior based on a small benchmark.

### Potential contribution

An updated, reproducible empirical evaluation of contemporary JVM concurrency-testing tools, including a characterization of which defect types each tool detects and misses.

### Evidence status

Plausible, requires literature verification

The functionality change in Lincheck is verified. Whether an independent peer-reviewed comparison of the updated frameworks has already been published needs a more systematic search.

Feasibility: High to medium. The main challenge is adapting common tests to both frameworks.

## Priority 3 — Distinguishing practically significant failures from timer-induced schedules

Strong narrowly scoped opportunity

Hypothesis H13

Some failures discovered through controlled concurrency testing may be theoretically valid but practically improbable because of interactions involving timed waits, sleeps, or wall-clock timeouts.

### Evidence supporting this hypothesis

This issue is explicitly acknowledged in the Fray paper.

For example, a thread waiting with a timeout may be scheduled to resume before another thread has made progress. Such a schedule may be allowed by Java semantics even though developers may consider it unlikely in ordinary execution.

The authors discuss statistical methods and user-configurable suppression as possible future improvements.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://arxiv.org\&sz=32)

arXiv

### What would verify the hypothesis?

1. Collect failing executions involving time-based waits.
2. Classify failures by their dependence on wall-clock behavior.
3. Reproduce each failure using recorded schedules.
4. Examine whether the failure remains under repeated realistic execution conditions.
5. Develop a small filtering or prioritization mechanism.
6. Measure how many low-plausibility reports are reduced and how many genuine defects are retained.

### Potential contribution

An experimental evaluation and modest extension of an existing scheduler to improve the prioritization of actionable concurrency failures.

### Evidence status

Directly documented limitation

However, the significance of the problem and effectiveness of a proposed solution still need empirical validation.

Feasibility: Medium–high. The classification and evaluation are manageable, but accurately distinguishing improbable schedules from meaningful defects is difficult.

# 5. Comparative prioritization

Here is my overall assessment based on your stated preferences.

Scores are qualitative prioritization scores, not validated thesis-topic scores.

H11. Coverage-guided scheduling

1st

# 4.6/5

Research alignment: Excellent · Prototype: Moderate · Data: Public

Strong connection to current research and measurable schedule exploration behavior.

H12. Fray versus modern Lincheck

2nd

# 4.4/5

Research alignment: Excellent · Prototype: Moderate · Data: Public

Very clear experimental design, although novelty rests on an updated comparison and defensible analytical contribution.

H13. Timer-induced failure triage

3rd

# 4.1/5

Research alignment: Very good · Prototype: Moderate · Data: Public, subject to classification

Strongly motivated by a documented limitation, but defining a reliable measure of practical significance is challenging.

These numbers express my preliminary judgment, not statistical evidence of novelty.

## Comparison across research criteria

| Criterion                         | H11 | H12 | H13 |
| --------------------------------- | --- | --- | --- |
| Alignment with interests          | 5   | 5   | 4   |
| Research-gap support              | 4   | 4   | 5   |
| Scientific contribution potential | 5   | 4   | 4   |
| Feasibility                       | 4   | 4   | 4   |
| Data availability                 | 5   | 5   | 4   |
| Methodological clarity            | 4   | 5   | 3   |
| Implementation fit                | 5   | 4   | 4   |
| Scope control                     | 4   | 5   | 4   |

No hard blocker is established yet. The main risks are benchmark reproducibility, equivalent test harnesses, and tool compatibility.

# 6. Practical feasibility on your workstation

Your i5-10400F, 32 GB RAM, and RTX 3060 are sufficient for all three directions.

The GPU is not needed.

Most relevant existing infrastructure

Fray

Open source

Scheduler modification, coverage collection, reproducible execution.

[Fray source code](https://github.com/cmu-pasta/fray?utm_source=chatgpt.com)

Lincheck

Open source

Alternative schedule exploration and model checking.

[Lincheck source code](https://github.com/JetBrains/lincheck?utm_source=chatgpt.com)

Fray artifact evaluation

Public

Existing reproducibility infrastructure.

[Benchmark artifacts](https://github.com/cmu-pasta/fray-benchmark?utm_source=chatgpt.com)

The Fray project currently advertises native agents for Windows x86-64 and Linux x86-64, among other platforms, and publishes Gradle/Maven integrations. Check the native-agent requirements against your actual operating system before committing to it.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub

### Suggested feasibility boundaries

For a six-month project, I would recommend:

- One primary JVM testing framework to modify or investigate.
- One secondary framework as a comparison, if appropriate.
- A small, manually validated collection of real concurrency defects.
- A limited number of experimental configurations.
- Repeated experiments with fixed time budgets and random seeds.
- An automated script for collecting and analyzing results.

Do not attempt to reproduce the full 2,664-test Fray evaluation during the initial phase.

# 7. What evidence is still missing?

Before considering any of these opportunities sufficiently validated, I would require the following.

| Validation requirement                         | H11      | H12      | H13      |
| ---------------------------------------------- | -------- | -------- | -------- |
| Identify closest existing academic work        | Required | Required | Required |
| Verify whether later experiments already exist | Required | Critical | Required |
| Check framework version and compatibility      | Critical | Critical | Critical |
| Identify reproducible benchmark cases          | Critical | Critical | Critical |
| Define independent variables and outcomes      | Critical | Critical | Critical |
| Validate experimental ground truth             | Required | Critical | Critical |
| Check feasibility of a modest modification     | Critical | Required | Required |

### Search queries for the next literature-review round

```
"Fray" "timeline coverage" concurrency testing

"Fray" "FestScheduler" JVM concurrency

"coverage-guided" schedule exploration JVM

"adaptive concurrency testing" Java model checking

"Lincheck 3.0" "Fray" comparison

"Fray" "Lincheck" concurrent testing empirical evaluation

"timed waits" "controlled concurrency testing"

"schedule exploration" bug detection coverage correlation
```

Search coverage: This validation used current publication records, the Fray OOPSLA paper and extended version, official Fray and Lincheck documentation and repositories, and the NSDI 2026 Fest publication. It also checked for direct current-tool comparison discussions. This was a focused search, not a systematic review of every publication through November 2026. The absence of an identified follow-up paper is not proof that one does not exist.

# 8. Recommended next step: a feasibility pilot

I would not generate thesis titles yet.

The most useful next experiment is a small pilot that determines whether H11 and H12 can actually be investigated with the current tools.

A practical pilot would have four stages:

1. Reproduce a few known concurrency defects using Fray.
2. Reproduce the same defects using Lincheck 3.7 where equivalent test harnesses are possible.
3. Run Fray with its standard and feedback-guided scheduling configurations.
4. Compare which defects are found, how quickly they are found, and whether execution traces reproduce reliably.

Pilot acceptance criteria

0/5 verified

0%

Both tools build and run on the available workstation.

At least five representative real or benchmark defects have reproducible ground truth.

Equivalent test oracles can be implemented for both frameworks.

Scheduler configurations produce measurable and repeatable differences.

Results can be collected automatically without excessive manual work.

If both frameworks work and the pilot produces useful differences, H12 becomes more defensible. If the coverage feedback produces measurable behavior that is not explained by raw execution counts, H11 becomes particularly attractive.

If neither condition is met, you will have learned that before investing months in the wrong research direction.

## Final verdict

Promising research area — proceed to feasibility validation

Your best research territory is now experimental evaluation and improvement of controlled concurrency testing for JVM programs.

The strongest opportunities are not inventing another general-purpose model checker, but investigating:

- How well adaptive schedule exploration works on real concurrent programs.
- How contemporary JVM testing frameworks differ in their defect-detection capabilities.
- How to distinguish useful concurrency failures from misleading or low-value schedule-induced failures.

These directions provide a plausible scientific contribution, use existing research infrastructure, fit your resources, and leave room for a moderate software artifact.

Final novelty approval still requires a deeper literature review and discussion with your supervisor.

A useful ongoing support step would be a monthly digest tracking new work on JVM model checking, Fray, Lincheck, and concurrency-testing benchmarks.

📚Monitor JVM concurrency research monthlyТоркніться, щоб налаштувати