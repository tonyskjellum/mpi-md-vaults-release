---
title: MPI_GROUP_DIFFERENCE
c_name: MPI_Group_difference
lis_name: MPI_GROUP_DIFFERENCE
chapter: context
aliases: [MPI_GROUP_DIFFERENCE, MPI_Group_difference]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_DIFFERENCE

**C**
```c
int MPI_Group_difference(MPI_Group group1, MPI_Group group2, MPI_Group *newgroup)
```

**C++**
```cpp
static MPI::Group MPI::Group::Difference(const MPI::Group& group1, const MPI::Group& group2)
```

| Parameter | Intent | Description |
|---|---|---|
| `group1` | IN | first group (handle) |
| `group2` | IN | second group (handle) |
| `newgroup` | OUT | difference group (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_DIFFERENCE(GROUP1, GROUP2, NEWGROUP, IERROR)
  INTEGER GROUP1, GROUP2, NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
