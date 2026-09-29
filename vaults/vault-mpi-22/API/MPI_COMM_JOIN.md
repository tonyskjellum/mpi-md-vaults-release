---
title: MPI_COMM_JOIN
c_name: MPI_Comm_join
lis_name: MPI_COMM_JOIN
chapter: dynamic
aliases: [MPI_COMM_JOIN, MPI_Comm_join]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_JOIN

**C**
```c
int MPI_Comm_join(int fd, MPI_Comm *intercomm)
```

**C++**
```cpp
static MPI::Intercomm MPI::Comm::Join(const int fd)
```

| Parameter | Intent | Description |
|---|---|---|
| `fd` | IN | socket file descriptor |
| `intercomm` | OUT | new intercommunicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_JOIN(FD, INTERCOMM, IERROR)
  INTEGER FD, INTERCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
