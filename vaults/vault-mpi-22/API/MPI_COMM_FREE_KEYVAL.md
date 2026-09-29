---
title: MPI_COMM_FREE_KEYVAL
c_name: MPI_Comm_free_keyval
lis_name: MPI_COMM_FREE_KEYVAL
chapter: context
aliases: [MPI_COMM_FREE_KEYVAL, MPI_Comm_free_keyval]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_FREE_KEYVAL

**C**
```c
int MPI_Comm_free_keyval(int *comm_keyval)
```

**C++**
```cpp
static void MPI::Comm::Free_keyval(int& comm_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_keyval` | INOUT | key value (integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_FREE_KEYVAL(COMM_KEYVAL, IERROR)
  INTEGER COMM_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
