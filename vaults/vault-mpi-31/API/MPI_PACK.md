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
int MPI_Pack(const void* inbuf, int incount, MPI_Datatype datatype, void *outbuf, int outsize, int *position, MPI_Comm comm)
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

**Fortran 2008**
```fortran
MPI_Pack(inbuf, incount, datatype, outbuf, outsize, position, comm, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
  TYPE(*), DIMENSION(..) :: outbuf
  INTEGER, INTENT(IN) :: incount, outsize
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(INOUT) :: position
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PACK(INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, COMM, IERROR)
  <type> INBUF(*), OUTBUF(*)
  INTEGER INCOUNT, DATATYPE, OUTSIZE, POSITION, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
