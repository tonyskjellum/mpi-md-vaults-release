---
title: MPI_GET_LIBRARY_VERSION
c_name: MPI_Get_library_version
lis_name: MPI_GET_LIBRARY_VERSION
chapter: inquiry
aliases: [MPI_GET_LIBRARY_VERSION, MPI_Get_library_version]
tags: [mpi/function, mpi/inquiry]
---

# MPI_GET_LIBRARY_VERSION

**C**
```c
int MPI_Get_library_version(char *version, int *resultlen)
```

| Parameter | Intent | Description |
|---|---|---|
| `version` | OUT | version string (string) |
| `resultlen` | OUT | Length (in printable characters) of the result returned in `version` (integer) |

**Fortran 2008**
```fortran
MPI_Get_library_version(version, resulten, ierror) BIND(C)
  CHARACTER(LEN=MPI_MAX_LIBRARY_VERSION_STRING), INTENT(OUT) :: version
  INTEGER, INTENT(OUT) :: resultlen
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GET_LIBRARY_VERSION(VERSION, RESULTEN, IERROR)
  CHARACTER*(*) VERSION
  INTEGER RESULTLEN,IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
