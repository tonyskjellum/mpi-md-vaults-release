---
title: MPI_RACCUMULATE
c_name: MPI_Raccumulate
lis_name: MPI_RACCUMULATE
chapter: one-side
aliases: [MPI_RACCUMULATE, MPI_Raccumulate, MPI_Raccumulate_c]
tags: [mpi/function, mpi/one-side]
---

# MPI_RACCUMULATE

**C**
```c
int MPI_Raccumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win, MPI_Request *request)
int MPI_Raccumulate_c(const void *origin_addr, MPI_Count origin_count, MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp, MPI_Count target_count, MPI_Datatype target_datatype, MPI_Op op, MPI_Win win, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `origin_addr` | IN | initial address of buffer (choice) |
| `origin_count` | IN | number of entries in buffer (non-negative integer) |
| `origin_datatype` | IN | datatype of each entry in origin buffer (handle) |
| `target_rank` | IN | rank of target (non-negative integer) |
| `target_disp` | IN | displacement from start of window to beginning of target buffer (non-negative integer) |
| `target_count` | IN | number of entries in target buffer (non-negative integer) |
| `target_datatype` | IN | datatype of each entry in target buffer (handle) |
| `op` | IN | accumulate operator (handle) |
| `win` | IN | window object (handle) |
| `request` | OUT | RMA request (handle) |

**Fortran 2008**
```fortran
MPI_Raccumulate(origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
  INTEGER, INTENT(IN) :: origin_count, target_rank, target_count
  TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, target_datatype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Raccumulate(origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, op, win, request, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: origin_addr
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: origin_count, target_count
  TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, target_datatype
  INTEGER, INTENT(IN) :: target_rank
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Win), INTENT(IN) :: win
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_RACCUMULATE(ORIGIN_ADDR, ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_DISP, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, REQUEST, IERROR)
  <type> ORIGIN_ADDR(*)
  INTEGER ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_COUNT, TARGET_DATATYPE, OP, WIN, REQUEST, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
