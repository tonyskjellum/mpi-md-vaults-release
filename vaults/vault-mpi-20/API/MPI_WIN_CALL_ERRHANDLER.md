---
title: MPI_WIN_CALL_ERRHANDLER
c_name: MPI_Win_call_errhandler
lis_name: MPI_WIN_CALL_ERRHANDLER
chapter: ei
aliases: [MPI_WIN_CALL_ERRHANDLER, MPI_Win_call_errhandler]
tags: [mpi/function, mpi/ei]
---

# MPI_WIN_CALL_ERRHANDLER

**C**
```c
int MPI_Win_call_errhandler(MPI_Win win, int errorcode)
```

**C++**
```cpp
void MPI::Win::Call_errhandler(int errorcode) const
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window with error handler (handle) |
| `errorcode` | IN | error code (integer) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_CALL_ERRHANDLER(WIN, ERRORCODE, IERROR)
  INTEGER WIN, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
