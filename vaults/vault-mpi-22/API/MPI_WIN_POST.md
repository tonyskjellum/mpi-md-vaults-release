---
title: MPI_WIN_POST
c_name: MPI_Win_post
lis_name: MPI_WIN_POST
chapter: one-side
aliases: [MPI_WIN_POST, MPI_Win_post]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_POST

**C**
```c
int MPI_Win_post(MPI_Group group, int assert, MPI_Win win)
```

**C++**
```cpp
void MPI::Win::Post(const MPI::Group& group, int assert) const
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group of origin processes (handle) |
| `assert` | IN | program assertion (integer) |
| `win` | IN | window object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_POST(GROUP, ASSERT, WIN, IERROR)
  INTEGER GROUP, ASSERT, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
