---
title: MPI_T_EVENT_HANDLE_FREE
c_name: MPI_T_event_handle_free
lis_name: MPI_T_EVENT_HANDLE_FREE
chapter: tools
aliases: [MPI_T_EVENT_HANDLE_FREE, MPI_T_event_free_cb_function, MPI_T_event_handle_free]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_HANDLE_FREE

**C**
```c
int MPI_T_event_handle_free(MPI_T_event_registration event_registration, void *user_data, MPI_T_event_free_cb_function free_cb_function)
typedef void MPI_T_event_free_cb_function(MPI_T_event_registration event_registration, MPI_T_cb_safety cb_safety, void *user_data);
```

| Parameter | Intent | Description |
|---|---|---|
| `event_registration` | INOUT | event registration (handle) |
| `user_data` | IN | pointer to a user-controlled buffer |
| `free_cb_function` | IN | pointer to user-defined callback function (function) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
