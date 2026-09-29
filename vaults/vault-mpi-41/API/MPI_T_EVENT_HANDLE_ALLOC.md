---
title: MPI_T_EVENT_HANDLE_ALLOC
c_name: MPI_T_event_handle_alloc
lis_name: MPI_T_EVENT_HANDLE_ALLOC
chapter: tools
aliases: [MPI_T_EVENT_HANDLE_ALLOC, MPI_T_event_handle_alloc]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_HANDLE_ALLOC

**C**
```c
int MPI_T_event_handle_alloc(int event_index, void *obj_handle, MPI_Info info, MPI_T_event_registration *event_registration)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_index` | IN | index of event type for which the registration handle is to be allocated (integer) |
| `obj_handle` | IN | reference to a handle of the MPI object to which this event is supposed to be bound (pointer) |
| `info` | IN | info object (handle) |
| `event_registration` | OUT | event registration (handle) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
