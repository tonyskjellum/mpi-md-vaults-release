---
title: MPI_TYPE_COMMIT
c_name: MPI_Type_commit
lis_name: MPI_TYPE_COMMIT
chapter: datatypes
aliases: [MPI_TYPE_COMMIT, MPI_Type_commit]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_COMMIT

**C**
```c
int MPI_Type_commit(MPI_Datatype *datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype that is committed (handle) |

**Fortran 2008**
```fortran
MPI_Type_commit(datatype, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(INOUT) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_COMMIT(DATATYPE, IERROR)
  INTEGER DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
