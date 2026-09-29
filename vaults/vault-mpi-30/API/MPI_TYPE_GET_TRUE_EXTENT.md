---
title: MPI_TYPE_GET_TRUE_EXTENT
c_name: MPI_Type_get_true_extent
lis_name: MPI_TYPE_GET_TRUE_EXTENT
chapter: datatypes
aliases: [MPI_TYPE_GET_TRUE_EXTENT, MPI_Type_get_true_extent]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_GET_TRUE_EXTENT

**C**
```c
int MPI_Type_get_true_extent(MPI_Datatype datatype, MPI_Aint *true_lb, MPI_Aint *true_extent)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to get information on (handle) |
| `true_lb` | OUT | true lower bound of datatype (integer) |
| `true_extent` | OUT | true size of datatype (integer) |

**Fortran 2008**
```fortran
MPI_Type_get_true_extent(datatype, true_lb, true_extent, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: true_lb, true_extent
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_TRUE_EXTENT(DATATYPE, TRUE_LB, TRUE_EXTENT, IERROR)
  INTEGER DATATYPE, IERROR
  INTEGER(KIND = MPI_ADDRESS_KIND) TRUE_LB, TRUE_EXTENT
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
