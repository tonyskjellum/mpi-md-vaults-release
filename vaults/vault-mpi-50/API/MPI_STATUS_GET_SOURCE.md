---
title: MPI_STATUS_GET_SOURCE
c_name: MPI_Status_get_source
lis_name: MPI_STATUS_GET_SOURCE
chapter: pt2pt
aliases: [MPI_STATUS_GET_SOURCE, MPI_Status_get_source]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_STATUS_GET_SOURCE

**C**
```c
int MPI_Status_get_source(const MPI_Status *status, int *source)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | status from which to retrieve source rank (status) |
| `source` | OUT | rank set in the `MPI_SOURCE` field (integer) |

**Fortran 2008**
```fortran
MPI_Status_get_source(status, source, ierror)
  TYPE(MPI_Status), INTENT(IN) :: status
  INTEGER, INTENT(OUT) :: source
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STATUS_GET_SOURCE(STATUS, SOURCE, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), SOURCE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
