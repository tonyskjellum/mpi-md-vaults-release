---
title: MPI_IBARRIER
c_name: MPI_Ibarrier
lis_name: MPI_IBARRIER
chapter: coll
aliases: [MPI_IBARRIER, MPI_Ibarrier]
tags: [mpi/function, mpi/coll]
---

# MPI_IBARRIER

**C**
```c
int MPI_Ibarrier(MPI_Comm comm, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Ibarrier(comm, request, ierror) BIND(C)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IBARRIER(COMM, REQUEST, IERROR)
  INTEGER COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
