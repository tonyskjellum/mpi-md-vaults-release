---
title: MPI_PACK_EXTERNAL
c_name: MPI_Pack_external
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PACK_EXTERNAL, MPI_Pack_external]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_PACK_EXTERNAL

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_PACK_EXTERNAL|MPI-2.0]] · [[versions/v21/API/MPI_PACK_EXTERNAL|MPI-2.1]] · [[versions/v22/API/MPI_PACK_EXTERNAL|MPI-2.2]] · [[versions/v30/API/MPI_PACK_EXTERNAL|MPI-3.0]] Δ · [[versions/v31/API/MPI_PACK_EXTERNAL|MPI-3.1]] Δ · [[versions/v40/API/MPI_PACK_EXTERNAL|MPI-4.0]] Δ · [[versions/v41/API/MPI_PACK_EXTERNAL|MPI-4.1]] · [[versions/v50/API/MPI_PACK_EXTERNAL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Pack_external(char *datarep, void *inbuf, int incount, MPI_Datatype datatype, void *outbuf, MPI_Aint outsize, MPI_Aint *position)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Pack_external(const char datarep[], const void *inbuf, int incount, MPI_Datatype datatype, void *outbuf, MPI_Aint outsize, MPI_Aint *position)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Pack_external(const char datarep[], const void *inbuf, int incount, MPI_Datatype datatype, void *outbuf, MPI_Aint outsize, MPI_Aint *position)
int MPI_Pack_external_c(const char datarep[], const void *inbuf, MPI_Count incount, MPI_Datatype datatype, void *outbuf, MPI_Count outsize, MPI_Count *position)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Datatype::Pack_external(const char* datarep, const void* inbuf, int incount, void* outbuf, MPI::Aint outsize, MPI::Aint& position) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Pack_external(datarep, inbuf, incount, datatype, outbuf, outsize, position, ierror) BIND(C)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER, INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: outsize
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(INOUT) :: position
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Pack_external(datarep, inbuf, incount, datatype, outbuf, outsize, position, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER, INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: outsize
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(INOUT) :: position
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
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
MPI_Pack_external(datarep, inbuf, incount, datatype, outbuf, outsize, position, ierror) !(_c)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: incount, outsize
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(INOUT) :: position
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_PACK_EXTERNAL(DATAREP, INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, IERROR)
    INTEGER INCOUNT, DATATYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) OUTSIZE, POSITION
    CHARACTER*(*) DATAREP
    <type> INBUF(*), OUTBUF(*)
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_PACK_EXTERNAL(DATAREP, INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, IERROR)
    CHARACTER*(*) DATAREP
    <type> INBUF(*), OUTBUF(*)
    INTEGER INCOUNT, DATATYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) OUTSIZE, POSITION
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datarep` | IN | **MPI-2.0–MPI-5.0:** data representation (string) |
| `inbuf` | IN | **MPI-2.0–MPI-5.0:** input buffer start (choice) |
| `incount` | IN | **MPI-2.0–MPI-5.0:** number of input data items (integer) |
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype of each input data item (handle) |
| `outbuf` | OUT | **MPI-2.0–MPI-5.0:** output buffer start (choice) |
| `outsize` | IN | **MPI-2.0–MPI-5.0:** output buffer size, in bytes (integer) |
| `position` | INOUT | **MPI-2.0–MPI-5.0:** current position in buffer, in bytes (integer) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_PACK_EXTERNAL|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
