---
title: MPI_GET_ELEMENTS
c_name: MPI_Get_elements
lis_name: MPI_GET_ELEMENTS
chapter: pt2pt
aliases: [MPI_GET_ELEMENTS, MPI_Get_elements]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_GET_ELEMENTS

**C**
```c
int MPI_Get_elements(MPI_Status *status, MPI_Datatype datatype, int *count)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | return status of receive operation (Status) |
| `datatype` | IN | datatype used by receive operation (handle) |
| `count` | OUT | number of received basic elements (integer) |

**Fortran (mpif.h)**
```fortran
MPI_GET_ELEMENTS(STATUS, DATATYPE, COUNT, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, COUNT, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
