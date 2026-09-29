---
title: MPI_GATHERV
c_name: MPI_Gatherv
chapter: coll
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GATHERV, MPI_Gatherv]
tags: [mpi/routine, mpi/coll]
---

# MPI_GATHERV

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_GATHERV|MPI-1.3]] · [[versions/v20/API/MPI_GATHERV|MPI-2.0]] · [[versions/v21/API/MPI_GATHERV|MPI-2.1]] Δ · [[versions/v22/API/MPI_GATHERV|MPI-2.2]] · [[versions/v30/API/MPI_GATHERV|MPI-3.0]] Δ · [[versions/v31/API/MPI_GATHERV|MPI-3.1]] Δ · [[versions/v40/API/MPI_GATHERV|MPI-4.0]] Δ · [[versions/v41/API/MPI_GATHERV|MPI-4.1]] Δ · [[versions/v50/API/MPI_GATHERV|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Gatherv(void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int *recvcounts, int *displs, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

**MPI-2.0**
_(no C binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI_Gatherv(void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int *recvcounts, int *displs, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Gatherv(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, int root, MPI_Comm comm)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Gatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, int root, MPI_Comm comm)
int MPI_Gatherv_c(const void *sendbuf, MPI_Count sendcount, MPI_Datatype sendtype, void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint displs[], MPI_Datatype recvtype, int root, MPI_Comm comm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Gatherv(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, const int recvcounts[], const int displs[], const MPI::Datatype& recvtype, int root) const = 0
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Gatherv(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm, ierror) BIND(C)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcounts(*), displs(*), root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Gatherv(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER, INTENT(IN) :: sendcount, recvcounts(*), displs(*), root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Gatherv(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm, ierror)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER, INTENT(IN) :: sendcount, recvcounts(*), displs(*), root
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Gatherv(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, root, comm, ierror) !(_c)
    TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcounts(*)
    TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
    TYPE(*), DIMENSION(..) :: recvbuf
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: displs(*)
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_GATHERV(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNTS, DISPLS, RECVTYPE, ROOT, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNTS(*), DISPLS(*), RECVTYPE, ROOT, COMM, IERROR
```

**MPI-2.0**
_(no mpif.h binding)_

**MPI-2.1–MPI-5.0**
```fortran
MPI_GATHERV(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNTS, DISPLS, RECVTYPE, ROOT, COMM, IERROR)
    <type> SENDBUF(*), RECVBUF(*)
    INTEGER SENDCOUNT, SENDTYPE, RECVCOUNTS(*), DISPLS(*), RECVTYPE, ROOT, COMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `sendbuf` | IN | **MPI-1.3–MPI-5.0:** starting address of send buffer (choice) |
| `sendcount` | IN | **MPI-1.3–MPI-2.0:** number of elements in send buffer (integer)<br>**MPI-2.1–MPI-4.1:** number of elements in send buffer (non-negative integer)<br>**MPI-5.0:** number of elements in send buffer (nonnegative integer) |
| `sendtype` | IN | **MPI-1.3–MPI-3.1:** data type of send buffer elements (handle)<br>**MPI-4.0–MPI-5.0:** datatype of send buffer elements (handle) |
| `recvbuf` | OUT | **MPI-1.3–MPI-5.0:** address of receive buffer (choice, significant only at root) |
| `recvcounts` | IN | **MPI-1.3–MPI-2.0:** integer array (of length group size) containing the number of elements that are received from each process (significant only at root)<br>**MPI-2.1–MPI-4.0:** non-negative integer array (of length group size) containing the number of elements that are received from each process (significant only at root)<br>**MPI-4.1–MPI-5.0:** nonnegative integer array (of length group size) containing the number of elements that are received from each MPI process (significant only at root) |
| `displs` | IN | **MPI-1.3–MPI-4.0:** integer array (of length group size). Entry `i` specifies the displacement relative to `recvbuf` at which to place the incoming data from process `i` (significant only at root)<br>**MPI-4.1–MPI-5.0:** integer array (of length group size). Entry `i` specifies the displacement relative to `recvbuf` at which to place the incoming data from MPI process `i` (significant only at root) |
| `recvtype` | IN | **MPI-1.3:** data type of recv buffer elements (significant only at root) (handle)<br>**MPI-2.0:** data type of recv buffer elements (handle, significant only at root)<br>**MPI-2.1–MPI-3.1:** data type of recv buffer elements (significant only at root) (handle)<br>**MPI-4.0–MPI-5.0:** datatype of recv buffer elements (handle, significant only at root) |
| `root` | IN | **MPI-1.3–MPI-4.0:** rank of receiving process (integer)<br>**MPI-4.1–MPI-5.0:** rank of receiving MPI process (integer) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_GATHERV|API note]] · chapter [[versions/v13/sections/coll|coll]]
- MPI-2.0: [[versions/v20/API/MPI_GATHERV|API note]] · chapter [[versions/v20/sections/collective|collective]]
- MPI-2.1: [[versions/v21/API/MPI_GATHERV|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_GATHERV|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_GATHERV|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_GATHERV|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_GATHERV|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_GATHERV|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_GATHERV|API note]] · chapter [[versions/v50/sections/coll|coll]]
