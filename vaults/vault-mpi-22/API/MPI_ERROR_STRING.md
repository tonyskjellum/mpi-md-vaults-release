---
title: MPI_ERROR_STRING
c_name: MPI_Error_string
lis_name: MPI_ERROR_STRING
chapter: inquiry
aliases: [MPI_ERROR_STRING, MPI_Error_string]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ERROR_STRING

**C**
```c
int MPI_Error_string(int errorcode, char *string, int *resultlen)
```

**C++**
```cpp
void MPI::Get_error_string(int errorcode, char* name, int& resultlen)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorcode` | IN | Error code returned by an MPI routine |
| `string` | OUT | Text that corresponds to the `errorcode` |
| `resultlen` | OUT | Length (in printable characters) of the result returned in `string` |

**Fortran (mpif.h)**
```fortran
MPI_ERROR_STRING(ERRORCODE, STRING, RESULTLEN, IERROR)
  INTEGER ERRORCODE, RESULTLEN, IERROR
  CHARACTER*(*) STRING
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
