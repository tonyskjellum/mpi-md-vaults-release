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
int MPI_TYPE_NULL_DELETE_FN(MPI_Datatype datatype, int type_keyval, void *attribute_val, void *extra_state)
typedef int MPI_Type_copy_attr_function(MPI_Datatype oldtype, int type_keyval, void *extra_state, void *attribute_val_in, void *attribute_val_out, int *flag);
typedef int MPI_Type_delete_attr_function(MPI_Datatype datatype, int type_keyval, void *attribute_val, void *extra_state);
```

| Parameter | Intent | Description |
|---|---|---|
| `type_copy_attr_fn` | IN | copy callback function for `type_keyval` (function) |
| `type_delete_attr_fn` | IN | delete callback function for `type_keyval` (function) |
| `type_keyval` | OUT | key value for future access (integer) |
| `extra_state` | IN | extra state for callback function |

**Fortran 2008**
```fortran
MPI_Type_create_keyval(type_copy_attr_fn, type_delete_attr_fn, type_keyval, extra_state, ierror)
  PROCEDURE(MPI_Type_copy_attr_function) :: type_copy_attr_fn
  PROCEDURE(MPI_Type_delete_attr_function) :: type_delete_attr_fn
  INTEGER, INTENT(OUT) :: type_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_TYPE_NULL_COPY_FN(oldtype, type_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
  TYPE(MPI_Datatype) :: oldtype
  INTEGER :: type_keyval, ierror
  INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in, attribute_val_out
  LOGICAL :: flag
```

**Fortran 2008**
```fortran
MPI_TYPE_DUP_FN(oldtype, type_keyval, extra_state, attribute_val_in, attribute_val_out, flag, ierror)
  TYPE(MPI_Datatype) :: oldtype
  INTEGER :: type_keyval, ierror
  INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state, attribute_val_in, attribute_val_out
  LOGICAL :: flag
```

**Fortran 2008**
```fortran
MPI_TYPE_NULL_DELETE_FN(datatype, type_keyval, attribute_val, extra_state, ierror)
  TYPE(MPI_Datatype) :: datatype
  INTEGER :: type_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND) :: attribute_val, extra_state
  INTEGER, INTENT(OUT) :: ierror
```

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
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_DUP_FN(OLDTYPE, TYPE_KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
  INTEGER OLDTYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT
  LOGICAL FLAG
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_NULL_DELETE_FN(DATATYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERROR)
  INTEGER DATATYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
