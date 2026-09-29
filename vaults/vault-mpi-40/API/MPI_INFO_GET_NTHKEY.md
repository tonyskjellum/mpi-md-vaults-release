---
title: MPI_INFO_GET_NTHKEY
c_name: MPI_Info_get_nthkey
lis_name: MPI_INFO_GET_NTHKEY
chapter: misc
aliases: [MPI_INFO_GET_NTHKEY, MPI_Info_get_nthkey]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_GET_NTHKEY

**C**
```c
int MPI_Info_get_nthkey(MPI_Info info, int n, char *key)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object (handle) |
| `n` | IN | key number (integer) |
| `key` | OUT | key (string) |

**Fortran 2008**
```fortran
MPI_Info_get_nthkey(info, n, key, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, INTENT(IN) :: n
  CHARACTER(LEN=*), INTENT(OUT) :: key
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_GET_NTHKEY(INFO, N, KEY, IERROR)
  INTEGER INFO, N, IERROR
  CHARACTER*(*) KEY
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
