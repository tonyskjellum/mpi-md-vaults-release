---
title: MPI_COMM_DISCONNECT
c_name: MPI_Comm_disconnect
lis_name: MPI_COMM_DISCONNECT
chapter: dynamic
aliases: [MPI_COMM_DISCONNECT, MPI_Comm_disconnect]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_DISCONNECT

**C**
```c
int MPI_Comm_disconnect(MPI_Comm *comm)
```

**C++**
```cpp
void MPI::Comm::Disconnect()
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_DISCONNECT(COMM, IERROR)
  INTEGER COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
