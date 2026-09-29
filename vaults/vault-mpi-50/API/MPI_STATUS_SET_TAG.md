---
title: MPI_STATUS_SET_TAG
c_name: MPI_Status_set_tag
lis_name: MPI_STATUS_SET_TAG
chapter: ei
aliases: [MPI_STATUS_SET_TAG, MPI_Status_set_tag]
tags: [mpi/function, mpi/ei]
---

# MPI_STATUS_SET_TAG

**C**
```c
int MPI_Status_set_tag(MPI_Status *status, int tag)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | INOUT | status with which to associate tag (status) |
| `tag` | IN | tag to set in the `MPI_TAG` field (integer) |

**Fortran 2008**
```fortran
MPI_Status_set_tag(status, tag, ierror)
  TYPE(MPI_Status), INTENT(INOUT) :: status
  INTEGER, INTENT(IN) :: tag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STATUS_SET_TAG(STATUS, TAG, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), TAG, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
