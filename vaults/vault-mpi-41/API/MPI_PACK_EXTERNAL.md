---
title: MPI_PACK_EXTERNAL
c_name: MPI_Pack_external
lis_name: MPI_PACK_EXTERNAL
chapter: datatypes
aliases: [MPI_PACK_EXTERNAL, MPI_Pack_external, MPI_Pack_external_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK_EXTERNAL

**C**
```c
int MPI_Pack_external(const char datarep[], const void *inbuf, int incount, MPI_Datatype datatype, void *outbuf, MPI_Aint outsize, MPI_Aint *position)
int MPI_Pack_external_c(const char datarep[], const void *inbuf, MPI_Count incount, MPI_Datatype datatype, void *outbuf, MPI_Count outsize, MPI_Count *position)
```

| Parameter | Intent | Description |
|---|---|---|
| `datarep` | IN | data representation (string) |
| `inbuf` | IN | input buffer start (choice) |
| `incount` | IN | number of input data items (integer) |
| `datatype` | IN | datatype of each input data item (handle) |
| `outbuf` | OUT | output buffer start (choice) |
| `outsize` | IN | output buffer size, in bytes (integer) |
| `position` | INOUT | current position in buffer, in bytes (integer) |

**Fortran 2008**
```fortran
MPI_Pack_external(datarep, inbuf, incount, datatype, outbuf, outsize, position, ierror)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
  INTEGER, INTENT(IN) :: incount
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(*), DIMENSION(..) :: outbuf
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: outsize
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(INOUT) :: position
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Pack_external(datarep, inbuf, incount, datatype, outbuf, outsize, position, ierror) !(_c)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: incount, outsize
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(*), DIMENSION(..) :: outbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(INOUT) :: position
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PACK_EXTERNAL(DATAREP, INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, IERROR)
  CHARACTER*(*) DATAREP
  <type> INBUF(*), OUTBUF(*)
  INTEGER INCOUNT, DATATYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) OUTSIZE, POSITION
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
