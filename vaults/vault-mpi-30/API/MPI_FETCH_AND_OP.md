---
title: MPI_FETCH_AND_OP
c_name: MPI_Fetch_and_op
lis_name: MPI_FETCH_AND_OP
chapter: one-side
aliases: [MPI_FETCH_AND_OP, MPI_Fetch_and_op]
tags: [mpi/function, mpi/one-side]
---

# MPI_FETCH_AND_OP

**C**
```c
int MPI_Fetch_and_op(const void *origin_addr, void *result_addr, MPI_Datatype datatype, int target_rank, MPI_Aint target_disp, MPI_Op op, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `origin_addr` | IN | initial address of buffer (choice) |
| `result_addr` | OUT | initial address of result buffer (choice) |
| `datatype` | IN | datatype of the entry in origin, result, and target buffers (handle) |
| `target_rank` | IN | rank of target (non-negative integer) |
| `target_disp` | IN | displacement from start of window to beginning of target buffer (non-negative integer) |
| `op` | IN | reduce operation (handle) |
| `win` | IN | window object (handle) |

**Fortran 2008**
```fortran
MPI_Fetch_and_op(origin_addr, result_addr, datatype, target_rank, target_disp, op, win, ierror) BIND(C)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: result_addr
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: target_rank
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FETCH_AND_OP(ORIGIN_ADDR, RESULT_ADDR, DATATYPE, TARGET_RANK, TARGET_DISP, OP, WIN, IERROR)
  <type> ORIGIN_ADDR(*), RESULT_ADDR(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
  INTEGER DATATYPE, TARGET_RANK, OP, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
