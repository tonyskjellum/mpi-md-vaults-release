---
title: MPI_ACCUMULATE
c_name: MPI_Accumulate
lis_name: MPI_ACCUMULATE
chapter: one-side
aliases: [MPI_ACCUMULATE, MPI_Accumulate]
tags: [mpi/function, mpi/one-side]
---

# MPI_ACCUMULATE

**C**
```c
int MPI_Accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `origin_addr` | IN | initial address of buffer (choice) |
| `origin_count` | IN | number of entries in buffer (non-negative integer) |
| `origin_datatype` | IN | datatype of each entry (handle) |
| `target_rank` | IN | rank of target (non-negative integer) |
| `target_disp` | IN | displacement from start of window to beginning of target buffer (non-negative integer) |
| `target_count` | IN | number of entries in target buffer (non-negative integer) |
| `target_datatype` | IN | datatype of each entry in target buffer (handle) |
| `op` | IN | reduce operation (handle) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Accumulate(origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, op, win, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
  INTEGER, INTENT(IN) :: origin_count, target_rank, target_count
  TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, target_datatype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ACCUMULATE(ORIGIN_ADDR, ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_DISP, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, IERROR)
  <type> ORIGIN_ADDR(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
  INTEGER ORIGIN_COUNT, ORIGIN_DATATYPE,TARGET_RANK, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
