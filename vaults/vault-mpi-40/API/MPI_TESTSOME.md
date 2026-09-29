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
int MPI_Testsome(int incount, MPI_Request array_of_requests[], int *outcount, int array_of_indices[], MPI_Status array_of_statuses[])
```

| Parameter | Intent | Description |
|---|---|---|
| `incount` | IN | length of array_of_requests (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `outcount` | OUT | number of completed requests (integer) |
| `array_of_indices` | OUT | array of indices of operations that completed (array of integers) |
| `array_of_statuses` | OUT | array of status objects for operations that completed (array of status) |

**Fortran 2008**
```fortran
MPI_Testsome(incount, array_of_requests, outcount, array_of_indices, array_of_statuses, ierror)
  INTEGER, INTENT(IN) :: incount
  TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(incount)
  INTEGER, INTENT(OUT) :: outcount, array_of_indices(*)
  TYPE(MPI_Status) :: array_of_statuses(*)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TESTSOME(INCOUNT, ARRAY_OF_REQUESTS, OUTCOUNT, ARRAY_OF_INDICES, ARRAY_OF_STATUSES, IERROR)
  INTEGER INCOUNT, ARRAY_OF_REQUESTS(*), OUTCOUNT, ARRAY_OF_INDICES(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
