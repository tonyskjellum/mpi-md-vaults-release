---
title: MPI_T_EVENT_READ
c_name: MPI_T_event_read
lis_name: MPI_T_EVENT_READ
chapter: tools
aliases: [MPI_T_EVENT_READ, MPI_T_event_read]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_READ

**C**
```c
int MPI_T_event_read(MPI_T_event_instance event_instance, int element_index, void *buffer)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_instance` | IN | event-instance handle provided to the callback function (handle) |
| `element_index` | IN | index into the array of datatypes of the item to be queried (integer) |
| `buffer` | OUT | pointer to a memory location to store the item data (choice) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
