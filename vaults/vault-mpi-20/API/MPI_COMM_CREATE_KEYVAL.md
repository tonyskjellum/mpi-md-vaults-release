---
title: MPI_COMM_CREATE_KEYVAL
c_name: MPI_Comm_create_keyval
lis_name: MPI_COMM_CREATE_KEYVAL
chapter: ei
aliases: [MPI_COMM_CREATE_KEYVAL, MPI_Comm_copy_attr_function, MPI_Comm_create_keyval, MPI_Comm_delete_attr_function]
tags: [mpi/function, mpi/ei]
---

# MPI_COMM_CREATE_KEYVAL

**C**
```c
int MPI_Comm_create_keyval(MPI_Comm_copy_attr_function *comm_copy_attr_fn, MPI_Comm_delete_attr_function *comm_delete_attr_fn, int *comm_keyval, void *extra_state)
typedef int MPI_Comm_copy_attr_function(MPI_Comm oldcomm, int comm_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Comm_delete_attr_function(MPI_Comm comm, int comm_keyval, void *attribute_val, void *extra_state);
```

**C++**
```cpp
static int MPI::Comm::Create_keyval(MPI::Comm::Copy_attr_function* comm_copy_attr_fn, MPI::Comm::Delete_attr_function* comm_delete_attr_fn, void* extra_state)
typedef int MPI::Comm::Copy_attr_function(const MPI::Comm& oldcomm, int comm_keyval, void* extra_state, void* attribute_val_in, void* attribute_val_out, bool& flag);
typedef int MPI::Comm::Delete_attr_function(MPI::Comm& comm, int comm_keyval, void* attribute_val, void* extra_state);
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_copy_attr_fn` | IN | copy callback function for `comm_keyval` (function) |
| `comm_delete_attr_fn` | IN | delete callback function for `comm_keyval` (function) |
| `comm_keyval` | OUT | key value for future access (integer) |
| `extra_state` | IN | extra state for callback functions |

**Fortran (mpif.h)**
```fortran
MPI_COMM_CREATE_KEYVAL(COMM_COPY_ATTR_FN, COMM_DELETE_ATTR_FN, COMM_KEYVAL, EXTRA_STATE, IERROR)
  EXTERNAL COMM_COPY_ATTR_FN, COMM_DELETE_ATTR_FN
  INTEGER COMM_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
