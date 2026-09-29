---
title: MPI_TYPE_CREATE_KEYVAL
c_name: MPI_Type_create_keyval
lis_name: MPI_TYPE_CREATE_KEYVAL
chapter: context
aliases: [MPI_TYPE_CREATE_KEYVAL, MPI_TYPE_DUP_FN, MPI_TYPE_NULL_COPY_FN, MPI_TYPE_NULL_DELETE_FN, MPI_Type_copy_attr_function, MPI_Type_create_keyval, MPI_Type_delete_attr_function]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_CREATE_KEYVAL

**C**
```c
int MPI_Type_create_keyval(MPI_Type_copy_attr_function *type_copy_attr_fn, MPI_Type_delete_attr_function *type_delete_attr_fn, int *type_keyval, void *extra_state)
int MPI_TYPE_NULL_COPY_FN(MPI_Datatype oldtype, int type_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_TYPE_DUP_FN(MPI_Datatype oldtype, int type_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag)
int MPI_TYPE_NULL_DELETE_FN(MPI_Datatype type, int type_keyval, void *attribute_val, void *extra_state)
typedef int MPI_Type_copy_attr_function(MPI_Datatype oldtype, int type_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Type_delete_attr_function(MPI_Datatype type, int type_keyval, void *attribute_val, void *extra_state);
```

**C++**
```cpp
static int MPI::Datatype::Create_keyval(MPI::Datatype::Copy_attr_function* type_copy_attr_fn, MPI::Datatype::Delete_attr_function* type_delete_attr_fn, void* extra_state)
typedef int MPI::Datatype::Copy_attr_function(const MPI::Datatype& oldtype, int type_keyval, void* extra_state, const void* attribute_val_in, void* attribute_val_out, bool& flag);
typedef int MPI::Datatype::Delete_attr_function(MPI::Datatype& type, int type_keyval, void* attribute_val, void* extra_state);
```

| Parameter | Intent | Description |
|---|---|---|
| `type_copy_attr_fn` | IN | copy callback function for `type_keyval` (function) |
| `type_delete_attr_fn` | IN | delete callback function for `type_keyval` (function) |
| `type_keyval` | OUT | key value for future access (integer) |
| `extra_state` | IN | extra state for callback functions |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_KEYVAL(TYPE_COPY_ATTR_FN, TYPE_DELETE_ATTR_FN, TYPE_KEYVAL, EXTRA_STATE, IERROR)
  EXTERNAL TYPE_COPY_ATTR_FN, TYPE_DELETE_ATTR_FN
  INTEGER TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_NULL_COPY_FN(OLDTYPE, TYPE_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
  INTEGER OLDTYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
  ATTRIBUTE_VAL_OUT
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_DUP_FN(OLDTYPE, TYPE_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
  INTEGER OLDTYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
  ATTRIBUTE_VAL_OUT
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_NULL_DELETE_FN(TYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR)
  INTEGER TYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
