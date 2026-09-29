---
title: MPI_TYPE_SET_NAME
c_name: MPI_Type_set_name
lis_name: MPI_TYPE_SET_NAME
chapter: context
aliases: [MPI_TYPE_SET_NAME, MPI_Type_set_name]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_SET_NAME

**C**
```c
int MPI_Type_set_name(MPI_Datatype datatype, const char *type_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype whose identifier is to be set (handle) |
| `type_name` | IN | the character string which is remembered as the name (string) |

**Fortran 2008**
```fortran
MPI_Type_set_name(datatype, type_name, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  CHARACTER(LEN=*), INTENT(IN) :: type_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SET_NAME(DATATYPE, TYPE_NAME, IERROR)
  INTEGER DATATYPE, IERROR
  CHARACTER*(*) TYPE_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
