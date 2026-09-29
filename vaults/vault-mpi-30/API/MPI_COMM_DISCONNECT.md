---
title: MPI_COMM_DISCONNECT
c_name: MPI_Comm_disconnect
lis_name: MPI_COMM_DISCONNECT
chapter: dynamic
aliases: [MPI_COMM_DISCONNECT, MPI_Comm_disconnect]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_DISCONNECT

**C**
```c
int MPI_Comm_disconnect(MPI_Comm *comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Comm_disconnect(comm, ierror) BIND(C)
  TYPE(MPI_Comm), INTENT(INOUT) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_DISCONNECT(COMM, IERROR)
  INTEGER COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
