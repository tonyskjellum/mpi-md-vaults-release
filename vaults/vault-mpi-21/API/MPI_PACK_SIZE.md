---
title: MPI_PACK_SIZE
c_name: MPI_Pack_size
lis_name: MPI_PACK_SIZE
chapter: datatypes
aliases: [MPI_PACK_SIZE, MPI_Pack_size]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK_SIZE

**C**
```c
int MPI_Pack_size(int incount, MPI_Datatype datatype, MPI_Comm comm, int *size)
```

**C++**
```cpp
int MPI::Datatype::Pack_size(int incount, const MPI::Comm& comm) const
```

| Parameter | Intent | Description |
|---|---|---|
| `incount` | IN | count argument to packing call (non-negative integer) |
| `datatype` | IN | datatype argument to packing call (handle) |
| `comm` | IN | communicator argument to packing call (handle) |
| `size` | OUT | upper bound on size of packed message, in bytes (non-negative integer) |

**Fortran (mpif.h)**
```fortran
MPI_PACK_SIZE(INCOUNT, DATATYPE, COMM, SIZE, IERROR)
  INTEGER INCOUNT, DATATYPE, COMM, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
