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
The Interleaving Blindspot: Why Timeline Coverage Fails as a Proxy for Fault Detection in Controlled JVM Concurrency Testing.
**Distributed Systems Verification (NSDI, SOSP, OSDI):** Deterministic schedule exploration and feedback-guided distributed testing.

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

**Search outcome:** I found **no 2024–2026 systematic literature review, systematic mapping study, scoping review, or meta-analysis** that directly evaluates whether timeline coverage predicts fault detection in controlled JVM concurrency testing. The closest evidence consists of high-quality empirical concurrency-testing studies, feedback-guided distributed-system fuzzing work, and a broader diversity-based testing review.[[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2311.09714)][[dl.acm](https://dl.acm.org/doi/proceedings/10.1145/3620665)][[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)]

|#|Exact title|Authors|Year|Venue|DOI|Direct link|Study type|Research questions|Method|Dataset / sample|Findings|Limitations|Explicit future work|Possible gap|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|1|**Greybox Fuzzing for Concurrency Testing**|Dylan Wolff, Zheng Shi, Gregory J. Duck, Umang Mathur, Abhik Roychoudhury|2024|ASPLOS 2024|10.1145/3620665.3640389|[ACM](https://dl.acm.org/doi/proceedings/10.1145/3620665) / [PDF](https://www.comp.nus.edu.sg/~gregory/papers/asplos24.pdf)|Primary empirical tool/algorithm study|Can a greybox-guided search over interleavings find concurrency bugs more efficiently than random or systematic bounded exploration?|Biased random search guided by the “reads-from” relation; prunes and navigates the interleaving search space; compares against state-of-the-art concurrency-testing approaches. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[comp.nus.edu](https://www.comp.nus.edu.sg/~gregory/papers/asplos24.pdf)]|Widely used concurrency-testing datasets; the retrieved abstract does not enumerate every subject system. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|The approach finds more bugs per schedule exercised than competing tools and improves over a randomized baseline through more uniform exploration of the schedule space. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|It measures bug-finding efficiency and schedule-space exploration, but does not isolate timeline coverage as an independent predictor of fault detection. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|The authors release the Reads-From Fuzzer (RFF) to support future research. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[github](https://github.com/dylanjwolff/RFF)]|Its feedback signal is semantic—reads-from relations—not timeline coverage; this leaves open whether timeline coverage adds fault-detection value.|
|2|**Selectively Uniform Concurrency Testing**|Abhik Roychoudhury and coauthors|2025|ASPLOS 2025|10.1145/3669940.3707214|[ACM](https://dl.acm.org/doi/10.1145/3669940.3707214) / [PDF](https://abhikrc.com/pdf/ASPLOS25_final.pdf)|Primary empirical algorithm study|Can randomized concurrency testing achieve more useful exploration by selectively enforcing uniformity?|Presents Selectively Uniform Random Walk (SURW), an online randomized concurrency-testing algorithm designed from first principles; evaluates bug-finding ability on popular concurrency-testing datasets. [[abhikrc](https://abhikrc.com/pdf/ASPLOS25_final.pdf)][[dl.acm](https://dl.acm.org/doi/10.1145/3669940.3707214)]|Popular concurrency-testing datasets; exact subject count not exposed in the retrieved record. [[abhikrc](https://abhikrc.com/pdf/ASPLOS25_final.pdf)]|The work targets uniform exploration of multi-threaded behaviors and evaluates bug-finding performance against established concurrency-testing algorithms. [[abhikrc](https://abhikrc.com/pdf/ASPLOS25_final.pdf)]|The retrieved record does not report whether it evaluates timeline coverage, JVM-specific scheduling artifacts, or distributed-system workloads. [[abhikrc](https://abhikrc.com/pdf/ASPLOS25_final.pdf)]|Not stated in the retrieved record.|It treats uniformity as a desirable exploration property, but does not establish that uniformity or timeline coverage is a valid proxy for fault detection.|
|3|**Tamias: Feedback-Guided Systematic Concurrency Testing**|Tamias authors|2026|SOSP 2026|Not retrieved|[PDF](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)|Primary empirical systems/testing study|Can systematic schedule exploration be combined with feedback-based mutation to test large concurrent systems effectively?|Enforces deterministic fine-grained schedules and integrates feedback-based mutation with systematic schedule exploration. [[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)]|Distributed/concurrent systems under test; exact benchmark details are not exposed in the retrieved record. [[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)]|Argues that prior approaches do not integrate systematic schedule exploration with mutation, reducing effectiveness in large search spaces; presents feedback-guided systematic exploration as a remedy. [[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)]|The retrieved record does not expose effect sizes, statistical tests, or a direct comparison of timeline coverage against semantic coverage. [[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)]|Not stated in the retrieved record.|It combines schedule exploration with feedback, but the feedback mechanism is not shown to be timeline coverage.|
|4|**Generalized Concurrency Testing Tool for Distributed Systems**|João Neto and coauthors|2024|ISSTA 2024|Not retrieved|[PDF](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)|Primary tool / empirical study|Can controlled concurrency testing be generalized across distributed-system implementations and scheduling algorithms?|Presents DSTest, a generalized controlled-concurrency-testing framework with a randomized scheduler implementing Probabilistic Concurrency Testing (PCT); enables event schedulers to be implemented and evaluated without repeated instrumentation. [[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)]|Distributed-system implementations; exact systems and workload count not exposed in the retrieved record. [[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)]|DSTest provides a reusable framework for implementing and evaluating event schedulers for distributed-system concurrency testing. [[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)]|It focuses on tool generality and PCT scheduling; the retrieved record does not evaluate timeline coverage or JVM-specific interleaving coverage. [[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)]|Not stated in the retrieved record.|It supports schedule experimentation but does not establish a coverage–fault-detection proxy relationship.|
|5|**An Interleaving Guided Metamorphic Testing Approach for Concurrent Programs**|Not fully listed in the retrieved record|2024|_ACM Transactions on Software Engineering and Methodology_ (TOSEM), 33(1), Article 8|10.1145/3607182|[ACM](https://dl.acm.org/doi/10.1145/3607182)|Primary empirical / methodology study|How can metamorphic relations be constructed specifically for concurrent programs and guided by interleavings?|Applies metamorphic testing to concurrency and investigates construction of metamorphic relations suited to concurrent programs. [[dl.acm](https://dl.acm.org/doi/10.1145/3607182)][[arxiv](https://arxiv.org/html/2412.20692v1)]|Concurrent programs; exact dataset details not exposed in the retrieved record. [[dl.acm](https://dl.acm.org/doi/10.1145/3607182)]|Demonstrates an interleaving-guided metamorphic-testing approach for concurrent programs. [[dl.acm](https://dl.acm.org/doi/10.1145/3607182)]|It guides testing by interleavings but does not appear to evaluate timeline coverage as a fault-detection proxy. [[dl.acm](https://dl.acm.org/doi/10.1145/3607182)]|Not stated in the retrieved record.|Supports the premise that interleaving-aware guidance matters, but does not test whether timeline coverage itself predicts faults.|
|6|**Fray: An Efficient General-Purpose Concurrency Testing Platform for the JVM**|Fray authors|2025|arXiv preprint|Not retrieved|[Link](https://arxiv.org/html/2501.12618)|Primary tool / empirical study|Can a general-purpose JVM concurrency-testing platform combine applicability, bug-finding efficiency, correctness guarantees, and extensibility?|Implements multiple scheduling algorithms—random walk, PCT, and partial-order sampling (POS)—and evaluates their ability to find JVM concurrency bugs. [[arxiv](https://arxiv.org/html/2501.12618)]|JVM concurrency-testing workloads; the retrieved record reports at least one bug detected only by POS within a 10-minute bound. [[arxiv](https://arxiv.org/html/2501.12618)]|Algorithm choice matters: one bug was detected only by POS within the 10-minute limit, showing that scheduling algorithms affect practical bug detection. [[arxiv](https://arxiv.org/html/2501.12618)]|The retrieved record does not report timeline-coverage metrics, statistical comparison across coverage measures, or JVM version sensitivity. [[arxiv](https://arxiv.org/html/2501.12618)]|The platform is designed for extensibility and future concurrency-testing research. [[arxiv](https://arxiv.org/html/2501.12618)]|Directly JVM-relevant, but it does not test whether timeline coverage predicts fault detection.|
|7|**Model-Guided Fuzzing of Distributed Systems**|Model-guided fuzzing authors|Not fully dated in retrieved record|Dissertation / technical report, TU Delft|Not applicable|[PDF](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)|Primary systems/testing study|Can model-guided fuzzing improve distributed-system testing through timeline-like state abstractions?|Uses a timeline abstraction of system states, similar to trace coverage, together with programmer annotations and event timelines as feedback for test generation. [[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]|Distributed systems built on Jepsen-style testing infrastructure; exact subject systems not exposed in the retrieved record. [[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]|Shows that timeline-like abstractions can guide distributed-system test generation. [[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]|It uses timeline-like feedback but does not establish timeline coverage as a validated predictor of fault detection. [[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]|Not stated in the retrieved record.|Directly relevant to the “timeline” construct, but it does not evaluate its predictive validity for JVM concurrency faults.|
|8|**A Survey of the Metrics, Uses, and Subjects of Diversity-Based Techniques in Software Testing**|Survey authors|2023 / later version|arXiv / survey|Not retrieved|[Link](https://ar5iv.labs.arxiv.org/html/2311.09714)|Systematic literature review|What diversity-based testing techniques, metrics, uses, and subject domains exist in software testing?|Systematic literature review collecting results from multiple search engines across diversity-based testing research. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2311.09714)]|Literature corpus; exact inclusion criteria and study count not exposed in the retrieved record. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2311.09714)]|Establishes diversity as a broad testing concept, including coverage-like and distribution-based notions. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2311.09714)]|It predates the 2024–2026 concurrency-testing developments and is not specific to timeline coverage, JVM concurrency, or controlled schedule exploration. [[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2311.09714)]|Not stated in the retrieved record.|Provides the broad review baseline but does not resolve the timeline-coverage proxy question.|

## B. Consensus map

- **The interleaving space is exponentially large.** ASPLOS 2024’s greybox-fuzzing work explicitly frames concurrency bug detection as difficult because thread interleavings grow exponentially.[[dl.acm](https://dl.acm.org/doi/proceedings/10.1145/3620665)][[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]
- **Schedule exploration strategy affects fault detection.** Fray reports that a bug was found only by partial-order sampling within its 10-minute budget, demonstrating that scheduler choice—not merely execution count—can determine whether a fault is detected.[[arxiv](https://arxiv.org/html/2501.12618)]
- **Feedback can improve exploration.** Greybox concurrency fuzzing uses reads-from relations to guide exploration, while Tamias combines systematic schedule exploration with feedback-based mutation.[[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)][[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]
- **Uniformity is considered valuable, but not sufficient by itself.** SURW is motivated by the desirability of uniform exploration, while RFF reports more uniform schedule-space exploration and improved bugs-per-schedule efficiency.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[abhikrc](https://abhikrc.com/pdf/ASPLOS25_final.pdf)]
- **Distributed systems require controlled concurrency testing.** DSTest positions controlled concurrency testing as an effective approach for finding heisenbugs in distributed-system implementations and provides a reusable scheduler-evaluation framework.[[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)]

## C. Disagreement map

|Issue|Position / evidence|Counterposition / limitation|
|---|---|---|
|**What should guide schedule exploration?**|RFF uses semantic reads-from relations; Tamias uses feedback-based mutation; Mallory-like work uses timeline/state abstractions. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)][[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]|These are different feedback signals, and the evidence does not show which best predicts fault detection in JVM workloads.|
|**Is uniform exploration desirable?**|SURW is explicitly built around selective uniformity, and RFF reports more uniform exploration with better bug-finding efficiency. [[abhikrc](https://abhikrc.com/pdf/ASPLOS25_final.pdf)][[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|Uniformity may spread effort thinly across harmless schedules; the retrieved work does not establish a causal coverage-to-fault-detection relationship.|
|**Is systematic exploration preferable to randomized exploration?**|Systematic exploration can ensure coverage of a reduced or bounded search space. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|RFF argues that purely systematic approaches can be pessimistic, while random sampling can be optimistic; its hybrid approach outperforms both in its evaluation. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|
|**Does more exploration imply better fault detection?**|More targeted exploration improves bugs found per schedule in RFF’s evaluation. [[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|Fray’s POS-only detection result shows that particular scheduling strategies can be necessary, but neither result establishes timeline coverage as a sufficient predictor. [[arxiv](https://arxiv.org/html/2501.12618)][[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]|

## D. Explicit gaps

- **No direct review of timeline coverage as a fault-detection proxy.** The retrieved diversity-testing systematic review addresses diversity-based testing broadly, not timeline coverage in JVM concurrency testing.[[ar5iv.labs.arxiv](https://ar5iv.labs.arxiv.org/html/2311.09714)]
- **Feedback-guided work uses semantic rather than timeline feedback.** RFF explicitly guides exploration using reads-from relations, not timeline coverage.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)]
- **Tamias identifies an integration gap.** It states that prior approaches do not integrate systematic schedule exploration with mutation, making exploration less effective in large search spaces.[[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)]
- **DSTest identifies a tooling-generalization gap.** It presents a generalized framework so that concurrency-testing algorithms can be evaluated without repeated instrumentation or implementation effort.[[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)]
- **JVM-specific evaluation remains limited.** Fray is JVM-specific, but its retrieved description evaluates scheduling algorithms rather than the predictive validity of timeline coverage.[[arxiv](https://arxiv.org/html/2501.12618)]

## E. Inferred gaps

- **Timeline coverage is not validated as a proxy.** Although timeline-like state abstractions guide distributed-system fuzzing, no retrieved study establishes a correlation, causal effect, or decision threshold between timeline coverage and JVM concurrency-fault detection.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]
- **The “interleaving blindspot” is not formally characterized.** Existing work measures schedule-space exploration and bug-finding efficiency, but does not define which interleavings are invisible to timeline coverage yet necessary to expose faults.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[arxiv](https://arxiv.org/html/2501.12618)]
- **JVM scheduling realism is underrepresented.** Fray targets the JVM, but the retrieved evidence does not connect its schedules to JVM-specific phenomena such as safepoints, JIT compilation, class initialization, native calls, lock implementation, or garbage-collection pauses.[[arxiv](https://arxiv.org/html/2501.12618)]
- **Fault-oracle quality is not separated from coverage quality.** Studies report bug detection, but the available records do not isolate whether failures stem from poor schedule exploration, weak oracles, or faults that require particular memory-visibility conditions.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[dl.acm](https://dl.acm.org/doi/10.1145/3607182)]
- **Distributed-system feedback is not transferred to JVM testing.** Timeline abstractions appear in distributed-system fuzzing, while JVM platforms emphasize scheduling algorithms and semantic relations; the bridge between these settings is not established.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[arxiv](https://arxiv.org/html/2501.12618)][[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]
- **Coverage-guided scheduler research exists but is not directly retrieved in full.** A search result identifies “Efficient Concurrency Testing via Coverage-Guided Scheduler,” suggesting an active research direction, but its full findings and methodology were not available in the retrieved material.[[connectedpapers](https://www.connectedpapers.com/main/fb6e6e38e073e24417f8cc622c487cb2f3646e4f)]

## F. Open questions

1. **Does timeline coverage predict fault detection after controlling for schedule count and algorithm?** A rigorous study would compare timeline coverage, reads-from coverage, partial-order coverage, and random exploration under equal execution budgets.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[abhikrc](https://abhikrc.com/pdf/ASPLOS25_final.pdf)][[arxiv](https://arxiv.org/html/2501.12618)]
2. **Which interleavings are invisible to timeline coverage but necessary for fault exposure?** The “interleaving blindspot” hypothesis requires identifying fault-triggering schedule features—such as ordering of conflicting accesses, lock acquisitions, visibility barriers, or exception paths—that timeline abstractions fail to distinguish.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[dl.acm](https://dl.acm.org/doi/10.1145/3607182)]
3. **Do JVM runtime events break the timeline abstraction?** JIT compilation, class initialization, native calls, GC pauses, and scheduler preemption may change observable timing without changing the logical interleaving; their effect on coverage-fault correlation is untested in the retrieved evidence.[[arxiv](https://arxiv.org/html/2501.12618)]
4. **Can feedback-guided mutation compensate for timeline-coverage blindness?** Tamias argues that integrating mutation with systematic exploration improves large-search-space testing, but whether it repairs timeline-coverage blindspots remains open.[[cs.purdue](https://www.cs.purdue.edu/homes/pfonseca/papers/sosp26-tamias.pdf)]
5. **Should testing feedback be based on timeline similarity, semantic reads-from relations, or both?** RFF’s semantic feedback and timeline-based distributed-system feedback represent competing design points that have not been directly compared on JVM workloads.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]
6. **Can DSTest-style controlled scheduling be ported to JVM applications without distorting real concurrency behavior?** DSTest provides a general scheduler framework for distributed systems, but its transferability to JVM heap, lock, and runtime scheduling semantics is unresolved.[[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)][[arxiv](https://arxiv.org/html/2501.12618)]

**Bottom line:** Current evidence supports the claim that schedule-exploration strategy and semantic feedback affect concurrency-fault detection, but it does **not** validate timeline coverage as a proxy for fault detection in controlled JVM concurrency testing. The central gap is the absence of a controlled, JVM-specific study that separates timeline coverage from semantic interleaving coverage, schedule count, scheduler algorithm, and fault-oracle strength.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[arxiv](https://arxiv.org/html/2501.12618)][[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]

# ЦІКАВЕ 

**Should testing feedback be based on timeline similarity, semantic reads-from relations, or both?** RFF’s semantic feedback and timeline-based distributed-system feedback represent competing design points that have not been directly compared on JVM workloads.[[comp.nus.edu](https://www.comp.nus.edu.sg/~umathur/publications/2024-asplos-wolff-rff-greybox-concurrency-fuzzing/)][[repository.tudelft](https://repository.tudelft.nl/file/File_09f2fd98-8a44-402c-ada6-c329fc43f5fe)]

**Can DSTest-style controlled scheduling be ported to JVM applications without distorting real concurrency behavior?** DSTest provides a general scheduler framework for distributed systems, but its transferability to JVM heap, lock, and runtime scheduling semantics is unresolved.[[joao.neto](https://joao.neto.pt/assets/publications/2024-issta-gulcan.pdf)][[arxiv](https://arxiv.org/html/2501.12618)]

**The interleaving space is exponentially large.** ASPLOS 2024’s greybox-fuzzing work explicitly frames concurrency bug detection as difficult because thread interleavings grow exponentially.acm+1