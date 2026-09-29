---
title: MPI_PARRIVED
c_name: MPI_Parrived
lis_name: MPI_PARRIVED
chapter: part
aliases: [MPI_PARRIVED, MPI_Parrived]
tags: [mpi/function, mpi/part]
---

# MPI_PARRIVED

**C**
```c
int MPI_Parrived(MPI_Request request, int partition, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | IN | partitioned communication request (handle) |
| `partition` | IN | partition to be tested (non-negative integer) |
| `flag` | OUT | `true` if operation completed on the specified partition, `false` if not (logical) |

**Fortran 2008**
```fortran
MPI_Parrived(request, partition, flag, ierror)
  TYPE(MPI_Request), INTENT(IN) :: request
  INTEGER, INTENT(IN) :: partition
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PARRIVED(REQUEST, PARTITION, FLAG, IERROR)
  INTEGER REQUEST, PARTITION, IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[part]] for the normative text.
