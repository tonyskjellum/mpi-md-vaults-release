---
title: MPI_PACK_EXTERNAL_SIZE
c_name: MPI_Pack_external_size
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PACK_EXTERNAL_SIZE, MPI_Pack_external_size]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_PACK_EXTERNAL_SIZE

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_PACK_EXTERNAL_SIZE|MPI-2.0]] · [[versions/v21/API/MPI_PACK_EXTERNAL_SIZE|MPI-2.1]] · [[versions/v22/API/MPI_PACK_EXTERNAL_SIZE|MPI-2.2]] · [[versions/v30/API/MPI_PACK_EXTERNAL_SIZE|MPI-3.0]] Δ · [[versions/v31/API/MPI_PACK_EXTERNAL_SIZE|MPI-3.1]] Δ · [[versions/v40/API/MPI_PACK_EXTERNAL_SIZE|MPI-4.0]] Δ · [[versions/v41/API/MPI_PACK_EXTERNAL_SIZE|MPI-4.1]] · [[versions/v50/API/MPI_PACK_EXTERNAL_SIZE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Pack_external_size(char *datarep, int incount, MPI_Datatype datatype, MPI_Aint *size)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Pack_external_size(const char datarep[], int incount, MPI_Datatype datatype, MPI_Aint *size)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Pack_external_size(const char datarep[], int incount, MPI_Datatype datatype, MPI_Aint *size)
int MPI_Pack_external_size_c(const char datarep[], MPI_Count incount, MPI_Datatype datatype, MPI_Count *size)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Aint MPI::Datatype::Pack_external_size(const char* datarep, int incount) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Pack_external_size(datarep, incount, datatype, size, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: incount
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Pack_external_size(datarep, incount, datatype, size, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: incount
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Pack_external_size(datarep, incount, datatype, size, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    INTEGER, INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Pack_external_size(datarep, incount, datatype, size, ierror) !(_c)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_PACK_EXTERNAL_SIZE(DATAREP, INCOUNT, DATATYPE, SIZE, IERROR)
    INTEGER INCOUNT, DATATYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
    CHARACTER*(*) DATAREP
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_PACK_EXTERNAL_SIZE(DATAREP, INCOUNT, DATATYPE, SIZE, IERROR)
    CHARACTER*(*) DATAREP
    INTEGER INCOUNT, DATATYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datarep` | IN | **MPI-2.0–MPI-5.0:** data representation (string) |
| `incount` | IN | **MPI-2.0–MPI-5.0:** number of input data items (integer) |
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype of each input data item (handle) |
| `size` | OUT | **MPI-2.0–MPI-5.0:** output buffer size, in bytes (integer) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_PACK_EXTERNAL_SIZE|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
