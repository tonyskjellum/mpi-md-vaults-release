---
title: MPI_WIN_CREATE_KEYVAL
c_name: MPI_Win_create_keyval
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_CREATE_KEYVAL, MPI_Win_create_keyval]
tags: [mpi/routine, mpi/context]
---

# MPI_WIN_CREATE_KEYVAL

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_WIN_CREATE_KEYVAL|MPI-2.0]] · [[versions/v21/API/MPI_WIN_CREATE_KEYVAL|MPI-2.1]] Δ · [[versions/v22/API/MPI_WIN_CREATE_KEYVAL|MPI-2.2]] · [[versions/v30/API/MPI_WIN_CREATE_KEYVAL|MPI-3.0]] Δ · [[versions/v31/API/MPI_WIN_CREATE_KEYVAL|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_CREATE_KEYVAL|MPI-4.0]] Δ · [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI-4.1]] · [[versions/v50/API/MPI_WIN_CREATE_KEYVAL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0**
```c
int MPI_Win_create_keyval(MPI_Win_copy_attr_function *win_copy_attr_fn, MPI_Win_delete_attr_function *win_delete_attr_fn, int *win_keyval, void *extra_state)
typedef int MPI_Win_copy_attr_function(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Win_delete_attr_function(MPI_Win win, int win_keyval, void *attribute_val, void *extra_state);
```

**MPI-2.1–MPI-5.0**
```c
int MPI_Win_create_keyval(MPI_Win_copy_attr_function *win_copy_attr_fn, MPI_Win_delete_attr_function *win_delete_attr_fn, int *win_keyval, void *extra_state)
int MPI_WIN_NULL_COPY_FN(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_WIN_DUP_FN(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_WIN_NULL_DELETE_FN(MPI_Win win, int win_keyval, void *attribute_val, void *extra_state)
typedef int MPI_Win_copy_attr_function(MPI_Win oldwin, int win_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Win_delete_attr_function(MPI_Win win, int win_keyval, void *attribute_val, void *extra_state);
```

## C++

**MPI-2.0–MPI-2.2**
```c
static int MPI::Win::Create_keyval(MPI::Win::Copy_attr_function* win_copy_attr_fn, MPI::Win::Delete_attr_function* win_delete_attr_fn, void* extra_state)
typedef int MPI::Win::Copy_attr_function(const MPI::Win& oldwin, int win_keyval, void* extra_state, void* attribute_val_in, void* attribute_val_out, bool& flag);
typedef int MPI::Win::Delete_attr_function(MPI::Win& win, int win_keyval, void* attribute_val, void* extra_state);
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Win_create_keyval(win_copy_attr_fn, win_delete_attr_fn, win_keyval, extra_state, ierror) BIND(C)
    PROCEDURE(MPI_Win_copy_attr_function) :: win_copy_attr_fn
    PROCEDURE(MPI_Win_delete_attr_function) :: win_delete_attr_fn
    INTEGER, INTENT(OUT) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_WIN_NULL_COPY_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror) BIND(C)
    INTEGER, INTENT(IN) :: oldwin, win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state, attribute_val_in
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val_out
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, INTENT(OUT) :: ierror
MPI_WIN_DUP_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror) BIND(C)
    INTEGER, INTENT(IN) :: oldwin, win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state, attribute_val_in
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val_out
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, INTENT(OUT) :: ierror
MPI_WIN_NULL_DELETE_FN(win, win_keyval, attribute_val, extra_state, ierror) BIND(C)
    TYPE(MPI_Win), INTENT(IN) :: win
    INTEGER, INTENT(IN) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: attribute_val, extra_state
    INTEGER, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Win_create_keyval(win_copy_attr_fn, win_delete_attr_fn, win_keyval, extra_state, ierror)
    PROCEDURE(MPI_Win_copy_attr_function) :: win_copy_attr_fn
    PROCEDURE(MPI_Win_delete_attr_function) :: win_delete_attr_fn
    INTEGER, INTENT(OUT) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_WIN_NULL_COPY_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
    TYPE(MPI_Win) :: oldwin
    INTEGER :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in
    INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val_out
    LOGICAL :: flag
    INTEGER :: ierror
MPI_WIN_DUP_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
    TYPE(MPI_Win) :: oldwin
    INTEGER :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in
    INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val_out
    LOGICAL :: flag
    INTEGER :: ierror
MPI_WIN_NULL_DELETE_FN(win, win_keyval, attribute_val, extra_state, ierror)
    TYPE(MPI_Win) :: win
    INTEGER :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val, extra_state
    INTEGER :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Win_create_keyval(win_copy_attr_fn, win_delete_attr_fn, win_keyval, extra_state, ierror)
    PROCEDURE(MPI_Win_copy_attr_function) :: win_copy_attr_fn
    PROCEDURE(MPI_Win_delete_attr_function) :: win_delete_attr_fn
    INTEGER, INTENT(OUT) :: win_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_WIN_NULL_COPY_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
    TYPE(MPI_Win) :: oldwin
    INTEGER :: win_keyval, ierror
    INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in, attribute_val_out
    LOGICAL :: flag
MPI_WIN_DUP_FN(oldwin, win_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
    TYPE(MPI_Win) :: oldwin
    INTEGER :: win_keyval, ierror
    INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in, attribute_val_out
    LOGICAL :: flag
MPI_WIN_NULL_DELETE_FN(win, win_keyval, attribute_val, extra_state, ierror)
    TYPE(MPI_Win) :: win
    INTEGER :: win_keyval, ierror
    INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val, extra_state
```

## mpif.h

**MPI-2.0**
```fortran
MPI_WIN_CREATE_KEYVAL(WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN, WIN_KEYVAL, EXTRA_STATE, IERROR)
    EXTERNAL WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN
    INTEGER WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```

**MPI-2.1–MPI-3.1**
```fortran
MPI_WIN_CREATE_KEYVAL(WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN, WIN_KEYVAL, EXTRA_STATE, IERROR)
    EXTERNAL WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN
    INTEGER WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
MPI_WIN_NULL_COPY_FN(OLDWIN, WIN_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
    INTEGER OLDWIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
    ATTRIBUTE_VAL_OUT
    LOGICAL FLAG
MPI_WIN_DUP_FN(OLDWIN, WIN_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
    INTEGER OLDWIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
    ATTRIBUTE_VAL_OUT
    LOGICAL FLAG
MPI_WIN_NULL_DELETE_FN(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR)
    INTEGER WIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_WIN_CREATE_KEYVAL(WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN, WIN_KEYVAL, EXTRA_STATE, IERROR)
    EXTERNAL WIN_COPY_ATTR_FN, WIN_DELETE_ATTR_FN
    INTEGER WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
MPI_WIN_NULL_COPY_FN(OLDWIN, WIN_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
    INTEGER OLDWIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT
    LOGICAL FLAG
MPI_WIN_DUP_FN(OLDWIN, WIN_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
    INTEGER OLDWIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT
    LOGICAL FLAG
MPI_WIN_NULL_DELETE_FN(WIN, WIN_KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR)
    INTEGER WIN, WIN_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `win_copy_attr_fn` | IN | **MPI-2.0–MPI-5.0:** copy callback function for `win_keyval` (function) |
| `win_delete_attr_fn` | IN | **MPI-2.0–MPI-5.0:** delete callback function for `win_keyval` (function) |
| `win_keyval` | OUT | **MPI-2.0–MPI-5.0:** key value for future access (integer) |
| `extra_state` | IN | **MPI-2.0–MPI-3.1:** extra state for callback functions<br>**MPI-4.0–MPI-5.0:** extra state for callback function |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_CREATE_KEYVAL|API note]] · chapter [[versions/v50/sections/context|context]]
