---
title: MPI_GROUP_COMPARE
c_name: MPI_Group_compare
lis_name: MPI_GROUP_COMPARE
chapter: context
aliases: [MPI_GROUP_COMPARE, MPI_Group_compare]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_COMPARE

**C**
```c
int MPI_Group_compare(MPI_Group group1,MPI_Group group2, int *result)
```

| Parameter | Intent | Description |
|---|---|---|
| `group1` | IN | first group (handle) |
| `group2` | IN | second group (handle) |
| `result` | OUT | result (integer) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_COMPARE(GROUP1, GROUP2, RESULT, IERROR)
  INTEGER GROUP1, GROUP2, RESULT, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
