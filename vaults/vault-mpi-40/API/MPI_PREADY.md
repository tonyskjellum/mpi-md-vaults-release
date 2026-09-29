---
title: MPI_PREADY
c_name: MPI_Pready
lis_name: MPI_PREADY
chapter: part
aliases: [MPI_PREADY, MPI_Pready]
tags: [mpi/function, mpi/part]
---

# MPI_PREADY

**C**
```c
int MPI_Pready(int partition, MPI_Request request)
```

| Parameter | Intent | Description |
|---|---|---|
| `partition` | IN | partition to mark ready for transfer (non-negative integer) |
| `request` | INOUT | partitioned communication request (handle) |

**Fortran 2008**
```fortran
MPI_Pready(partition, request, ierror)
  INTEGER, INTENT(IN) :: partition
  TYPE(MPI_Request), INTENT(IN) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PREADY(PARTITION, REQUEST, IERROR)
  INTEGER PARTITION, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[part]] for the normative text.
