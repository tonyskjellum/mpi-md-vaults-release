---
title: MPI_T_SOURCE_GET_INFO
c_name: MPI_T_source_get_info
lis_name: MPI_T_SOURCE_GET_INFO
chapter: tools
aliases: [MPI_T_SOURCE_GET_INFO, MPI_T_source_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_SOURCE_GET_INFO

**C**
```c
int MPI_T_source_get_info(int source_index, char *name, int *name_len, char *desc, int *desc_len, MPI_T_source_order *ordering, MPI_Count *ticks_per_second, MPI_Count *max_ticks, MPI_Info *info)
```

| Parameter | Intent | Description |
|---|---|---|
| `source_index` | IN | index of the source to be queried between $0$ and $`num_sources`-1$ (integer) |
| `name` | OUT | buffer to return the string containing the name of the source (string) |
| `name_len` | INOUT | length of the string and/or buffer for `name` (integer) |
| `desc` | OUT | buffer to return the string containing the description of the source (string) |
| `desc_len` | INOUT | length of the string and/or buffer for `desc` (integer) |
| `ordering` | OUT | flag indicating chronological ordering guarantees given by the source (integer) |
| `ticks_per_second` | OUT | the number of ticks per second for the timer of this source (integer) |
| `max_ticks` | OUT | the maximum count of ticks reported by this source before overflow occurs (integer) |
| `info` | OUT | optional info object (handle) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
