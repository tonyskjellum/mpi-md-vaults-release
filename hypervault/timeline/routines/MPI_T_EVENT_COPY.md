---
title: MPI_T_EVENT_COPY
c_name: MPI_T_event_copy
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_COPY, MPI_T_event_copy]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_COPY

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_COPY|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_COPY|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_COPY|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_copy(MPI_T_event_instance event_instance, void *buffer)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `event_instance` | IN | **MPI-4.0–MPI-5.0:** event instance provided to the callback function (handle) |
| `buffer` | OUT | **MPI-4.0–MPI-5.0:** user-allocated buffer for event data (choice) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_COPY|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_COPY|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_COPY|API note]] · chapter [[versions/v50/sections/tools|tools]]
