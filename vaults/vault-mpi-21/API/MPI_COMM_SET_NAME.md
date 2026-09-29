---
title: MPI_COMM_SET_NAME
c_name: MPI_Comm_set_name
lis_name: MPI_COMM_SET_NAME
chapter: context
aliases: [MPI_COMM_SET_NAME, MPI_Comm_set_name]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_SET_NAME

**C**
```c
int MPI_Comm_set_name(MPI_Comm comm, char *comm_name)
```

**C++**
```cpp
void MPI::Comm::Set_name(const char* comm_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator whose identifier is to be set (handle) |
| `comm_name` | IN | the character string which is remembered as the name (string) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_SET_NAME(COMM, COMM_NAME, IERROR)
  INTEGER COMM, IERROR
  CHARACTER*(*) COMM_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
