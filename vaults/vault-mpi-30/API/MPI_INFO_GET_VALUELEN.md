---
title: MPI_INFO_GET_VALUELEN
c_name: MPI_Info_get_valuelen
lis_name: MPI_INFO_GET_VALUELEN
chapter: misc
aliases: [MPI_INFO_GET_VALUELEN, MPI_Info_get_valuelen]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_GET_VALUELEN

**C**
```c
int MPI_Info_get_valuelen(MPI_Info info, const char *key, int *valuelen, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object (handle) |
| `key` | IN | key (string) |
| `valuelen` | OUT | length of value arg (integer) |
| `flag` | OUT | `true` if key defined, `false` if not (boolean) |

**Fortran 2008**
```fortran
MPI_Info_get_valuelen(info, key, valuelen, flag, ierror) BIND(C)
  TYPE(MPI_Info), INTENT(IN) :: info
  CHARACTER(LEN=*), INTENT(IN) :: key
  INTEGER, INTENT(OUT) :: valuelen
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_GET_VALUELEN(INFO, KEY, VALUELEN, FLAG, IERROR)
  INTEGER INFO, VALUELEN, IERROR
  LOGICAL FLAG
  CHARACTER*(*) KEY
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
