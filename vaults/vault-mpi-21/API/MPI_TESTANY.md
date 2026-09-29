---
title: MPI_TESTANY
c_name: MPI_Testany
lis_name: MPI_TESTANY
chapter: pt2pt
aliases: [MPI_TESTANY, MPI_Testany]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TESTANY

**C**
```c
int MPI_Testany(int count, MPI_Request *array_of_requests, int *index, int *flag, MPI_Status *status)
```

**C++**
```cpp
static bool MPI::Request::Testany(int count, MPI::Request array_of_requests[], int& index, MPI::Status& status)
static bool MPI::Request::Testany(int count, MPI::Request array_of_requests[], int& index)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | list length (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `index` | OUT | index of operation that completed, or MPI_UNDEFINED if none completed (integer) |
| `flag` | OUT | true if one of the operations is complete (logical) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_TESTANY(COUNT, ARRAY_OF_REQUESTS, INDEX, FLAG, STATUS, IERROR)
  LOGICAL FLAG
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
