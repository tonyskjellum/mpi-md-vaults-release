---
title: MPI_TYPE_FREE
c_name: MPI_Type_free
lis_name: MPI_TYPE_FREE
chapter: datatypes
aliases: [MPI_TYPE_FREE, MPI_Type_free]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_FREE

**C**
```c
int MPI_Type_free(MPI_Datatype *datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype that is freed (handle) |

**Fortran 2008**
```fortran
MPI_Type_free(datatype, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(INOUT) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_FREE(DATATYPE, IERROR)
  INTEGER DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
