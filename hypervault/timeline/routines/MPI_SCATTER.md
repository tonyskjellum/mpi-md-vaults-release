---
title: MPI_SCATTER
c_name: MPI_Scatter
chapter: coll
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_SCATTER, MPI_Scatter]
tags: [mpi/routine, mpi/coll]
---

# MPI_SCATTER

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_SCATTER|MPI-1.3]] · [[versions/v20/API/MPI_SCATTER|MPI-2.0]] · [[versions/v21/API/MPI_SCATTER|MPI-2.1]] Δ · [[versions/v22/API/MPI_SCATTER|MPI-2.2]] · [[versions/v30/API/MPI_SCATTER|MPI-3.0]] Δ · [[versions/v31/API/MPI_SCATTER|MPI-3.1]] Δ · [[versions/v40/API/MPI_SCATTER|MPI-4.0]] Δ · [[versions/v41/API/MPI_SCATTER|MPI-4.1]] Δ · [[versions/v50/API/MPI_SCATTER|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Scatter(void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

**MPI-2.0**
_(no C binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI_Scatter(void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Scatter(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Scatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm)
int MPI_Scatter_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, void *recvbuf, MPI_Count recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Scatter(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, int recvcount, const MPI::Datatype& recvtype, int root) const = 0
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Scatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Scatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Scatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, recvcount, root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Scatter(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcount
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_SCATTER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR
```

**MPI-2.0**
_(no mpif.h binding)_

**MPI-2.1–MPI-5.0**
```fortran
MPI_SCATTER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-1.3–MPI-5.0:** address of send buffer (choice, significant only at root) |
| `sendcount` | IN | **MPI-1.3–MPI-2.0:** number of elements sent to each process (integer, significant only at root)<br>**MPI-2.1–MPI-4.0:** number of elements sent to each process (non-negative integer, significant only at root)<br>**MPI-4.1:** number of elements sent to each MPI process (non-negative integer, significant only at root)<br>**MPI-5.0:** number of elements sent to each MPI process (nonnegative integer, significant only at root) |
| `sendtype` | IN | **MPI-1.3:** data type of send buffer elements (significant only at root) (handle)<br>**MPI-2.0:** data type of send buffer elements (handle, significant only at root)<br>**MPI-2.1–MPI-3.1:** data type of send buffer elements (significant only at root) (handle)<br>**MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle, significant only at root) |
| `recvbuf` | OUT | **MPI-1.3–MPI-5.0:** address of receive buffer (choice) |
| `recvcount` | IN | **MPI-1.3–MPI-2.0:** number of elements in receive buffer (integer)<br>**MPI-2.1–MPI-4.1:** number of elements in receive buffer (non-negative integer)<br>**MPI-5.0:** number of elements in receive buffer (nonnegative integer) |
| `recvtype` | IN | **MPI-1.3–MPI-3.1:** data type of receive buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of receive buffer elements (handle) |
| `root` | IN | **MPI-1.3–MPI-4.0:** rank of sending process (integer)<br>**MPI-4.1–MPI-5.0:** rank of sending MPI process (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_SCATTER|API note]] · chapter [[versions/v13/sections/coll|coll]]
- MPI-2.0: [[versions/v20/API/MPI_SCATTER|API note]] · chapter [[versions/v20/sections/collective|collective]]
- MPI-2.1: [[versions/v21/API/MPI_SCATTER|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_SCATTER|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_SCATTER|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_SCATTER|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_SCATTER|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_SCATTER|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_SCATTER|API note]] · chapter [[versions/v50/sections/coll|coll]]
