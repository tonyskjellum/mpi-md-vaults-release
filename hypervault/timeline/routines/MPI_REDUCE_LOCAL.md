---
title: MPI_REDUCE_LOCAL
c_name: MPI_Reduce_local
chapter: coll
introduced: "MPI-2.2"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_REDUCE_LOCAL, MPI_Reduce_local]
tags: [mpi/routine, mpi/coll]
---

# MPI_REDUCE_LOCAL

**Introduced** in MPI-2.2.

Releases: [[versions/v22/API/MPI_REDUCE_LOCAL|MPI-2.2]] · [[versions/v30/API/MPI_REDUCE_LOCAL|MPI-3.0]] Δ · [[versions/v31/API/MPI_REDUCE_LOCAL|MPI-3.1]] Δ · [[versions/v40/API/MPI_REDUCE_LOCAL|MPI-4.0]] Δ · [[versions/v41/API/MPI_REDUCE_LOCAL|MPI-4.1]] · [[versions/v50/API/MPI_REDUCE_LOCAL|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.2**
```c
int MPI_Reduce_local(void* inbuf, void* inoutbuf, int count, MPI_Datatype datatype, MPI_Op op)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Reduce_local(const void* inbuf, void* inoutbuf, int count, MPI_Datatype datatype, MPI_Op op)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Reduce_local(const void *inbuf, void *inoutbuf, int count, MPI_Datatype datatype, MPI_Op op)
int MPI_Reduce_local_c(const void *inbuf, void *inoutbuf, MPI_Count count, MPI_Datatype datatype, MPI_Op op)
```

## C++

**MPI-2.2**
```c
void MPI::Op::Reduce_local(const void* inbuf, void* inoutbuf, int count, const MPI::Datatype& datatype) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Reduce_local(inbuf, inoutbuf, count, datatype, op, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: inoutbuf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Reduce_local(inbuf, inoutbuf, count, datatype, op, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: inoutbuf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Reduce_local(inbuf, inoutbuf, count, datatype, op, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: inoutbuf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Reduce_local(inbuf, inoutbuf, count, datatype, op, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
    TYPE(*), DIMENSION(..) :: inoutbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Op), INTENT(IN) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.2**
```fortran
MPI_REDUCE_LOCAL(INBUF, INOUBUF, COUNT, DATATYPE, OP, IERROR)
    <type> INBUF(*), INOUTBUF(*)
    INTEGER COUNT, DATATYPE, OP, IERROR
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_REDUCE_LOCAL(INBUF, INOUTBUF, COUNT, DATATYPE, OP, IERROR)
    <type> INBUF(*), INOUTBUF(*)
    INTEGER COUNT, DATATYPE, OP, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `inbuf` | IN | **MPI-2.2–MPI-5.0:** input buffer (choice) |
| `inoutbuf` | INOUT | **MPI-2.2–MPI-5.0:** combined input and output buffer (choice) |
| `count` | IN | **MPI-2.2–MPI-4.1:** number of elements in `inbuf` and `inoutbuf` buffers (non-negative integer)<br>**MPI-5.0:** number of elements in `inbuf` and `inoutbuf` buffers (nonnegative integer) |
| `datatype` | IN | **MPI-2.2–MPI-3.1:** data type of elements of `inbuf` and `inoutbuf` buffers (handle)<br>**MPI-4.0–MPI-5.0:** datatype of elements of `inbuf` and `inoutbuf` buffers (handle) |
| `op` | IN | **MPI-2.2–MPI-5.0:** operation (handle) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.2: [[versions/v22/API/MPI_REDUCE_LOCAL|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_REDUCE_LOCAL|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_REDUCE_LOCAL|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_REDUCE_LOCAL|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_REDUCE_LOCAL|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_REDUCE_LOCAL|API note]] · chapter [[versions/v50/sections/coll|coll]]
