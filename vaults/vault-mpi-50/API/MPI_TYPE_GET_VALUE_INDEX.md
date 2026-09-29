---
title: MPI_TYPE_GET_VALUE_INDEX
c_name: MPI_Type_get_value_index
lis_name: MPI_TYPE_GET_VALUE_INDEX
chapter: coll
aliases: [MPI_TYPE_GET_VALUE_INDEX, MPI_Type_get_value_index]
tags: [mpi/function, mpi/coll]
---

# MPI_TYPE_GET_VALUE_INDEX

**C**
```c
int MPI_Type_get_value_index(MPI_Datatype value_type, MPI_Datatype index_type, MPI_Datatype *pair_type)
```

| Parameter | Intent | Description |
|---|---|---|
| `value_type` | IN | datatype of the value in pair (handle) |
| `index_type` | IN | datatype of the index in pair (handle) |
| `pair_type` | OUT | datatype of the value-index pair (handle) |

**Fortran 2008**
```fortran
MPI_Type_get_value_index(value_type, index_type, pair_type, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: value_type, index_type
  TYPE(MPI_Datatype), INTENT(OUT) :: pair_type
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_VALUE_INDEX(VALUE_TYPE, INDEX_TYPE, PAIR_TYPE, IERROR)
  INTEGER VALUE_TYPE, INDEX_TYPE, PAIR_TYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
