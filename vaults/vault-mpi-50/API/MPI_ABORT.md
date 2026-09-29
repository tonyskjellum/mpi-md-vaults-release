---
title: MPI_ABORT
c_name: MPI_Abort
lis_name: MPI_ABORT
chapter: dynamic
aliases: [MPI_ABORT, MPI_Abort]
tags: [mpi/function, mpi/dynamic]
---

# MPI_ABORT

**C**
```c
int MPI_Abort(MPI_Comm comm, int errorcode)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator of MPI processes to abort (handle) |
| `errorcode` | IN | error code to return to invoking environment (integer) |

**Fortran 2008**
```fortran
MPI_Abort(comm, errorcode, ierror)
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
> See the chapter note [[dynamic]] for the normative text.
