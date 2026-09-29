---
title: MPI_BCAST
c_name: MPI_Bcast
lis_name: MPI_BCAST
chapter: coll
aliases: [MPI_BCAST, MPI_Bcast]
tags: [mpi/function, mpi/coll]
---

# MPI_BCAST

**C**
```c
int MPI_Bcast(void* buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm )
```

**C++**
```cpp
void MPI::Comm::Bcast(void* buffer, int count, const MPI::Datatype& datatype, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `buffer` | INOUT | starting address of buffer (choice) |
| `count` | IN | number of entries in buffer (non-negative integer) |
| `datatype` | IN | data type of buffer (handle) |
| `root` | IN | rank of broadcast root (integer) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_BCAST(BUFFER, COUNT, DATATYPE, ROOT, COMM, IERROR)
  <type> BUFFER(*)
  INTEGER COUNT, DATATYPE, ROOT, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
