---
title: MPI_WIN_GET_ATTR
c_name: MPI_Win_get_attr
lis_name: MPI_WIN_GET_ATTR
chapter: context
aliases: [MPI_WIN_GET_ATTR, MPI_Win_get_attr]
tags: [mpi/function, mpi/context]
---

# MPI_WIN_GET_ATTR

**C**
```c
int MPI_Win_get_attr(MPI_Win win, int win_keyval, void *attribute_val, int *flag)
```

**C++**
```cpp
bool MPI::Win::Get_attr(int win_keyval, void* attribute_val) const
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | window to which the attribute is attached (handle) |
| `win_keyval` | IN | key value (integer) |
| `attribute_val` | OUT | attribute value, unless `flag = false` |
| `flag` | OUT | false if no attribute is associated with the key (logical) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_GET_ATTR(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
  INTEGER WIN, WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
