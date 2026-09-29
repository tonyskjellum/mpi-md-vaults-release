---
title: MPI_TYPE_SIZE_X
c_name: MPI_Type_size_x
lis_name: MPI_TYPE_SIZE_X
chapter: datatypes
aliases: [MPI_TYPE_SIZE_X, MPI_Type_size_x]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_SIZE_X

**C**
```c
int MPI_Type_size_x(MPI_Datatype datatype, MPI_Count *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to get information on (handle) |
| `size` | OUT | datatype size (integer) |

**Fortran 2008**
```fortran
MPI_Type_size_x(datatype, size, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SIZE_X(DATATYPE, SIZE, IERROR)
  INTEGER DATATYPE, IERROR
  INTEGER(KIND=MPI_COUNT_KIND) SIZE
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
