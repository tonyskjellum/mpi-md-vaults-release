---
title: MPI_PACK
c_name: MPI_Pack
lis_name: MPI_PACK
chapter: datatypes
aliases: [MPI_PACK, MPI_Pack]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK

**C**
```c
int MPI_Pack(void* inbuf, int incount, MPI_Datatype datatype, void *outbuf, int outsize, int *position, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Datatype::Pack(const void* inbuf, int incount, void *outbuf, int outsize, int& position, const MPI::Comm &comm) const
```

| Parameter | Intent | Description |
|---|---|---|
| `inbuf` | IN | input buffer start (choice) |
| `incount` | IN | number of input data items (non-negative integer) |
| `datatype` | IN | datatype of each input data item (handle) |
| `outbuf` | OUT | output buffer start (choice) |
| `outsize` | IN | output buffer size, in bytes (non-negative integer) |
| `position` | INOUT | current position in buffer, in bytes (integer) |
| `comm` | IN | communicator for packed message (handle) |

**Fortran (mpif.h)**
```fortran
MPI_PACK(INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, COMM, IERROR)
  <type> INBUF(*), OUTBUF(*)
  INTEGER INCOUNT, DATATYPE, OUTSIZE, POSITION, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
