---
title: MPI_WIN_SET_ATTR
c_name: MPI_Win_set_attr
lis_name: MPI_WIN_SET_ATTR
chapter: ei
aliases: [MPI_WIN_SET_ATTR, MPI_Win_set_attr]
tags: [mpi/function, mpi/ei]
---

# MPI_WIN_SET_ATTR

**C**
```c
int MPI_Win_set_attr(MPI_Win win, int win_keyval, void *attribute_val)
```

**C++**
```cpp
void MPI::Win::Set_attr(int win_keyval, const void* attribute_val)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window to which attribute will be attached (handle) |
| `win_keyval` | IN | key value (integer) |
| `attribute_val` | IN | attribute value |

**Fortran (mpif.h)**
```fortran
MPI_WIN_SET_ATTR(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, IERROR)
  INTEGER WIN, WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
