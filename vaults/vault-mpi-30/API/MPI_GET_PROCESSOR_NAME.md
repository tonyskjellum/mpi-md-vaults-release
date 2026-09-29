---
title: MPI_GET_PROCESSOR_NAME
c_name: MPI_Get_processor_name
lis_name: MPI_GET_PROCESSOR_NAME
chapter: inquiry
aliases: [MPI_GET_PROCESSOR_NAME, MPI_Get_processor_name]
tags: [mpi/function, mpi/inquiry]
---

# MPI_GET_PROCESSOR_NAME

**C**
```c
int MPI_Get_processor_name(char *name, int *resultlen)
```

| Parameter | Intent | Description |
|---|---|---|
| `name` | OUT | A unique specifier for the actual (as opposed to virtual) node. |
| `resultlen` | OUT | Length (in printable characters) of the result returned in `name` |

**Fortran 2008**
```fortran
MPI_Get_processor_name(name, resultlen, ierror) BIND(C)
  CHARACTER(LEN=MPI_MAX_PROCESSOR_NAME), INTENT(OUT) :: name
  INTEGER, INTENT(OUT) :: resultlen
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GET_PROCESSOR_NAME( NAME, RESULTLEN, IERROR)
  CHARACTER*(*) NAME
  INTEGER RESULTLEN,IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
