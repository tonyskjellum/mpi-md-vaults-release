---
title: MPI_AINT_ADD
c_name: MPI_Aint_add
lis_name: MPI_AINT_ADD
chapter: datatypes
aliases: [MPI_AINT_ADD, MPI_Aint_add]
tags: [mpi/function, mpi/datatypes]
---

# MPI_AINT_ADD

**C**
```c
MPI_Aint MPI_Aint_add(MPI_Aint base, MPI_Aint disp)
```

| Parameter | Intent | Description |
|---|---|---|
| `base` | IN | base address (integer) |
| `disp` | IN | displacement (integer) |

**Fortran 2008**
```fortran
MPI_Aint_add(base, disp)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: base, disp
```

**Fortran (mpif.h)**
```fortran
INTEGER(KIND=MPI_ADDRESS_KIND) MPI_AINT_ADD(BASE, DISP)
  INTEGER(KIND=MPI_ADDRESS_KIND) BASE, DISP
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
