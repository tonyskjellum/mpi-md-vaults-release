---
title: MPI_COMM_SPLIT
c_name: MPI_Comm_split
lis_name: MPI_COMM_SPLIT
chapter: context
aliases: [MPI_COMM_SPLIT, MPI_Comm_split]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_SPLIT

**C**
```c
int MPI_Comm_split(MPI_Comm comm, int color, int key, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `color` | IN | control of subset assignment (integer) |
| `key` | IN | control of rank assigment (integer) |
| `newcomm` | OUT | new communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_SPLIT(COMM, COLOR, KEY, NEWCOMM, IERROR)
  INTEGER COMM, COLOR, KEY, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
