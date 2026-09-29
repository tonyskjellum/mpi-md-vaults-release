---
title: MPI_COMM_GET_NAME
c_name: MPI_Comm_get_name
lis_name: MPI_COMM_GET_NAME
chapter: ei
aliases: [MPI_COMM_GET_NAME, MPI_Comm_get_name]
tags: [mpi/function, mpi/ei]
---

# MPI_COMM_GET_NAME

**C**
```c
int MPI_Comm_get_name(MPI_Comm comm, char *comm_name, int *resultlen)
```

**C++**
```cpp
void MPI::Comm::Get_name(char* comm_name, int& resultlen) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator whose name is to be returned (handle) |
| `comm_name` | OUT | the name previously stored on the communicator, or an empty string if no such name exists (string) |
| `resultlen` | OUT | length of returned name (integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_GET_NAME(COMM, COMM_NAME, RESULTLEN, IERROR)
  INTEGER COMM, RESULTLEN, IERROR
  CHARACTER*(*) COMM_NAME
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
