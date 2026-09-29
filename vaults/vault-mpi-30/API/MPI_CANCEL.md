---
title: MPI_CANCEL
c_name: MPI_Cancel
lis_name: MPI_CANCEL
chapter: pt2pt
aliases: [MPI_CANCEL, MPI_Cancel]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_CANCEL

**C**
```c
int MPI_Cancel(MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | IN | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Cancel(request, ierror) BIND(C)
  TYPE(MPI_Request), INTENT(IN) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_CANCEL(REQUEST, IERROR)
  INTEGER REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
