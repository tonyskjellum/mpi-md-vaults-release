---
title: MPI_REQUEST_GET_STATUS_ANY
c_name: MPI_Request_get_status_any
lis_name: MPI_REQUEST_GET_STATUS_ANY
chapter: pt2pt
aliases: [MPI_REQUEST_GET_STATUS_ANY, MPI_Request_get_status_any]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_REQUEST_GET_STATUS_ANY

**C**
```c
int MPI_Request_get_status_any(int count, const MPI_Request array_of_requests[], int *index, int *flag, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | list length (non-negative integer) |
| `array_of_requests` | IN | array of requests (array of handles) |
| `index` | OUT | index of operation that completed or `MPI_UNDEFINED` if none completed (integer) |
| `flag` | OUT | `true` if one of the operations is complete (logical) |
| `status` | OUT | status object if flag is true (status) |

**Fortran 2008**
```fortran
MPI_Request_get_status_any(count, array_of_requests, index, flag, status, ierror)
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Request), INTENT(IN) :: array_of_requests(count)
  INTEGER, INTENT(OUT) :: index
  LOGICAL, INTENT(OUT) :: flag
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REQUEST_GET_STATUS_ANY(COUNT, ARRAY_OF_REQUESTS, INDEX, FLAG, STATUS, IERROR)
  INTEGER COUNT, ARRAY_OF_REQUESTS(*), INDEX, STATUS(MPI_STATUS_SIZE), IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
