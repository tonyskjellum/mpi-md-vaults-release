---
title: MPI_COMM_GET_ERRHANDLER
c_name: MPI_Comm_get_errhandler
lis_name: MPI_COMM_GET_ERRHANDLER
chapter: inquiry
aliases: [MPI_COMM_GET_ERRHANDLER, MPI_Comm_get_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_COMM_GET_ERRHANDLER

**C**
```c
int MPI_Comm_get_errhandler(MPI_Comm comm, MPI_Errhandler *errhandler)
```

**C++**
```cpp
MPI::Errhandler MPI::Comm::Get_errhandler() const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `errhandler` | OUT | error handler currently associated with communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_GET_ERRHANDLER(COMM, ERRHANDLER, IERROR)
  INTEGER COMM, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
