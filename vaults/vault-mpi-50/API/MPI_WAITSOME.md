---
title: MPI_WAITSOME
c_name: MPI_Waitsome
lis_name: MPI_WAITSOME
chapter: pt2pt
aliases: [MPI_WAITSOME, MPI_Waitsome]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_WAITSOME

**C**
```c
int MPI_Waitsome(int incount, MPI_Request array_of_requests[], int *outcount, int array_of_indices[], MPI_Status array_of_statuses[])
```

| Parameter | Intent | Description |
|---|---|---|
| `incount` | IN | length of array_of_requests (nonnegative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `outcount` | OUT | number of completed requests (integer) |
| `array_of_indices` | OUT | array of indices of operations that completed (array of integers) |
| `array_of_statuses` | OUT | array of status objects for operations that completed (array of status) |

**Fortran 2008**
```fortran
MPI_Waitsome(incount, array_of_requests, outcount, array_of_indices, array_of_statuses, ierror)
  INTEGER, INTENT(IN) :: incount
  TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(incount)
  INTEGER, INTENT(OUT) :: outcount, array_of_indices(*)
  TYPE(MPI_Status) :: array_of_statuses(*)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WAITSOME(INCOUNT, ARRAY_OF_REQUESTS, OUTCOUNT, ARRAY_OF_INDICES, ARRAY_OF_STATUSES, IERROR)
  INTEGER INCOUNT, ARRAY_OF_REQUESTS(*), OUTCOUNT, ARRAY_OF_INDICES(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
