---
title: MPI_COMM_GET_PARENT
c_name: MPI_Comm_get_parent
lis_name: MPI_COMM_GET_PARENT
chapter: dynamic
aliases: [MPI_COMM_GET_PARENT, MPI_Comm_get_parent]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_GET_PARENT

**C**
```c
int MPI_Comm_get_parent(MPI_Comm *parent)
```

**C++**
```cpp
static MPI::Intercomm MPI::Comm::Get_parent()
```

| Parameter | Intent | Description |
|---|---|---|
| `parent` | OUT | the parent communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_GET_PARENT(PARENT, IERROR)
  INTEGER PARENT, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
