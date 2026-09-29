---
title: MPI_T_EVENT_HANDLE_ALLOC
c_name: MPI_T_event_handle_alloc
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_HANDLE_ALLOC, MPI_T_event_handle_alloc]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_HANDLE_ALLOC

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_HANDLE_ALLOC|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_HANDLE_ALLOC|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_HANDLE_ALLOC|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_handle_alloc(int event_index, void *obj_handle, MPI_Info info, MPI_T_event_registration *event_registration)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `event_index` | IN | **MPI-4.0–MPI-5.0:** index of event type for which the registration handle is to be allocated (integer) |
| `obj_handle` | IN | **MPI-4.0–MPI-5.0:** reference to a handle of the MPI object to which this event is supposed to be bound (pointer) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `event_registration` | OUT | **MPI-4.0–MPI-5.0:** event registration (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_HANDLE_ALLOC|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_HANDLE_ALLOC|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_HANDLE_ALLOC|API note]] · chapter [[versions/v50/sections/tools|tools]]
