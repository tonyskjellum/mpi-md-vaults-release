---
title: MPI_TYPE_SIZE
c_name: MPI_Type_size
lis_name: MPI_TYPE_SIZE
chapter: datatypes
aliases: [MPI_TYPE_SIZE, MPI_Type_size]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_SIZE

**C**
```c
int MPI_Type_size(MPI_Datatype datatype, int *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype (handle) |
| `size` | OUT | datatype size (integer) |

**Fortran 2008**
```fortran
MPI_Type_size(datatype, size, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SIZE(DATATYPE, SIZE, IERROR)
  INTEGER DATATYPE, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
