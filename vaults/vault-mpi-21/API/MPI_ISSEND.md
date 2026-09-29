---
title: MPI_ISSEND
c_name: MPI_Issend
lis_name: MPI_ISSEND
chapter: pt2pt
aliases: [MPI_ISSEND, MPI_Issend]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_ISSEND

**C**
```c
int MPI_Issend(void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Request *request)
```

**C++**
```cpp
MPI::Request MPI::Comm::Issend(const void* buf, int count, const MPI::Datatype& datatype, int dest, int tag) const
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | IN | initial address of send buffer (choice) |
| `count` | IN | number of elements in send buffer (non-negative integer) |
| `datatype` | IN | datatype of each send buffer element (handle) |
| `dest` | IN | rank of destination (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ISSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
