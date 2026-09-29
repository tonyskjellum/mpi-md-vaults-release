---
title: MPI_TEST_CANCELLED
c_name: MPI_Test_cancelled
lis_name: MPI_TEST_CANCELLED
chapter: pt2pt
aliases: [MPI_TEST_CANCELLED, MPI_Test_cancelled]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_TEST_CANCELLED

**C**
```c
int MPI_Test_cancelled(const MPI_Status *status, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | status object (status) |
| `flag` | OUT | `true` if the operation has been cancelled (logical) |

**Fortran 2008**
```fortran
MPI_Test_cancelled(status, flag, ierror)
  TYPE(MPI_Status), INTENT(IN) :: status
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TEST_CANCELLED(STATUS, FLAG, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
