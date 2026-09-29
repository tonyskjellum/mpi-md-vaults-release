---
title: MPI_STATUS_SET_SOURCE
c_name: MPI_Status_set_source
lis_name: MPI_STATUS_SET_SOURCE
chapter: ei
aliases: [MPI_STATUS_SET_SOURCE, MPI_Status_set_source]
tags: [mpi/function, mpi/ei]
---

# MPI_STATUS_SET_SOURCE

**C**
```c
int MPI_Status_set_source(MPI_Status *status, int source)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | INOUT | status with which to associate source rank (status) |
| `source` | IN | rank to set in the `MPI_SOURCE` field (integer) |

**Fortran 2008**
```fortran
MPI_Status_set_source(status, source, ierror)
  TYPE(MPI_Status), INTENT(INOUT) :: status
  INTEGER, INTENT(IN) :: source
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STATUS_SET_SOURCE(STATUS, SOURCE, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), SOURCE, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
