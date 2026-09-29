---
title: MPI_BUFFER_IFLUSH
c_name: MPI_Buffer_iflush
lis_name: MPI_BUFFER_IFLUSH
chapter: pt2pt
aliases: [MPI_BUFFER_IFLUSH, MPI_Buffer_iflush]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_BUFFER_IFLUSH

**C**
```c
int MPI_Buffer_iflush(MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Buffer_iflush(request, ierror)
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_BUFFER_IFLUSH(REQUEST, IERROR)
  INTEGER REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
