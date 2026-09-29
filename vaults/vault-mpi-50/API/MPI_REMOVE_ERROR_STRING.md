---
title: MPI_REMOVE_ERROR_STRING
c_name: MPI_Remove_error_string
lis_name: MPI_REMOVE_ERROR_STRING
chapter: inquiry
aliases: [MPI_REMOVE_ERROR_STRING, MPI_Remove_error_string]
tags: [mpi/function, mpi/inquiry]
---

# MPI_REMOVE_ERROR_STRING

**C**
```c
int MPI_Remove_error_string(int errorcode)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorcode` | IN | error code or class (integer) |

**Fortran 2008**
```fortran
MPI_Remove_error_string(errorcode, ierror)
  INTEGER, INTENT(IN) :: errorcode
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REMOVE_ERROR_STRING(ERRORCODE, IERROR)
  INTEGER ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
