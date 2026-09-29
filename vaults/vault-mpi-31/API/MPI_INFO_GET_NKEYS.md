---
title: MPI_INFO_GET_NKEYS
c_name: MPI_Info_get_nkeys
lis_name: MPI_INFO_GET_NKEYS
chapter: misc
aliases: [MPI_INFO_GET_NKEYS, MPI_Info_get_nkeys]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_GET_NKEYS

**C**
```c
int MPI_Info_get_nkeys(MPI_Info info, int *nkeys)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object (handle) |
| `nkeys` | OUT | number of defined keys (integer) |

**Fortran 2008**
```fortran
MPI_Info_get_nkeys(info, nkeys, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, INTENT(OUT) :: nkeys
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_GET_NKEYS(INFO, NKEYS, IERROR)
  INTEGER INFO, NKEYS, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
