---
title: MPI_INFO_SET
c_name: MPI_Info_set
lis_name: MPI_INFO_SET
chapter: misc
aliases: [MPI_INFO_SET, MPI_Info_set]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_SET

**C**
```c
int MPI_Info_set(MPI_Info info, const char *key, const char *value)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | INOUT | info object (handle) |
| `key` | IN | key (string) |
| `value` | IN | value (string) |

**Fortran 2008**
```fortran
MPI_Info_set(info, key, value, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  CHARACTER(LEN=*), INTENT(IN) :: key, value
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_SET(INFO, KEY, VALUE, IERROR)
  INTEGER INFO, IERROR
  CHARACTER*(*) KEY, VALUE
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
