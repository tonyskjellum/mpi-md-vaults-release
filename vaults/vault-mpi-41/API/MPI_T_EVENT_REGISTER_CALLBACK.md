---
title: MPI_T_EVENT_REGISTER_CALLBACK
c_name: MPI_T_event_register_callback
lis_name: MPI_T_EVENT_REGISTER_CALLBACK
chapter: tools
aliases: [MPI_T_EVENT_REGISTER_CALLBACK, MPI_T_event_cb_function, MPI_T_event_register_callback]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_REGISTER_CALLBACK

**C**
```c
int MPI_T_event_register_callback(MPI_T_event_registration event_registration, MPI_T_cb_safety cb_safety, MPI_Info info, void *user_data, MPI_T_event_cb_function event_cb_function)
typedef void MPI_T_event_cb_function(MPI_T_event_instance event_instance, MPI_T_event_registration event_registration, MPI_T_cb_safety cb_safety, void *user_data);
```

| Parameter | Intent | Description |
|---|---|---|
| `event_registration` | INOUT | event registration (handle) |
| `cb_safety` | IN | maximum callback safety level (integer) |
| `info` | IN | info object (handle) |
| `user_data` | IN | pointer to a user-controlled buffer |
| `event_cb_function` | IN | pointer to user-defined callback function (function) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
