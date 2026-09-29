---
title: MPI_STATUS_GET_TAG
c_name: MPI_Status_get_tag
lis_name: MPI_STATUS_GET_TAG
chapter: pt2pt
aliases: [MPI_STATUS_GET_TAG, MPI_Status_get_tag]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_STATUS_GET_TAG

**C**
```c
int MPI_Status_get_tag(MPI_Status *status, int *tag)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | status from which to retrieve tag (status) |
| `tag` | OUT | tag set in the `MPI_TAG` field (integer) |

**Fortran 2008**
```fortran
MPI_Status_get_tag(status, tag, ierror)
  TYPE(MPI_Status), INTENT(IN) :: status
  INTEGER, INTENT(OUT) :: tag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_STATUS_GET_TAG(STATUS, TAG, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), TAG, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
