---
title: MPI_COMM_TEST_INTER
c_name: MPI_Comm_test_inter
lis_name: MPI_COMM_TEST_INTER
chapter: context
aliases: [MPI_COMM_TEST_INTER, MPI_Comm_test_inter]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_TEST_INTER

**C**
```c
int MPI_Comm_test_inter(MPI_Comm comm, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `flag` | OUT | (logical) |

**Fortran 2008**
```fortran
MPI_Comm_test_inter(comm, flag, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_TEST_INTER(COMM, FLAG, IERROR)
  INTEGER COMM, IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
