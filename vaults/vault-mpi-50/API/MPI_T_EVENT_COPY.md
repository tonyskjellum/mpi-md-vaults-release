---
title: MPI_T_EVENT_COPY
c_name: MPI_T_event_copy
lis_name: MPI_T_EVENT_COPY
chapter: tools
aliases: [MPI_T_EVENT_COPY, MPI_T_event_copy]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_COPY

**C**
```c
int MPI_T_event_copy(MPI_T_event_instance event_instance, void *buffer)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_instance` | IN | event instance provided to the callback function (handle) |
| `buffer` | OUT | user-allocated buffer for event data (choice) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
