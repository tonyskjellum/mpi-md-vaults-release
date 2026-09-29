---
title: MPI_T_PVAR_GET_INFO
c_name: MPI_T_pvar_get_info
lis_name: MPI_T_PVAR_GET_INFO
chapter: tools
aliases: [MPI_T_PVAR_GET_INFO, MPI_T_pvar_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_PVAR_GET_INFO

**C**
```c
int MPI_T_pvar_get_info(int pvar_index, char *name, int *name_len, int *verbosity, int *var_class, MPI_Datatype *datatype, MPI_T_enum *enumtype, char *desc, int *desc_len, int *bind, int *readonly, int *continuous, int *atomic)
```

| Parameter | Intent | Description |
|---|---|---|
| `pvar_index` | IN | index of the performance variable to be queried between $0$ and $num_pvar-1$ (integer) |
| `name` | OUT | buffer to return the string containing the name of the performance variable (string) |
| `{name}_len` | INOUT | length of the string and/or buffer for `name` (integer) |
| `verbosity` | OUT | verbosity level of this variable (integer) |
| `var_class` | OUT | class of performance variable (integer) |
| `datatype` | OUT | MPI datatype of the information stored in the performance variable (handle) |
| `enumtype` | OUT | optional descriptor for enumeration information (handle) |
| `desc` | OUT | buffer to return the string containing a description of the performance variable (string) |
| `{desc}_len` | INOUT | length of the string and/or buffer for `desc` (integer) |
| `bind` | OUT | type of MPI object to which this variable must be bound (integer) |
| `readonly` | OUT | flag indicating whether the variable can be written/reset (integer) |
| `continuous` | OUT | flag indicating whether the variable can be started and stopped or is continuously active (integer) |
| `atomic` | OUT | flag indicating whether the variable can be atomically read and reset (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
