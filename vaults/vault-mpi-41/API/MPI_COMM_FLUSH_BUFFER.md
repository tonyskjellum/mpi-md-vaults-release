---
title: MPI_COMM_FLUSH_BUFFER
c_name: MPI_Comm_flush_buffer
lis_name: MPI_COMM_FLUSH_BUFFER
chapter: pt2pt
aliases: [MPI_COMM_FLUSH_BUFFER, MPI_Comm_flush_buffer]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_COMM_FLUSH_BUFFER

**C**
```c
int MPI_Comm_flush_buffer(MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Comm_flush_buffer(comm, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_FLUSH_BUFFER(COMM, IERROR)
  INTEGER COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
