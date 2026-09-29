---
title: MPI_INFO_DUP
c_name: MPI_Info_dup
lis_name: MPI_INFO_DUP
chapter: misc
aliases: [MPI_INFO_DUP, MPI_Info_dup]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_DUP

**C**
```c
int MPI_Info_dup(MPI_Info info, MPI_Info *newinfo)
```

**C++**
```cpp
MPI::Info MPI::Info::Dup() const
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object (handle) |
| `newinfo` | OUT | info object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_INFO_DUP(INFO, NEWINFO, IERROR)
  INTEGER INFO, NEWINFO, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
