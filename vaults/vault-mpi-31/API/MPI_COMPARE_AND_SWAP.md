---
title: MPI_COMPARE_AND_SWAP
c_name: MPI_Compare_and_swap
lis_name: MPI_COMPARE_AND_SWAP
chapter: one-side
aliases: [MPI_COMPARE_AND_SWAP, MPI_Compare_and_swap]
tags: [mpi/function, mpi/one-side]
---

# MPI_COMPARE_AND_SWAP

**C**
```c
int MPI_Compare_and_swap(const void *origin_addr, const void *compare_addr, void *result_addr, MPI_Datatype datatype, int target_rank, MPI_Aint target_disp, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `origin_addr` | IN | initial address of buffer (choice) |
| `compare_addr` | IN | initial address of compare buffer (choice) |
| `result_addr` | OUT | initial address of result buffer (choice) |
| `datatype` | IN | datatype of the element in all buffers (handle) |
| `target_rank` | IN | rank of target (non-negative integer) |
| `target_disp` | IN | displacement from start of window to beginning of target buffer (non-negative integer) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Compare_and_swap(origin_addr, compare_addr, result_addr, datatype, target_rank, target_disp, win, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: compare_addr
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: target_rank
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMPARE_AND_SWAP(ORIGIN_ADDR, COMPARE_ADDR, RESULT_ADDR, DATATYPE, TARGET_RANK, TARGET_DISP, WIN, IERROR)
  <type> ORIGIN_ADDR(*), COMPARE_ADDR(*), RESULT_ADDR(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
  INTEGER DATATYPE, TARGET_RANK, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
