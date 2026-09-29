---
title: MPI_ADD_ERROR_STRING
c_name: MPI_Add_error_string
lis_name: MPI_ADD_ERROR_STRING
chapter: inquiry
aliases: [MPI_ADD_ERROR_STRING, MPI_Add_error_string]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ADD_ERROR_STRING

**C**
```c
int MPI_Add_error_string(int errorcode, const char *string)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorcode` | IN | error code or class (integer) |
| `string` | IN | text corresponding to `errorcode` (string) |

**Fortran 2008**
```fortran
MPI_Add_error_string(errorcode, string, ierror)
  INTEGER, INTENT(IN) :: errorcode
  CHARACTER(LEN=*), INTENT(IN) :: string
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ADD_ERROR_STRING(ERRORCODE, STRING, IERROR)
  INTEGER ERRORCODE, IERROR
  CHARACTER*(*) STRING
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
