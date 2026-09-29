---
title: MPI_T_EVENT_HANDLE_GET_INFO
c_name: MPI_T_event_handle_get_info
lis_name: MPI_T_EVENT_HANDLE_GET_INFO
chapter: tools
aliases: [MPI_T_EVENT_HANDLE_GET_INFO, MPI_T_event_handle_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_HANDLE_GET_INFO

**C**
```c
int MPI_T_event_handle_get_info(MPI_T_event_registration event_registration, MPI_Info *info_used)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_registration` | IN | event registration (handle) |
| `info_used` | OUT | info object (handle) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
