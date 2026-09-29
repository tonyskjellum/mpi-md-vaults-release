---
title: MPI_GET_ELEMENTS
c_name: MPI_Get_elements
lis_name: MPI_GET_ELEMENTS
chapter: datatypes
aliases: [MPI_GET_ELEMENTS, MPI_Get_elements]
tags: [mpi/function, mpi/datatypes]
---

# MPI_GET_ELEMENTS

**C**
```c
int MPI_Get_elements(const MPI_Status *status, MPI_Datatype datatype, int *count)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | return status of receive operation (Status) |
| `datatype` | IN | datatype used by receive operation (handle) |
| `count` | OUT | number of received basic elements (integer) |

**Fortran 2008**
```fortran
MPI_Get_elements(status, datatype, count, ierror)
  TYPE(MPI_Status), INTENT(IN) :: status
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(OUT) :: count
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GET_ELEMENTS(STATUS, DATATYPE, COUNT, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, COUNT, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
