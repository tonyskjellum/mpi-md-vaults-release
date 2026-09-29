---
title: MPI_PACK
c_name: MPI_Pack
lis_name: MPI_PACK
chapter: pt2pt
aliases: [MPI_PACK, MPI_Pack]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_PACK

**C**
```c
int MPI_Pack(void* inbuf, int incount, MPI_Datatype datatype, void *outbuf, int outsize, int *position, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `inbuf` | IN | input buffer start (choice) |
| `incount` | IN | number of input data items (integer) |
| `datatype` | IN | datatype of each input data item (handle) |
| `outbuf` | OUT | output buffer start (choice) |
| `outsize` | IN | output buffer size, in bytes (integer) |
| `position` | INOUT | current position in buffer, in bytes (integer) |
| `comm` | IN | communicator for packed message (handle) |

**Fortran (mpif.h)**
```fortran
MPI_PACK(INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, COMM, IERROR)
  <type> INBUF(*), OUTBUF(*)
  INTEGER INCOUNT, DATATYPE, OUTSIZE, POSITION, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
