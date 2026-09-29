---
title: MPI_IRECV
c_name: MPI_Irecv
lis_name: MPI_IRECV
chapter: pt2pt
aliases: [MPI_IRECV, MPI_Irecv]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_IRECV

**C**
```c
int MPI_Irecv(void* buf, int count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | OUT | initial address of receive buffer (choice) |
| `count` | IN | number of elements in receive buffer (integer) |
| `datatype` | IN | datatype of each receive buffer element (handle) |
| `source` | IN | rank of source (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran (mpif.h)**
```fortran
MPI_IRECV(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
