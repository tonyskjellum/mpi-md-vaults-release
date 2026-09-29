---
title: MPI_T_EVENT_GET_SOURCE
c_name: MPI_T_event_get_source
lis_name: MPI_T_EVENT_GET_SOURCE
chapter: tools
aliases: [MPI_T_EVENT_GET_SOURCE, MPI_T_event_get_source]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_GET_SOURCE

**C**
```c
int MPI_T_event_get_source(MPI_T_event_instance event_instance, int *source_index)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_instance` | IN | event instance provided to the callback function (handle) |
| `source_index` | OUT | index identifying the source (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
