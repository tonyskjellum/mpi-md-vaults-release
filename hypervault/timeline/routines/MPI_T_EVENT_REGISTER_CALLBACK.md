---
title: MPI_T_EVENT_REGISTER_CALLBACK
c_name: MPI_T_event_register_callback
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_REGISTER_CALLBACK, MPI_T_event_register_callback]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_REGISTER_CALLBACK

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_REGISTER_CALLBACK|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_REGISTER_CALLBACK|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_REGISTER_CALLBACK|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_register_callback(MPI_T_event_registration event_registration, MPI_T_cb_safety cb_safety, MPI_Info info, void *user_data, MPI_T_event_cb_function event_cb_function)
typedef void MPI_T_event_cb_function(MPI_T_event_instance event_instance, MPI_T_event_registration event_registration, MPI_T_cb_safety cb_safety, void *user_data);
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `event_registration` | INOUT | **MPI-4.0–MPI-5.0:** event registration (handle) |
| `cb_safety` | IN | **MPI-4.0–MPI-5.0:** maximum callback safety level (integer) |
| `info` | IN | **MPI-4.0–MPI-5.0:** info object (handle) |
| `user_data` | IN | **MPI-4.0–MPI-5.0:** pointer to a user-controlled buffer |
| `event_cb_function` | IN | **MPI-4.0–MPI-5.0:** pointer to user-defined callback function (function) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_REGISTER_CALLBACK|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_REGISTER_CALLBACK|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_REGISTER_CALLBACK|API note]] · chapter [[versions/v50/sections/tools|tools]]
