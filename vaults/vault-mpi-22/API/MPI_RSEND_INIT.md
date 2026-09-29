---
title: MPI_RSEND_INIT
c_name: MPI_Rsend_init
lis_name: MPI_RSEND_INIT
chapter: pt2pt
aliases: [MPI_RSEND_INIT, MPI_Rsend_init]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_RSEND_INIT

**C**
```c
int MPI_Rsend_init(void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Request *request)
```

**C++**
```cpp
MPI::Prequest MPI::Comm::Rsend_init(const void* buf, int count, const MPI::Datatype& datatype, int dest, int tag) const
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | IN | initial address of send buffer (choice) |
| `count` | IN | number of elements sent (non-negative integer) |
| `datatype` | IN | type of each element (handle) |
| `dest` | IN | rank of destination (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran (mpif.h)**
```fortran
MPI_RSEND_INIT(BUF, COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
