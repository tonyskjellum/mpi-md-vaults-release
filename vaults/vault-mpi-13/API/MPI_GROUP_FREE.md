---
title: MPI_GROUP_FREE
c_name: MPI_Group_free
lis_name: MPI_GROUP_FREE
chapter: context
aliases: [MPI_GROUP_FREE, MPI_Group_free]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_FREE

**C**
```c
int MPI_Group_free(MPI_Group *group)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | INOUT | group (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_FREE(GROUP, IERROR)
  INTEGER GROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
