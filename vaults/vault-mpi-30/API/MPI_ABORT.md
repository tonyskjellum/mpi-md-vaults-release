---
title: MPI_ABORT
c_name: MPI_Abort
lis_name: MPI_ABORT
chapter: inquiry
aliases: [MPI_ABORT, MPI_Abort]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ABORT

**C**
```c
int MPI_Abort(MPI_Comm comm, int errorcode)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator of tasks to abort |
| `errorcode` | IN | error code to return to invoking environment |

**Fortran 2008**
```fortran
MPI_Abort(comm, errorcode, ierror) BIND(C)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: errorcode
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ABORT(COMM, ERRORCODE, IERROR)
  INTEGER COMM, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
