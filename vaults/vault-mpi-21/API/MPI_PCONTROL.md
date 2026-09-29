---
title: MPI_PCONTROL
c_name: MPI_Pcontrol
lis_name: MPI_PCONTROL
chapter: prof
aliases: [MPI_PCONTROL, MPI_Pcontrol]
tags: [mpi/function, mpi/prof]
---

# MPI_PCONTROL

**C**
```c
int MPI_Pcontrol(const int level, ...)
```

**C++**
```cpp
void MPI::Pcontrol(const int level, ...)
```

| Parameter | Intent | Description |
|---|---|---|
| `level` | IN | Profiling level |

**Fortran (mpif.h)**
```fortran
MPI_PCONTROL(LEVEL)
  INTEGER LEVEL, ...
```


> [!info] Semantics
> See the chapter note [[prof]] for the normative text.
