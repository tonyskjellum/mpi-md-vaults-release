---
title: MPI_KEYVAL_CREATE
c_name: MPI_Keyval_create
lis_name: MPI_KEYVAL_CREATE
chapter: deprecated
aliases: [MPI_Copy_function, MPI_DUP_FN, MPI_Delete_function, MPI_KEYVAL_CREATE, MPI_Keyval_create, MPI_NULL_COPY_FN, MPI_NULL_DELETE_FN]
tags: [mpi/function, mpi/deprecated]
---

# MPI_KEYVAL_CREATE

**C**
```c
int MPI_Keyval_create(MPI_Copy_function *copy_fn, MPI_Delete_function *delete_fn, int *keyval, void *extra_state)
int MPI_NULL_COPY_FN(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_DUP_FN(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_NULL_DELETE_FN(MPI_Comm comm, int keyval, void *attribute_val, void *extra_state)
typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Delete_function(MPI_Comm comm, int keyval, void *attribute_val, void *extra_state);
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

**Fortran (mpif.h)**
```fortran
MPI_NULL_COPY_FN(OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERR)
  INTEGER OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, IERR
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_DUP_FN(OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERR)
  INTEGER OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, IERR
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_NULL_DELETE_FN(COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR)
  INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.
