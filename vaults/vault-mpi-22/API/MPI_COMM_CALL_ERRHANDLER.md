---
title: MPI_COMM_CALL_ERRHANDLER
c_name: MPI_Comm_call_errhandler
lis_name: MPI_COMM_CALL_ERRHANDLER
chapter: inquiry
aliases: [MPI_COMM_CALL_ERRHANDLER, MPI_Comm_call_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_COMM_CALL_ERRHANDLER

**C**
```c
int MPI_Comm_call_errhandler(MPI_Comm comm, int errorcode)
```

**C++**
```cpp
void MPI::Comm::Call_errhandler(int errorcode) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with error handler (handle) |
| `errorcode` | IN | error code (integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_CALL_ERRHANDLER(COMM, ERRORCODE, IERROR)
  INTEGER COMM, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
