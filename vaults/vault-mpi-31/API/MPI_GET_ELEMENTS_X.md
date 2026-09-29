---
title: MPI_GET_ELEMENTS_X
c_name: MPI_Get_elements_x
lis_name: MPI_GET_ELEMENTS_X
chapter: datatypes
aliases: [MPI_GET_ELEMENTS_X, MPI_Get_elements_x]
tags: [mpi/function, mpi/datatypes]
---

# MPI_GET_ELEMENTS_X

**C**
```c
int MPI_Get_elements_x(const MPI_Status *status, MPI_Datatype datatype, MPI_Count *count)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | return status of receive operation (Status) |
| `datatype` | IN | datatype used by receive operation (handle) |
| `count` | OUT | number of received basic elements (integer) |

**Fortran 2008**
```fortran
MPI_Get_elements_x(status, datatype, count, ierror)
  TYPE(MPI_Status), INTENT(IN) :: status
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: count
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GET_ELEMENTS_X(STATUS, DATATYPE, COUNT, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, IERROR
  INTEGER(KIND=MPI_COUNT_KIND) COUNT
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
