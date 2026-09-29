---
title: MPI_COMM_SET_ERRHANDLER
c_name: MPI_Comm_set_errhandler
lis_name: MPI_COMM_SET_ERRHANDLER
chapter: inquiry
aliases: [MPI_COMM_SET_ERRHANDLER, MPI_Comm_set_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_COMM_SET_ERRHANDLER

**C**
```c
int MPI_Comm_set_errhandler(MPI_Comm comm, MPI_Errhandler errhandler)
```

**C++**
```cpp
void MPI::Comm::Set_errhandler(const MPI::Errhandler& errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator (handle) |
| `errhandler` | IN | new error handler for communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_SET_ERRHANDLER(COMM, ERRHANDLER, IERROR)
  INTEGER COMM, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
