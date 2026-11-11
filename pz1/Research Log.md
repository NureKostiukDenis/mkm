---
tags:
  - research-log
Related:
  - "[[TE-1]]"
Date: 2026-11-08
---

----

>DATE: 2026-11-08
>Auto-Thinking
>ChatGPT

Визначення тем дослідження у [[mkm/pz1/01_interest/GPT/NP-2|GPT NP-2]]: фокус на Java/Kotlin, багатопоточності, оптимізації та статичному аналізі коду за заданих ресурсних обмежень.

Що взято для ланцюжка:
Перелік проблем у багатопоточності та аналізі програм для порівняння в [[SN-1]] (INPUT A).

Промпт:

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
```

---

>DATE: 2026-11-08
>gemini-4-argon-high
>Gemini

Визначення тем дослідження у [[mkm/pz1/01_interest/Gemini/NP-2|Gemini NP-2]] за тим самим запитом у Gemini.

Що взято для ланцюжка:
Перелік проблем у JVM та паралельному програмуванні для порівняння в [[SN-1]] (INPUT B).

Промпт:

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
```

---

>DATE: 2026-11-10
>antigravity-3.8-flash-high
>Gemini / CLI

Порівняння результатів [[GPT NP-2]] та [[Gemini NP-2]] у [[SN-1]] і виділення 8 спільних проблем.

Що взято для ланцюжка:
Проблема 4: блокування потоків-носіїв (pinning) у віртуальних потоках Java через JNI/FFM та перевитрата пам'яті через ThreadLocal. Передано в [[SK-4]].

Промпт:

```
ROLE
Act as a research synthesis analyst.

INPUT A
[RESULT A]

INPUT B
[RESULT B]

TASK
Compare both analyses.

Create:
1. problems mentioned by both;
2. problems unique to A;
3. problems unique to B;
4. recurring research directions;
5. terminology mismatches;
6. gaps appearing in both;
7. weak/speculative gaps;
8. top 8 problems worth verifying.

For each top problem provide:
- problem statement;
- importance;
- possible gap type;
- keywords;
- Boolean search string;
- evidence needed;
- evidence that would falsify the gap.

Do not invent references.
Do not expose private chain-of-thought.
```

---

>DATE: 10.11.2026
>antigravity-3.8-flash-high 
>CLI 

Створення промптів для критичного аналізу кожної з 8 проблем із [[SN-1]].

Що взято для ланцюжка:
Сформовано промпт для перевірки проблеми 4 у [[SK-4]].

Промпт:

```
TASK
Make Skeptical Promprts (Examples: @01_interest/Skeptical/SK-1.md , @01_interest/Skeptical/SK-2.md ) for all blueprints from @01_interest/Synthesis/SN-1.md . 

OUTPUT
The same structure as in examples. Mark every file with identifiers as in example. Numeration is dedicated from blueprint num.
```

---

>DATE: 2026-11-10
>antigravity-3.8-flash-high
>Gemini / CLI

Критичний розбір проблеми 4 у [[SK-4]]: пошук слабких місць та переформулювання теми.

Що взято для ланцюжка:
Формулювання теми з розділу «Цікаве 1»: «Quantifying the Fragility of M:N Runtime Scheduling Under Mixed-Cooperative Execution: An Empirical Study of JVM Carrier-Thread Starvation Induced by Native (FFM/JNI) and Synthetic Blocking». Передано як тему пошуку в [[PX-2]].

Промпт:

```
ROLE
Act as a skeptical senior reviewer from a top-tier software engineering venue.

INPUT
- **Problem Statement:** Following JDK 24's elimination of monitor pinning inside `synchronized` blocks (JEP 491), production JVM systems adopting Virtual Threads (Java 24/25) face uncharacterized performance pathologies: residual carrier-thread pinning in native JNI/FFM frames, class initializers, and local I/O; and severe heap allocation bloat caused by legacy `ThreadLocal` caching instead of JEP 506 `ScopedValue`.
- **Importance:** Developers migrating high-throughput services to Virtual Threads expecting uniform scalability can encounter severe throughput collapses, carrier-thread starvation, and OutOfMemoryErrors due to residual pinning and unthrottled `ThreadLocal` allocations.
- **Possible Gap Type:** Empirical runtime characterization gap & Static detector gap.

TASK
Try to show why each supposed gap may be invalid, trivial, already solved, too broad, too narrow, or merely engineering.

For each:
1. hidden assumptions;
2. alternative terminology;
3. adjacent communities;
4. evidence that would disprove novelty;
5. classify: scientific problem / engineering problem / product feature / educational intervention / methodological issue;
6. stronger formulation.

OUTPUT
Candidate gap | Why it may be false | What to search | What would falsify it | Stronger formulation

RULES
Do not invent references.
Mark memory-based suggestions UNVERIFIED.
```

---

>DATE: 2026-11-10
>Auto
>Perplexity

Пошук наукових робіт 2024–2026 років у [[PX-2]] за сформульованою темою блокування віртуальних потоків.

Що взято для ланцюжка:
Два факти з розділу «Explicit Gaps»:
1. Систематичних оглядів щодо вразливості віртуальних потоків JVM немає.
2. Немає експериментальних порівнянь блокування носіїв між JNI, FFM, сокетами та файлами.
Обидва пункти передано в запит для [[CT-3]].

Промпт:

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
- metrics;
- key findings;
- explicit/inferred gap;
- boundaries/limitations.

OUTPUT
Structured summary followed by:
A. Direct answers to RQs
B. Verified state of the art
C. Confirmed claims with citations
D. Explicit gaps with citations
E. Methodological recommendations

RULES
If a source cannot be found, state NOT RETRIEVED.
Do not invent citations.
```

---

>DATE: 2026-11-10
>Auto
>Perplexity

Пошук суперечностей у літературі щодо віртуальних потоків та перевірка виявлених прогалин у [[CT-3]].

Що взято для ланцюжка:
1. Оцінка стану досліджень FFM/JNI: доказів недостатньо (D — insufficient evidence).
2. Вимоги до експерименту з розділу «What the gap requires»: порівняння версій JVM, JNI та FFM, зворотних викликів, файлів, сокетів, сліпу, кількості носіїв, конкурентності та часу блокування. Текст передано в [[GP-3]].

Промпт:

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

---

>DATE: 2026-11-11
>Auto
>Perplexity

Аналіз обмежень у знайдених публікаціях (Pandita 2024, ECMS 2025 та ін.) у [[GP-3]].

Що взято для ланцюжка:
Висновок, що наявні роботи не порівнюють нативні виклики під навантаженням пулу носіїв. Формулювання передано для контрольної перевірки в [[SGP-3]].

Промпт:

```
Analyze recent scholarly sources about:
**The FFM/JNI boundary is underexplored experimentally.** Although native frames are identified as a remaining pinning source, the retrieved evidence does not compare JNI, Panama/FFM, file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure. A decisive study should vary **JVM version, JNI versus FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration**, while holding task semantics and resource budgets constant. Version stratification is particularly important because monitor-pinning behavior changed, whereas native-callback pinning remains a distinct concern in the retrieved engineering evidence.

Focus on:
- limitations;
- threats to validity;
- future work;
- open challenges;
- unanswered questions;
- conflicting findings;
- missing populations;
- missing datasets;
- missing benchmarks;
- methodological weaknesses.

OUTPUT
Source | Limitation | Future work | Gap type | Explicit/Infered | Evidence strength | Potential Master's direction
```

---

>DATE: 2026-11-11
>Auto
>Perplexity

Пошук робіт 2025–2026 років (ACM TACO, SAC, ASPLOS, OOPSLA) у [[SGP-3]], щоб перевірити, чи закрита ця проблема.

Що взято для ланцюжка:
Підтверджено статус: OPEN (проблема відкрита). Роботи 2025–2026 років покращують методику тестування, але не порівнюють FFM і JNI під навантаженням пулу носіїв. Результат передано в [[GEC-3]].

Промпт:

```
A review or earlier study suggests:
**The FFM/JNI boundary is underexplored experimentally.** Although native frames are identified as a remaining pinning source, the retrieved evidence does not compare JNI, Panama/FFM, file I/O, socket I/O, and synthetic sleep/blocking under controlled carrier-pool pressure. A decisive study should vary **JVM version, JNI versus FFM, native callbacks, file/socket operations, synthetic blocking, carrier parallelism, concurrency, and blocking duration**, while holding task semantics and resource budgets constant. Version stratification is particularly important because monitor-pinning behavior changed, whereas native-callback pinning remains a distinct concern in the retrieved engineering evidence.

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

---

>DATE: 2026-11-11
>gemini-3.8-flash-high
>Gemini / CLI

Виділення та перевірка джерел із ланцюжка [[SGP-3]] для створення карток джерел у 04_sources/. Аналогічні дії виконано для [[GP-1]] та [[GP-2]].

Що взято для ланцюжка:
Створено картки перевірених джерел (Src-1 ... Src-23), на які спирається опис проблеми.

Промпт:
```
ЗАДАЧА
Виділи ключові джерела для ланцюжка дослідження @[05_gaps/SGP-3.md] .
Проаналізуй чому це джерело з'явилося в ланцюжку, та виділи ключові моменти.
Проаналізуй abstract, якщо можливо.
Виділи його обмження та можливий геп.
Дай відповідь на питання: "Чи відповідає наведені обмження та гепу в джерелі, тому що написано в аналізі?"


РЕЗУЛЬТАТ
Виділи із кожного: рік, посилання на doi якщо існує (якщо ні, залиш пустим), посилання, рік публікації, авторів списком, тип
дослідження, чи відповідає джерело дійсності: VERIFIED, CORRUPTED, NOT.
Створи для кожного унікального джерела файл за прикладом @04_sources/SrcGP-1.md . Назва файлу це загальний наскрізний індефікатор
Src-[1...N]
```

---

>DATE: 2026-11-11
>gemini-3.8-flash-high
>Gemini / CLI

Заповнення картки прогалини в дослідженні [[GEC-3]] на основі [[GP-3]] та [[SGP-3]].

Що взято для ланцюжка:
Опис причин блокування потоків через C ABI, збереження проблеми в Panama FFM та перелік 8 параметрів експерименту. Передано в [[TE-1]].

Промпт:
```
ЗАДАЧА
Для @[05_gaps/GP-3.md] та @[05_gaps/SGP-3.md] проаналізуй та заповни за шаблном @[05_gaps/GEC-3.md] .

РЕЗУЛЬТАТ
Заповнений файл @[05_gaps/GEC-3.md]
```

Шаблон `GEC-3`
```
---
Date: 2026-11-11
tags:
  - AI
Service: Gemini
Model: gemini-3.8-flash-high
Additional:
  - cli
Related:
  - "[[GP-3]]"
  - "[[SGP-3]]"
Confidence: LOW/MEDIUM/HIGH
Type: 
Title: 
---
# Контекст

# Що відомо

# Що невідомо

# Чому важливо

# Доказ 1

# Доказ 2

# Доказ 3

# Яке дослідження може закрити gap

# Що спростує gap
```

---

>DATE: 2026-11-11
>gemini-4-argon-high
>Gemini

Генерація трьох варіантів магістерської теми у [[TE-1]]: теоретичного (A), прикладного (B) та міждисциплінарного (C) з урахуванням обмежень на час і комп'ютер.

Що взято для ланцюжка:
Структура і опис трьох тем передано для оформлення окремих файлів [[T-1]], [[T-2]], [[T-3]].

Промпт:

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
3. Research problem;
4. Verified gap;
5. Object;
6. Subject;
7. RQ (Research Questions);
8. Hypothesis;
9. Aim;
10. Tasks;
15. Anticipated novelty;
16. Practical value;
17. Methodology;
18. Data;
19. Baseline;
20. Metrics;
21. Minimum viable research (MVR);
22. Stretch goal;
23. Compute/resources;
24. Risks;
25. Threats to validity;
22. Key evidence;
23. What could falsify novelty;
24. Feasibility (0–100).
```

---

>DATE: 2026-11-11
>gemini-3.8-flash-high
>Gemini / CLI

Оформлення трьох тем за шаблоном на 30 пунктів в окремі файли: [[T-1]] (теоретична), [[T-2]] (інженерна) та [[T-3]] (міждисциплінарна).

Що взято для ланцюжка:
Сформовані файли тем для вибору напряму дослідження.

Промпт:

```
ЗАДАЧА
Витягни 3 теми із @06_topics/TE-1.md
Стоври для кожної файл за шаблоном @06_topics/T-1.md
Дай відповіді на навдеенні пункти в новому файлі для теми

ПУНКТИ
1. Working title UA
2. Working title EN
3. Research field
4. Research problem
5. Problem evidence
6. Research gap
7. Gap type
8. Object
9. Subject
10. RQ
11. Hypothesis
12. Aim
13. Tasks
14. Novelty
15. Practical contribution
16. Method
17. Dataset/sample
18. Baseline
19. Metrics
20. Tools
21. Compute
22. Ethical risks
23. Threats to validity
24. Minimum viable research
25. Stretch goal
26. Key verified sources
27. Gap evidence
28. Falsification condition
29. Why suitable for Master's thesis
30. Main reason NOT to choose it

РЕЗУЛЬТАТ
3 нових файла із заповниними пунктами
```

---
