---
title: MPI_COMM_SPLIT_TYPE
c_name: MPI_Comm_split_type
lis_name: MPI_COMM_SPLIT_TYPE
chapter: context
aliases: [MPI_COMM_SPLIT_TYPE, MPI_Comm_split_type]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_SPLIT_TYPE

**C**
```c
int MPI_Comm_split_type(MPI_Comm comm, int split_type, int key, MPI_Info info, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `split_type` | IN | type of processes to be grouped together (integer) |
| `key` | IN | control of rank assignment (integer) |
| `info` | INOUT | info argument (handle) |
| `newcomm` | OUT | new communicator (handle) |

**Fortran 2008**
```fortran
MPI_Comm_split_type(comm, split_type, key, info, newcomm, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: split_type, key
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Comm), INTENT(OUT) :: newcomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_SPLIT_TYPE(COMM, SPLIT_TYPE, KEY, INFO, NEWCOMM, IERROR)
  INTEGER COMM, SPLIT_TYPE, KEY, INFO, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
