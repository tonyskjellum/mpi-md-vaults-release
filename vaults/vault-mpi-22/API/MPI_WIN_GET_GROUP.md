---
title: MPI_WIN_GET_GROUP
c_name: MPI_Win_get_group
lis_name: MPI_WIN_GET_GROUP
chapter: one-side
aliases: [MPI_WIN_GET_GROUP, MPI_Win_get_group]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_GET_GROUP

**C**
```c
int MPI_Win_get_group(MPI_Win win, MPI_Group *group)
```

**C++**
```cpp
MPI::Group MPI::Win::Get_group() const
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window object (handle) |
| `group` | OUT | group of processes which share access to the window (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_GET_GROUP(WIN, GROUP, IERROR)
  INTEGER WIN, GROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
