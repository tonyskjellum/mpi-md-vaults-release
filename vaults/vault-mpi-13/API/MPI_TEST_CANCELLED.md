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
int MPI_Test_cancelled(MPI_Status *status, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | IN | status object (Status) |
| `flag` | OUT | (logical) |

**Fortran (mpif.h)**
```fortran
MPI_TEST_CANCELLED(STATUS, FLAG, IERROR)
  LOGICAL FLAG
  INTEGER STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
