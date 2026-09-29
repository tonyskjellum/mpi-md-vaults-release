---
title: MPI_REQUEST_GET_STATUS
c_name: MPI_Request_get_status
lis_name: MPI_REQUEST_GET_STATUS
chapter: pt2pt
aliases: [MPI_REQUEST_GET_STATUS, MPI_Request_get_status]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_REQUEST_GET_STATUS

**C**
```c
int MPI_Request_get_status(MPI_Request request, int *flag, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | IN | request (handle) |
| `flag` | OUT | boolean flag, same as from `MPI_TEST` (logical) |
| `status` | OUT | status object if flag is true (Status) |

**Fortran 2008**
```fortran
MPI_Request_get_status(request, flag, status, ierror)
  TYPE(MPI_Request), INTENT(IN) :: request
  LOGICAL, INTENT(OUT) :: flag
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REQUEST_GET_STATUS( REQUEST, FLAG, STATUS, IERROR)
  INTEGER REQUEST, STATUS(MPI_STATUS_SIZE), IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
