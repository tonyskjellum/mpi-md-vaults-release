---
title: MPI_COMM_SET_INFO
c_name: MPI_Comm_set_info
lis_name: MPI_COMM_SET_INFO
chapter: context
aliases: [MPI_COMM_SET_INFO, MPI_Comm_set_info]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_SET_INFO

**C**
```c
int MPI_Comm_set_info(MPI_Comm comm, MPI_Info info)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator (handle) |
| `info` | IN | info object (handle) |

**Fortran 2008**
```fortran
MPI_Comm_set_info(MPI_Comm comm, MPI_Info info) BIND(C)
  TYPE(MPI_Comm), INTENT(INOUT) :: comm
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_SET_INFO(COMM, INFO, IERROR)
  INTEGER COMM, INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
