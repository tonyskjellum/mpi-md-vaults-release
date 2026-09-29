---
title: MPI_BCAST
c_name: MPI_Bcast
chapter: coll
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_BCAST, MPI_Bcast]
tags: [mpi/routine, mpi/coll]
---

# MPI_BCAST

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_BCAST|MPI-1.3]] · [[versions/v20/API/MPI_BCAST|MPI-2.0]] · [[versions/v21/API/MPI_BCAST|MPI-2.1]] Δ · [[versions/v22/API/MPI_BCAST|MPI-2.2]] · [[versions/v30/API/MPI_BCAST|MPI-3.0]] Δ · [[versions/v31/API/MPI_BCAST|MPI-3.1]] Δ · [[versions/v40/API/MPI_BCAST|MPI-4.0]] Δ · [[versions/v41/API/MPI_BCAST|MPI-4.1]] Δ · [[versions/v50/API/MPI_BCAST|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Bcast(void* buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm )
```

**MPI-2.0**
_(no C binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI_Bcast(void* buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm )
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Bcast(void* buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Bcast(void *buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm)
int MPI_Bcast_c(void *buffer, MPI_Count count, MPI_Datatype datatype, int root, MPI_Comm comm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Bcast(void* buffer, int count, const MPI::Datatype& datatype, int root) const = 0
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Bcast(buffer, count, datatype, root, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..) :: buffer
    INTEGER, INTENT(IN) :: count, root
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Bcast(buffer, count, datatype, root, comm, ierror)
    TYPE(*), DIMENSION(..) :: buffer
    INTEGER, INTENT(IN) :: count, root
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Bcast(buffer, count, datatype, root, comm, ierror)
    TYPE(*), DIMENSION(..) :: buffer
    INTEGER, INTENT(IN) :: count, root
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Bcast(buffer, count, datatype, root, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..) :: buffer
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_BCAST(BUFFER, COUNT, DATATYPE, ROOT, COMM, IERROR)
    <type> BUFFER(*)
    INTEGER COUNT, DATATYPE, ROOT, COMM, IERROR
```

**MPI-2.0**
_(no mpif.h binding)_

**MPI-2.1–MPI-5.0**
```fortran
MPI_BCAST(BUFFER, COUNT, DATATYPE, ROOT, COMM, IERROR)
    <type> BUFFER(*)
    INTEGER COUNT, DATATYPE, ROOT, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buffer` | INOUT | **MPI-1.3–MPI-5.0:** starting address of buffer (choice) |
| `count` | IN | **MPI-1.3–MPI-2.0:** number of entries in buffer (integer)<br>**MPI-2.1–MPI-4.1:** number of entries in buffer (non-negative integer)<br>**MPI-5.0:** number of entries in buffer (nonnegative integer) |
| `datatype` | IN | **MPI-1.3–MPI-3.1:** data type of buffer (handle)<br>**MPI-4.0–MPI-5.0:** datatype of buffer (handle) |
| `root` | IN | **MPI-1.3–MPI-4.0:** rank of broadcast root (integer)<br>**MPI-4.1–MPI-5.0:** rank of the root (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_BCAST|API note]] · chapter [[versions/v13/sections/coll|coll]]
- MPI-2.0: [[versions/v20/API/MPI_BCAST|API note]] · chapter [[versions/v20/sections/collective|collective]]
- MPI-2.1: [[versions/v21/API/MPI_BCAST|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_BCAST|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_BCAST|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_BCAST|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_BCAST|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_BCAST|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_BCAST|API note]] · chapter [[versions/v50/sections/coll|coll]]
