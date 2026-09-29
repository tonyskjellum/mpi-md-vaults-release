---
title: MPI_START
c_name: MPI_Start
lis_name: MPI_START
chapter: pt2pt
aliases: [MPI_START, MPI_Start]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_START

**C**
```c
int MPI_Start(MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | INOUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Start(request, ierror)
  TYPE(MPI_Request), INTENT(INOUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_START(REQUEST, IERROR)
  INTEGER REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
