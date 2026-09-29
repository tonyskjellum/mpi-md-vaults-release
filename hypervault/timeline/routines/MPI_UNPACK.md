---
title: MPI_UNPACK
c_name: MPI_Unpack
chapter: datatypes
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_UNPACK, MPI_Unpack]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_UNPACK

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_UNPACK|MPI-1.3]] · [[versions/v21/API/MPI_UNPACK|MPI-2.1]] Δ · [[versions/v22/API/MPI_UNPACK|MPI-2.2]] · [[versions/v30/API/MPI_UNPACK|MPI-3.0]] Δ · [[versions/v31/API/MPI_UNPACK|MPI-3.1]] Δ · [[versions/v40/API/MPI_UNPACK|MPI-4.0]] Δ · [[versions/v41/API/MPI_UNPACK|MPI-4.1]] · [[versions/v50/API/MPI_UNPACK|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Unpack(void* inbuf, int insize, int *position, void *outbuf, int outcount, MPI_Datatype datatype, MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Unpack(const void* inbuf, int insize, int *position, void *outbuf, int outcount, MPI_Datatype datatype, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Unpack(const void *inbuf, int insize, int *position, void *outbuf, int outcount, MPI_Datatype datatype, MPI_Comm comm)
int MPI_Unpack_c(const void *inbuf, MPI_Count insize, MPI_Count *position, void *outbuf, MPI_Count outcount, MPI_Datatype datatype, MPI_Comm comm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Datatype::Unpack(const void* inbuf, int insize, void *outbuf, int outcount, int& position, const MPI::Comm& comm) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Unpack(inbuf, insize, position, outbuf, outcount, datatype, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER, INTENT(IN) :: insize, outcount
    INTEGER, INTENT(INOUT) :: position
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Unpack(inbuf, insize, position, outbuf, outcount, datatype, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: outbuf
    INTEGER, INTENT(IN) :: insize, outcount
    INTEGER, INTENT(INOUT) :: position
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Unpack(inbuf, insize, position, outbuf, outcount, datatype, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    INTEGER, INTENT(IN) :: insize, outcount
    INTEGER, INTENT(INOUT) :: position
    TYPE(*), DIMENSION(..) :: outbuf
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Unpack(inbuf, insize, position, outbuf, outcount, datatype, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: insize, outcount
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(INOUT) :: position
    TYPE(*), DIMENSION(..) :: outbuf
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_UNPACK(INBUF, INSIZE, POSITION, OUTBUF, OUTCOUNT, DATATYPE, COMM, IERROR)
    <type> INBUF(*), OUTBUF(*)
    INTEGER INSIZE, POSITION, OUTCOUNT, DATATYPE, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `inbuf` | IN | **MPI-1.3–MPI-5.0:** input buffer start (choice) |
| `insize` | IN | **MPI-1.3:** size of input buffer, in bytes (integer)<br>**MPI-2.1–MPI-4.1:** size of input buffer, in bytes (non-negative integer)<br>**MPI-5.0:** size of input buffer, in bytes (nonnegative integer) |
| `position` | INOUT | **MPI-1.3–MPI-5.0:** current position in bytes (integer) |
| `outbuf` | OUT | **MPI-1.3–MPI-5.0:** output buffer start (choice) |
| `outcount` | IN | **MPI-1.3–MPI-5.0:** number of items to be unpacked (integer) |
| `datatype` | IN | **MPI-1.3–MPI-5.0:** datatype of each output data item (handle) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator for packed message (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_UNPACK|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_UNPACK|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_UNPACK|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_UNPACK|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_UNPACK|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_UNPACK|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_UNPACK|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_UNPACK|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]
