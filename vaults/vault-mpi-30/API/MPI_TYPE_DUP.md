---
title: MPI_TYPE_DUP
c_name: MPI_Type_dup
lis_name: MPI_TYPE_DUP
chapter: datatypes
aliases: [MPI_TYPE_DUP, MPI_Type_dup]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_DUP

**C**
```c
int MPI_Type_dup(MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `oldtype` | IN | datatype (handle) |
| `newtype` | OUT | copy of `oldtype` (handle) |

**Fortran 2008**
```fortran
MPI_Type_dup(oldtype, newtype, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_DUP(OLDTYPE, NEWTYPE, IERROR)
  INTEGER OLDTYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
