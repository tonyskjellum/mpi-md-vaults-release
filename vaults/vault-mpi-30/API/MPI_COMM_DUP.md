---
title: MPI_COMM_DUP
c_name: MPI_Comm_dup
lis_name: MPI_COMM_DUP
chapter: context
aliases: [MPI_COMM_DUP, MPI_Comm_dup]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_DUP

**C**
```c
int MPI_Comm_dup(MPI_Comm comm, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `newcomm` | OUT | copy of `comm` (handle) |

**Fortran 2008**
```fortran
MPI_Comm_dup(comm, newcomm, ierror) BIND(C)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Comm), INTENT(OUT) :: newcomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_DUP(COMM, NEWCOMM, IERROR)
  INTEGER COMM, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
