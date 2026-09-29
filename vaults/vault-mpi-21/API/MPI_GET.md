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

**C++**
```cpp
void MPI::Win::Get(void *origin_addr, int origin_count, const MPI::Datatype& origin_datatype, int target_rank, MPI::Aint target_disp, int target_count, const MPI::Datatype& target_datatype) const
```

| Parameter | Intent | Description |
|---|---|---|
| `origin_addr` | OUT | initial address of origin buffer (choice) |
| `origin_count` | IN | number of entries in origin buffer (nonnegative integer) |
| `origin_datatype` | IN | datatype of each entry in origin buffer (handle) |
| `target_rank` | IN | rank of target (nonnegative integer) |
| `target_disp` | IN | displacement from window start to the beginning of the target buffer (nonnegative integer) |
| `target_count` | IN | number of entries in target buffer (nonnegative integer) |
| `target_datatype` | IN | datatype of each entry in target buffer (handle) |
| `win` | IN | window object used for communication (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GET(ORIGIN_ADDR, ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_DISP, TARGET_COUNT, TARGET_DATATYPE, WIN, IERROR)
  <type> ORIGIN_ADDR(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
  INTEGER ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_COUNT, TARGET_DATATYPE, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
