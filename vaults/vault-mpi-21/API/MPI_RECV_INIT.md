---
title: MPI_RECV_INIT
c_name: MPI_Recv_init
lis_name: MPI_RECV_INIT
chapter: pt2pt
aliases: [MPI_RECV_INIT, MPI_Recv_init]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_RECV_INIT

**C**
```c
int MPI_Recv_init(void* buf, int count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Request *request)
```

**C++**
```cpp
MPI::Prequest MPI::Comm::Recv_init(void* buf, int count, const MPI::Datatype& datatype, int source, int tag) const
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | OUT | initial address of receive buffer (choice) |
| `count` | IN | number of elements received (non-negative integer) |
| `datatype` | IN | type of each element (handle) |
| `source` | IN | rank of source or MPI_ANY_SOURCE (integer) |
| `tag` | IN | message tag or MPI_ANY_TAG (integer) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran (mpif.h)**
```fortran
MPI_RECV_INIT(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
