---
title: MPI_REMOVE_ERROR_CODE
c_name: MPI_Remove_error_code
lis_name: MPI_REMOVE_ERROR_CODE
chapter: inquiry
aliases: [MPI_REMOVE_ERROR_CODE, MPI_Remove_error_code]
tags: [mpi/function, mpi/inquiry]
---

# MPI_REMOVE_ERROR_CODE

**C**
```c
int MPI_Remove_error_code(int errorcode)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorcode` | IN | error code to be removed (integer) |

**Fortran 2008**
```fortran
MPI_Remove_error_code(errorcode, ierror)
  INTEGER, INTENT(IN) :: errorcode
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REMOVE_ERROR_CODE(ERRORCODE, IERROR)
  INTEGER ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
