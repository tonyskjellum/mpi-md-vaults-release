---
title: MPI_AINT_DIFF
c_name: MPI_Aint_diff
lis_name: MPI_AINT_DIFF
chapter: datatypes
aliases: [MPI_AINT_DIFF, MPI_Aint_diff]
tags: [mpi/function, mpi/datatypes]
---

# MPI_AINT_DIFF

**C**
```c
MPI_Aint MPI_Aint_diff(MPI_Aint addr1, MPI_Aint addr2)
```

| Parameter | Intent | Description |
|---|---|---|
| `addr1` | IN | minuend address (integer) |
| `addr2` | IN | subtrahend address (integer) |

**Fortran 2008**
```fortran
MPI_Aint_diff(addr1, addr2)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: addr1, addr2
```

**Fortran (mpif.h)**
```fortran
INTEGER(KIND=MPI_ADDRESS_KIND) MPI_AINT_DIFF(ADDR1, ADDR2)
  INTEGER(KIND=MPI_ADDRESS_KIND) ADDR1, ADDR2
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
