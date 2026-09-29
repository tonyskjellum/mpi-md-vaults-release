---
title: MPI_TYPE_GET_EXTENT
c_name: MPI_Type_get_extent
lis_name: MPI_TYPE_GET_EXTENT
chapter: datatypes
aliases: [MPI_TYPE_GET_EXTENT, MPI_Type_get_extent]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_GET_EXTENT

**C**
```c
int MPI_Type_get_extent(MPI_Datatype datatype, MPI_Aint *lb, MPI_Aint *extent)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to get information on (handle) |
| `lb` | OUT | lower bound of datatype (integer) |
| `extent` | OUT | extent of datatype (integer) |

**Fortran 2008**
```fortran
MPI_Type_get_extent(datatype, lb, extent, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: lb, extent
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_EXTENT(DATATYPE, LB, EXTENT, IERROR)
  INTEGER DATATYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) LB, EXTENT
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
