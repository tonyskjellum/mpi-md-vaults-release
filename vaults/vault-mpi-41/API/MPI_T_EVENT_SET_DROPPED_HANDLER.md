---
title: MPI_T_EVENT_SET_DROPPED_HANDLER
c_name: MPI_T_event_set_dropped_handler
lis_name: MPI_T_EVENT_SET_DROPPED_HANDLER
chapter: tools
aliases: [MPI_T_EVENT_SET_DROPPED_HANDLER, MPI_T_event_dropped_cb_function, MPI_T_event_set_dropped_handler]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_SET_DROPPED_HANDLER

**C**
```c
int MPI_T_event_set_dropped_handler(MPI_T_event_registration event_registration, MPI_T_event_dropped_cb_function dropped_cb_function)
typedef void MPI_T_event_dropped_cb_function(MPI_Count count, MPI_T_event_registration event_registration, int source_index, MPI_T_cb_safety cb_safety, void *user_data);
```

| Parameter | Intent | Description |
|---|---|---|
| `event_registration` | INOUT | valid event registration (handle) |
| `dropped_cb_function` | IN | pointer to user-defined callback function (function) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
