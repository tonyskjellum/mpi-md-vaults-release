---
title: MPI_WIN_CREATE_KEYVAL
c_name: MPI_Win_create_keyval
lis_name: MPI_WIN_CREATE_KEYVAL
chapter: context
aliases: [MPI_WIN_CREATE_KEYVAL, MPI_WIN_DUP_FN, MPI_WIN_NULL_COPY_FN, MPI_WIN_NULL_DELETE_FN, MPI_Win_copy_attr_function, MPI_Win_create_keyval, MPI_Win_delete_attr_function]
tags: [mpi/function, mpi/context]
---

# MPI_WIN_CREATE_KEYVAL

**C**
```c
int MPI_Win_create_keyval(MPI_Win_copy_attr_function *win_copy_attr_fn, MPI_Win_delete_attr_function *win_delete_attr_fn, int *win_keyval, void *extra_state)
int MPI_WIN_NULL_COPY_FN(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_WIN_DUP_FN(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_WIN_NULL_DELETE_FN(MPI_Win win, int win_keyval, void *attribute_val, void *extra_state)
typedef int MPI_Win_copy_attr_function(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Win_delete_attr_function(MPI_Win win, int win_keyval, void *attribute_val, void *extra_state);
```

| Parameter | Intent | Description |
|---|---|---|
| `win_copy_attr_fn` | IN | copy callback function for `win_keyval` (function) |
| `win_delete_attr_fn` | IN | delete callback function for `win_keyval` (function) |
| `win_keyval` | OUT | key value for future access (integer) |
| `extra_state` | IN | extra state for callback functions |

**Fortran 2008**
```fortran
MPI_Win_create_keyval(win_copy_attr_fn, win_delete_attr_fn, win_keyval, extra_state, ierror)
  PROCEDURE(MPI_Win_copy_attr_function) :: win_copy_attr_fn
  PROCEDURE(MPI_Win_delete_attr_function) :: win_delete_attr_fn
  INTEGER, INTENT(OUT) :: win_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_WIN_NULL_COPY_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
  TYPE(MPI_Win) :: oldwin
  INTEGER :: win_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in
  INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val_out
  LOGICAL :: flag
  INTEGER :: ierror
```

**Fortran 2008**
```fortran
MPI_WIN_DUP_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
  TYPE(MPI_Win) :: oldwin
  INTEGER :: win_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in
  INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val_out
  LOGICAL :: flag
  INTEGER :: ierror
```

**Fortran 2008**
```fortran
MPI_WIN_NULL_DELETE_FN(win, win_keyval, attribute_val, extra_state, ierror)
  TYPE(MPI_Win) :: win
  INTEGER :: win_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val, extra_state
  INTEGER :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_CREATE_KEYVAL(WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN, WIN_KEYVAL, EXTRA_STATE, IERROR)
  EXTERNAL WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN
  INTEGER WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_NULL_COPY_FN(OLDWIN, WIN_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
  INTEGER OLDWIN, WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
  ATTRIBUTE_VAL_OUT
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_DUP_FN(OLDWIN, WIN_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
  INTEGER OLDWIN, WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
  ATTRIBUTE_VAL_OUT
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_NULL_DELETE_FN(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR)
  INTEGER WIN, WIN_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
