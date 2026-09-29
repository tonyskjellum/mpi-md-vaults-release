---
title: MPI_STATUS_SET_ELEMENTS_X
c_name: MPI_Status_set_elements_x
lis_name: MPI_STATUS_SET_ELEMENTS_X
chapter: ei
aliases: [MPI_STATUS_SET_ELEMENTS_X, MPI_Status_set_elements_x]
tags: [mpi/function, mpi/ei]
---

# MPI_STATUS_SET_ELEMENTS_X

**C**
```c
int MPI_Status_set_elements_x(MPI_Status *status, MPI_Datatype datatype, MPI_Count count)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | INOUT | status with which to associate count (Status) |
| `datatype` | IN | datatype associated with count (handle) |
| `count` | IN | number of elements to associate with status (integer) |

**Fortran 2008**
```fortran
MPI_Status_set_elements_x(status, datatype, count, ierror)
  TYPE(MPI_Status), INTENT(INOUT) :: status
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND = MPI_COUNT_KIND), INTENT(IN) :: count
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STATUS_SET_ELEMENTS_X(STATUS, DATATYPE, COUNT, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, IERROR
  INTEGER (KIND=MPI_COUNT_KIND) COUNT
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
