---
title: MPI_GROUP_EXCL
c_name: MPI_Group_excl
lis_name: MPI_GROUP_EXCL
chapter: context
aliases: [MPI_GROUP_EXCL, MPI_Group_excl]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_EXCL

**C**
```c
int MPI_Group_excl(MPI_Group group, int n, int *ranks, MPI_Group *newgroup)
```

**C++**
```cpp
MPI::Group MPI::Group::Excl(int n, const int ranks[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `n` | IN | number of elements in array ranks (integer) |
| `ranks` | IN | array of integer ranks in `group` not to appear in `newgroup` |
| `newgroup` | OUT | new group derived from above, preserving the order defined by ` group` (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_EXCL(GROUP, N, RANKS, NEWGROUP, IERROR)
  INTEGER GROUP, N, RANKS(*), NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
