---
title: MPI_WIN_SET_ERRHANDLER
c_name: MPI_Win_set_errhandler
lis_name: MPI_WIN_SET_ERRHANDLER
chapter: misc
aliases: [MPI_WIN_SET_ERRHANDLER, MPI_Win_set_errhandler]
tags: [mpi/function, mpi/misc]
---

# MPI_WIN_SET_ERRHANDLER

**C**
```c
int MPI_Win_set_errhandler(MPI_Win win, MPI_Errhandler errhandler)
```

**C++**
```cpp
void MPI::Win::Set_errhandler(const MPI::Errhandler& errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window (handle) |
| `errhandler` | IN | new error handler for window (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_SET_ERRHANDLER(WIN, ERRHANDLER, IERROR)
  INTEGER WIN, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
