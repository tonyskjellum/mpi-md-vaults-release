---
title: MPI_T_SOURCE_GET_TIMESTAMP
c_name: MPI_T_source_get_timestamp
lis_name: MPI_T_SOURCE_GET_TIMESTAMP
chapter: tools
aliases: [MPI_T_SOURCE_GET_TIMESTAMP, MPI_T_source_get_timestamp]
tags: [mpi/function, mpi/tools]
---

# MPI_T_SOURCE_GET_TIMESTAMP

**C**
```c
int MPI_T_source_get_timestamp(int source_index, MPI_Count *timestamp)
```

| Parameter | Intent | Description |
|---|---|---|
| `source_index` | IN | index of the source (integer) |
| `timestamp` | OUT | current timestamp from specified source (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
