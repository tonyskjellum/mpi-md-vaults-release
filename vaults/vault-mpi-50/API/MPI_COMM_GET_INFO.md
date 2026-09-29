---
title: MPI_COMM_GET_INFO
c_name: MPI_Comm_get_info
lis_name: MPI_COMM_GET_INFO
chapter: context
aliases: [MPI_COMM_GET_INFO, MPI_Comm_get_info]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_GET_INFO

**C**
```c
int MPI_Comm_get_info(MPI_Comm comm, MPI_Info *info_used)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator object (handle) |
| `info_used` | OUT | new info object (handle) |

**Fortran 2008**
```fortran
MPI_Comm_get_info(comm, info_used, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Info), INTENT(OUT) :: info_used
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_GET_INFO(COMM, INFO_USED, IERROR)
  INTEGER COMM, INFO_USED, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
