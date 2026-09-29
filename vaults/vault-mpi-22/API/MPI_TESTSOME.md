---
title: MPI_TESTSOME
c_name: MPI_Testsome
lis_name: MPI_TESTSOME
chapter: pt2pt
aliases: [MPI_TESTSOME, MPI_Testsome]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TESTSOME

**C**
```c
int MPI_Testsome(int incount, MPI_Request *array_of_requests, int *outcount, int *array_of_indices, MPI_Status *array_of_statuses)
```

**C++**
```cpp
static int MPI::Request::Testsome(int incount, MPI::Request array_of_requests[], int array_of_indices[], MPI::Status array_of_statuses[])
static int MPI::Request::Testsome(int incount, MPI::Request array_of_requests[], int array_of_indices[])
```

| Parameter | Intent | Description |
|---|---|---|
| `incount` | IN | length of array_of_requests (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `outcount` | OUT | number of completed requests (integer) |
| `array_of_indices` | OUT | array of indices of operations that completed (array of integers) |
| `array_of_statuses` | OUT | array of status objects for operations that completed (array of Status) |

**Fortran (mpif.h)**
```fortran
MPI_TESTSOME(INCOUNT, ARRAY_OF_REQUESTS, OUTCOUNT, ARRAY_OF_INDICES, ARRAY_OF_STATUSES, IERROR)
  INTEGER INCOUNT, ARRAY_OF_REQUESTS(*), OUTCOUNT, ARRAY_OF_INDICES(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE,*), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
