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
int MPI_Testall(int count, MPI_Request array_of_requests[], int *flag, MPI_Status array_of_statuses[])
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | list length (non-negative integer) |
| `array_of_requests` | INOUT | array of requests (array of handles) |
| `flag` | OUT | `true` if all of the operations are complete (logical) |
| `array_of_statuses` | OUT | array of status objects (array of status) |

**Fortran 2008**
```fortran
MPI_Testall(count, array_of_requests, flag, array_of_statuses, ierror)
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Request), INTENT(INOUT) :: array_of_requests(count)
  LOGICAL, INTENT(OUT) :: flag
  TYPE(MPI_Status) :: array_of_statuses(*)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TESTALL(COUNT, ARRAY_OF_REQUESTS, FLAG, ARRAY_OF_STATUSES, IERROR)
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
