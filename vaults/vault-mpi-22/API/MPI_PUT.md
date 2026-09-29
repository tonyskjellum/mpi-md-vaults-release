---
title: MPI_PUT
c_name: MPI_Put
lis_name: MPI_PUT
chapter: one-side
aliases: [MPI_PUT, MPI_Put]
tags: [mpi/function, mpi/one-side]
---

# MPI_PUT

**C**
```c
int MPI_Put(void *origin_addr, int origin_count, MPI_Datatype origin_datatype, int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype, MPI_Win win)
```

**C++**
```cpp
void MPI::Win::Put(const void* origin_addr, int origin_count, const MPI::Datatype& origin_datatype, int target_rank, MPI::Aint target_disp, int target_count, const MPI::Datatype& target_datatype) const
```

| Parameter | Intent | Description |
|---|---|---|
| `origin_addr` | IN | initial address of origin buffer (choice) |
| `origin_count` | IN | number of entries in origin buffer (non-negative integer) |
| `origin_datatype` | IN | datatype of each entry in origin buffer (handle) |
| `target_rank` | IN | rank of target (non-negative integer) |
| `target_disp` | IN | displacement from start of window to target buffer (non-negative integer) |
| `target_count` | IN | number of entries in target buffer (non-negative integer) |
| `target_datatype` | IN | datatype of each entry in target buffer (handle) |
| `win` | IN | window object used for communication (handle) |

**Fortran (mpif.h)**
```fortran
MPI_PUT(ORIGIN_ADDR, ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_DISP, TARGET_COUNT, TARGET_DATATYPE, WIN, IERROR)
  <type> ORIGIN_ADDR(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) TARGET_DISP
  INTEGER ORIGIN_COUNT, ORIGIN_DATATYPE, TARGET_RANK, TARGET_COUNT, TARGET_DATATYPE, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
