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

# PROMPT 1

> DATE: 08.11.2026

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

# ANSWER 1

> DATE: 08.11.2026

## Research profile and scope

Your profile suggests a particularly useful research intersection:

Empirical software engineering + Android engineering + JVM/Kotlin ecosystem + software quality.

The important distinction is that your thesis does not need to produce a new application. It should investigate a phenomenon, compare approaches, evaluate a technique, or establish empirical evidence about software systems.

Your available resources make several forms of experimental research realistic:

- Mining open-source repositories and analyzing source code with Python.
    
- Running controlled experiments on Android applications.
    
- Evaluating static-analysis, testing, and profiling tools.
    
- Studying Kotlin and Java codebases using reproducible datasets.
    
- Building a small prototype when necessary to test a research hypothesis.
    

Your workstation is adequate for repository mining, static analysis, statistical experiments, and Android emulation. Some experiments, particularly energy consumption and hardware-specific performance, require a physical Android device.

I have deliberately excluded web application engineering, generative AI, and garbage-collector comparisons.

## A. Landscape map

## 1. Eight research subdomains

These are research areas, not proposed thesis topics.

|Research subdomain|Main research concern|Evidence maturity|Experimental suitability|
|---|---|---|---|
|1. Android testing and test quality|How effective are existing testing practices?|Mature / developing|Excellent|
|2. Automated GUI testing|How reliably can Android applications be explored and tested automatically?|Developing|Excellent|
|3. Android compatibility and fragmentation|How do OS versions and device configurations affect application correctness?|Mature / developing|Very good|
|4. Performance and energy efficiency|How do implementation decisions affect startup, responsiveness and energy consumption?|Developing|Very good, hardware dependent|
|5. Mobile security and privacy analysis|How effectively can vulnerabilities and privacy-related data flows be detected?|Mature / developing|Very good|
|6. Kotlin/Java evolution and maintainability|How does language adoption and code evolution affect software quality?|Developing|Excellent|
|7. Kotlin concurrency and coroutine correctness|What causes asynchronous and lifecycle-related bugs?|Emerging / developing|Excellent|
|8. Android accessibility engineering|How reliably can accessibility problems in native interfaces be detected?|Developing / emerging|Very good|

### 1. Android testing and test quality

Central research question: Are Android applications adequately tested, and what characteristics distinguish effective test suites from ineffective ones?

Research concerns include test coverage, test smells, unit versus integration testing, testing adoption, mutation testing, test maintenance and test effectiveness.

An especially relevant publication is:

Why Android Testing Falls Short: Empirical Insights from Open-Source Projects and a Practitioner Survey (2025), published in Empirical Software Engineering.

It examines thousands of open-source Android applications and investigates test presence, coverage, test smells and developer practices. It provides an empirical baseline rather than leaving this area unexplored. Its replication package is also available.

doi.org+2

Why this area matters: You can perform controlled experiments without recruiting participants or obtaining proprietary data.

### 2. Automated GUI testing

Central research question: Can automated tools discover meaningful application failures, rather than simply execute large numbers of UI actions?

Research problems include:

- GUI state exploration.
    
- Input generation.
    
- Navigation and activity coverage.
    
- Test-oracle construction.
    
- Context-dependent behaviour.
    
- Crashes and failures that require particular sequences of actions.
    

A relevant direction is GUI-level invariants: rules describing properties that should remain true during GUI execution. Research published in Information and Software Technology in 2025 investigates their extraction and use as test oracles. Another example, CamDroid, evaluates context-aware GUI exploration on 20 applications.

sciencedirect.com+1

This is more scientifically interesting than simply implementing a UI automation script because the central question concerns test effectiveness.

### 3. Android compatibility and fragmentation

Central research question: How can application correctness be tested across different Android configurations without testing every possible configuration?

Important dimensions include Android API level, manufacturer-specific behaviour, screen size, hardware capabilities, permissions, device configuration and lifecycle behaviour.

CompatDroid is a particularly relevant reference. Its research evaluates device-selection strategies using 46 benchmark applications across 14 SDK versions and a larger dataset of 645 applications.

onlinelibrary.wiley.com

The area is already established, so a new experiment would need to examine a particular limitation, updated environment or evaluation criterion.

### 4. Performance and energy efficiency

Central research question: How do software implementation and runtime optimizations affect measurable application performance and energy usage?

Important measurements include:

- Application startup latency.
    
- Frame rendering and UI jank.
    
- CPU and memory usage.
    
- Execution time.
    
- Energy consumption.
    
- Performance under different workloads.
    

A significant 2025 contribution is EDATA, presented at MOBILESoft 2025. It introduces method-level energy measurement for Android applications. Its evaluation also identifies inconsistent energy results across devices and inconsistent effects of debug mode.

MOBILESoft 2025+2

This creates a research area involving measurement reliability, optimization trade-offs and reproducibility.

Constraint: Your RTX 3060 does not replace a physical Android device for meaningful battery and hardware-level energy experiments.

### 5. Mobile security and privacy analysis

Central research question: What security and privacy problems exist in Android software, and how reliably can automated analysis detect them?

Research includes:

- Static and dynamic taint analysis.
    
- Permission usage.
    
- Inter-component communication (ICC).
    
- Sensitive data flows.
    
- Third-party SDK behaviour.
    
- Data disclosure accuracy.
    
- Application dependency vulnerabilities.
    

A particularly current example is A Study of Privacy-Related Data Collected by Android Apps, published in Automated Software Engineering in January 2026.

The authors investigate privacy-related data collection in 7,500 Android applications and compare extracted information with data-safety disclosures. The research also provides an artifact for further analysis.

Springer Nature Link+1

This is an active research area with existing tools and datasets. Its value for you lies in carefully defined experiments, not in inventing a new security scanner without an evaluated research contribution.

### 6. Kotlin/Java evolution and maintainability

Central research question: Does using Kotlin instead of Java actually improve software quality in real projects, and under which conditions?

Research includes:

- Java-to-Kotlin migration.
    
- Mixed Java/Kotlin projects.
    
- Maintainability metrics.
    
- Code complexity.
    
- Code duplication.
    
- Technical debt.
    
- Software evolution.
    
- Defect proneness.
    

A highly relevant 2025 Journal of Systems and Software study, Kotlin Assimilating the Android Ecosystem: An Appraisal of Diffusion and Impact on Maintainability, investigates 2,708 open-source Android applications from F-Droid.

It reports that Kotlin adoption has increased and finds associations between exclusive Kotlin use and improvements in the maintainability metrics examined. It also makes its research data available through a replication package.

sciencedirect.com+1

This is important because it demonstrates that the broad Java-versus-Kotlin maintainability question already has empirical research behind it.

### 7. Kotlin concurrency and coroutine correctness

Central research question: What kinds of concurrency bugs occur in Kotlin applications, and why are they difficult to detect?

Relevant phenomena include:

- Coroutine cancellation.
    
- Structured concurrency.
    
- Race conditions.
    
- Incorrect dispatcher usage.
    
- Shared-state access.
    
- Lifecycle-related asynchronous operations.
    
- Lost or duplicated operations.
    
- Incorrect exception propagation.
    

A directly relevant ECOOP 2024 paper, Understanding Concurrency Bugs in Real-World Programs with Kotlin Coroutines, analyzes 55 bug cases from seven open-source repositories. It identifies coroutine-specific bug patterns and discusses possible automated detection strategies.

drops.dagstuhl.de+1

This is particularly compatible with your Java/Kotlin experience and your preference for experimental research.

### 8. Android accessibility engineering

Central research question: How well can automated tools detect accessibility defects in native Android applications?

Relevant aspects include:

- Missing or inadequate accessibility labels.
    
- Incorrect semantic properties.
    
- Touch target dimensions.
    
- Text contrast.
    
- Navigation order.
    
- Screen-reader compatibility.
    
- Differences between traditional Android Views and Jetpack Compose.
    

Android officially provides Compose accessibility testing APIs and integration with the Accessibility Test Framework. However, automated detection does not replace testing with actual accessibility services.

developer.android.com

A 2026 research direction, A11yArgus, combines dynamic exploration and interface analysis for detecting accessibility issues in Android applications.

CHASE 2026

This area permits controlled technical experiments without necessarily recruiting participants, although claims about actual user experience would require user-based validation.

## 2. Initial assessment of the research landscape

Interpretation of the reviewed publications, not a systematic-literature-review conclusion.

Strongest methodological fit

## Testing, concurrency, repository mining

Public source code, reproducible experiments and relatively low infrastructure requirements.

Strongest connection to current technology changes

## Kotlin evolution and Jetpack Compose

Modern compiler, UI and multiplatform changes provide evolving experimental contexts.

Strongest measurement-oriented area

## Performance and energy efficiency

Good scientific questions, but physical-device access and measurement reproducibility are important constraints.

Strongest security-oriented area

## Privacy and dependency security

Significant public research activity and potentially reusable datasets, but corpus access and analysis complexity must be controlled.

## B. Problem list

The following are 15 significant research problems. They are phrased as problems to investigate, not as thesis titles.

## 1. Testing and automated quality assurance

|ID|Research problem|Scientific significance|
|---|---|---|
|P1|The presence of tests does not necessarily indicate that an application is adequately tested.|Test existence and test effectiveness are different constructs.|
|P2|Test smells and poorly maintained tests may reduce the reliability of test suites.|Relationship between test design, maintainability and fault detection requires empirical evaluation.|
|P3|Automated GUI tests struggle to determine whether the application's behaviour is actually correct.|The test-oracle problem remains important even when exploration coverage is high.|
|P4|Automated exploration may fail to discover defects requiring particular event sequences or input contexts.|Test generation strategies need controlled evaluation against known faults.|
|P5|Mobile test results may depend on Android versions, application state and execution environment.|Reproducibility and test flakiness affect the validity of quality assurance.|

For P1 and P2, the 2025 empirical study provides a useful starting point: it reports that 1,579 of 5,183 analyzed applications had test suites with non-zero statement coverage under its definition of meaningful tests. Importantly, different sections of the article report inconsistent percentages, so the replication package and original denominators should be checked rather than simply repeating its summary percentage.

Springer Nature Link+2

## 2. Compatibility and fragmentation

|ID|Research problem|Scientific significance|
|---|---|---|
|P6|Testing every device and Android version is expensive.|Test selection must balance resource consumption and fault detection.|
|P7|Code coverage across Android configurations might not represent behavioural compatibility.|Coverage is an imperfect proxy for application correctness.|

The distinction in P7 is particularly important. Two test strategies may achieve similar code coverage while detecting different numbers of compatibility failures.

## 3. Performance and energy efficiency

|ID|Research problem|Scientific significance|
|---|---|---|
|P8|Energy and performance measurements may not be reproducible across devices.|Measurement validity and experimental controls need investigation.|
|P9|Performance optimizations may improve one quality attribute while worsening another.|The relationships between startup time, responsiveness, CPU utilization and energy consumption require measurement.|

EDATA's 2025 findings provide direct motivation for P8: energy efficiency was not necessarily consistent between devices.

research.tudelft.nl+1

## 4. Security and privacy

|ID|Research problem|Scientific significance|
|---|---|---|
|P10|Static analysis may identify potential privacy leaks that do not necessarily occur at runtime.|Precision, recall and execution context matter.|
|P11|Applications may collect or expose data differently from what their privacy disclosures indicate.|There is an empirical consistency problem between implementation and declared behaviour.|
|P12|Vulnerabilities in transitive dependencies can expose otherwise unaffected applications.|Security risk propagates through dependency networks.|

A 2026 study on privacy-related data collection and a 2025 study of Maven dependency vulnerabilities demonstrate that these problems have substantial recent research activity.

Springer Nature Link+1

## 5. Kotlin and asynchronous programming

|ID|Research problem|Scientific significance|
|---|---|---|
|P13|Kotlin adoption and Java-to-Kotlin migration may not produce uniform maintainability improvements.|Confounding variables and project context affect empirical conclusions.|
|P14|Coroutine cancellation, asynchronous execution and lifecycle interactions can produce subtle defects.|Existing correctness assumptions need empirical examination.|
|P15|Automated accessibility checks may fail to detect some interface-level defects, particularly those involving semantics and navigation.|The validity and completeness of automated accessibility assessments need evaluation.|

The Kotlin coroutine research of 2024 and Android accessibility research of 2026 provide examples of existing approaches to P14 and P15.

drops.dagstuhl.de+1

## 6. Scientific problems versus ordinary implementation tasks

This distinction is essential for Master's thesis approval.

|Ordinary implementation task|Corresponding scientific problem|
|---|---|
|Add unit tests to an Android application.|Determine whether specific testing practices improve fault-detection effectiveness.|
|Build a UI automation tool.|Compare exploration strategies under controlled execution budgets and known faults.|
|Upgrade an application to Kotlin.|Investigate how migration affects maintainability, defects and development effort.|
|Implement a static security scanner.|Evaluate detection accuracy, false-positive rates and generalization across applications.|
|Optimize application startup.|Measure the trade-offs between optimization techniques across workloads and devices.|
|Add a dependency vulnerability checker.|Characterize vulnerability propagation through real application dependency graphs.|
|Migrate an application from Views to Compose.|Investigate how migration affects performance, accessibility or testing effectiveness.|
|Add coroutine-based background processing.|Study concurrency failure patterns and the effectiveness of detection strategies.|
|Implement accessibility checks.|Establish how accurately automated checks detect independently verified accessibility defects.|

The rule: A prototype is not automatically a research contribution.

For experimental research, you need at least:

1. A phenomenon or problem worth investigating.
    
2. A research question.
    
3. An experimental method.
    
4. A measurable outcome.
    
5. A comparison, baseline or control.
    
6. A defensible interpretation of the results.
    

For example, implementing a tool that detects coroutine problems is engineering. Demonstrating which classes of coroutine problems it can detect, where it fails, and how it compares with existing approaches is research.

# C. Terminology matrix

This section is particularly important when searching scientific databases. Academic terminology often differs considerably from terminology used by developers.

|Research domain|Primary academic terminology|Synonyms and related terms|
|---|---|---|
|Test quality|Software test effectiveness|Test adequacy, test quality, fault detection, test suite effectiveness|
|Test coverage|Structural coverage|Statement coverage, branch coverage, API coverage, activity coverage|
|GUI testing|Automated GUI testing|Mobile GUI testing, UI testing, event-based testing|
|GUI correctness|Test oracle problem|GUI oracle, test oracle generation, GUI invariants|
|Automated exploration|Model-based testing|UI exploration, state-space exploration, event sequence generation|
|Test instability|Flaky tests|Non-deterministic tests, test flakiness, test instability|
|Android fragmentation|Device fragmentation|Platform fragmentation, device diversity, configuration diversity|
|Compatibility|Mobile compatibility testing|Cross-version testing, API-level compatibility, configuration testing|
|Test optimization|Test suite minimization|Test selection, combinatorial testing, covering arrays|
|Application performance|Mobile performance engineering|Startup latency, execution time, rendering performance|
|Energy|Energy-aware software engineering|Software energy consumption, power profiling, energy efficiency|
|Kotlin adoption|Programming language migration|Java-to-Kotlin migration, language transition, mixed-language projects|
|Maintainability|Software maintainability|Maintainability index, code quality, technical debt, code smells|
|Kotlin concurrency|Asynchronous programming correctness|Coroutine bugs, structured concurrency, cancellation errors|
|Concurrency|Concurrency defect analysis|Race conditions, deadlocks, data races, synchronization errors|
|Security analysis|Static program analysis|Static taint analysis, data-flow analysis, information-flow analysis|
|Mobile privacy|Mobile application privacy analysis|Sensitive data collection, privacy leakage, privacy disclosure|
|Component communication|Inter-component communication|ICC, intent analysis, component interaction|
|Supply chain|Software supply-chain security|Software composition analysis, SCA, dependency vulnerability analysis|
|Dependency analysis|Dependency graph analysis|Direct dependencies, transitive dependencies, vulnerability propagation|
|Accessibility|Mobile accessibility testing|A11y testing, accessibility conformance, accessibility defect detection|
|Compose|Declarative UI quality|Jetpack Compose testing, Compose semantics, recomposition performance|

## Especially useful academic vocabulary

I would prioritize learning these concepts because they allow you to formulate research questions in a more precise way.

Experimental design

- Independent variable
    
- Dependent variable
    
- Control variable
    
- Confounding variable
    
- Treatment group
    
- Baseline
    
- Experimental validity
    
- Internal validity
    
- External validity
    
- Construct validity
    
- Reproducibility
    
- Statistical significance
    
- Effect size
    

Empirical software engineering

- Mining Software Repositories (MSR)
    
- Empirical Software Engineering (ESE)
    
- Controlled experiment
    
- Case study
    
- Replication study
    
- Longitudinal study
    
- Secondary data analysis
    
- Quantitative analysis
    
- Fault localization
    
- Defect prediction
    

Software quality

- Fault proneness
    
- Maintainability
    
- Reliability
    
- Robustness
    
- Test effectiveness
    
- Technical debt
    
- Software evolution
    
- Quality attributes
    
- Performance regression
    

These concepts will help you distinguish a research contribution from an engineering deliverable.

# D. Emerging research directions (2024–2026)

This section distinguishes genuine technological changes from scientific claims about their consequences.

## 1. Kotlin compiler modernization

Verified technology development

Kotlin 2.0 introduced the stable K2 compiler on May 21, 2024.

This is relevant to compiler behaviour, language tooling, migration, static analysis and build ecosystems.

Kotlin Documentation

Potential research dimensions:

- Differences in compiler diagnostics.
    
- Compiler-related build failures.
    
- Static-analysis compatibility.
    
- Effects of compiler upgrades on existing projects.
    
- Language tooling and code analysis.
    

A compiler upgrade alone is not a research contribution. Its measurable effects are what matter.

## 2. Kotlin Multiplatform becoming production-ready

Emerging application context

There have been substantial changes in the Kotlin Multiplatform ecosystem.

Notable developments include:

- Kotlin Multiplatform's production-ready status.
    
- Google support for sharing business logic between Android and iOS.
    
- Compose Multiplatform for iOS reaching stable status in 2025.
    

    The JetBrains Blog+1

    

JetBrains' 2026 industry report also describes increasing adoption of Kotlin Multiplatform. These adoption statistics are vendor-associated survey and industry evidence, not independent experimental proof of superior software quality.

The Kotlin Report

Potential research dimensions include code sharing, platform-specific defects, maintainability and performance trade-offs.

This is an adjacent research direction rather than an obvious first choice, because meaningful Android/iOS experiments require access to both platforms.

## 3. Jetpack Compose as an experimental context

Verified technology development

Compose is an important contemporary research context because UI development, testing, accessibility and performance are increasingly being addressed through declarative interfaces.

Three particularly relevant directions are:

- Compose versus traditional Views in performance evaluation.
    
- Compose semantic properties and accessibility testing.
    
- Automated testing of state-driven UI behaviour.
    

Android's current documentation describes hero benchmarks for comparing Compose and Views. It reports equivalent scrolling jank rates for Compose 1.9 and later in its benchmark scenario. This is a vendor-provided benchmark result, not a universal conclusion about every application.

Android Developers

## 4. Baseline Profiles and profile-guided optimization

Android's Baseline Profiles use ahead-of-time compilation to optimize important code paths.

Google documents performance improvements of approximately 30% in code execution speed for included paths from the first launch, subject to application and workload characteristics. Macrobenchmark is recommended for evaluating application-specific results.

Android Developers

This introduces interesting research questions about:

- Startup performance.
    
- Rendering responsiveness.
    
- Optimization effectiveness.
    
- Regression detection.
    
- Performance versus energy consumption.
    

## 5. Greater attention to software energy measurement

Developing research direction

EDATA (2025) is an important example of the movement toward method-level energy measurement and more precise energy-debugging techniques.

The fact that energy results may differ across devices makes experimental reproducibility especially important.

TU Delft Research Portal

The important research direction is not simply making applications consume less energy. It is understanding how to measure, compare and explain energy consumption reliably.

## 6. More sophisticated mobile GUI testing

Recent research includes context-aware exploration and explicit GUI-level test oracles.

A related 2025 systematic mapping study examines 27 primary studies concerning mobile application testing infrastructures. Another 2025 study evaluates GUI-level invariants as test oracles.

sciencedirect.com+1

This suggests several relevant themes:

- Context-aware testing.
    
- Test-oracle generation.
    
- GUI state exploration.
    
- Input generation.
    
- Testing infrastructure reproducibility.
    

## 7. Privacy analysis at application scale

The January 2026 privacy study illustrates a research direction toward analyzing data collection at the application level, considering both source-code and user-interface information.

It also highlights the difficulty of determining precisely what data an application collects and whether that collection is accurately disclosed.

Springer Nature Link+1

## 8. Dependency networks and vulnerability propagation

Developing research direction

The 2025 MSR research on Maven vulnerabilities investigates 14,459,139 releases and reports substantial propagation through transitive dependencies.

This is particularly relevant because Android projects commonly use Gradle with Maven-based dependency repositories.

MSR 2025+1

Possible experimental dimensions include dependency graph structure, vulnerability exposure, remediation delay and the difference between direct and transitive dependencies.

## 9. Accessibility automation

Compose accessibility testing has become more integrated with the standard Android testing ecosystem. Android documentation describes automated checks using the Accessibility Test Framework starting with Compose 1.8.0.

developer.android.com

The 2026 A11yArgus research provides an example of combining UI exploration and interface analysis to detect accessibility problems.

CHASE 2026

An interesting distinction is between defects detectable from interface metadata and defects that only become apparent through real assistive-technology interaction.

# E. Candidate research-gap hypotheses

All ten are provisional hypotheses, not established research gaps.

The important task at this stage is to determine where a meaningful contribution might exist. Recent studies demonstrate that several broad problems are already being investigated. We should therefore look for narrower evidence, context, methodological, measurement and generalization gaps.

I would investigate the following hypotheses.

## H1. Test quality in modern Kotlin Android applications

High feasibility

Gap classification: Context gap / generalization gap.

Hypothesis: Existing empirical findings about Android test quality may not fully characterize applications using modern Kotlin development practices, particularly Jetpack Compose.

The 2025 study of Android testing provides a large-scale baseline, but this does not itself establish whether particular findings hold across Compose-based and traditional Views-based projects.

DOI+1

Evidence needed to verify:

1. Obtain the 2025 testing study's replication package.
    
2. Identify whether Compose usage can be reliably classified.
    
3. Find additional actively maintained Kotlin Android repositories.
    
4. Compare test presence, coverage, test smells and testing frameworks between project groups.
    
5. Control for project size, age, activity and other relevant confounders.
    
6. Search for other studies already conducting this comparison.
    

Evidence supporting the hypothesis: A reproducible difference remains after controlling for project characteristics, and previous research has not adequately examined it.

Evidence rejecting the hypothesis: Existing studies already establish the same result under comparable conditions, or observed differences disappear after controlling for confounding variables.

## H2. The relationship between GUI exploration coverage and actual fault detection

High feasibility

Gap classification: Measurement gap / methodological gap.

Hypothesis: Higher GUI exploration coverage does not necessarily result in better fault-detection effectiveness.

A test generator may explore many activities and screen states while failing to detect important behavioural defects.

Existing research on GUI invariants and context-aware GUI exploration provides a starting point.

sciencedirect.com+1

Evidence needed to verify:

- Compare different automated GUI exploration strategies.
    
- Use the same applications and execution budget.
    
- Introduce controlled faults or use known reproducible faults.
    
- Measure activity and transition coverage.
    
- Measure detected faults, false positives and execution time.
    
- Investigate the relationship between coverage and fault detection.
    

Evidence supporting the hypothesis: Two strategies produce comparable coverage but significantly different fault-detection effectiveness.

Evidence rejecting the hypothesis: Coverage reliably predicts fault detection in the tested settings, or existing benchmarks have already established the claimed relationship.

## H3. Test flakiness across Android configurations

High feasibility

Gap classification: Evidence gap / generalization gap.

Hypothesis: Android instrumentation and GUI tests exhibit configuration-dependent instability that cannot be adequately characterized by a single successful test execution.

Potential factors include:

- Android API level.
    
- UI animation.
    
- Application lifecycle.
    
- Background execution.
    
- Timing and asynchronous operations.
    
- Application state.
    
- Network availability.
    

Evidence needed to verify:

1. Collect test suites from open-source applications.
    
2. Execute tests repeatedly under controlled configurations.
    
3. Compare at least two or three Android API levels.
    
4. Identify tests that pass and fail inconsistently.
    
5. Classify causes of instability.
    
6. Determine whether retries conceal genuine failures.
    

Metrics could include test flakiness rate, reproducibility, failure frequency and test execution time.

Evidence supporting the hypothesis: A measurable and reproducible relationship exists between particular environmental conditions and test instability.

Evidence rejecting the hypothesis: The effect is negligible or already adequately characterized by existing reproducible studies.

## H4. Confounding factors in Java-to-Kotlin maintainability research

High feasibility

Gap classification: Methodological gap / replication gap.

Hypothesis: Some reported maintainability improvements associated with Kotlin adoption may be explained partly by project characteristics rather than language choice itself.

The 2025 study of 2,708 Android applications reports positive associations between exclusive Kotlin use and its selected maintainability metrics.

sciencedirect.com

However, empirical associations are not equivalent to causal effects.

Possible confounding factors include:

- Project age.
    
- Project size.
    
- Number of contributors.
    
- Development activity.
    
- Architectural changes.
    
- Changes in coding conventions.
    
- Differences in application complexity.
    

Evidence needed to verify:

- Obtain the published replication package.
    
- Identify repositories with Java-to-Kotlin migration histories.
    
- Analyze projects before and after migration.
    
- Where possible, identify comparable projects without migration.
    
- Use matched comparisons or longitudinal statistical methods.
    
- Compare multiple maintainability measures rather than relying on one metric.
    

Evidence supporting the hypothesis: The observed association changes materially after controlling for project characteristics or migration-related changes.

Evidence rejecting the hypothesis: The existing results remain robust under stronger controls and alternative measurements.

## H5. Android lifecycle interactions in Kotlin coroutine bugs

High–moderate feasibility

Gap classification: Context gap / evidence gap.

Hypothesis: Android applications exhibit coroutine failure patterns associated with lifecycle management that deserve separate empirical characterization.

The ECOOP 2024 research establishes that coroutine-specific concurrency bugs exist and analyzes 55 real-world bug cases across seven repositories. However, the abstract does not establish the extent to which Android lifecycle-specific cases are represented.

drops.dagstuhl.de+1

Potential phenomena:

- Coroutines surviving after an Activity or ViewModel is no longer relevant.
    
- Incorrect cancellation propagation.
    
- Stale asynchronous results.
    
- Race conditions between UI state updates.
    
- Incorrect use of coroutine scopes.
    
- Background operations continuing unexpectedly.
    

Evidence needed to verify:

1. Inspect the existing 55 bug cases and their repository distribution.
    
2. Identify active Kotlin Android repositories with issue and commit histories.
    
3. Extract bug-fixing commits related to coroutine behaviour.
    
4. Classify the defects using a reproducible taxonomy.
    
5. Reproduce a subset of defects.
    
6. Compare discovered patterns with the existing taxonomy.
    

Evidence supporting the hypothesis: Reproducible Android-specific patterns emerge that are insufficiently described by the existing corpus.

Evidence rejecting the hypothesis: Existing classifications cover the observed patterns without meaningful additions.

## H6. Performance versus energy trade-offs of Android optimization techniques

Requires physical Android device

Gap classification: Measurement gap / cost-efficiency gap.

Hypothesis: Techniques that improve Android startup or rendering performance do not necessarily produce equivalent improvements in energy efficiency.

Relevant existing work includes EDATA and Android Baseline Profiles. EDATA identifies measurement inconsistencies, while Android documentation describes performance gains from profile-guided optimization.

TU Delft Research Portal+1

Evidence needed to verify:

- Use identical application workloads.
    
- Compare an unoptimized and optimized configuration.
    
- Measure startup latency, rendering performance, CPU usage and energy.
    
- Repeat experiments on the same physical device.
    
- Where possible, repeat on another device.
    
- Control battery level, brightness, temperature, network and background processes.
    

Evidence supporting the hypothesis: Performance and energy measurements exhibit different responses to the optimization treatment.

Evidence rejecting the hypothesis: The selected optimization consistently improves both dimensions without a meaningful trade-off under controlled conditions.

This hypothesis becomes substantially less attractive if you cannot access a physical Android device.

## H7. Privacy-analysis reliability around third-party components

Moderate feasibility

Gap classification: Measurement gap / safety and reliability gap.

Hypothesis: Static privacy analysis may have difficulty attributing sensitive data flows that cross application and third-party library boundaries.

The January 2026 privacy study provides a significant starting point: it investigates 7,500 applications and includes analysis of discrepancies in data-safety reporting.

Springer Nature Link+1

Evidence needed to verify:

1. Obtain the existing privacy-analysis artifacts.
    
2. Identify applications with identifiable third-party dependencies.
    
3. Examine data flows involving application code and libraries.
    
4. Compare static results with selected dynamic observations.
    
5. Examine whether attribution changes when third-party libraries are considered separately.
    
6. Compare the resulting classifications with available disclosures.
    

Evidence supporting the hypothesis: A reproducible class of data flows is systematically missed or incorrectly attributed.

Evidence rejecting the hypothesis: Existing tools and datasets already handle these boundaries with adequate accuracy.

This area has a relatively high technical setup cost.

## H8. Vulnerability propagation in real Android Gradle dependency graphs

High–moderate feasibility

Gap classification: Context gap / generalization gap.

Hypothesis: Vulnerability statistics for the overall Maven ecosystem may not accurately represent actual security exposure in Android application dependency graphs.

The 2025 MSR research on Maven dependency vulnerabilities examines millions of releases and provides a strong foundation.

MSR 2025+1

Evidence needed to verify:

- Collect Gradle dependency graphs from Android repositories.
    
- Identify direct and transitive dependencies.
    
- Correlate package versions with OSV and CVE information.
    
- Examine vulnerability severity and remediation status.
    
- Compare Android-project exposure with broader Maven ecosystem findings.
    

Potential metrics include:

- Vulnerable dependency proportion.
    
- Transitive dependency exposure.
    
- Time between vulnerability disclosure and remediation.
    
- Dependency depth.
    
- Number of affected projects.
    

Evidence supporting the hypothesis: Android applications exhibit distinctive dependency-risk patterns that cannot be inferred from aggregate Maven results.

Evidence rejecting the hypothesis: Comparable results have already been established for Android Gradle applications.

## H9. Whether compatibility-test selection preserves behavioural fault detection

High–moderate feasibility

Gap classification: Measurement gap / generalization gap.

Hypothesis: Android test-configuration selection methods may reduce testing costs while preserving code coverage, but this does not necessarily preserve behavioural fault detection.

CompatDroid provides evidence that selecting a smaller set of SDK versions can retain much of the measured code coverage.

onlinelibrary.wiley.com

The key question is whether that result generalizes to real application failures.

Evidence needed to verify:

1. Identify a suitable set of Android applications.
    
2. Compare exhaustive and reduced configuration testing.
    
3. Apply controlled compatibility faults or known defects.
    
4. Measure test execution cost.
    
5. Measure missed failures and retained fault detection.
    
6. Compare results with code coverage alone.
    

Evidence supporting the hypothesis: A reduced matrix achieves similar coverage but misses more compatibility faults.

Evidence rejecting the hypothesis: The selection method preserves both coverage and fault detection under the examined conditions.

## H10. Reliability of automated accessibility assessment in Compose applications

Moderate feasibility

Gap classification: Measurement gap / generalization gap.

Hypothesis: Different accessibility testing approaches have complementary detection capabilities, and their effectiveness may differ between traditional Android Views and Jetpack Compose.

Android offers automated accessibility checks for Compose, while recent independent work has investigated broader Android accessibility detection.

Android Developers+1

Evidence needed to verify:

- Select applications using Views and Compose.
    
- Run existing automated accessibility checks.
    
- Independently review a sample of findings.
    
- Establish a manually verified reference set.
    
- Calculate precision, recall and F1.
    
- Classify false positives and false negatives by issue category.
    

Evidence supporting the hypothesis: Certain issue types are reliably missed by one approach but detected by another, or detection performance differs systematically between UI technologies.

Evidence rejecting the hypothesis: Existing approaches achieve comparable and sufficiently complete detection under a representative evaluation.

## Gap hypothesis summary

|ID|Possible contribution area|Gap type|Feasibility|
|---|---|---|---|
|H1|Test quality in Compose/Kotlin applications|Context|High|
|H2|GUI coverage versus fault detection|Measurement|High|
|H3|Android test flakiness|Evidence|High|
|H4|Confounding factors in Kotlin maintainability|Methodological|High|
|H5|Coroutine and lifecycle bug patterns|Context|High–moderate|
|H6|Performance and energy trade-offs|Measurement|Conditional|
|H7|Privacy analysis across third-party components|Reliability|Moderate|
|H8|Android Gradle dependency vulnerabilities|Context|High–moderate|
|H9|Compatibility selection versus behavioural correctness|Measurement|High–moderate|
|H10|Accessibility detection in Compose and Views|Measurement|Moderate|

My methodological observation: H1–H5 are particularly compatible with your current resources. They can use public repositories, repeatable execution environments and quantitative metrics. H6 has interesting scientific potential but depends on physical hardware.

None of these ten has been established as a novel gap. The purpose is to identify hypotheses worth investigating through a more systematic search.

# F. Search terms and research resources

## 1. Recommended scientific databases

These are the databases I would use for the next literature-review stage.

|Database|Main purpose|
|---|---|
|ACM Digital Library|Software engineering, testing, mobile development|
|IEEE Xplore|Mobile software, security, testing and performance|
|SpringerLink|Empirical software engineering and software quality|
|ScienceDirect|Software engineering and information technology|
|Google Scholar|Broad literature discovery and citation tracking|
|arXiv|Early research developments; distinguish preprints from peer-reviewed work|

Useful publication venues and communities:

- ICSE — International Conference on Software Engineering.
    
- FSE — ACM International Conference on the Foundations of Software Engineering.
    
- ASE — Automated Software Engineering.
    
- ISSTA — International Symposium on Software Testing and Analysis.
    
- MOBILESoft — Mobile Software Engineering and Systems.
    
- MSR — Mining Software Repositories.
    
- ECOOP — European Conference on Object-Oriented Programming.
    
- ESEM — Empirical Software Engineering and Measurement.
    

These venues are especially relevant to your experimental preferences.

## 2. Search-query library

The following queries are designed to be reusable in Google Scholar, ACM Digital Library, IEEE Xplore and other academic databases.

### Testing and GUI automation

```

("Android application testing" OR "mobile application testing")
AND
("test effectiveness" OR "test adequacy" OR "fault detection")
AND
(2024 OR 2025 OR 2026)
```

```

("Android GUI testing" OR "mobile GUI testing")
AND
("test oracle" OR "GUI invariants" OR "model-based testing")
AND
(coverage OR effectiveness OR reliability)
```

```

("Android test flakiness" OR "mobile test instability")
AND
("API level" OR "device fragmentation" OR "configuration diversity")
```

### Kotlin and Java

```

("Java to Kotlin migration" OR "Kotlin adoption")
AND
("software maintainability" OR "code quality" OR "technical debt")
AND
(empirical OR longitudinal OR quantitative)
```

```

("Kotlin coroutines" OR "structured concurrency")
AND
("concurrency bugs" OR "cancellation" OR "race conditions")
AND
("Android" OR "mobile applications")
```

```

("Kotlin Android" OR "Android Kotlin")
AND
("lifecycle" OR "asynchronous programming")
AND
("bug analysis" OR "software reliability" OR "program analysis")
```

### Performance and energy

```

("Android energy consumption" OR "mobile energy profiling")
AND
("measurement" OR "reproducibility" OR "benchmarking")
```

```

("Android application performance")
AND
("Baseline Profiles" OR "profile-guided optimization")
AND
("startup latency" OR "energy efficiency" OR "rendering performance")
```

### Security and privacy

```

("Android privacy analysis" OR "Android data-flow analysis")
AND
("static analysis" OR "dynamic analysis" OR "taint analysis")
AND
("precision" OR "recall" OR "false positives")
```

```

("Android application security")
AND
("third-party libraries" OR "transitive dependencies")
AND
("vulnerability propagation" OR "software supply chain")
```

### Accessibility

```

("Android accessibility testing")
AND
("automated detection" OR "accessibility defects")
AND
("Jetpack Compose" OR "Android Views")
```

## 3. Datasets and benchmarks

This is an important part of your situation: you currently have no proprietary data, no respondents and no organizational access.

Fortunately, several public research resources are available.

|Resource|Contents|Potential research use|
|---|---|---|
|F-Droid|Open-source Android applications and source repositories|Testing, maintainability, compatibility|
|GitHub|Kotlin and Java repositories, commits, issues and tests|Repository mining, concurrency and dependency research|
|AndroZoo|Large collection of Android APKs and metadata|Security and privacy|
|DroidBench|Android test applications for taint analysis|Static-analysis evaluation|
|MH-1M|1,340,515 Android application samples|Security research|
|Open Source Vulnerabilities (OSV)|Vulnerabilities associated with package versions|Dependency security|
|Mendeley Data|Published mobile energy dataset|Secondary energy analysis|

### More detailed assessment

F-Droid

Probably one of your most useful resources.

You can obtain Android source code, inspect Gradle configuration, investigate language composition, analyze tests and inspect project evolution.

The 2025 Android testing study used F-Droid together with additional GitHub projects, while the 2025 Kotlin maintainability study analyzed 2,708 F-Droid applications.

Springer Nature Link+1

Advantages: publicly accessible source code, no respondent recruitment, no GPU requirements.

Limitations: open-source applications are not necessarily representative of commercial Android development.

AndroZoo

AndroZoo provides a very large collection of Android APKs. Its website currently documents access conditions and research registration requirements.

androzoo.uni.lu+1

Do not assume that its APK download facilities constitute an unrestricted free API. Verify access before making it central to your research design.

DroidBench

An established benchmark for Android static and dynamic taint-analysis research, with test cases involving application lifecycle, callbacks, UI interactions and information flows.

GitHub

Useful when evaluating security analysis tools rather than inventing an entire benchmark.

MH-1M

A recently published large-scale Android malware dataset containing more than 1.3 million samples from 2010–2024. Its raw dataset and additional metadata exceed 400 GB, although processed data are also made available.

Nature

This is an interesting resource, but the entire raw corpus would be excessive for your available time and workstation.

Android compatibility research

CompatDroid is a useful reference for studying configuration selection and test-resource optimization. Its published work includes benchmark applications and a larger study of Android applications.

onlinelibrary.wiley.com

Privacy research artifacts

The 2026 Android privacy paper identifies a publicly available Zenodo artifact and documents a study involving 7,500 applications. This can potentially save substantial data-collection work.

DOI+1

Energy data

A 2024 Mendeley dataset contains 9,752,529 records across 98 features, collected from ten Android devices. It concerns daily device usage and energy-related information. It may be useful for secondary analysis, but it is not a substitute for controlled measurements of energy consumed by individual application implementations.

data.mendeley.com

## 4. Typical experimental settings

Depending on the research area, you will encounter four main experimental designs.

|Experimental setting|Procedure|Typical measurements|
|---|---|---|
|Repository mining|Analyze existing Android/Kotlin repositories|Complexity, test coverage, bugs, language ratios|
|Controlled experiment|Run different implementations or techniques under equal conditions|Execution time, energy, faults, coverage|
|Benchmark evaluation|Run tools on established datasets|Precision, recall, F1, runtime|
|Replication study|Reproduce an existing experiment with new samples or environments|Effect sizes, consistency, generalization|

For a six-month Master's thesis, a particularly sensible strategy is to combine repository mining with one smaller controlled experiment.

For example, repository mining could identify interesting patterns, while an experiment could investigate whether those patterns have a measurable technical consequence.

## 5. Metrics worth learning

|Research area|Useful evaluation metrics|
|---|---|
|Testing|Statement coverage, branch coverage, API coverage, mutation score, fault detection rate|
|GUI testing|Activity coverage, transition coverage, discovered crashes, execution time|
|Test reliability|Flakiness rate, reproducibility, failure frequency|
|Compatibility|Configuration coverage, compatibility failures, missed faults|
|Performance|Startup latency, p50/p95 execution time, frame time, jank|
|Energy|Joules, mWh, energy per operation|
|Maintainability|Cyclomatic complexity, duplication, code churn, maintainability metrics|
|Concurrency|Defect categories, reproduction rate, cancellation failures, race conditions|
|Security|Precision, recall, F1, false-positive rate, detected data flows|
|Dependencies|Vulnerable dependency proportion, transitive exposure, remediation time|
|Accessibility|Precision, recall, F1 and issue-category detection rate|

One additional methodological recommendation: avoid relying exclusively on a single metric.

For example, code coverage is useful, but it is not equivalent to fault-detection effectiveness. Similarly, low execution time does not necessarily mean low energy consumption.

# G. Questions before topic selection

Your profile is sufficiently developed to map the research landscape. However, several unknowns will substantially influence which research direction is realistic.

I would resolve these before narrowing the field to a few candidate research topics.

## 1. Physical Android hardware

This is the most important practical question.

Do you have access to a physical Android smartphone for experiments, or only an Android emulator?

Why it matters:

- Testing and repository mining do not require physical devices.
    
- Performance experiments can sometimes use emulators, with limitations.
    
- Energy consumption and hardware-specific behaviour need physical-device measurements.
    

## 2. Preferred experimental approach

Which kind of experiment sounds most interesting?

- A. Repository mining: Analyze hundreds of existing Kotlin/Java projects with Python.
    
- B. Controlled application experiments: Build or modify applications and compare their behaviour.
    
- C. Tool evaluation: Evaluate existing testing, security or static-analysis tools.
    
- D. Bug analysis: Study real defects, their causes and reproducibility.
    
- E. Mixed approach: Combine repository analysis and controlled experiments.
    

## 3. Your desired research contribution

What would you prefer to deliver?

- Empirical evidence about an existing software engineering problem.
    
- An evaluation or comparison of existing approaches.
    
- A small prototype that demonstrates an experimentally evaluated technique.
    
- A new testing or analysis method.
    

This matters because the same research area can lead to very different thesis designs.

## 4. Your practical experience with testing

How comfortable are you with these technologies?

|Technology|What I need to establish|
|---|---|
|JUnit|Unit testing|
|Mockito / MockK|Mocking and test isolation|
|Espresso|Android UI testing|
|UI Automator|System-level UI automation|
|Gradle|Android project builds and dependency analysis|
|Python / pandas|Dataset analysis and statistical processing|
|Android Profiler|Performance profiling|

It is perfectly acceptable to have experience with only some of them.

## 5. Scope of Android development

Are you comfortable working with both traditional Android Views and Jetpack Compose, or would you prefer to focus on one?

This is relevant to accessibility, testing and performance experiments.

## Overall research assessment

Based on the evidence collected, I would keep the following five research directions in the active search space:

1. Android automated testing

Excellent fit

Strong public-data availability and measurable outcomes. Requires a narrower problem than general testing adoption.

2. Kotlin concurrency and correctness

Excellent fit

Directly connected to Kotlin, with real-world bug evidence and opportunities for empirical analysis.

3. Java/Kotlin maintainability

Excellent fit

Well suited to repository mining and statistical experimentation, but broad language comparisons already exist.

4. Android dependency security

Strong fit

Good availability of public dependency and vulnerability information. Requires careful control of the analysis scope.

5. GUI testing and fault detection

Strong fit

An experimentally interesting field with established tools and measurable outcomes.

Performance/energy research and privacy analysis should remain in consideration, subject to hardware and dataset access.

Important limitation of this report: This is an evidence-informed landscape scan, not a completed systematic literature review. It uses identifiable 2024–2026 publications, conference records, research artifacts and official technical documentation. Some publisher pages were accessible only through their abstracts or metadata, and ScienceDirect restricted full-page retrieval for some records. The searches do not establish novelty or exhaustively cover all relevant publications.

Before approving any eventual thesis topic, the nearest studies must be examined in greater depth, their limitations compared, and the proposed research contribution validated with your supervisor.

Recommended next step: Answer the five questions in section G. That will allow us to eliminate research directions that are technically interesting but unsuitable for your actual experimental environment. Afterward, we can investigate the strongest research areas in greater depth without prematurely committing to thesis titles.

# ЦІКАВЕ 1

Нічого не взято. Додано до промтпу 

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

📚Monitor new concurrency research monthlyТоркніться, щоб налаштувати