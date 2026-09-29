---
title: MPI_T_ENUM_GET_ITEM
c_name: MPI_T_enum_get_item
lis_name: MPI_T_ENUM_GET_ITEM
chapter: tools
aliases: [MPI_T_ENUM_GET_ITEM, MPI_T_enum_get_item]
tags: [mpi/function, mpi/tools]
---

# MPI_T_ENUM_GET_ITEM

**C**
```c
int MPI_T_enum_get_item(MPI_T_enum enumtype, int index, int *value, char *name, int *name_len)
```

| Parameter | Intent | Description |
|---|---|---|
| `enumtype` | IN | enumeration to be queried (handle) |
| `index` | IN | number of the value to be queried in this enumeration (integer) |
| `value` | OUT | variable value (integer) |
| `name` | OUT | buffer to return the string containing the name of the enumeration item (string) |
| `name_len` | INOUT | length of the string and/or buffer for `name` (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
