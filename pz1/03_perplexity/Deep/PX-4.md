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
---

# PROMPT 

```

Act as an academic literature analyst.

RESEARCH AREA
Semantic Mutation Testing for Continuation-Passing JVM Compilers: Differentiating Intentional Logic from Synthetic State Machines in Kotlin Bytecode.
Investigate whether mutating compiler-synthesized coroutine state machines reveals real asynchronous concurrency bugs that cannot be modeled by traditional source-level mutation operators
**Automated Software Maintenance (ASE, SANER):** Test suite maintenance and automated refactoring.

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

**Search outcome:** I found **no 2024–2026 systematic review, mapping study, scoping review, or meta-analysis** on semantic mutation testing of compiler-synthesized Kotlin coroutine state machines, nor on whether bytecode-level coroutine mutations reveal asynchronous concurrency bugs beyond traditional source-level mutation operators. The closest evidence is an ECOOP 2024 empirical bug study, JVM concurrency-testing work, and general mutation-testing reviews.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)][[dl.acm](https://dl.acm.org/doi/10.1145/3643756)]

|#|Exact title|Authors|Year|Venue|DOI|Direct link|Study type|Research questions|Method|Dataset / sample|Findings|Limitations|Explicit future work|Possible gap|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|1|**Understanding Concurrency Bugs in Real-World Programs with Kotlin Coroutines**|Bob Brockbernd, Nikita Koval, Arie van Deursen, Burcu Külahçıoğlu Özkan|2024|ECOOP 2024, LIPIcs vol. 313, article 8|10.4230/LIPIcs.ECOOP.2024.8|[PDF](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf) / [Record](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2024.8)|Empirical bug-characterization study|What concurrency bugs arise in real-world Kotlin-coroutine programs, what are their patterns and root causes, and how can they be detected automatically?|Analyzed commits in selected repositories; classified 55 concurrency bugs by characteristics, root causes, misconceptions, corrections, and possible detection strategies. [[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[drops.dagstuhl](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2024.8)]|55 concurrency-bug cases from 7 popular open-source repositories, including IntelliJ IDEA, Firefox, and Ktor. [[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)]|Identifies common Kotlin-coroutine bug patterns related to asynchrony and coroutine semantics, with root causes, misconceptions, fixes, and detection strategies. [[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)]|It characterizes historical bugs rather than evaluating mutation operators, compiler state machines, or test-suite fault-detection capability. [[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)]|Explicitly aims to foster research and development of concurrency-analysis tools for Kotlin programs. [[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)]|Provides a real-world bug taxonomy but does not establish which bytecode-level mutations correspond to realistic asynchronous faults.|
|2|**Fray: An Efficient General-Purpose Concurrency Testing Platform for the JVM**|Fray authors|2025|arXiv preprint|Not retrieved|[Link](https://arxiv.org/html/2501.12618v1)|Primary tool / empirical study|Can a general-purpose JVM concurrency-testing platform improve applicability, bug-finding efficiency, correctness, and extensibility?|Implements and evaluates JVM scheduling algorithms including random walk, PCT, and partial-order sampling (POS). [[arxiv](https://arxiv.org/html/2501.12618v1)]|JVM concurrency-testing workloads; one reported Kotlin Mutex liveness bug was missed by the evaluated approach. [[arxiv](https://arxiv.org/html/2501.12618v1)]|Shows that Kotlin implements coroutines by interleaving logical tasks on user-space threads and switching context at blocking I/O; POS detected a bug that another evaluated approach missed within a 10-minute bound. [[arxiv](https://arxiv.org/html/2501.12618v1)]|It does not evaluate mutation testing, compiler-synthesized state-machine mutants, or source-versus-bytecode mutation comparability. [[arxiv](https://arxiv.org/html/2501.12618v1)]|The platform is designed for extensibility and future concurrency-testing research.|Directly relevant JVM infrastructure, but it does not test semantic mutation of Kotlin coroutine compilation artifacts.|
|3|**Syntax Is All You Need: A Universal-Language Approach to Mutation Testing**|Not fully listed in the retrieved record|2024|ACM publication / OOPSLA-related record|10.1145/3643756|[ACM](https://dl.acm.org/doi/10.1145/3643756)|Primary tool / methodology study|Can mutation-tool construction be generalized across programming languages through a syntax-based approach?|Proposes a universal-language approach to mutant generation; acknowledges that invalid mutants may be produced and rejected during compilation. [[dl.acm](https://dl.acm.org/doi/10.1145/3643756)]|Mutation-testing tool ecosystem; exact subject systems not exposed in the retrieved record. [[dl.acm](https://dl.acm.org/doi/10.1145/3643756)]|Presents a general approach to mutant generation and situates it within the standard mutation-testing pipeline: baseline execution, mutant generation, mutant execution, and analysis. [[dl.acm](https://dl.acm.org/doi/10.1145/3643756)]|It does not address Kotlin coroutine compilation, asynchronous state machines, or concurrency-specific semantic mutation. [[dl.acm](https://dl.acm.org/doi/10.1145/3643756)]|Not stated in the retrieved record.|Generalizes mutant generation, but does not model compiler-lowered coroutine control flow or asynchronous semantics.|
|4|**Mutation Testing in Practice: Insights From Open-Source Software Developers**|Sánchez and coauthors|2024|_ACM Transactions on Software Engineering and Methodology_ / IEEE record|Not retrieved|[Link](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)|Empirical repository-mining study|How is mutation testing used in practice, and what barriers affect adoption?|Repository mining of thousands of GitHub repositories with evidence of mutation-testing-tool usage. [[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)]|Thousands of GitHub repositories using mutation-testing tools. [[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)]|Finds that performance remains a major adoption obstacle even with bytecode mutation and coverage-driven mutant execution. [[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)]|It studies practitioner usage rather than Kotlin coroutine bytecode or asynchronous fault semantics. [[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)]|Not stated in the retrieved record.|Confirms bytecode mutation is practically used, but not that it captures coroutine state-machine faults.|
|5|**A Comprehensive Review on Equivalent Mutant Detection Using Machine Learning**|Review authors|2025|Springer book chapter / review|Not retrieved|[Link](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)|Review|How can machine learning help detect equivalent mutants in mutation testing?|Reviews machine-learning approaches for equivalent-mutant detection and identifies standardization and future-research needs. [[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)]|Literature corpus on equivalent-mutant detection; exact study count not exposed. [[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)]|Mutation testing introduces small modifications and checks whether tests detect them; the review highlights the need for standardized frameworks and future research. [[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)]|It focuses on equivalent-mutant detection, not compiler-synthesized coroutine state machines or asynchronous concurrency. [[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)]|Explicitly calls for standardized frameworks and future research directions. [[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)]|Equivalent mutants are especially plausible in compiler-lowered code, but the review does not examine coroutine-specific mutation equivalence.|
|6|**Application of machine learning algorithms in mutation testing: A systematic literature review**|Review authors|2026|_Procedia Computer Science_, vol. 284|Not retrieved|[Link](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)|Systematic literature review|How can machine learning improve mutation testing efficiency, cost, and mutant analysis?|Systematic review of machine-learning integration in mutation testing. [[dl.acm](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)]|Literature corpus on ML-enhanced mutation testing; exact inclusion criteria not exposed. [[dl.acm](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)]|Reports that machine learning can improve efficiency, reduce computational cost, and support mutant classification, clustering, and prioritization. [[dl.acm](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)]|It is broad and does not address Kotlin coroutines, JVM bytecode, or asynchronous concurrency bugs. [[dl.acm](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)]|Not stated in the retrieved record.|Could support mutant prioritization, but no coroutine-state-machine mutation model is considered.|
|7|**LitmusKt: Concurrency Stress Testing for Kotlin**|LitmusKt authors|2025|arXiv preprint|Not retrieved|[Link](https://ar5iv.labs.arxiv.org/html/2501.07472)|Primary tool / research preprint|Can mutation-based fuzzing of litmus tests expose weak behaviors and concurrency bugs in Kotlin?|Proposes fuzzing litmus tests through code mutation to trigger random compiler optimizations and expose weak behaviors. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2501.07472)]|Kotlin litmus tests; exact benchmark/sample size not exposed in the retrieved record. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2501.07472)]|Suggests that mutation-based fuzzing of litmus tests may reveal more weak behaviors and bugs. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2501.07472)]|It targets memory-model/weak-behavior fuzzing, not compiler-synthesized coroutine state machines or asynchronous application bugs. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2501.07472)]|Not stated in the retrieved record.|Mutation is used as a fuzzing input, not as a semantic model of coroutine compilation artifacts.|
|8|**Static Deadlock Analysis for Kotlin Coroutines**|Static-analysis authors|Not fully dated in retrieved record|TU Delft repository / thesis or technical report|Not applicable|[PDF](https://repository.tudelft.nl/file/File_266fa14a-d87a-493c-af7c-dd9106c76ac3)|Primary static-analysis study|Can deadlocks in Kotlin coroutines, especially `runBlocking` deadlocks, be detected statically?|Develops an approach for detecting Kotlin-coroutine deadlocks, focusing on `runBlocking` scenarios. [[repository.tudelft](https://repository.tudelft.nl/file/File_266fa14a-d87a-493c-af7c-dd9106c76ac3)]|Kotlin-coroutine programs; exact evaluation details not exposed in the retrieved record. [[repository.tudelft](https://repository.tudelft.nl/file/File_266fa14a-d87a-493c-af7c-dd9106c76ac3)]|Presents initial steps toward general deadlock detection for Kotlin coroutines. [[repository.tudelft](https://repository.tudelft.nl/file/File_266fa14a-d87a-493c-af7c-dd9106c76ac3)]|It targets deadlocks, not mutation testing, bytecode-level state-machine mutants, or test-suite effectiveness. [[repository.tudelft](https://repository.tudelft.nl/file/File_266fa14a-d87a-493c-af7c-dd9106c76ac3)]|Not stated in the retrieved record.|Demonstrates that coroutine-specific analysis is feasible, but does not connect compiler state machines to mutation adequacy.|
|9|**krispr: Mutation testing for Kotlin unit tests, via a K2 compiler plugin**|krispr developers|2026|GitHub project / practitioner tooling|Not applicable|[Link](https://github.com/timusus/krispr)|Practitioner tooling|Can Kotlin/JVM, Android, and Kotlin Multiplatform unit tests be mutation-tested through a K2 compiler plugin?|Implements mutation testing for Kotlin/JVM and related targets through a K2 compiler plugin. [[github](https://github.com/timusus/krispr)]|Kotlin/JVM, Android local tests, and Kotlin Multiplatform JVM targets. [[github](https://github.com/timusus/krispr)]|Provides a practical Kotlin mutation-testing route via compiler-plugin integration. [[github](https://github.com/timusus/krispr)]|It is practitioner tooling, not a peer-reviewed empirical evaluation; it does not establish semantic mutation of coroutine state machines. [[github](https://github.com/timusus/krispr)]|Not stated in the retrieved record.|Demonstrates feasibility of Kotlin-level mutation infrastructure, but not coroutine-state-machine semantic operators.|

## B. Consensus map

- **Kotlin coroutines create real, recurring concurrency-fault classes.** The ECOOP 2024 study identifies 55 real-world coroutine-related concurrency bugs across seven repositories and derives recurring patterns, root causes, and detection strategies.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[drops.dagstuhl](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2024.8)]
- **Coroutine semantics differ from ordinary sequential control flow.** Kotlin implements coroutines by interleaving logical tasks on user-space threads and context-switching at blocking I/O operations, which makes scheduling and suspension central to correctness.[[arxiv](https://arxiv.org/html/2501.12618v1)]
- **JVM concurrency testing can distinguish scheduling algorithms.** Fray reports that one Kotlin Mutex liveness bug was missed by one approach but detected by partial-order sampling within its evaluation bound, showing that test strategy affects fault exposure.[[arxiv](https://arxiv.org/html/2501.12618v1)]
- **Mutation testing conventionally evaluates test-suite fault-detection capability.** Mutation testing introduces synthetic changes and checks whether tests detect them; bytecode mutation and coverage-driven execution are established practical techniques.[[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)][[etheses.whiterose.ac](https://etheses.whiterose.ac.uk/id/eprint/39289/1/paper.pdf)]
- **Mutation-testing cost remains a practical barrier.** A 2024 practitioner study finds that performance remains a major obstacle even when bytecode mutation and coverage-driven mutant execution are used.[[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)]
- **Kotlin-specific mutation infrastructure is emerging.** A 2026 K2 compiler-plugin project targets Kotlin/JVM, Android, and Kotlin Multiplatform mutation testing, showing that Kotlin-native mutation tooling is technically feasible.[[github](https://github.com/timusus/krispr)]

## C. Disagreement map

|Issue|Position / evidence|Counterposition / limitation|
|---|---|---|
|**Should mutations be source-level or bytecode-level?**|Bytecode mutation is already used in practice and can reduce some mutation-testing costs. [[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)]|Source-level operators may miss faults introduced or obscured by compiler lowering; no retrieved study compares the two for Kotlin coroutine state machines. [[dl.acm](https://dl.acm.org/doi/10.1145/3643756)][[github](https://github.com/timusus/krispr)]|
|**Are coroutine bugs best addressed by static analysis or dynamic testing?**|Static deadlock analysis targets a specific coroutine failure class. [[repository.tudelft](https://repository.tudelft.nl/file/File_266fa14a-d87a-493c-af7c-dd9106c76ac3)]|The ECOOP study identifies a broader set of asynchrony-related bug patterns and explicitly calls for automated detection tools, implying that static analysis alone is insufficient. [[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)]|
|**Do synthetic mutants represent real faults?**|Traditional mutation testing is grounded in the competent-programmer hypothesis and uses synthetic faults to assess test-suite detection strength. [[etheses.whiterose.ac](https://etheses.whiterose.ac.uk/id/eprint/39289/1/paper.pdf)]|Compiler-synthesized coroutine state machines may produce mutants that are syntactically valid but semantically unrealistic, equivalent, or not representative of observed real-world coroutine bugs. [[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)][[etheses.whiterose.ac](https://etheses.whiterose.ac.uk/id/eprint/39289/1/paper.pdf)]|
|**Is mutation useful for concurrency testing?**|LitmusKt proposes mutation-based fuzzing to trigger compiler optimizations and expose weak behaviors. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2501.07472)]|That work targets memory-model weak behaviors, not the asynchronous state-machine transitions produced by Kotlin coroutine compilation. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2501.07472)]|

## D. Explicit gaps

- **No direct systematic review exists for semantic mutation of coroutine state machines.** The retrieved mutation-testing reviews address general mutation testing, equivalent mutants, and machine-learning support, but not Kotlin coroutine compilation artifacts.[[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)][[dl.acm](https://dl.acm.org/doi/10.1145/3643756)][[dl.acm](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)]
- **The Kotlin-coroutine bug study explicitly calls for detection tooling.** Its authors state that the study is intended to foster research and development of concurrency-analysis tools for Kotlin programs.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)]
- **Kotlin coroutine state machines are not evaluated as mutation targets.** No retrieved source evaluates mutations to compiler-generated continuation/state-machine bytecode or compares them with source-level mutation operators.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[dl.acm](https://dl.acm.org/doi/10.1145/3643756)][[github](https://github.com/timusus/krispr)]
- **Bytecode mutation is practical but not coroutine-aware.** The practitioner study confirms bytecode mutation is used, but does not examine coroutine lowering or asynchronous concurrency semantics.[[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)]
- **JVM concurrency testing does not yet incorporate semantic mutation.** Fray evaluates scheduling algorithms and bug detection, but not mutation-based test-suite assessment or coroutine-state-machine mutants.[[arxiv](https://arxiv.org/html/2501.12618v1)]

## E. Inferred gaps

- **No mapping exists from real coroutine bugs to compiler-state-machine mutations.** The ECOOP bug taxonomy could seed mutation-operator design, but the retrieved evidence does not link its 55 bugs to bytecode-level continuation, suspension, resumption, cancellation, or dispatcher-state mutations.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[github](https://github.com/timusus/krispr)]
- **The “intentional logic versus synthetic state machine” distinction is untested.** Existing mutation work assumes source-level or general bytecode mutants, but does not distinguish user-written coroutine logic from compiler-lowered control-flow artifacts.[[dl.acm](https://dl.acm.org/doi/10.1145/3643756)][[github](https://github.com/timusus/krispr)][[etheses.whiterose.ac](https://etheses.whiterose.ac.uk/id/eprint/39289/1/paper.pdf)]
- **Traditional mutation operators may be inadequate for asynchronous faults.** Since coroutine correctness depends on suspension points, dispatcher behavior, cancellation, structured concurrency, and interleaving, conventional operator mutants may fail to represent these failure modes.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[arxiv](https://arxiv.org/html/2501.12618v1)]
- **Equivalent-mutant risk may be higher in compiler-lowered code.** Compiler-generated state machines may contain redundant or implementation-specific transitions, making equivalence classification especially important; the retrieved reviews identify equivalence detection as an unresolved challenge.[[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)][[dl.acm](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)]
- **Kotlin mutation tooling does not yet expose coroutine-aware operators.** The K2-plugin project supports Kotlin mutation testing but is not shown to mutate coroutine state machines or evaluate asynchronous bug-detection capability.[[github](https://github.com/timusus/krispr)]
- **Test-suite maintenance is disconnected from coroutine mutation.** The ASE/SANER concern—maintaining and refactoring tests as compiler versions or coroutine semantics evolve—is not addressed in the retrieved evidence.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[github](https://github.com/timusus/krispr)]

## F. Open questions

1. **Which compiler-synthesized coroutine state-machine components are mutation-worthy?** Candidate targets include suspension-point transitions, continuation resume paths, exception/cancellation paths, dispatcher handoffs, and state-variable updates; their relationship to real-world Kotlin coroutine bugs has not been established.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[arxiv](https://arxiv.org/html/2501.12618v1)]
2. **Do bytecode-level coroutine mutants detect faults that source-level mutants cannot?** A controlled comparison would need identical programs, test suites, mutation operators, execution budgets, and fault-oracle criteria across source-level and compiler-state-machine mutation.[[dl.acm](https://dl.acm.org/doi/10.1145/3643756)][[computer](https://www.computer.org/csdl/journal/ts/2024/05/10472898/1VpY3do6cyA)][[github](https://github.com/timusus/krispr)]
3. **Which real-world Kotlin coroutine bugs are representable by semantic state-machine mutants?** The 55-bug corpus provides a starting taxonomy, but it does not map each bug to a compiler artifact or mutation operator.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[github](https://github.com/bbrockbernd/kotlin-coroutine-bugs)]
4. **How can equivalent coroutine-state-machine mutants be identified?** Compiler optimizations, dead states, unreachable transitions, and implementation-specific scheduling details may create mutants that are not meaningfully distinguishable by tests.[[link.springer](http://link.springer.com/chapter/10.1007/978-3-031-92474-3_4)][[dl.acm](https://dl.acm.org/doi/10.1016/j.procs.2026.07.048)]
5. **Can mutation testing guide automated refactoring of coroutine test suites?** A mutation-driven approach could identify missing cancellation, dispatcher, exception, timeout, or interleaving tests, but no retrieved study evaluates this maintenance workflow.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[github](https://github.com/timusus/krispr)]
6. **Do results generalize across Kotlin compiler versions and coroutine libraries?** Because compiler lowering and coroutine runtime behavior may change across Kotlin versions, mutation validity and fault representativeness require longitudinal evaluation.[[arxiv](https://arxiv.org/html/2501.12618v1)][[github](https://github.com/timusus/krispr)]

**Bottom line:** The literature establishes that Kotlin coroutine concurrency bugs are real, recurring, and semantically distinctive, and that JVM concurrency-testing strategy affects fault detection. However, it does **not** yet provide semantic mutation operators for compiler-synthesized coroutine state machines or evidence that such mutants reveal asynchronous bugs beyond traditional source-level mutation.[[drops.dagstuhl](https://drops.dagstuhl.de/storage/00lipics/lipics-vol313-ecoop2024/LIPIcs.ECOOP.2024.8/LIPIcs.ECOOP.2024.8.pdf)][[dl.acm](https://dl.acm.org/doi/10.1145/3643756)][[arxiv](https://arxiv.org/html/2501.12618v1)]

# ЦІКАВЕ 