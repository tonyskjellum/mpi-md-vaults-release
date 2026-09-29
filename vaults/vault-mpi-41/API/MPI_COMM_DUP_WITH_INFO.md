---
title: MPI_COMM_DUP_WITH_INFO
c_name: MPI_Comm_dup_with_info
lis_name: MPI_COMM_DUP_WITH_INFO
chapter: context
aliases: [MPI_COMM_DUP_WITH_INFO, MPI_Comm_dup_with_info]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_DUP_WITH_INFO

**C**
```c
int MPI_Comm_dup_with_info(MPI_Comm comm, MPI_Info info, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `info` | IN | info object (handle) |
| `newcomm` | OUT | copy of `comm` (handle) |

**Fortran 2008**
```fortran
MPI_Comm_dup_with_info(comm, info, newcomm, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Comm), INTENT(OUT) :: newcomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_DUP_WITH_INFO(COMM, INFO, NEWCOMM, IERROR)
  INTEGER COMM, INFO, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
