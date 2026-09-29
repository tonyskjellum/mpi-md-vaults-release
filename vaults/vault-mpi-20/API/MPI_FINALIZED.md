---
title: MPI_FINALIZED
c_name: MPI_Finalized
lis_name: MPI_FINALIZED
chapter: misc
aliases: [MPI_FINALIZED, MPI_Finalized]
tags: [mpi/function, mpi/misc]
---

# MPI_FINALIZED

**C**
```c
int MPI_Finalized(int *flag)
```

**C++**
```cpp
bool MPI::Is_finalized()
```

| Parameter | Intent | Description |
|---|---|---|
| `flag` | OUT | true if MPI was finalized (logical) |

**Fortran (mpif.h)**
```fortran
MPI_FINALIZED(FLAG, IERROR)
  LOGICAL FLAG
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
