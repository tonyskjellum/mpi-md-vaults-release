---
title: MPI_GET
c_name: MPI_Get
lis_name: MPI_GET
chapter: one-side
aliases: [MPI_GET, MPI_Get]
tags: [mpi/function, mpi/one-side]
---

# MPI_GET

**C**
```c
int MPI_Get(void *origin_addr, int origin_count, MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype, MPI_Win win)
```

| Parameter | Intent | Description |
|---|---|---|
| `origin_addr` | OUT | initial address of origin buffer (choice) |
| `origin_count` | IN | number of entries in origin buffer (non-negative integer) |
| `origin_datatype` | IN | datatype of each entry in origin buffer (handle) |
| `target_rank` | IN | rank of target (non-negative integer) |
| `target_disp` | IN | displacement from window start to the beginning of the target buffer (non-negative integer) |
| `target_count` | IN | number of entries in target buffer (non-negative integer) |
| `target_datatype` | IN | datatype of each entry in target buffer (handle) |
| `win` | IN | window object used for communication (handle) |

**Fortran 2008**
```fortran
MPI_Get(origin_addr, origin_count, origin_datatype, target_rank, target_disp, target_count, target_datatype, win, ierror) BIND(C)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: origin_addr
  INTEGER, INTENT(IN) :: origin_count, target_rank, target_count
  TYPE(MPI_Datatype), INTENT(IN) :: origin_datatype, target_datatype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: target_disp
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GET(ORIGIN_ADDR, ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_DISP, TARGET_COUNT, TARGET_DATATYPE, WIN, IERROR)
  <type> ORIGIN_ADDR(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
  INTEGER ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_COUNT, TARGET_DATATYPE, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
