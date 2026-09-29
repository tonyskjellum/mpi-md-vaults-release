---
title: MPI_TYPE_FREE
c_name: MPI_Type_free
lis_name: MPI_TYPE_FREE
chapter: pt2pt
aliases: [MPI_TYPE_FREE, MPI_Type_free]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TYPE_FREE

**C**
```c
int MPI_Type_free(MPI_Datatype *datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype that is freed (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_FREE(DATATYPE, IERROR)
  INTEGER DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
