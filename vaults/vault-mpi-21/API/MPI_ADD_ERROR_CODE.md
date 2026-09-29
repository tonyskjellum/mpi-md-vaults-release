---
title: MPI_ADD_ERROR_CODE
c_name: MPI_Add_error_code
lis_name: MPI_ADD_ERROR_CODE
chapter: inquiry
aliases: [MPI_ADD_ERROR_CODE, MPI_Add_error_code]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ADD_ERROR_CODE

**C**
```c
int MPI_Add_error_code(int errorclass, int *errorcode)
```

**C++**
```cpp
int MPI::Add_error_code(int errorclass)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorclass` | IN | error class (integer) |
| `errorcode` | OUT | new error code to associated with `errorclass` (integer) |

**Fortran (mpif.h)**
```fortran
MPI_ADD_ERROR_CODE(ERRORCLASS, ERRORCODE, IERROR)
  INTEGER ERRORCLASS, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
