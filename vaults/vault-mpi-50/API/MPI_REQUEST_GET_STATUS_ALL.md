---
title: MPI_REQUEST_GET_STATUS_ALL
c_name: MPI_Request_get_status_all
lis_name: MPI_REQUEST_GET_STATUS_ALL
chapter: pt2pt
aliases: [MPI_REQUEST_GET_STATUS_ALL, MPI_Request_get_status_all]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_REQUEST_GET_STATUS_ALL

**C**
```c
int MPI_Request_get_status_all(int count, const MPI_Request array_of_requests[], int *flag, MPI_Status array_of_statuses[])
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | list length (nonnegative integer) |
| `array_of_requests` | IN | array of requests (array of handles) |
| `flag` | OUT | true if all of the operations are complete (logical) |
| `array_of_statuses` | OUT | array of status objects (array of status) |

**Fortran 2008**
```fortran
MPI_Request_get_status_all(count, array_of_requests, flag, array_of_statuses, ierror)
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Request), INTENT(IN) :: array_of_requests(count)
  LOGICAL, INTENT(OUT) :: flag
  TYPE(MPI_Status) :: array_of_statuses(*)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REQUEST_GET_STATUS_ALL(COUNT, ARRAY_OF_REQUESTS, FLAG, ARRAY_OF_STATUSES, IERROR)
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), ARRAY_OF_STATUSES(MPI_STATUS_SIZE, *), IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
