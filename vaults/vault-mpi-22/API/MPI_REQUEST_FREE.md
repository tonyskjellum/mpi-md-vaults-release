---
title: MPI_REQUEST_FREE
c_name: MPI_Request_free
lis_name: MPI_REQUEST_FREE
chapter: pt2pt
aliases: [MPI_REQUEST_FREE, MPI_Request_free]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_REQUEST_FREE

**C**
```c
int MPI_Request_free(MPI_Request *request)
```

**C++**
```cpp
void MPI::Request::Free()
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | INOUT | communication request (handle) |

**Fortran (mpif.h)**
```fortran
MPI_REQUEST_FREE(REQUEST, IERROR)
  INTEGER REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
