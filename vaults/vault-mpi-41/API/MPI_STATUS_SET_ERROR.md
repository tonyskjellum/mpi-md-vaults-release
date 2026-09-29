---
title: MPI_STATUS_SET_ERROR
c_name: MPI_Status_set_error
lis_name: MPI_STATUS_SET_ERROR
chapter: ei
aliases: [MPI_STATUS_SET_ERROR, MPI_Status_set_error]
tags: [mpi/function, mpi/ei]
---

# MPI_STATUS_SET_ERROR

**C**
```c
int MPI_Status_set_error(MPI_Status *status, int err)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | INOUT | status with which to associate error (status) |
| `err` | IN | error to set in the `MPI_ERROR` field (integer) |

**Fortran 2008**
```fortran
MPI_Status_set_error(status, err, ierror)
  TYPE(MPI_Status), INTENT(INOUT) :: status
  INTEGER, INTENT(IN) :: err
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STATUS_SET_ERROR(STATUS, ERR, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), ERR, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
