---
title: MPI_T_EVENT_SET_DROPPED_HANDLER
c_name: MPI_T_event_set_dropped_handler
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_SET_DROPPED_HANDLER, MPI_T_event_set_dropped_handler]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_SET_DROPPED_HANDLER

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_SET_DROPPED_HANDLER|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_SET_DROPPED_HANDLER|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_SET_DROPPED_HANDLER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_set_dropped_handler(MPI_T_event_registration event_registration, MPI_T_event_dropped_cb_function dropped_cb_function)
typedef void MPI_T_event_dropped_cb_function(MPI_Count count, MPI_T_event_registration event_registration, int source_index, MPI_T_cb_safety cb_safety, void *user_data);
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `event_registration` | INOUT | **MPI-4.0–MPI-5.0:** valid event registration (handle) |
| `dropped_cb_function` | IN | **MPI-4.0–MPI-5.0:** pointer to user-defined callback function (function) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_SET_DROPPED_HANDLER|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_SET_DROPPED_HANDLER|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_SET_DROPPED_HANDLER|API note]] · chapter [[versions/v50/sections/tools|tools]]
