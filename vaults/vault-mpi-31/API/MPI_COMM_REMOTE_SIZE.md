---
title: MPI_COMM_REMOTE_SIZE
c_name: MPI_Comm_remote_size
lis_name: MPI_COMM_REMOTE_SIZE
chapter: context
aliases: [MPI_COMM_REMOTE_SIZE, MPI_Comm_remote_size]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_REMOTE_SIZE

**C**
```c
int MPI_Comm_remote_size(MPI_Comm comm, int *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | inter-communicator (handle) |
| `size` | OUT | number of processes in the remote group of ` comm` (integer) |

**Fortran 2008**
```fortran
MPI_Comm_remote_size(comm, size, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_REMOTE_SIZE(COMM, SIZE, IERROR)
  INTEGER COMM, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
