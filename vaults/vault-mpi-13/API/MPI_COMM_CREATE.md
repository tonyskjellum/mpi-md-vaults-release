---
title: MPI_COMM_CREATE
c_name: MPI_Comm_create
lis_name: MPI_COMM_CREATE
chapter: context
aliases: [MPI_COMM_CREATE, MPI_Comm_create]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_CREATE

**C**
```c
int MPI_Comm_create(MPI_Comm comm, MPI_Group group, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `group` | IN | Group, which is a subset of the group of `comm` (handle) |
| `newcomm` | OUT | new communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_CREATE(COMM, GROUP, NEWCOMM, IERROR)
  INTEGER COMM, GROUP, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
