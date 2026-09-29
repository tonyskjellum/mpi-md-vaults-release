---
title: MPI_UNPACK_EXTERNAL
c_name: MPI_Unpack_external
lis_name: MPI_UNPACK_EXTERNAL
chapter: datatypes
aliases: [MPI_UNPACK_EXTERNAL, MPI_Unpack_external, MPI_Unpack_external_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_UNPACK_EXTERNAL

**C**
```c
int MPI_Unpack_external(const char datarep[], const void *inbuf, MPI_Aint insize, MPI_Aint *position, void *outbuf, int outcount, MPI_Datatype datatype)
int MPI_Unpack_external_c(const char datarep[], const void *inbuf, MPI_Count insize, MPI_Count *position, void *outbuf, MPI_Count outcount, MPI_Datatype datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `datarep` | IN | data representation (string) |
| `inbuf` | IN | input buffer start (choice) |
| `insize` | IN | input buffer size, in bytes (integer) |
| `position` | INOUT | current position in buffer, in bytes (integer) |
| `outbuf` | OUT | output buffer start (choice) |
| `outcount` | IN | number of output data items (integer) |
| `datatype` | IN | datatype of output data item (handle) |

**Fortran 2008**
```fortran
MPI_Unpack_external(datarep, inbuf, insize, position, outbuf, outcount, datatype, ierror)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: insize
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(INOUT) :: position
  TYPE(*), DIMENSION(..) :: outbuf
  INTEGER, INTENT(IN) :: outcount
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Unpack_external(datarep, inbuf, insize, position, outbuf, outcount, datatype, ierror) !(_c)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: insize, outcount
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(INOUT) :: position
  TYPE(*), DIMENSION(..) :: outbuf
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_UNPACK_EXTERNAL(DATAREP, INBUF, INSIZE, POSITION, OUTBUF, OUTCOUNT, DATATYPE, IERROR)
  CHARACTER*(*) DATAREP
  <type> INBUF(*), OUTBUF(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) INSIZE, POSITION
  INTEGER OUTCOUNT, DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
