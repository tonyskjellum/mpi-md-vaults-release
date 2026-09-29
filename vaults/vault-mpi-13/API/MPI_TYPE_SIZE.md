---
title: MPI_TYPE_SIZE
c_name: MPI_Type_size
lis_name: MPI_TYPE_SIZE
chapter: pt2pt
aliases: [MPI_TYPE_SIZE, MPI_Type_size]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TYPE_SIZE

**C**
```c
int MPI_Type_size(MPI_Datatype datatype, int *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype (handle) |
| `size` | OUT | datatype size (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SIZE(DATATYPE, SIZE, IERROR)
  INTEGER DATATYPE, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
