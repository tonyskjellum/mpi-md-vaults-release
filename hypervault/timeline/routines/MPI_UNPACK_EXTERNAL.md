---
title: MPI_UNPACK_EXTERNAL
c_name: MPI_Unpack_external
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_UNPACK_EXTERNAL, MPI_Unpack_external]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_UNPACK_EXTERNAL

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_UNPACK_EXTERNAL|MPI-2.0]] · [[versions/v21/API/MPI_UNPACK_EXTERNAL|MPI-2.1]] · [[versions/v22/API/MPI_UNPACK_EXTERNAL|MPI-2.2]] · [[versions/v30/API/MPI_UNPACK_EXTERNAL|MPI-3.0]] Δ · [[versions/v31/API/MPI_UNPACK_EXTERNAL|MPI-3.1]] Δ · [[versions/v40/API/MPI_UNPACK_EXTERNAL|MPI-4.0]] Δ · [[versions/v41/API/MPI_UNPACK_EXTERNAL|MPI-4.1]] · [[versions/v50/API/MPI_UNPACK_EXTERNAL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Unpack_external(char *datarep, void *inbuf, MPI_Aint insize, MPI_Aint *position, void *outbuf, int outcount, MPI_Datatype datatype)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Unpack_external(const char datarep[], const void *inbuf, MPI_Aint insize, MPI_Aint *position, void *outbuf, int outcount, MPI_Datatype datatype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Unpack_external(const char datarep[], const void *inbuf, MPI_Aint insize, MPI_Aint *position, void *outbuf, int outcount, MPI_Datatype datatype)
int MPI_Unpack_external_c(const char datarep[], const void *inbuf, MPI_Count insize, MPI_Count *position, void *outbuf, MPI_Count outcount, MPI_Datatype datatype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Datatype::Unpack_external(const char* datarep, const void* inbuf, MPI::Aint insize, MPI::Aint& position, void* outbuf, int outcount) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Unpack_external(datarep, inbuf, insize, position, outbuf, outcount, datatype, ierror) BIND(C)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: insize
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(INOUT) :: position
    INTEGER, INTENT(IN) :: outcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Unpack_external(datarep, inbuf, insize, position, outbuf, outcount, datatype, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: insize
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(INOUT) :: position
    INTEGER, INTENT(IN) :: outcount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
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
MPI_Unpack_external(datarep, inbuf, insize, position, outbuf, outcount, datatype, ierror) !(_c)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: insize, outcount
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(INOUT) :: position
    TYPE(*), DIMENSION(..) :: outbuf
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_UNPACK_EXTERNAL(DATAREP, INBUF, INSIZE, POSITION, OUTBUF, OUTCOUNT, DATATYPE, IERROR)
    INTEGER OUTCOUNT, DATATYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) INSIZE, POSITION
    CHARACTER*(*) DATAREP
    <type> INBUF(*), OUTBUF(*)
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_UNPACK_EXTERNAL(DATAREP, INBUF, INSIZE, POSITION, OUTBUF, OUTCOUNT, DATATYPE, IERROR)
    CHARACTER*(*) DATAREP
    <type> INBUF(*), OUTBUF(*)
    INTEGER(KIND=MPI_ADDRESS_KIND) INSIZE, POSITION
    INTEGER OUTCOUNT, DATATYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datarep` | IN | **MPI-2.0–MPI-5.0:** data representation (string) |
| `inbuf` | IN | **MPI-2.0–MPI-5.0:** input buffer start (choice) |
| `insize` | IN | **MPI-2.0–MPI-5.0:** input buffer size, in bytes (integer) |
| `position` | INOUT | **MPI-2.0–MPI-5.0:** current position in buffer, in bytes (integer) |
| `outbuf` | OUT | **MPI-2.0–MPI-5.0:** output buffer start (choice) |
| `outcount` | IN | **MPI-2.0–MPI-5.0:** number of output data items (integer) |
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype of output data item (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_UNPACK_EXTERNAL|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
