---
title: MPI_UNPACK
c_name: MPI_Unpack
lis_name: MPI_UNPACK
chapter: pt2pt
aliases: [MPI_UNPACK, MPI_Unpack]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_UNPACK

**C**
```c
int MPI_Unpack(void* inbuf, int insize, int *position, void *outbuf, int outcount, MPI_Datatype datatype, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `inbuf` | IN | input buffer start (choice) |
| `insize` | IN | size of input buffer, in bytes (integer) |
| `position` | INOUT | current position in bytes (integer) |
| `outbuf` | OUT | output buffer start (choice) |
| `outcount` | IN | number of items to be unpacked (integer) |
| `datatype` | IN | datatype of each output data item (handle) |
| `comm` | IN | communicator for packed message (handle) |

**Fortran (mpif.h)**
```fortran
MPI_UNPACK(INBUF, INSIZE, POSITION, OUTBUF, OUTCOUNT, DATATYPE, COMM, IERROR)
  <type> INBUF(*), OUTBUF(*)
  INTEGER INSIZE, POSITION, OUTCOUNT, DATATYPE, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
