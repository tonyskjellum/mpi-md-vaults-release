---
title: MPI_COMM_ATTACH_BUFFER
c_name: MPI_Comm_attach_buffer
lis_name: MPI_COMM_ATTACH_BUFFER
chapter: pt2pt
aliases: [MPI_COMM_ATTACH_BUFFER, MPI_Comm_attach_buffer, MPI_Comm_attach_buffer_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_COMM_ATTACH_BUFFER

**C**
```c
int MPI_Comm_attach_buffer(MPI_Comm comm, void *buffer, int size)
int MPI_Comm_attach_buffer_c(MPI_Comm comm, void *buffer, MPI_Count size)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `buffer` | IN | initial buffer address (choice) |
| `size` | IN | buffer size, in bytes (nonnegative integer) |

**Fortran 2008**
```fortran
MPI_Comm_attach_buffer(comm, buffer, size, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
  INTEGER, INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Comm_attach_buffer(comm, buffer, size, ierror) !(_c)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_ATTACH_BUFFER(COMM, BUFFER, SIZE, IERROR)
  INTEGER COMM, SIZE, IERROR
  <type> BUFFER(*)
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
