---
tags:
  - source
Date: 2026-11-11
Related:
  - "[[GP-1]]"
  - "[[SGP-1]]"
Title: "Java Threading Options in 2026: Platform vs Virtual Threads"
Authors:
  - Ronald Dehuysser
Study type: Empirical framework benchmark & industry case study
Venue: JobRunr Technical Blog
DOI: 
link: https://www.jobrunr.io/en/blog/java-job-threading-options/
Pub. Year: 2026
Verified: VERIFIED
---
----

# Key finding
The benchmark evaluates background job execution throughput and latency under Java platform threads versus virtual threads across JDK versions (JDK 21 through JDK 25). On JDK 21, introducing a `synchronized` block around a blocking job caused catastrophic performance collapse due to carrier pinning: throughput plummeted from 462 to 33 jobs/s, while P99 latency exploded from 253 ms to 6,799 ms. On JDK 25, the identical workload ran with zero pinning events and restored full throughput, empirically demonstrating the real-world impact of JEP 491.

# Limitation
The evaluation is context-dependent and reports throughput, latency, and JFR pinning events, but completely omits power or energy consumption measurements. Furthermore, it focuses on background batch tasks rather than synchronous HTTP microservice workloads, and evaluates only monitor pinning without isolating residual native-frame (JNI/FFM) pinning.

# Gap signal
This benchmark demonstrates that carrier pinning is a catastrophic fragility risk under pre-JDK 24 runtimes, and that performance is strongly version-dependent. However, it leaves open whether the severe tail-latency inflation and throughput drop observed during carrier starvation also cause corresponding spikes in energy consumption per processed task.
