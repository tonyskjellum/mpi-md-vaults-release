---
title: MPI_TYPE_GET_EXTENT_X
c_name: MPI_Type_get_extent_x
lis_name: MPI_TYPE_GET_EXTENT_X
chapter: datatypes
aliases: [MPI_TYPE_GET_EXTENT_X, MPI_Type_get_extent_x]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_GET_EXTENT_X

**C**
```c
int MPI_Type_get_extent_x(MPI_Datatype datatype, MPI_Count *lb, MPI_Count *extent)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to get information on (handle) |
| `lb` | OUT | lower bound of datatype (integer) |
| `extent` | OUT | extent of datatype (integer) |

**Fortran 2008**
```fortran
MPI_Type_get_extent_x(datatype, lb, extent, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: lb, extent
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_EXTENT_X(DATATYPE, LB, EXTENT, IERROR)
  INTEGER DATATYPE, IERROR
  INTEGER(KIND=MPI_COUNT_KIND) LB, EXTENT
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
