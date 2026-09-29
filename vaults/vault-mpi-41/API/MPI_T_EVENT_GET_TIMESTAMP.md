---
title: MPI_T_EVENT_GET_TIMESTAMP
c_name: MPI_T_event_get_timestamp
lis_name: MPI_T_EVENT_GET_TIMESTAMP
chapter: tools
aliases: [MPI_T_EVENT_GET_TIMESTAMP, MPI_T_event_get_timestamp]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_GET_TIMESTAMP

**C**
```c
int MPI_T_event_get_timestamp(MPI_T_event_instance event_instance, MPI_Count *event_timestamp)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_instance` | IN | event instance provided to the callback function (handle) |
| `event_timestamp` | OUT | timestamp the event was observed (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
