---
title: MPI_T_CVAR_GET_INFO
c_name: MPI_T_cvar_get_info
lis_name: MPI_T_CVAR_GET_INFO
chapter: tools
aliases: [MPI_T_CVAR_GET_INFO, MPI_T_cvar_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CVAR_GET_INFO

**C**
```c
int MPI_T_cvar_get_info(int cvar_index, char *name, int *name_len, int *verbosity, MPI_Datatype *datatype, MPI_T_enum *enumtype, char *desc, int *desc_len, int *bind, int *scope)
```

| Parameter | Intent | Description |
|---|---|---|
| `cvar_index` | IN | index of the control variable to be queried, value between $0$ and $num_cvar-1$ (integer) |
| `name` | OUT | buffer to return the string containing the name of the control variable (string) |
| `{name}_len` | INOUT | length of the string and/or buffer for `name` (integer) |
| `verbosity` | OUT | verbosity level of this variable (integer) |
| `datatype` | OUT | MPI datatype of the information stored in the control variable (handle) |
| `enumtype` | OUT | optional descriptor for enumeration information (handle) |
| `desc` | OUT | buffer to return the string containing a description of the control variable (string) |
| `{desc}_len` | INOUT | length of the string and/or buffer for `desc` (integer) |
| `bind` | OUT | type of MPI object to which this variable must be bound (integer) |
| `scope` | OUT | scope of when changes to this variable are possible (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
