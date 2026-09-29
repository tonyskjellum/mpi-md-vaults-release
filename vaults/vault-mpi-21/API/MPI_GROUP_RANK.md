---
title: MPI_GROUP_RANK
c_name: MPI_Group_rank
lis_name: MPI_GROUP_RANK
chapter: context
aliases: [MPI_GROUP_RANK, MPI_Group_rank]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_RANK

**C**
```c
int MPI_Group_rank(MPI_Group group, int *rank)
```

**C++**
```cpp
int MPI::Group::Get_rank() const
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `rank` | OUT | rank of the calling process in group, or MPI_UNDEFINED if the process is not a member (integer) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_RANK(GROUP, RANK, IERROR)
  INTEGER GROUP, RANK, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
