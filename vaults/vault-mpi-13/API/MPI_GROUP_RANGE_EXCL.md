---
title: MPI_GROUP_RANGE_EXCL
c_name: MPI_Group_range_excl
lis_name: MPI_GROUP_RANGE_EXCL
chapter: context
aliases: [MPI_GROUP_RANGE_EXCL, MPI_Group_range_excl]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_RANGE_EXCL

**C**
```c
int MPI_Group_range_excl(MPI_Group group, int n, int ranges[][3], MPI_Group *newgroup)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `n` | IN | number of elements in array ranges (integer) |
| `ranges` | IN | a one-dimensional array of integer triplets of the form (first rank, last rank, stride), indicating the ranks in `group` of processes to be excluded from the output group `newgroup`. |
| `newgroup` | OUT | new group derived from above, preserving the order in `group` (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_RANGE_EXCL(GROUP, N, RANGES, NEWGROUP, IERROR)
  INTEGER GROUP, N, RANGES(3,*), NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
