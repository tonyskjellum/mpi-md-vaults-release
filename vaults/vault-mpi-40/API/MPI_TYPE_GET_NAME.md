---
title: MPI_TYPE_GET_NAME
c_name: MPI_Type_get_name
lis_name: MPI_TYPE_GET_NAME
chapter: context
aliases: [MPI_TYPE_GET_NAME, MPI_Type_get_name]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_GET_NAME

**C**
```c
int MPI_Type_get_name(MPI_Datatype datatype, char *type_name, int *resultlen)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype whose name is to be returned (handle) |
| `type_name` | OUT | the name previously stored on the datatype, or an empty string if no such name exists (string) |
| `resultlen` | OUT | length of returned name (integer) |

**Fortran 2008**
```fortran
MPI_Type_get_name(datatype, type_name, resultlen, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  CHARACTER(LEN=MPI_MAX_OBJECT_NAME), INTENT(OUT) :: type_name
  INTEGER, INTENT(OUT) :: resultlen
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_NAME(DATATYPE, TYPE_NAME, RESULTLEN, IERROR)
  INTEGER DATATYPE, RESULTLEN, IERROR
  CHARACTER*(*) TYPE_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
