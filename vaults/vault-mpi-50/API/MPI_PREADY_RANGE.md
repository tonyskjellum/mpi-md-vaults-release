---
title: MPI_PREADY_RANGE
c_name: MPI_Pready_range
lis_name: MPI_PREADY_RANGE
chapter: part
aliases: [MPI_PREADY_RANGE, MPI_Pready_range]
tags: [mpi/function, mpi/part]
---

# MPI_PREADY_RANGE

**C**
```c
int MPI_Pready_range(int partition_low, int partition_high, MPI_Request request)
```

| Parameter | Intent | Description |
|---|---|---|
| `partition_low` | IN | lowest partition ready for transfer (nonnegative integer) |
| `partition_high` | IN | highest partition ready for transfer (nonnegative integer) |
| `request` | INOUT | partitioned communication request (handle) |

**Fortran 2008**
```fortran
MPI_Pready_range(partition_low, partition_high, request, ierror)
  INTEGER, INTENT(IN) :: partition_low, partition_high
  TYPE(MPI_Request), INTENT(IN) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PREADY_RANGE(PARTITION_LOW, PARTITION_HIGH, REQUEST, IERROR)
  INTEGER PARTITION_LOW, PARTITION_HIGH, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[part]] for the normative text.
