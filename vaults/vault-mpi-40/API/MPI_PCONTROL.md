---
title: MPI_PCONTROL
c_name: MPI_Pcontrol
lis_name: MPI_PCONTROL
chapter: tools
aliases: [MPI_PCONTROL, MPI_Pcontrol]
tags: [mpi/function, mpi/tools]
---

# MPI_PCONTROL

**C**
```c
int MPI_Pcontrol(const int level, ...)
```

| Parameter | Intent | Description |
|---|---|---|
| `level` | IN | Profiling level (integer) |

**Fortran 2008**
```fortran
MPI_Pcontrol(level)
  INTEGER, INTENT(IN) :: level
```

**Fortran (mpif.h)**
```fortran
MPI_PCONTROL(LEVEL)
  INTEGER LEVEL
```


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.
