---
title: MPI_ALLTOALLW
c_name: MPI_Alltoallw
lis_name: MPI_ALLTOALLW
chapter: coll
aliases: [MPI_ALLTOALLW, MPI_Alltoallw, MPI_Alltoallw_c]
tags: [mpi/function, mpi/coll]
---

# MPI_ALLTOALLW

**C**
```c
int MPI_Alltoallw(const void *sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm)
int MPI_Alltoallw_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcounts` | IN | nonnegative integer array (of length group size) specifying the number of elements to send to each rank |
| `sdispls` | IN | integer array (of length group size). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for MPI process `j` (array of integers) |
| `sendtypes` | IN | array of datatypes (of length group size). Entry `j` specifies the type of data to send to MPI process `j` (array of handles) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcounts` | IN | nonnegative integer array (of length group size) specifying the number of elements that can be received from each rank |
| `rdispls` | IN | integer array (of length group size). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from MPI process `i` (array of integers) |
| `recvtypes` | IN | array of datatypes (of length group size). Entry `i` specifies the type of data received from MPI process `i` (array of handles) |
| `comm` | IN | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtypes(*), recvtypes(*)
  TYPE(*), DIMENSION(..) :: recvbuf
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcounts(*), recvcounts(*)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: sdispls(*), rdispls(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtypes(*), recvtypes(*)
  TYPE(*), DIMENSION(..) :: recvbuf
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ALLTOALLW(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPES, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPES, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPES(*), RECVCOUNTS(*), RDISPLS(*), RECVTYPES(*), COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
