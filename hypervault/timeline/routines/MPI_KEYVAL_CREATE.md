---
title: MPI_KEYVAL_CREATE
c_name: MPI_Keyval_create
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: null
continued_as: "MPI_COMM_CREATE_KEYVAL"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_KEYVAL_CREATE, MPI_Keyval_create]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_KEYVAL_CREATE

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **continued as** [[timeline/routines/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_KEYVAL_CREATE|MPI-1.3]] · [[versions/v21/API/MPI_KEYVAL_CREATE|MPI-2.1]] † · [[versions/v22/API/MPI_KEYVAL_CREATE|MPI-2.2]] † · [[versions/v30/API/MPI_KEYVAL_CREATE|MPI-3.0]] † · [[versions/v31/API/MPI_KEYVAL_CREATE|MPI-3.1]] † · [[versions/v40/API/MPI_KEYVAL_CREATE|MPI-4.0]] † · [[versions/v41/API/MPI_KEYVAL_CREATE|MPI-4.1]] † · [[versions/v50/API/MPI_KEYVAL_CREATE|MPI-5.0]] †

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Keyval_create(MPI_Copy_function *copy_fn, MPI_Delete_function *delete_fn, int *keyval, void* extra_state)
```

**MPI-2.1–MPI-3.1**
```c
int MPI_Keyval_create(MPI_Copy_function *copy_fn, MPI_Delete_function *delete_fn, int *keyval, void* extra_state)
int MPI_NULL_COPY_FN(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_DUP_FN(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_NULL_DELETE_FN(MPI_Comm comm, int keyval, void *attribute_val, void *extra_state)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Keyval_create(MPI_Copy_function *copy_fn, MPI_Delete_function *delete_fn, int *keyval, void *extra_state)
int MPI_NULL_COPY_FN(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_DUP_FN(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_NULL_DELETE_FN(MPI_Comm comm, int keyval, void *attribute_val, void *extra_state)
typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Delete_function(MPI_Comm comm, int keyval, void *attribute_val, void *extra_state);
```

## mpif.h

**MPI-1.3**
```fortran
MPI_KEYVAL_CREATE(COPY_FN, DELETE_FN, KEYVAL, EXTRA_STATE, IERROR)
    EXTERNAL COPY_FN, DELETE_FN
    INTEGER KEYVAL, EXTRA_STATE, IERROR
```

**MPI-2.1–MPI-5.0**
```fortran
MPI_KEYVAL_CREATE(COPY_FN, DELETE_FN, KEYVAL, EXTRA_STATE, IERROR)
    EXTERNAL COPY_FN, DELETE_FN
    INTEGER KEYVAL, EXTRA_STATE, IERROR
MPI_NULL_COPY_FN(OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERR)
    INTEGER OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, IERR
    LOGICAL FLAG
MPI_DUP_FN(OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERR)
    INTEGER OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, IERR
    LOGICAL FLAG
MPI_NULL_DELETE_FN(COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR)
    INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `copy_fn` | IN | **MPI-1.3–MPI-5.0:** Copy callback function for `keyval` |
| `delete_fn` | IN | **MPI-1.3–MPI-5.0:** Delete callback function for `keyval` |
| `keyval` | OUT | **MPI-1.3–MPI-5.0:** key value for future access (integer) |
| `extra_state` | IN | **MPI-1.3–MPI-5.0:** Extra state for callback functions |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]
- MPI-3.0: [[versions/v30/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v30/sections/deprecated|deprecated]]
- MPI-3.1: [[versions/v31/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v31/sections/deprecated|deprecated]]
- MPI-4.0: [[versions/v40/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v40/sections/deprecated|deprecated]]
- MPI-4.1: [[versions/v41/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v41/sections/deprecated|deprecated]]
- MPI-5.0: [[versions/v50/API/MPI_KEYVAL_CREATE|API note]] · chapter [[versions/v50/sections/deprecated|deprecated]]
