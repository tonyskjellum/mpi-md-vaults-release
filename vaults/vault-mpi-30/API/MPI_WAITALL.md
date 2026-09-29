---
title: MPI_WAITALL
c_name: MPI_Waitall
lis_name: MPI_WAITALL
chapter: pt2pt
aliases: [MPI_WAITALL, MPI_Waitall]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_WAITALL

**C**
```c
int MPI_Waitall(int count, MPI_Request array_of_requests[], MPI_Status array_of_statuses[])
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | lists length (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `array_of_statuses` | OUT | array of status objects (array of Status) |

**Fortran 2008**
```fortran
MPI_Waitall(count, array_of_requests, array_of_statuses, ierror) BIND(C)
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
  TYPE(MPI_Status) :: array_of_statuses(*)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WAITALL(COUNT, ARRAY_OF_REQUESTS, ARRAY_OF_STATUSES, IERROR)
  INTEGER COUNT, ARRAY_OF_REQUESTS(*)
  INTEGER ARRAY_OF_STATUSES(MPI_STATUS_SIZE,*), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
