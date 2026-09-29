---
title: MPI_T_EVENT_CALLBACK_GET_INFO
c_name: MPI_T_event_callback_get_info
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_CALLBACK_GET_INFO, MPI_T_event_callback_get_info]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_CALLBACK_GET_INFO

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_CALLBACK_GET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_CALLBACK_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_CALLBACK_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_callback_get_info(MPI_T_event_registration event_registration, MPI_T_cb_safety cb_safety, MPI_Info *info_used)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `event_registration` | IN | **MPI-4.0–MPI-5.0:** event registration (handle) |
| `cb_safety` | IN | **MPI-4.0–MPI-5.0:** callback safety level (integer) |
| `info_used` | OUT | **MPI-4.0–MPI-5.0:** info object (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_CALLBACK_GET_INFO|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_CALLBACK_GET_INFO|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_CALLBACK_GET_INFO|API note]] · chapter [[versions/v50/sections/tools|tools]]
