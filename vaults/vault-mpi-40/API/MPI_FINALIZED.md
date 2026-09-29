---
title: MPI_FINALIZED
c_name: MPI_Finalized
lis_name: MPI_FINALIZED
chapter: dynamic
aliases: [MPI_FINALIZED, MPI_Finalized]
tags: [mpi/function, mpi/dynamic]
---

# MPI_FINALIZED

**C**
```c
int MPI_Finalized(int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `flag` | OUT | true if MPI was finalized (logical) |

**Fortran 2008**
```fortran
MPI_Finalized(flag, ierror)
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FINALIZED(FLAG, IERROR)
  LOGICAL FLAG
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
