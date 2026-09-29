---
title: MPI_RECV
c_name: MPI_Recv
lis_name: MPI_RECV
chapter: pt2pt
aliases: [MPI_RECV, MPI_Recv]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_RECV

**C**
```c
int MPI_Recv(void* buf, int count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | OUT | initial address of receive buffer (choice) |
| `count` | IN | number of elements in receive buffer (non-negative integer) |
| `datatype` | IN | datatype of each receive buffer element (handle) |
| `source` | IN | rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | communicator (handle) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Recv(buf, count, datatype, source, tag, comm, status, ierror) BIND(C)
  TYPE(*), DIMENSION(..) :: buf
  INTEGER, INTENT(IN) :: count, source, tag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_RECV(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM, STATUS, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, SOURCE, TAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
