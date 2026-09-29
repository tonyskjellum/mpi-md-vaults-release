---
title: MPI_WAITANY
c_name: MPI_Waitany
lis_name: MPI_WAITANY
chapter: pt2pt
aliases: [MPI_WAITANY, MPI_Waitany]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_WAITANY

**C**
```c
int MPI_Waitany(int count, MPI_Request *array_of_requests, int *index, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | list length (integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `index` | OUT | index of handle for operation that completed (integer) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_WAITANY(COUNT, ARRAY_OF_REQUESTS, INDEX, STATUS, IERROR)
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
