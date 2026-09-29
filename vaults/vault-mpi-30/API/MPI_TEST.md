---
title: MPI_TEST
c_name: MPI_Test
lis_name: MPI_TEST
chapter: pt2pt
aliases: [MPI_TEST, MPI_Test]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TEST

**C**
```c
int MPI_Test(MPI_Request *request, int *flag, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | INOUT | communication request (handle) |
| `flag` | OUT | true if operation completed (logical) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Test(request, flag, status, ierror) BIND(C)
  TYPE(MPI_Request), INTENT(INOUT) :: request
  LOGICAL, INTENT(OUT) :: flag
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TEST(REQUEST, FLAG, STATUS, IERROR)
  LOGICAL FLAG
  INTEGER REQUEST, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
