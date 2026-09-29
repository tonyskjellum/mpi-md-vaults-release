---
title: MPI_KEYVAL_CREATE
c_name: MPI_Keyval_create
lis_name: MPI_KEYVAL_CREATE
chapter: context
aliases: [MPI_KEYVAL_CREATE, MPI_Keyval_create]
tags: [mpi/function, mpi/context]
---

# MPI_KEYVAL_CREATE

**C**
```c
int MPI_Keyval_create(MPI_Copy_function *copy_fn, MPI_Delete_function *delete_fn, int *keyval, void* extra_state)
```

| Parameter | Intent | Description |
|---|---|---|
| `copy_fn` | IN | Copy callback function for `keyval` |
| `delete_fn` | IN | Delete callback function for `keyval` |
| `keyval` | OUT | key value for future access (integer) |
| `extra_state` | IN | Extra state for callback functions |

**Fortran (mpif.h)**
```fortran
MPI_KEYVAL_CREATE(COPY_FN, DELETE_FN, KEYVAL, EXTRA_STATE, IERROR)
  EXTERNAL COPY_FN, DELETE_FN
  INTEGER KEYVAL, EXTRA_STATE, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
