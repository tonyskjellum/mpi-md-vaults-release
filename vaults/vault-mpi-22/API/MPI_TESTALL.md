---
title: MPI_TESTALL
c_name: MPI_Testall
lis_name: MPI_TESTALL
chapter: pt2pt
aliases: [MPI_TESTALL, MPI_Testall]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TESTALL

**C**
```c
int MPI_Testall(int count, MPI_Request *array_of_requests, int *flag, MPI_Status *array_of_statuses)
```

**C++**
```cpp
static bool MPI::Request::Testall(int count, MPI::Request array_of_requests[], MPI::Status array_of_statuses[])
static bool MPI::Request::Testall(int count, MPI::Request array_of_requests[])
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | lists length (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `flag` | OUT | (logical) |
| `array_of_statuses` | OUT | array of status objects (array of Status) |

**Fortran (mpif.h)**
```fortran
MPI_TESTALL(COUNT, ARRAY_OF_REQUESTS, FLAG, ARRAY_OF_STATUSES, IERROR)
  LOGICAL FLAG
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE,*), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
