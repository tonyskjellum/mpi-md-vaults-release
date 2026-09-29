---
title: MPI_INFO_CREATE_ENV
c_name: MPI_Info_create_env
lis_name: MPI_INFO_CREATE_ENV
chapter: misc
aliases: [MPI_INFO_CREATE_ENV, MPI_Info_create_env]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_CREATE_ENV

**C**
```c
int MPI_Info_create_env(int argc, char *argv[], MPI_Info *info)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | OUT | info object (handle) |

**Fortran 2008**
```fortran
MPI_Info_create_env(info, ierror)
  TYPE(MPI_Info), INTENT(OUT) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_CREATE_ENV(INFO, IERROR)
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
