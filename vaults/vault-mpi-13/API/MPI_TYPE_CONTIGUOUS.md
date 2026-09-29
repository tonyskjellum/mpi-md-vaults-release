---
title: MPI_TYPE_CONTIGUOUS
c_name: MPI_Type_contiguous
lis_name: MPI_TYPE_CONTIGUOUS
chapter: pt2pt
aliases: [MPI_TYPE_CONTIGUOUS, MPI_Type_contiguous]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TYPE_CONTIGUOUS

**C**
```c
int MPI_Type_contiguous(int count, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | replication count (nonnegative integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CONTIGUOUS(COUNT, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
