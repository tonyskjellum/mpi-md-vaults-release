---
title: MPI_GET_COUNT
c_name: MPI_Get_count
lis_name: MPI_GET_COUNT
chapter: pt2pt
aliases: [MPI_GET_COUNT, MPI_Get_count]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_GET_COUNT

**C**
```c
int MPI_Get_count(MPI_Status *status, MPI_Datatype datatype, int *count)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | return status of receive operation (Status) |
| `datatype` | IN | datatype of each receive buffer entry (handle) |
| `count` | OUT | number of received entries (integer) |

**Fortran (mpif.h)**
```fortran
MPI_GET_COUNT(STATUS, DATATYPE, COUNT, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, COUNT, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
