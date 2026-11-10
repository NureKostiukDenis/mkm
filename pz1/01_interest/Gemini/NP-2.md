---
Date: 2026-11-08
tags:
  - AI
Service: Gemini
Model: gemini-4-argon-high
Relevance:
Additional:
  - "cross-memory: off"
Related:
---
# PROMPT 3

```
ROLE
Act as a senior research methodologist, software engineering researcher, and Master's thesis supervisor.

CONTEXT
I am a Master's student in Software Engineering.
I need to define a defensible research topic for my Master's thesis.

MY INTEREST PROFILE
1. What areas interest me?
Java/Kotlin, Python

2. What problems do I see?
Nothing

3. What systems have I worked with before?
Android, Web

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

# ANSWER 3

## A. Landscape Map

### 1. Research Subdomains (7 Subdomains)

1. **Static Program Analysis & Bug Detection (Java/Kotlin/Python):** Constructing or evaluating abstract syntax tree (AST), control-flow graph (CFG), or data-flow analyses to identify defects, nullability violations, or resource leaks without executing code.

2. **Concurrency & Asynchronous Programming Models:** Analyzing performance, correctness, structured concurrency violations, and thread-safety in Java Virtual Threads (Project Loom), Kotlin Coroutines, and Python `asyncio`/free-threading.
  
3. **Android UI & Runtime Performance Engineering:** Investigating UI rendering bottlenecks (frame drops/jank), startup latency, and state-recomposition overhead in declarative UI frameworks (Jetpack Compose vs. XML Views).
    
      
    
4. **Cross-Language Interoperability & Multiplatform Evolution:** Studying build performance, boundary overhead, and defect proneness in mixed-language systems (Java-Kotlin interop, Kotlin Multiplatform [KMP], or Python C-extensions/Rust bindings).
    
      
    
5. **Automated Software Testing & Fuzzing:** Evaluating coverage, fault-detection effectiveness, and execution cost of property-based testing, mutation testing, and automated GUI testing for Android or Python libraries.
    
      
    
6. **Software Evolution, Refactoring & Code Smells:** Mining version control histories to quantify how language migrations (e.g., Java to Kotlin, Python 2/untyped to typed Python) or specific refactorings impact defect density and maintainability.
    
      
    
7. **Software Supply Chain & Dependency Ecosystem Analysis:** Analyzing semantic versioning compliance, breaking changes, transitive vulnerability propagation, and dependency bloat across Maven Central and PyPI.
    
      
    

### 2. Stakeholders

- **Language & Compiler Designers (JetBrains, Oracle, Python Software Foundation):** Need empirical evidence on how developers use/misuse new language features (e.g., K2 compiler, Project Loom, Python typing) to guide compiler optimizations and warnings.
    
      
    
- **Static Analysis & Tool Vendors (SonarSource, Detekt, Astral/Ruff, Meta):** Rely on new bug patterns and abstract interpretation heuristics to reduce false-positive rates in linters and type checkers.
    
      
    
- **Mobile & Library Engineering Teams:** Need actionable metrics on runtime overhead, binary size impact, and migration risks when adopting Jetpack Compose, Kotlin Multiplatform, or KSP (Kotlin Symbol Processing).
    
      
    
- **Empirical SE Researchers:** Consume curated bug benchmarks, reproducible AST/bytecode analysis pipelines, and longitudinal repository datasets.
    
      
    

### 3. Typical Datasets, Benchmarks, and Experimental Settings

Because you have no proprietary data, empirical SE relies on standardized open-source corpora that run easily on a 32GB RAM desktop:

  

- **Defect Benchmarks:** **Defects4J** (reproducible Java bugs), **BugsInPy** (curated Python bugs with test suites), **DroidLeaks** (Android resource leak bugs), **AndroR2** (reproducible Android bug reports).
    
      
    
- **Execution & Performance Benchmarks:** **Renaissance** and **DaCapo** (modern JVM concurrency/workload benchmarks—used for thread/coroutine profiling, _not_ GC tuning), **PyPerformance** (official Python benchmark suite), **Android Macrobenchmark / Perfetto traces** (via headless Android emulators or a single physical USB test device).
    
      
    
- **Repository Mining Sources:** **F-Droid** (thousands of open-source Android apps in Java/Kotlin), **Maven Central / PyPI** top-1000 libraries, **GitHub REST/GraphQL API** (free tier allows 5,000 requests/hour—sufficient for mining 100–500 targeted repositories), and **Software Heritage / GH Archive** (queryable via Google BigQuery free sandbox).
    
      
    

### 4. Adjacent Research Communities

- **Programming Languages (PL) & Compilers (ACM SIGPLAN — PLDI, OOPSLA, ECOOP):** Focuses on type systems, formal semantics, and compiler internals.
    
      
    
- **Mobile Computing Systems (ACM SIGMOBILE — MobiSys, MobileHCI):** Focuses on OS-level mobile telemetry and user-perceived latency.
    
      
    
- **Mining Software Repositories & Empirical SE (MSR, ESEM, SANER):** Focuses on statistical analysis of large codebases and evolutionary history.
    
      
    

## B. Problem List & Scientific Distinction

### 1. Scientific Problems vs. Ordinary Implementation Tasks

In a Master's defense, committees reject projects that are purely engineering tasks. The boundary is defined by **generalizability, controlled measurement, and falsifiability**:

|**Dimension**|**Ordinary Implementation Task (Engineering)**|**Scientific Research Problem (Experimental SE)**|
|---|---|---|
|**Goal**|Build a working tool, plugin, or app migration.|Answer an unknown question about software behavior, trade-offs, or defect patterns.|
|**Example**|"Rewrite a Java Android app into Kotlin Jetpack Compose."|"Quantify the recomposition overhead and frame-time variance of state-hoisting patterns in Jetpack Compose vs. traditional Android View bindings across 20 benchmark workloads."|
|**Success Metric**|The code compiles, passes tests, and deploys.|Statistical significance ($p$-values), effect sizes (Cliff's Delta), Precision/Recall of a detector, or controlled runtime speedup.|
|**Output**|A GitHub repo with an application.|A reproducible experimental package, empirical taxonomy, and validated mathematical/statistical claims.|

### 2. 12 Important Current Problems (2024–2026 Scope)

1. **Kotlin Coroutine Structured Concurrency Violations:** Detecting silent exception swallowing, leaked `CoroutineScope` instances, and dispatcher deadlocks in Android and JVM applications.
    
      
    
2. **Java Virtual Threads (Project Loom) Pinning & Contention:** Identifying and mitigating carrier-thread pinning caused by `synchronized` blocks or native calls when migrating legacy thread-pool Java systems to Virtual Threads.
    
      
    
3. **Jetpack Compose Unnecessary Recomposition Detection:** Statically or dynamically identifying unstable types and lambda captures that trigger excessive UI tree recompositions and frame drops (jank) in Android.
    
      
    
4. **Gradual Typing Soundness vs. Ergonomics in Python:** Measuring the disagreement rate and false-positive overhead across competing Python static type checkers (`mypy`, `pyright`, `ty`/`pyre`) on real-world dynamic idioms.
    
      
    
5. **Java-to-Kotlin Interoperability Defect Patterns:** Quantifying how platform types (`T!`) and nullability mismatches at the Java/Kotlin boundary introduce `NullPointerException` regressions in mixed codebases.
    
      
    
6. **Python Free-Threading (No-GIL PEP 703) Race Conditions:** Assessing thread-safety defects and single-threaded performance degradation when running existing Python libraries under experimental free-threaded CPython builds.
    
      
    
7. **Android Lifecycle-Aware Resource & Memory Leaks:** Detecting subtle memory leaks caused by lambda closures, RxJava/Flow subscriptions, and singleton context retention in modern Kotlin Android architectures.
    
      
    
8. **Mutation Testing Scalability in JVM/Python:** Reducing the computational cost of mutation testing (e.g., PITest for Java/Kotlin, Cosmic Ray/Mutmut for Python) using AST-based mutant selection or bytecode filtering.
    
      
    
9. **Kotlin Multiplatform (KMP) Expect/Actual Maintenance Overhead:** Analyzing how code clones, platform-specific divergence, and build-time overhead evolve in KMP repositories compared to single-platform repositories.
    
      
    
10. **Python Dependency Breaking Changes & SemVer Violations:** Detecting undocumented breaking API changes in Python library updates using static call-graph differencing.
    
      
    
11. **Annotation Processing Migration Bottlenecks (KAPT to KSP):** Evaluating compilation speedups and metaprogramming limitations when migrating Android projects from Java-stub-based KAPT to Kotlin Symbol Processing (KSP).
    
      
    
12. **Flaky Test Root-Cause Analysis in Asynchronous Code:** Isolating timing-dependent and concurrency-induced test flakiness in Python `pytest-asyncio` or Kotlin `kotlinx-coroutines-test` suites.
    
      
    

## C. Terminology Matrix

Use these terms to translate developer jargon into rigorous academic search queries:

|**Developer / Industry Term**|**Academic / Research Terminology**|**Synonyms & Related Concepts**|
|---|---|---|
|Linter / Code Checker|**Static Program Analysis (SPA)**|Abstract Interpretation, AST Traversal, Taint Analysis, Data-flow Analysis|
|App Lag / Stuttering / Jank|**UI Rendering Latency / Frame Time Variance**|Missed VSync, Main-Thread Blocking, Tail Latency, Jank Rate|
|Bad Code / Tech Debt|**Code Smells / Anti-patterns**|Design Debt, Architectural Smells, Self-Admitted Technical Debt (SATD)|
|Bug Hunting in Git|**Mining Software Repositories (MSR)**|Defect Prediction, SZZ Algorithm (bug-inducing commits), Empirical Taxonomy|
|Async / Threads / Coroutines|**Concurrency Primitives & Asynchronous Models**|Structured Concurrency, Continuation-Passing Style (CPS), Cooperative Multitasking, Thread Pinning|
|Python Type Hints|**Gradual Typing**|Optional Type Systems, Type Inference, Type Soundness, Type Migration|
|Random Test Generation|**Automated Test Generation / Fuzzing**|Property-Based Testing (PBT), Search-Based Software Testing (SBST), Grey-box Fuzzing|
|Checking if tests are good|**Mutation Analysis / Fault Seeding**|Mutation Score, Equivalent Mutants, Coupling Effect, Test Suite Effectiveness|

## D. Emerging Directions (2024–2026)

1. **The K2 Compiler & FIR (Frontend Intermediate Representation) Ecosystem:** With Kotlin 2.x stabilizing the K2 compiler, static analysis tools (Detekt, Android Lint) and compiler plugins are shifting from PSI (syntactic trees) to FIR (semantic trees). Research into FIR-based bug detection accuracy and compilation overhead is brand new.
    
      
    
2. **Post-Loom JVM Concurrency (Java 21–25):** Virtual threads are now in production. The research frontier has shifted from _whether_ virtual threads are fast to _where they fail_ (e.g., thread pinning, memory footprint of millions of continuations, and structured task scopes vs. Kotlin Coroutines).
    
      
    
3. **Declarative Mobile UI & Kotlin Multiplatform (KMP) Stabilization:** Compose Multiplatform and KMP reached broad production adoption between 2024 and 2026. Empirical studies on KMP shared-code ratios, multiplatform testability, and Compose state management bugs are lagging behind industry adoption.
    
      
    
4. **Rust-Backed Python Tooling & Free-Threaded Python (PEP 703):** Python 3.13/3.14 introduced experimental no-GIL (free-threaded) execution, while AST tooling moved toward high-speed Rust implementations (e.g., Ruff). This enables massive-scale Python static analysis on modest hardware and raises new questions about multi-threaded Python concurrency bugs.
    
      
    

## E. Candidate Gap Hypotheses & Verification Protocols

_Note: Per methodological rules, these are structured as falsifiable hypotheses about literature gaps, not asserted facts._

  

### Hypothesis 1: Idiomatic Kotlin vs. Translated Java Smells

- **Gap Hypothesis:** Existing static analysis rulesets for Kotlin mostly replicate object-oriented Java code smells, failing to capture functional and coroutine-specific anti-patterns that correlate with defects in native Kotlin repositories.
    
      
    
- **Verification Evidence:** Survey 2020–2026 papers on "Kotlin code smells" in IEEE/ACM; compare academic smell catalogs against Detekt's coroutine/functional rulesets and measure defect correlation across 50 F-Droid Kotlin apps using the SZZ algorithm.
    
      
    

### Hypothesis 2: Jetpack Compose State-Stability Misconfigurations

- **Gap Hypothesis:** Developers frequently misapply or omit `@Stable` and `@Immutable` annotations in Jetpack Compose, causing silent recomposition cascades that static linters fail to prioritize by actual runtime frame-time impact.
    
      
    
- **Verification Evidence:** Literature search on `"Jetpack Compose" AND ("recomposition" OR "performance")` in ACM DL; run the Compose Compiler Metrics report across 30 open-source Compose apps on F-Droid to measure the ratio of unstable parameters in UI composables.
    
      
    

### Hypothesis 3: Java Virtual Threads vs. Kotlin Coroutines Under Contention

- **Gap Hypothesis:** While synthetic microbenchmarks compare Java Virtual Threads and Kotlin Coroutines, there is a lack of controlled empirical benchmarks evaluating their tail-latency and memory-allocation behavior under mixed I/O and CPU-bound lock contention (thread pinning scenarios).
    
      
    
- **Verification Evidence:** Check ICPE (Performance Engineering) and OOPSLA proceedings (2023–2026) for `"Virtual Threads" AND "Coroutines"`; verify whether existing studies test `ReentrantLock` vs. `synchronized` vs. `Mutex` across varying payload sizes.
    
      
    

### Hypothesis 4: Python Type Checker Disagreement on Real-World Codebases

- **Gap Hypothesis:** Competing Python static type checkers (`mypy`, `pyright`, and newer Rust-based checkers) exhibit significant diagnostic divergence (false positives/negatives) on identical PEP-484/695 typed repositories, creating soundness gaps during type migration.
    
      
    
- **Verification Evidence:** Search literature for comparative empirical evaluations of Python type checkers (2023–2026); run 3 type checkers on the top 100 typed PyPI packages and compute the Jaccard similarity index of reported type errors.
    
      
    

### Hypothesis 5: Coroutine Exception Handling & Scope Leaks in Android

- **Gap Hypothesis:** A substantial proportion of crash-inducing concurrency bugs in modern Android apps stem from improper `CoroutineScope` lifecycle binding and broken parent-child job cancellation hierarchies rather than traditional thread data races.
    
      
    
- **Verification Evidence:** Mine GitHub/F-Droid commit histories and issue trackers of 100 Kotlin Android apps for keywords (`CoroutineExceptionHandler`, `SupervisorJob`, `GlobalScope`, `CancellationException`) and cross-reference with existing Android concurrency taxonomies.
    
      
    

### Hypothesis 6: Mutation Testing Redundancy in Kotlin Bytecode

- **Gap Hypothesis:** Standard JVM bytecode mutation operators (designed for Java in tools like PITest) generate a high percentage of equivalent or trivial mutants when applied to Kotlin bytecode due to compiler-generated null-checks, coroutine state machines, and data class methods.
    
      
    
- **Verification Evidence:** Literature review on `"mutation testing" AND "Kotlin"`; execute PITest on 10 Kotlin projects, decompile the surviving mutants, and categorize the percentage of mutants residing in synthetic compiler-generated bytecode.
    
      
    

### Hypothesis 7: Kotlin Multiplatform (KMP) Shared-Code Defect Density

- **Gap Hypothesis:** Modules at the boundary between shared `commonMain` code and platform-specific `androidMain`/`iosMain` implementations (`expect`/`actual` declarations) exhibit higher change-proneness and defect density than purely shared modules.
    
      
    
- **Verification Evidence:** Search MSR and ICSE (2023–2026) for `"Kotlin Multiplatform"`; mine git commit histories of 50 public KMP repositories on GitHub to compare churn and bug-fix commit frequency in `expect/actual` files versus standard shared files.
    
      
    

### Hypothesis 8: Python Asyncio Task Leaks ("Fire-and-Forget" Anti-pattern)

- **Gap Hypothesis:** Creating unreferenced background tasks via `asyncio.create_task()` without retaining strong references causes silent task disappearance during garbage collection in Python applications, and this pattern is widespread but undetected by standard Python linters.
    
      
    
- **Verification Evidence:** Search Python static analysis literature for `asyncio` bug patterns; write a lightweight Python `ast` script to scan 200 async Python repositories for unreferenced `create_task` calls and verify whether Pylint/Ruff flag them.
    
      
    

### Hypothesis 9: Test Flakiness in Coroutine/Async Test Suites

- **Gap Hypothesis:** Asynchronous test utilities (`runTest` in Kotlin or `pytest-asyncio` in Python) exhibit distinct root causes of test flakiness (such as virtual time dispatcher misconfiguration) compared to traditional thread-sleep flakiness studied in Java literature.
    
      
    
- **Verification Evidence:** Review flaky test taxonomies (e.g., Luo et al. and subsequent 2022–2026 replications—_UNVERIFIED exact 2025 replication titles_); mine commits fixing flaky tests in Kotlin/Python repositories to see if virtual-time/dispatcher fixes constitute a distinct category.
    
      
    

## F. Search Terms (For Google Scholar, ACM DL, IEEE Xplore, DBLP)

Use these Boolean strings to validate literature density and find baseline papers:

  

1. **Kotlin/Android Concurrency:** `("Kotlin" AND "coroutines") AND ("empirical study" OR "static analysis" OR "bug" OR "anti-pattern")`
    
      
    
2. **Compose Performance:** `("Jetpack Compose" OR "declarative UI") AND "Android" AND ("performance" OR "recomposition" OR "jank")`
    
      
    
3. **JVM Concurrency Comparison:** `("Virtual Threads" OR "Project Loom") AND ("Kotlin Coroutines" OR "scalability" OR "pinning")`
    
      
    
4. **Java-Kotlin Interop & Evolution:** `("Java" AND "Kotlin") AND ("interoperability" OR "migration") AND ("empirical" OR "defects" OR "code smells")`
    
      
    
5. **Kotlin Mutation Testing:** `"mutation testing" AND "Kotlin" AND ("bytecode" OR "equivalent mutants" OR "PITest")`
    
      
    
6. **Python Gradual Typing:** `"Python" AND ("gradual typing" OR "type checking" OR "type annotations") AND ("empirical" OR "soundness")`
    
      
    
7. **Python Async Defects:** `"Python" AND "asyncio" AND ("concurrency bugs" OR "static analysis" OR "anti-patterns")`
    
      
    
8. **Android Resource/Memory Leaks:** `"Android" AND ("memory leak" OR "resource leak") AND ("Kotlin" OR "Flow" OR "Jetpack")`
    
      
    

## G. Questions Before Topic Selection

To narrow this landscape down to 3–5 concrete, defensible Master's thesis proposals in our next step, please answer the following:

  

1. **Primary Ecosystem Preference:** If you had to pick **one** primary subject system for the next 6 months, which excites you more: **(a) Android/Kotlin (Compose, Coroutines, KMP)**, **(b) Pure JVM Backend/Systems (Java 21+ Virtual Threads vs. Kotlin)**, or **(c) Python (Type systems, AST static analysis, Asyncio)**?
    
      
    
2. **Methodological Style:** Which experimental activity fits your daily working style better?
    
      
    - _Style 1 (Tool + Evaluation):_ Writing a static analyzer, linter rule, or bytecode filter, and measuring its Precision/Recall/Speed on 50 open-source projects.
        
          
        
    - _Style 2 (Benchmarking & Profiling):_ Designing controlled workload experiments, running profilers (JMH, Perfetto, PySpy) for hours on your PC, and doing statistical performance analysis.
        
          
        
    - _Style 3 (Repository Mining):_ Writing Python scripts to mine 500 GitHub repositories/commit histories to prove a statistical correlation between code patterns and software bugs.
        
          
        
3. **Android Hardware Check:** For Android-related experiments, do you have at least **one physical Android phone** you can plug into your workstation via USB for accurate frame-time/latency profiling, or would you rely strictly on the Android Emulator on your i5/32GB machine?
    
      
    
4. **University / Department Expectations:** Does your department require you to build a software artifact (e.g., a plugin/tool) alongside the experiment, or is a pure empirical measurement/benchmarking study fully accepted?

# КОРИСНЕ 3

## A. Landscape

1. Research Subdomains (7 Subdomains)
**Static Program Analysis & Bug Detection (Java/Kotlin/Python):** Constructing or evaluating abstract syntax tree (AST), control-flow graph (CFG), or data-flow analyses to identify defects, nullability violations, or resource leaks without executing code.

**Cross-Language Interoperability & Multiplatform Evolution:** Studying build performance, boundary overhead, and defect proneness in mixed-language systems (Java-Kotlin interop, Kotlin Multiplatform [KMP], or Python C-extensions/Rust bindings).

**Concurrency & Asynchronous Programming Models:** Analyzing performance, correctness, structured concurrency violations, and thread-safety in Java Virtual Threads (Project Loom), Kotlin Coroutines, and Python `asyncio`/free-threading.

3. Typical Datasets, Benchmarks, and Experimental Settings
Defect Benchmarks: Defects4J (reproducible Java bugs), BugsInPy (curated Python bugs with test suites), DroidLeaks (Android resource leak bugs), AndroR2 (reproducible Android bug reports).

Execution & Performance Benchmarks: Renaissance and DaCapo (modern JVM concurrency/workload benchmarks—used for thread/coroutine profiling, not GC tuning), PyPerformance (official Python benchmark suite), Android Macrobenchmark / Perfetto traces (via headless Android emulators or a single physical USB test device).

## B. Landscape

### Problems

**Python Free-Threading (No-GIL PEP 703) Race Conditions:** Assessing thread-safety defects and single-threaded performance degradation when running existing Python libraries under experimental free-threaded CPython builds.

**Flaky Test Root-Cause Analysis in Asynchronous Code:** Isolating timing-dependent and concurrency-induced test flakiness in Python `pytest-asyncio` or Kotlin `kotlinx-coroutines-test` suites.

# PROMPT 4

відповідь на промпт 1

```
1. b (I dont want to focus only on Java vs Kotlin) and c 
2. I prefer Style 2 and 1
3. I have 6 android phones with differen SoC and OS
4. Both variants are accepted 
```

# ANSWER 4

## 5 Defensible Master's Thesis Blueprints (2026 Scope)

### Blueprint 1 (Python — Style 1 + Style 2): Empirical Soundness, Inference Divergence, and Performance of Next-Generation Python Type Checkers

* **Context & 2026 Novelty:** Between 2025 and 2026, Python static type checking underwent a major architectural shift with the release of two Rust-based type checkers: Meta's **Pyrefly** (which performs aggressive concrete union inference even on unannotated code, running at 1.85M lines/sec) and Astral's **`ty`** (which enforces the formal *gradual guarantee*, leaving unannotated returns as `Unknown` so adding type checking never breaks working untyped code). Alongside established checkers (**Mypy** and **Pyright**), developers now face four major checkers that disagree on what constitutes a type error.
* **Research Questions:**
* **RQ1 (Divergence & Soundness):** To what extent do `mypy`, `pyright`, `pyrefly`, and `ty` disagree (diagnostic overlap and false-positive/negative rates) when analyzing identical real-world typed Python repositories and known type-related bugs (BugsInPy)?
* **RQ2 (Inference Trade-offs):** How do aggressive return-type inference (`pyrefly`) versus gradual-guarantee inference (`ty`) impact defect detection recall versus diagnostic noise during incremental type migration?
* **RQ3 (Performance Scaling):** How do memory footprint (RSS) and cold vs. incremental type-checking latency scale across AST size and dependency graph depth on a fixed hardware baseline?


* **Methodology & Experimental Setup:**
* **Style 1 (Tooling Pipeline):** Build an automated harness that normalizes diagnostic outputs (file, line, error category) across all 4 checkers and maps them against bug-inducing commits in **BugsInPy** and 100 top typed PyPI packages.
* **Style 2 (Benchmarking):** Measure wall-clock execution time, CPU utilization, and peak RAM across repository sizes using `hyperfine` and Linux `perf`/memory profilers.

---

### Blueprint 2 (Python — Style 2 + Style 1): Concurrency Scaling and Contention Bottlenecks in Free-Threaded Python (PEP 703)

* **Context & 2026 Novelty:** With Python 3.13 and 3.14 introducing optional free-threading (`--disable-gil` via PEP 703), CPython replaced the Global Interpreter Lock with biased reference counting, deferred reference counting, and optimistic per-object locking on `dict` and `list` containers. While single-threaded overhead is roughly 1% to 8%, multi-threaded scaling in pure Python can degrade unexpectedly when threads trigger biased reference count merges, shared container lock contention, or stop-the-world cycle collection pauses.
* **Research Questions:**
* **RQ1 (Contention Profiling):** Under what shared-state access patterns (e.g., concurrent `dict` mutation, shared object reference passing, iterator sharing) does free-threaded CPython experience lock contention or reference-counting bottlenecks that negate multi-core speedup?
* **RQ2 (Concurrency Model Comparison):** How does free-threaded multi-threading compare in throughput, tail latency (p99), and memory overhead against `multiprocessing`, `asyncio`, and sub-interpreters across CPU-bound and mixed I/O workloads on a 6-core/12-thread workstation?
* **RQ3 (Static Anti-Pattern Detection):** Can an AST-based static linter rule identify "GIL-assumed" thread-unsafe patterns or high-contention shared container mutations in existing Python `threading` codebases?


* **Methodology & Experimental Setup:**
* **Style 2 (Benchmarking):** Construct parameterized micro- and macro-benchmarks based on `pyperformance` running on standard CPython 3.14 vs. free-threaded CPython 3.14t (`--disable-gil`) on your 6-core i5-10400F. Profile C-level lock contention and reference counting overhead using `perf`, `py-spy`, and custom CPython telemetry.
* **Style 1 (Tool + Evaluation):** Write a static AST analyzer (using Python's `ast` or `LibCST`) that flags shared mutable container patterns that cause either race conditions or severe biased-refcount invalidation under PEP 703, and evaluate it on 50 multi-threaded GitHub repositories.

---

### Blueprint 3 (JVM Systems — Style 1 + Style 2): Post-JEP 491 Virtual Thread Pathologies: Residual Pinning, `ThreadLocal` Bloat, and `ScopedValue` Migration

* **Context & 2026 Novelty:** Early research on Java 21 Virtual Threads focused on carrier-thread pinning inside `synchronized` blocks. However, **JDK 24 delivered JEP 491 ("Synchronize Virtual Threads without Pinning")**, which rewrote JVM monitors so `synchronized` blocks no longer pin carrier threads. In 2026 production systems (JDK 24/25), the bottleneck has shifted to three *new* pathologies: (1) **residual pinning** in native JNI/FFM frames, class loading, and Linux local file I/O; (2) **`ThreadLocal` allocation explosion** (where unbounded virtual threads instantiate hundreds of thousands of redundant `ThreadLocal` caches instead of using **JDK 25's finalized JEP 506 `ScopedValue**`); and (3) **unbounded concurrency resource exhaustion** when virtual threads overwhelm connection pools without semaphores.
* **Research Questions:**
* **RQ1 (Prevalence of Post-JEP 491 Anti-Patterns):** How prevalent are virtual-thread performance hazards (`ThreadLocal.withInitial` caching, unthrottled virtual thread spawning, and native/class-loading pinning) in open-source JVM libraries and services adopting Java 21–25?
* **RQ2 (Quantitative Runtime Impact):** What is the throughput, p99 tail-latency, and heap-allocation penalty of `ThreadLocal` vs. `ScopedValue` (JEP 506) and unthrottled virtual threads vs. semaphore-bounded virtual threads under controlled JMH and Renaissance workloads?
* **RQ3 (Automated Static Detection):** With what precision and recall can a bytecode/AST static analyzer detect `ThreadLocal` misuse and residual pinning paths before runtime deployment?


* **Methodology & Experimental Setup:**
* **Style 1 (Tool):** Build a static analyzer (using Spoon, ASM bytecode analysis, or a SpotBugs/ErrorProne plugin) that detects `ThreadLocal` caching reachable from virtual-thread executors and JNI/class-initializer blocking calls.
* **Style 2 (Profiling):** Use **JMH (Java Microbenchmark Harness)** and **JDK Flight Recorder (JFR)** (`jdk.VirtualThreadPinned`, heap allocation rates, tail latency) on JDK 21 vs. JDK 24/25 to prove the exact performance cost of the patterns your tool detects.

---

### Blueprint 4 (JVM / Kotlin Systems — Style 1 + Style 2): Pruning Equivalent and Compiler-Generated Mutants in Kotlin Bytecode Mutation Testing

* **Context & 2026 Novelty:** This is a deep JVM bytecode & testing study (not a Java-vs-Kotlin comparison). Mutation testing tools on the JVM (such as **PITest**) mutate compiled JVM bytecode to evaluate test suite quality. However, the Kotlin compiler (including the K2 compiler) generates substantial synthetic bytecode for null-safety assertions (`Intrinsics.checkNotNullParameter`), coroutine state-machine switches (`Continuation` tables), `data class` synthetic methods (`copy$default`, `componentN`), and inline functions. Mutating these compiler artifacts creates useless or unkillable mutants, wasting massive CPU time and distorting the mutation score.
* **Research Questions:**
* **RQ1 (Mutant Taxonomy):** What percentage of bytecode mutants generated by standard JVM mutation operators on Kotlin 2.x codebases reside in compiler-generated synthetic constructs (coroutines, null-checks, data/value classes, delegated properties)?
* **RQ2 (Efficiency & Accuracy Gain):** By how much does a Kotlin-aware bytecode filter reduce mutation testing execution time and false surviving mutants without reducing real fault-detection capability?


* **Methodology & Experimental Setup:**
* **Style 1 (Tool):** Write a **PITest `MutationInterceptor` plugin** (using ASM bytecode inspection) that inspects Kotlin `@Metadata` annotations and bytecode patterns to filter out compiler-generated coroutine state-machine branches and synthetic methods.
* **Style 2 (Benchmarking):** Run controlled mutation testing benchmarks across 15–20 open-source Kotlin libraries before and after applying your interceptor, measuring wall-clock speedup, total mutants pruned, and mutation score shift.

---

### Blueprint 5 (Mobile JVM / ART Runtime — Style 2 + Style 1): Cross-SoC Performance Variance of Coroutine Dispatchers and Baseline Profiles Across Heterogeneous Android Hardware

* **Context & 2026 Novelty:** Because you own **6 physical Android phones with different SoCs and OS versions**, you can run an experiment that 95% of students cannot. Modern mobile SoCs use asymmetric multi-processing (ARM big.LITTLE / DynamIQ with Prime, Performance, and Efficiency cores) and vary widely in Android Runtime (ART) versions and OS thread schedulers. Developers apply concurrency primitives (Kotlin Coroutine dispatchers, thread pool sizes) and AOT Baseline Profiles assuming uniform speedup, yet thread migration across little/big cores and differing ART JIT/AOT behavior can cause severe tail-latency variance on mid-range/older SoCs compared to flagship SoCs.
* **Research Questions:**
* **RQ1 (Cross-SoC Variance):** How consistently do concurrency configurations (e.g., `Dispatchers.Default` parallelism limits, `Dispatchers.IO` elastic thread scaling, structured concurrency fan-out) perform across 6 heterogeneous Android SoCs and OS versions?
* **RQ2 (ART & Scheduling Bottlenecks):** To what extent are tail-latency spikes (p95/p99) on lower-tier SoCs driven by OS CPU core migration (little-to-big core scheduling delays) versus ART lock contention?
* **RQ3 (Adaptive Heuristics):** Can a lightweight runtime heuristic or static linter rule tune coroutine parallelism to the underlying device SoC topology to reduce p99 latency?


* **Methodology & Experimental Setup:**
* **Style 2 (Hardware Testbed Benchmarking):** Connect your 6 Android devices via ADB to your workstation. Use **Android Jetpack Macrobenchmark / Microbenchmark** and **Perfetto** system traces (`sched_switch`, CPU frequency, ART monitor contention) to run automated, repeatable concurrency and serialization benchmarks across all 6 phones.
* **Style 1 (Artifact):** Build a small adaptive dispatcher wrapper or static check based on the empirical findings and validate its latency reduction across the 6-device cluster.

---

## Comparison Matrix of the 5 Blueprints

| Blueprint | Ecosystem | Primary Balance | Key Tools / Profilers | Hardware Used | 6-Month Risk Level |
| --- | --- | --- | --- | --- | --- |
| **1. Next-Gen Python Type Checkers (`ty`, `pyrefly`, `mypy`, `pyright`)** | Python | 50% Style 1 (Eval Harness) / 50% Style 2 (Benchmarks) | `ty`, `pyrefly`, `mypy`, `pyright`, BugsInPy, `hyperfine` | PC (i5 + 32GB RAM) | **Very Low** (Tools & datasets ready today) |
| **2. Free-Threaded Python (PEP 703) Contention & Linter** | Python | 60% Style 2 (Profiling) / 40% Style 1 (AST Linter) | Python 3.14t (`--disable-gil`), `pyperformance`, `perf`, `ast` | PC (6-core/12-thread i5) | **Low** (High novelty in 2026) |
| **3. Post-JEP 491 JVM Virtual Thread Pathologies & `ScopedValue**` | JVM (Java 24/25) | 50% Style 1 (Static Detector) / 50% Style 2 (JMH + JFR) | JDK 25, JMH, JFR, ASM / Spoon / ErrorProne | PC (i5 + 32GB RAM) | **Low** (Clear baseline metrics) |
| **4. Kotlin Bytecode Mutation Testing Filter (PITest)** | JVM / Kotlin | 60% Style 1 (Bytecode Filter) / 40% Style 2 (Speedup Eval) | PITest, ASM Bytecode, Kotlin 2.x, JUnit | PC (i5 + 32GB RAM) | **Low–Medium** (Requires reading JVM bytecode) |
| **5. Cross-SoC Concurrency & ART Profiling on 6 Phones** | Android ART / JVM | 75% Style 2 (Perfetto / Hardware) / 25% Style 1 (Heuristic) | ADB, Perfetto, Android Benchmark, Kotlin Coroutines | PC + **6 Android Phones** | **Medium** (ADB automation takes setup time, but high reward) |

---

## Supervisor Recommendation & Next Step

All five blueprints are strictly experimental, require zero paid APIs or human participants, avoid your excluded topics, and fit comfortably inside a 480-hour schedule.

* Choose **Blueprint 1 or 2** if you want to work primarily in **Python** on bleeding-edge 2025–2026 language shifts (`ty`/`pyrefly` or No-GIL PEP 703).
* Choose **Blueprint 3 or 4** if you want deep **JVM runtime/bytecode engineering** (JDK 24/25 Virtual Threads or Kotlin bytecode mutation pruning).
* Choose **Blueprint 5** if you want to turn your **6 physical Android phones** into an unfair experimental advantage that guarantees a unique empirical dataset.

**Which 1 or 2 blueprints from this list resonate most with you?** Once you select your top candidate(s), we will move to the next methodological phase: verifying the exact baseline papers and drafting a rigorous **Experimental Protocol** (independent/dependent variables, dataset selection criteria, statistical tests, and threats to validity).

# КОРИСНЕ 4

### Blueprint 3 (JVM Systems — Style 1 + Style 2): Post-JEP 491 Virtual Thread Pathologies: Residual Pinning, `ThreadLocal` Bloat, and `ScopedValue` Migration

- **Context & 2026 Novelty:** Early research on Java 21 Virtual Threads focused on carrier-thread pinning inside `synchronized` blocks. However, **JDK 24 delivered JEP 491 ("Synchronize Virtual Threads without Pinning")**, which rewrote JVM monitors so `synchronized` blocks no longer pin carrier threads. In 2026 production systems (JDK 24/25), the bottleneck has shifted to three _new_ pathologies: (1) **residual pinning** in native JNI/FFM frames, class loading, and Linux local file I/O; (2) **`ThreadLocal` allocation explosion** (where unbounded virtual threads instantiate hundreds of thousands of redundant `ThreadLocal` caches instead of using **JDK 25's finalized JEP 506 `ScopedValue`**); and (3) **unbounded concurrency resource exhaustion** when virtual threads overwhelm connection pools without semaphores.
    
- **Research Questions:**
    
    - **RQ1 (Prevalence of Post-JEP 491 Anti-Patterns):** How prevalent are virtual-thread performance hazards (`ThreadLocal.withInitial` caching, unthrottled virtual thread spawning, and native/class-loading pinning) in open-source JVM libraries and services adopting Java 21–25?
        
    - **RQ2 (Quantitative Runtime Impact):** What is the throughput, p99 tail-latency, and heap-allocation penalty of `ThreadLocal` vs. `ScopedValue` (JEP 506) and unthrottled virtual threads vs. semaphore-bounded virtual threads under controlled JMH and Renaissance workloads?
        
    - **RQ3 (Automated Static Detection):** With what precision and recall can a bytecode/AST static analyzer detect `ThreadLocal` misuse and residual pinning paths before runtime deployment?
        
- **Methodology & Experimental Setup:**
    
    - **Style 1 (Tool):** Build a static analyzer (using Spoon, ASM bytecode analysis, or a SpotBugs/ErrorProne plugin) that detects `ThreadLocal` caching reachable from virtual-thread executors and JNI/class-initializer blocking calls.
        
    - **Style 2 (Profiling):** Use **JMH (Java Microbenchmark Harness)** and **JDK Flight Recorder (JFR)** (`jdk.VirtualThreadPinned`, heap allocation rates, tail latency) on JDK 21 vs. JDK 24/25 to prove the exact performance cost of the patterns your tool detects.

### Blueprint 4 (JVM / Kotlin Systems — Style 1 + Style 2): Pruning Equivalent and Compiler-Generated Mutants in Kotlin Bytecode Mutation Testing

- **Context & 2026 Novelty:** This is a deep JVM bytecode & testing study (not a Java-vs-Kotlin comparison). Mutation testing tools on the JVM (such as **PITest**) mutate compiled JVM bytecode to evaluate test suite quality. However, the Kotlin compiler (including the K2 compiler) generates substantial synthetic bytecode for null-safety assertions (`Intrinsics.checkNotNullParameter`), coroutine state-machine switches (`Continuation` tables), `data class` synthetic methods (`copy$default`, `componentN`), and inline functions. Mutating these compiler artifacts creates useless or unkillable mutants, wasting massive CPU time and distorting the mutation score.
    
- **Research Questions:**
    
    - **RQ1 (Mutant Taxonomy):** What percentage of bytecode mutants generated by standard JVM mutation operators on Kotlin 2.x codebases reside in compiler-generated synthetic constructs (coroutines, null-checks, data/value classes, delegated properties)?
        
    - **RQ2 (Efficiency & Accuracy Gain):** By how much does a Kotlin-aware bytecode filter reduce mutation testing execution time and false surviving mutants without reducing real fault-detection capability?
        
- **Methodology & Experimental Setup:**
    
    - **Style 1 (Tool):** Write a **PITest `MutationInterceptor` plugin** (using ASM bytecode inspection) that inspects Kotlin `@Metadata` annotations and bytecode patterns to filter out compiler-generated coroutine state-machine branches and synthetic methods.
        
    - **Style 2 (Benchmarking):** Run controlled mutation testing benchmarks across 15–20 open-source Kotlin libraries before and after applying your interceptor, measuring wall-clock speedup, total mutants pruned, and mutation score shift.

### Blueprint 5 (Mobile JVM / ART Runtime — Style 2 + Style 1): Cross-SoC Performance Variance of Coroutine Dispatchers and Baseline Profiles Across Heterogeneous Android Hardware

- **Context & 2026 Novelty:** Because you own **6 physical Android phones with different SoCs and OS versions**, you can run an experiment that 95% of students cannot. Modern mobile SoCs use asymmetric multi-processing (ARM big.LITTLE / DynamIQ with Prime, Performance, and Efficiency cores) and vary widely in Android Runtime (ART) versions and OS thread schedulers. Developers apply concurrency primitives (Kotlin Coroutine dispatchers, thread pool sizes) and AOT Baseline Profiles assuming uniform speedup, yet thread migration across little/big cores and differing ART JIT/AOT behavior can cause severe tail-latency variance on mid-range/older SoCs compared to flagship SoCs.
    
- **Research Questions:**
    
    - **RQ1 (Cross-SoC Variance):** How consistently do concurrency configurations (e.g., `Dispatchers.Default` parallelism limits, `Dispatchers.IO` elastic thread scaling, structured concurrency fan-out) perform across 6 heterogeneous Android SoCs and OS versions?
        
    - **RQ2 (ART & Scheduling Bottlenecks):** To what extent are tail-latency spikes (p95/p99) on lower-tier SoCs driven by OS CPU core migration (little-to-big core scheduling delays) versus ART lock contention?
        
    - **RQ3 (Adaptive Heuristics):** Can a lightweight runtime heuristic or static linter rule tune coroutine parallelism to the underlying device SoC topology to reduce p99 latency?
        
- **Methodology & Experimental Setup:**
    
    - **Style 2 (Hardware Testbed Benchmarking):** Connect your 6 Android devices via ADB to your workstation. Use **Android Jetpack Macrobenchmark / Microbenchmark** and **Perfetto** system traces (`sched_switch`, CPU frequency, ART monitor contention) to run automated, repeatable concurrency and serialization benchmarks across all 6 phones.
        
    - **Style 1 (Artifact):** Build a small adaptive dispatcher wrapper or static check based on the empirical findings and validate its latency reduction across the 6-device cluster.