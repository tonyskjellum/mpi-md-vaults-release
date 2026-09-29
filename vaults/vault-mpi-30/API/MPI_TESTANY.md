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
int MPI_Testany(int count, MPI_Request array_of_requests[], int *index, int *flag, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | list length (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `index` | OUT | index of operation that completed, or `MPI_UNDEFINED` if none completed (integer) |
| `flag` | OUT | `true` if one of the operations is complete (logical) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Testany(count, array_of_requests, index, flag, status, ierror) BIND(C)
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
  INTEGER, INTENT(OUT) :: index
  LOGICAL, INTENT(OUT) :: flag
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TESTANY(COUNT, ARRAY_OF_REQUESTS, INDEX, FLAG, STATUS, IERROR)
  LOGICAL FLAG
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
