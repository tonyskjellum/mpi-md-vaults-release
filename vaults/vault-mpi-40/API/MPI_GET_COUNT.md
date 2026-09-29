---
title: MPI_GET_COUNT
c_name: MPI_Get_count
lis_name: MPI_GET_COUNT
chapter: pt2pt
aliases: [MPI_GET_COUNT, MPI_Get_count, MPI_Get_count_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_GET_COUNT

**C**
```c
int MPI_Get_count(const MPI_Status *status, MPI_Datatype datatype, int *count)
int MPI_Get_count_c(const MPI_Status *status, MPI_Datatype datatype, MPI_Count *count)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | return status of receive operation (status) |
| `datatype` | IN | datatype of each receive buffer entry (handle) |
| `count` | OUT | number of received entries (integer) |

**Fortran 2008**
```fortran
MPI_Get_count(status, datatype, count, ierror)
  TYPE(MPI_Status), INTENT(IN) :: status
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(OUT) :: count
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Get_count(status, datatype, count, ierror) !(_c)
  TYPE(MPI_Status), INTENT(IN) :: status
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: count
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GET_COUNT(STATUS, DATATYPE, COUNT, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, COUNT, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
