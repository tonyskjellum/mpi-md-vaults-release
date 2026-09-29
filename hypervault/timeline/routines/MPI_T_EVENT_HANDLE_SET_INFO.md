---
title: MPI_T_EVENT_HANDLE_SET_INFO
c_name: MPI_T_event_handle_set_info
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_HANDLE_SET_INFO, MPI_T_event_handle_set_info]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_HANDLE_SET_INFO

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_handle_set_info(MPI_T_event_registration event_registration, MPI_Info info)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `event_registration` | INOUT | **MPI-4.0–MPI-5.0:** event registration (handle) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_HANDLE_SET_INFO|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_HANDLE_SET_INFO|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_HANDLE_SET_INFO|API note]] · chapter [[versions/v50/sections/tools|tools]]
