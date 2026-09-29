---
title: MPI_WIN_CREATE_KEYVAL
c_name: MPI_Win_create_keyval
lis_name: MPI_WIN_CREATE_KEYVAL
chapter: ei
aliases: [MPI_WIN_CREATE_KEYVAL, MPI_Win_copy_attr_function, MPI_Win_create_keyval, MPI_Win_delete_attr_function]
tags: [mpi/function, mpi/ei]
---

# MPI_WIN_CREATE_KEYVAL

**C**
```c
int MPI_Win_create_keyval(MPI_Win_copy_attr_function *win_copy_attr_fn, MPI_Win_delete_attr_function *win_delete_attr_fn, int *win_keyval, void *extra_state)
typedef int MPI_Win_copy_attr_function(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Win_delete_attr_function(MPI_Win win, int win_keyval, void *attribute_val, void *extra_state);
```

**C++**
```cpp
static int MPI::Win::Create_keyval(MPI::Win::Copy_attr_function* win_copy_attr_fn, MPI::Win::Delete_attr_function* win_delete_attr_fn, void* extra_state)
typedef int MPI::Win::Copy_attr_function(const MPI::Win& oldwin, int win_keyval, void* extra_state, void* attribute_val_in, void* attribute_val_out, bool& flag);
typedef int MPI::Win::Delete_attr_function(MPI::Win& win, int win_keyval, void* attribute_val, void* extra_state);
```

| Parameter | Intent | Description |
|---|---|---|
| `win_copy_attr_fn` | IN | copy callback function for `win_keyval` (function) |
| `win_delete_attr_fn` | IN | delete callback function for `win_keyval` (function) |
| `win_keyval` | OUT | key value for future access (integer) |
| `extra_state` | IN | extra state for callback functions |

**Fortran (mpif.h)**
```fortran
MPI_WIN_CREATE_KEYVAL(WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN, WIN_KEYVAL, EXTRA_STATE, IERROR)
  EXTERNAL WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN
  INTEGER WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
