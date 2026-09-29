---
title: MPI_BUFFER_ATTACH
c_name: MPI_Buffer_attach
lis_name: MPI_BUFFER_ATTACH
chapter: pt2pt
aliases: [MPI_BUFFER_ATTACH, MPI_Buffer_attach, MPI_Buffer_attach_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_BUFFER_ATTACH

**C**
```c
int MPI_Buffer_attach(void *buffer, int size)
int MPI_Buffer_attach_c(void *buffer, MPI_Count size)
```

| Parameter | Intent | Description |
|---|---|---|
| `buffer` | IN | initial buffer address (choice) |
| `size` | IN | buffer size, in bytes (nonnegative integer) |

**Fortran 2008**
```fortran
MPI_Buffer_attach(buffer, size, ierror)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
  INTEGER, INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Buffer_attach(buffer, size, ierror) !(_c)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_BUFFER_ATTACH(BUFFER, SIZE, IERROR)
  <type> BUFFER(*)
  INTEGER SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
