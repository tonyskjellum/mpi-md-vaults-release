---
title: MPI_GREQUEST_COMPLETE
c_name: MPI_Grequest_complete
lis_name: MPI_GREQUEST_COMPLETE
chapter: ei
aliases: [MPI_GREQUEST_COMPLETE, MPI_Grequest_complete]
tags: [mpi/function, mpi/ei]
---

# MPI_GREQUEST_COMPLETE

**C**
```c
int MPI_Grequest_complete(MPI_Request request)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | INOUT | generalized request (handle) |

**Fortran 2008**
```fortran
MPI_Grequest_complete(request, ierror)
  TYPE(MPI_Request), INTENT(IN) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GREQUEST_COMPLETE(REQUEST, IERROR)
  INTEGER REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
