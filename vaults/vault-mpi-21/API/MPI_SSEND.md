---
title: MPI_SSEND
c_name: MPI_Ssend
lis_name: MPI_SSEND
chapter: pt2pt
aliases: [MPI_SSEND, MPI_Ssend]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_SSEND

**C**
```c
int MPI_Ssend(void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Ssend(const void* buf, int count, const MPI::Datatype& datatype, int dest, int tag) const
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | IN | initial address of send buffer (choice) |
| `count` | IN | number of elements in send buffer (non-negative integer) |
| `datatype` | IN | datatype of each send buffer element (handle) |
| `dest` | IN | rank of destination (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_SSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, DEST, TAG, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
