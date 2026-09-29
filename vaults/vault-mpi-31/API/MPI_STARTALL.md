---
title: MPI_STARTALL
c_name: MPI_Startall
lis_name: MPI_STARTALL
chapter: pt2pt
aliases: [MPI_STARTALL, MPI_Startall]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_STARTALL

**C**
```c
int MPI_Startall(int count, MPI_Request array_of_requests[])
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | list length (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handle) |

**Fortran 2008**
```fortran
MPI_Startall(count, array_of_requests, ierror)
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STARTALL(COUNT, ARRAY_OF_REQUESTS, IERROR)
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
