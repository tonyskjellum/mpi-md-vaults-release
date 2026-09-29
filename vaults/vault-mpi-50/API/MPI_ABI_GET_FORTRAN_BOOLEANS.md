---
title: MPI_ABI_GET_FORTRAN_BOOLEANS
c_name: MPI_Abi_get_fortran_booleans
lis_name: MPI_ABI_GET_FORTRAN_BOOLEANS
chapter: abi
aliases: [MPI_ABI_GET_FORTRAN_BOOLEANS, MPI_Abi_get_fortran_booleans]
tags: [mpi/function, mpi/abi]
---

# MPI_ABI_GET_FORTRAN_BOOLEANS

**C**
```c
int MPI_Abi_get_fortran_booleans(int logical_size, void *logical_true, void *logical_false, int *is_set)
```

| Parameter | Intent | Description |
|---|---|---|
| `logical_size` | IN | the size of Fortran `LOGICAL` in bytes (integer) |
| `logical_true` | OUT | the Fortran literal value `.TRUE.` (logical) |
| `logical_false` | OUT | the Fortran literal value `.FALSE.` (logical) |
| `is_set` | OUT | flag to indicate whether the logical boolean values were set previously (logical) |

**Fortran 2008**
```fortran
MPI_Abi_get_fortran_booleans(logical_size, logical_true, logical_false, is_set, ierror)
  INTEGER, INTENT(IN) :: logical_size
  LOGICAL, INTENT(OUT) :: logical_true, logical_false, is_set
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ABI_GET_FORTRAN_BOOLEANS(LOGICAL_SIZE, LOGICAL_TRUE, LOGICAL_FALSE, IS_SET, IERROR)
  INTEGER LOGICAL_SIZE, IERROR
  LOGICAL LOGICAL_TRUE, LOGICAL_FALSE, IS_SET
```


> [!info] Semantics
> See the chapter note [[abi]] for the normative text.
