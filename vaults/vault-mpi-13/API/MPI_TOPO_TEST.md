---
title: MPI_TOPO_TEST
c_name: MPI_Topo_test
lis_name: MPI_TOPO_TEST
chapter: topol
aliases: [MPI_TOPO_TEST, MPI_Topo_test]
tags: [mpi/function, mpi/topol]
---

# MPI_TOPO_TEST

**C**
```c
int MPI_Topo_test(MPI_Comm comm, int *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `status` | OUT | topology type of communicator `comm` (state) |

**Fortran (mpif.h)**
```fortran
MPI_TOPO_TEST(COMM, STATUS, IERROR)
  INTEGER COMM, STATUS, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
