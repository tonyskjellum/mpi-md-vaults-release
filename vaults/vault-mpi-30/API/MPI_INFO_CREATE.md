---
title: MPI_INFO_CREATE
c_name: MPI_Info_create
lis_name: MPI_INFO_CREATE
chapter: misc
aliases: [MPI_INFO_CREATE, MPI_Info_create]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_CREATE

**C**
```c
int MPI_Info_create(MPI_Info *info)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | OUT | info object created (handle) |

**Fortran 2008**
```fortran
MPI_Info_create(info, ierror) BIND(C)
  TYPE(MPI_Info), INTENT(OUT) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_CREATE(INFO, IERROR)
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
