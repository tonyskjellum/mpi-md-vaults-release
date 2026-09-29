---
title: MPI_PACK
c_name: MPI_Pack
lis_name: MPI_PACK
chapter: datatypes
aliases: [MPI_PACK, MPI_Pack, MPI_Pack_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK

**C**
```c
int MPI_Pack(const void *inbuf, int incount, MPI_Datatype datatype, void *outbuf, int outsize, int *position, MPI_Comm comm)
int MPI_Pack_c(const void *inbuf, MPI_Count incount, MPI_Datatype datatype, void *outbuf, MPI_Count outsize, MPI_Count *position, MPI_Comm comm)
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
  INTEGER, INTENT(IN) :: incount, outsize
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(*), DIMENSION(..) :: outbuf
  INTEGER, INTENT(INOUT) :: position
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Pack(inbuf, incount, datatype, outbuf, outsize, position, comm, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: incount, outsize
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(*), DIMENSION(..) :: outbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(INOUT) :: position
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
