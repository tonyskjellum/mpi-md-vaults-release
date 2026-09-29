---
title: MPI_T_EVENT_GET_INDEX
c_name: MPI_T_event_get_index
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_GET_INDEX, MPI_T_event_get_index]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_GET_INDEX

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_GET_INDEX|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_GET_INDEX|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_GET_INDEX|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_get_index(const char *name, int *event_index)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `name` | IN | **MPI-4.0–MPI-5.0:** name of the event type (string) |
| `event_index` | OUT | **MPI-4.0–MPI-5.0:** index of the event type (integer) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_GET_INDEX|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_GET_INDEX|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_GET_INDEX|API note]] · chapter [[versions/v50/sections/tools|tools]]
