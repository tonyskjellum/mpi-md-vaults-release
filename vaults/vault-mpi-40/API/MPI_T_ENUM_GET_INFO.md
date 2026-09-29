---
title: MPI_T_ENUM_GET_INFO
c_name: MPI_T_enum_get_info
lis_name: MPI_T_ENUM_GET_INFO
chapter: tools
aliases: [MPI_T_ENUM_GET_INFO, MPI_T_enum_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_ENUM_GET_INFO

**C**
```c
int MPI_T_enum_get_info(MPI_T_enum enumtype, int *num, char *name, int *name_len)
```

| Parameter | Intent | Description |
|---|---|---|
| `enumtype` | IN | enumeration to be queried (handle) |
| `num` | OUT | number of discrete values represented by this enumeration (integer) |
| `name` | OUT | buffer to return the string containing the name of the enumeration item (string) |
| `name_len` | INOUT | length of the string and/or buffer for `name` (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
