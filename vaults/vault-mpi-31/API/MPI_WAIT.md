---
title: MPI_WAIT
c_name: MPI_Wait
lis_name: MPI_WAIT
chapter: pt2pt
aliases: [MPI_WAIT, MPI_Wait]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_WAIT

**C**
```c
int MPI_Wait(MPI_Request *request, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | INOUT | request (handle) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Wait(request, status, ierror)
  TYPE(MPI_Request), INTENT(INOUT) :: request
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WAIT(REQUEST, STATUS, IERROR)
  INTEGER REQUEST, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
