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
int MPI_Waitall(int count, MPI_Request *array_of_requests, MPI_Status *array_of_statuses)
```

**C++**
```cpp
static void MPI::Request::Waitall(int count, MPI::Request array_of_requests[], MPI::Status array_of_statuses[])
static void MPI::Request::Waitall(int count, MPI::Request array_of_requests[])
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | lists length (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `array_of_statuses` | OUT | array of status objects (array of Status) |

**Fortran (mpif.h)**
```fortran
MPI_WAITALL(COUNT, ARRAY_OF_REQUESTS, ARRAY_OF_STATUSES, IERROR)
  INTEGER COUNT, ARRAY_OF_REQUESTS(*)
  INTEGER ARRAY_OF_STATUSES(MPI_STATUS_SIZE,*), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
