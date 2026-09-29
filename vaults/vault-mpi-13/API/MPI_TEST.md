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

**Fortran (mpif.h)**
```fortran
MPI_TEST(REQUEST, FLAG, STATUS, IERROR)
  LOGICAL FLAG
  INTEGER REQUEST, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
