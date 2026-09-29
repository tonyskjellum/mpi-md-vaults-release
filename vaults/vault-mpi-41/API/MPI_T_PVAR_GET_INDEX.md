---
title: MPI_T_PVAR_GET_INDEX
c_name: MPI_T_pvar_get_index
lis_name: MPI_T_PVAR_GET_INDEX
chapter: tools
aliases: [MPI_T_PVAR_GET_INDEX, MPI_T_pvar_get_index]
tags: [mpi/function, mpi/tools]
---

# MPI_T_PVAR_GET_INDEX

**C**
```c
int MPI_T_pvar_get_index(const char *name, int var_class, int *pvar_index)
```

| Parameter | Intent | Description |
|---|---|---|
| `name` | IN | the name of the performance variable (string) |
| `var_class` | IN | the class of the performance variable (integer) |
| `pvar_index` | OUT | the index of the performance variable (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
