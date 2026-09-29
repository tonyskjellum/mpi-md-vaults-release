---
title: MPI_STATUS_GET_ERROR
c_name: MPI_Status_get_error
lis_name: MPI_STATUS_GET_ERROR
chapter: pt2pt
aliases: [MPI_STATUS_GET_ERROR, MPI_Status_get_error]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_STATUS_GET_ERROR

**C**
```c
int MPI_Status_get_error(const MPI_Status *status, int *err)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | status from which to retrieve error (status) |
| `err` | OUT | error set in the `MPI_ERROR` field (integer) |

**Fortran 2008**
```fortran
MPI_Status_get_error(status, err, ierror)
  TYPE(MPI_Status), INTENT(IN) :: status
  INTEGER, INTENT(OUT) :: err
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STATUS_GET_ERROR(STATUS, ERR, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), ERR, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
