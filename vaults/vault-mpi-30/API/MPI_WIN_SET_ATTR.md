---
title: MPI_WIN_SET_ATTR
c_name: MPI_Win_set_attr
lis_name: MPI_WIN_SET_ATTR
chapter: context
aliases: [MPI_WIN_SET_ATTR, MPI_Win_set_attr]
tags: [mpi/function, mpi/context]
---

# MPI_WIN_SET_ATTR

**C**
```c
int MPI_Win_set_attr(MPI_Win win, int win_keyval, void *attribute_val)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | INOUT | window to which attribute will be attached (handle) |
| `win_keyval` | IN | key value (integer) |
| `attribute_val` | IN | attribute value |

**Fortran 2008**
```fortran
MPI_Win_set_attr(win, win_keyval, attribute_val, ierror) BIND(C)
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, INTENT(IN) :: win_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: attribute_val
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_SET_ATTR(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, IERROR)
  INTEGER WIN, WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
