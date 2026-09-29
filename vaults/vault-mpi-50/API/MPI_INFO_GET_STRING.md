---
title: MPI_INFO_GET_STRING
c_name: MPI_Info_get_string
lis_name: MPI_INFO_GET_STRING
chapter: misc
aliases: [MPI_INFO_GET_STRING, MPI_Info_get_string]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_GET_STRING

**C**
```c
int MPI_Info_get_string(MPI_Info info, const char *key, int *buflen, char *value, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object (handle) |
| `key` | IN | key (string) |
| `buflen` | INOUT | length of buffer (integer) |
| `value` | OUT | value (string) |
| `flag` | OUT | `true` if `key` is defined, `false` otherwise (logical) |

**Fortran 2008**
```fortran
MPI_Info_get_string(info, key, buflen, value, flag, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  CHARACTER(LEN=*), INTENT(IN) :: key
  INTEGER, INTENT(INOUT) :: buflen
  CHARACTER(LEN=*), INTENT(OUT) :: value
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INFO_GET_STRING(INFO, KEY, BUFLEN, VALUE, FLAG, IERROR)
  INTEGER INFO, BUFLEN, IERROR
  CHARACTER*(*) KEY, VALUE
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
