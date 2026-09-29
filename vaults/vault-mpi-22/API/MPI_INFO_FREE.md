---
title: MPI_INFO_FREE
c_name: MPI_Info_free
lis_name: MPI_INFO_FREE
chapter: misc
aliases: [MPI_INFO_FREE, MPI_Info_free]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_FREE

**C**
```c
int MPI_Info_free(MPI_Info *info)
```

**C++**
```cpp
void MPI::Info::Free()
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | INOUT | info object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_INFO_FREE(INFO, IERROR)
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
