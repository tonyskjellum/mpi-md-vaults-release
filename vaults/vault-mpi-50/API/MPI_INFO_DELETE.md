---
title: MPI_INFO_DELETE
c_name: MPI_Info_delete
lis_name: MPI_INFO_DELETE
chapter: misc
aliases: [MPI_INFO_DELETE, MPI_Info_delete]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_DELETE

**C**
```c
int MPI_Info_delete(MPI_Info info, const char *key)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | INOUT | info object (handle) |
| `key` | IN | key (string) |

**Fortran 2008**
```fortran
MPI_Info_delete(info, key, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  CHARACTER(LEN=*), INTENT(IN) :: key
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_DELETE(INFO, KEY, IERROR)
  INTEGER INFO, IERROR
  CHARACTER*(*) KEY
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
