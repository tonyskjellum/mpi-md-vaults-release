---
title: MPI_GET_VERSION
c_name: MPI_Get_version
lis_name: MPI_GET_VERSION
chapter: misc-1.2
aliases: [MPI_GET_VERSION, MPI_Get_version]
tags: [mpi/function, mpi/misc-1.2]
---

# MPI_GET_VERSION

**C**
```c
int MPI_Get_version(int *version, int *subversion)
```

| Parameter | Intent | Description |
|---|---|---|
| `version` | OUT | version number (integer) |
| `subversion` | OUT | subversion number (integer) |

**Fortran (mpif.h)**
```fortran
MPI_GET_VERSION(VERSION, SUBVERSION, IERROR)
  INTEGER VERSION, SUBVERSION, IERROR
```


> [!info] Semantics
> See the chapter note [[misc-1.2]] for the normative text.
