---
title: MPI_PACK_SIZE
c_name: MPI_Pack_size
lis_name: MPI_PACK_SIZE
chapter: pt2pt
aliases: [MPI_PACK_SIZE, MPI_Pack_size]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_PACK_SIZE

**C**
```c
int MPI_Pack_size(int incount, MPI_Datatype datatype, MPI_Comm comm, int *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `incount` | IN | count argument to packing call (integer) |
| `datatype` | IN | datatype argument to packing call (handle) |
| `comm` | IN | communicator argument to packing call (handle) |
| `size` | OUT | upper bound on size of packed message, in bytes (integer) |

**Fortran (mpif.h)**
```fortran
MPI_PACK_SIZE(INCOUNT, DATATYPE, COMM, SIZE, IERROR)
  INTEGER INCOUNT, DATATYPE, COMM, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
