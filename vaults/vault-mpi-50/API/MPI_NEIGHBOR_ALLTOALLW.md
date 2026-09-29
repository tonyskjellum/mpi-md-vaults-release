---
title: MPI_NEIGHBOR_ALLTOALLW
c_name: MPI_Neighbor_alltoallw
lis_name: MPI_NEIGHBOR_ALLTOALLW
chapter: topol
aliases: [MPI_NEIGHBOR_ALLTOALLW, MPI_Neighbor_alltoallw, MPI_Neighbor_alltoallw_c]
tags: [mpi/function, mpi/topol]
---

# MPI_NEIGHBOR_ALLTOALLW

**C**
```c
int MPI_Neighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm)
int MPI_Neighbor_alltoallw_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[], void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[], MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcounts` | IN | nonnegative integer array (of length outdegree) specifying the number of elements to send to each neighbor |
| `sdispls` | IN | integer array (of length outdegree). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for neighbor `j` (array of integers) |
| `sendtypes` | IN | array of datatypes (of length outdegree). Entry `j` specifies the type of data to send to neighbor `j` (array of handles) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcounts` | IN | nonnegative integer array (of length indegree) specifying the number of elements that are received from each neighbor |
| `rdispls` | IN | integer array (of length indegree). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from neighbor `i` (array of integers) |
| `recvtypes` | IN | array of datatypes (of length indegree). Entry `i` specifies the type of data received from neighbor `i` (array of handles) |
| `comm` | IN | communicator with associated virtual topology (handle) |

**Fortran 2008**
```fortran
MPI_Neighbor_alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  INTEGER, INTENT(IN) :: sendcounts(*), recvcounts(*)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: sdispls(*), rdispls(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtypes(*), recvtypes(*)
  TYPE(*), DIMENSION(..) :: recvbuf
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Neighbor_alltoallw(sendbuf, sendcounts, sdispls, sendtypes, recvbuf, recvcounts, rdispls, recvtypes, comm, ierror) !(_c)
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
MPI_NEIGHBOR_ALLTOALLW(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPES, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPES, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNTS(*), SENDTYPES(*), RECVCOUNTS(*), RECVTYPES(*), COMM, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) SDISPLS(*), RDISPLS(*)
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
