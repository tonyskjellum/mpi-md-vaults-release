---
title: MPI_TYPE_GET_TRUE_EXTENT_X
c_name: MPI_Type_get_true_extent_x
lis_name: MPI_TYPE_GET_TRUE_EXTENT_X
chapter: datatypes
aliases: [MPI_TYPE_GET_TRUE_EXTENT_X, MPI_Type_get_true_extent_x]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_GET_TRUE_EXTENT_X

**C**
```c
int MPI_Type_get_true_extent_x(MPI_Datatype datatype, MPI_Count *true_lb, MPI_Count *true_extent)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to get information on (handle) |
| `true_lb` | OUT | true lower bound of datatype (integer) |
| `true_extent` | OUT | true size of datatype (integer) |

**Fortran 2008**
```fortran
MPI_Type_get_true_extent_x(datatype, true_lb, true_extent, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND = MPI_COUNT_KIND), INTENT(OUT) :: true_lb, true_extent
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_TRUE_EXTENT_X(DATATYPE, TRUE_LB, TRUE_EXTENT, IERROR)
  INTEGER DATATYPE, IERROR
  INTEGER(KIND = MPI_COUNT_KIND) TRUE_LB, TRUE_EXTENT
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
