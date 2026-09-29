---
title: MPI_PACK
c_name: MPI_Pack
chapter: datatypes
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PACK, MPI_Pack]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_PACK

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_PACK|MPI-1.3]] · [[versions/v21/API/MPI_PACK|MPI-2.1]] Δ · [[versions/v22/API/MPI_PACK|MPI-2.2]] · [[versions/v30/API/MPI_PACK|MPI-3.0]] Δ · [[versions/v31/API/MPI_PACK|MPI-3.1]] Δ · [[versions/v40/API/MPI_PACK|MPI-4.0]] Δ · [[versions/v41/API/MPI_PACK|MPI-4.1]] · [[versions/v50/API/MPI_PACK|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Pack(void* inbuf, int incount, MPI_Datatype datatype, void *outbuf, int outsize, int *position, MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Pack(const void* inbuf, int incount, MPI_Datatype datatype, void *outbuf, int outsize, int *position, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Pack(const void *inbuf, int incount, MPI_Datatype datatype, void *outbuf, int outsize, int *position, MPI_Comm comm)
int MPI_Pack_c(const void *inbuf, MPI_Count incount, MPI_Datatype datatype, void *outbuf, MPI_Count outsize, MPI_Count *position, MPI_Comm comm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Datatype::Pack(const void* inbuf, int incount, void *outbuf, int outsize, int& position, const MPI::Comm &comm) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Pack(inbuf, incount, datatype, outbuf, outsize, position, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER, INTENT(IN) :: incount, outsize
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(INOUT) :: position
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
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

**MPI-4.0–MPI-5.0**
```fortran
MPI_Pack(inbuf, incount, datatype, outbuf, outsize, position, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    INTEGER, INTENT(IN) :: incount, outsize
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER, INTENT(INOUT) :: position
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Pack(inbuf, incount, datatype, outbuf, outsize, position, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: incount, outsize
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(INOUT) :: position
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_PACK(INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, COMM, IERROR)
    <type> INBUF(*), OUTBUF(*)
    INTEGER INCOUNT, DATATYPE, OUTSIZE, POSITION, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `inbuf` | IN | **MPI-1.3–MPI-5.0:** input buffer start (choice) |
| `incount` | IN | **MPI-1.3:** number of input data items (integer)<br>**MPI-2.1–MPI-4.1:** number of input data items (non-negative integer)<br>**MPI-5.0:** number of input data items (nonnegative integer) |
| `datatype` | IN | **MPI-1.3–MPI-5.0:** datatype of each input data item (handle) |
| `outbuf` | OUT | **MPI-1.3–MPI-5.0:** output buffer start (choice) |
| `outsize` | IN | **MPI-1.3:** output buffer size, in bytes (integer)<br>**MPI-2.1–MPI-4.1:** output buffer size, in bytes (non-negative integer)<br>**MPI-5.0:** output buffer size, in bytes (nonnegative integer) |
| `position` | INOUT | **MPI-1.3–MPI-5.0:** current position in buffer, in bytes (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator for packed message (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_PACK|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_PACK|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_PACK|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_PACK|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_PACK|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_PACK|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_PACK|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_PACK|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
