---
title: MPI_T_EVENT_CALLBACK_GET_INFO
c_name: MPI_T_event_callback_get_info
lis_name: MPI_T_EVENT_CALLBACK_GET_INFO
chapter: tools
aliases: [MPI_T_EVENT_CALLBACK_GET_INFO, MPI_T_event_callback_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_CALLBACK_GET_INFO

**C**
```c
int MPI_T_event_callback_get_info(MPI_T_event_registration event_registration, MPI_T_cb_safety cb_safety, MPI_Info *info_used)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_registration` | IN | event registration (handle) |
| `cb_safety` | IN | callback safety level (integer) |
| `info_used` | OUT | info object (handle) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
