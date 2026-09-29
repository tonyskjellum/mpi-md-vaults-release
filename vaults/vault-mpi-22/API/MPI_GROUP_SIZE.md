---
title: MPI_GROUP_SIZE
c_name: MPI_Group_size
lis_name: MPI_GROUP_SIZE
chapter: context
aliases: [MPI_GROUP_SIZE, MPI_Group_size]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_SIZE

**C**
```c
int MPI_Group_size(MPI_Group group, int *size)
```

**C++**
```cpp
int MPI::Group::Get_size() const
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `size` | OUT | number of processes in the group (integer) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_SIZE(GROUP, SIZE, IERROR)
  INTEGER GROUP, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
