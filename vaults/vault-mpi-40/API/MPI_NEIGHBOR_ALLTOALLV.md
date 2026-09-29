---
title: MPI_NEIGHBOR_ALLTOALLV
c_name: MPI_Neighbor_alltoallv
lis_name: MPI_NEIGHBOR_ALLTOALLV
chapter: topol
aliases: [MPI_NEIGHBOR_ALLTOALLV, MPI_Neighbor_alltoallv, MPI_Neighbor_alltoallv_c]
tags: [mpi/function, mpi/topol]
---

# MPI_NEIGHBOR_ALLTOALLV

**C**
```c
int MPI_Neighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype, void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
int MPI_Neighbor_alltoallv_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint sdispls[], MPI_Datatype sendtype, void *recvbuf, const MPI_Count recvcounts[], const MPI_Aint rdispls[], MPI_Datatype recvtype, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcounts` | IN | non-negative integer array (of length outdegree) specifying the number of elements to send to each neighbor |
| `sdispls` | IN | integer array (of length outdegree). Entry `j` specifies the displacement (relative to `sendbuf`) from which to send the outgoing data to neighbor `j` |
| `sendtype` | IN | datatype of send buffer elements (handle) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcounts` | IN | non-negative integer array (of length indegree) specifying the number of elements that are received from each neighbor |
| `rdispls` | IN | integer array (of length indegree). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from neighbor `i` |
| `recvtype` | IN | datatype of receive buffer elements (handle) |
| `comm` | IN | communicator with topology structure (handle) |

**Fortran 2008**
```fortran
MPI_Neighbor_alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  INTEGER, INTENT(IN) :: sendcounts(*), sdispls(*), recvcounts(*), rdispls(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(*), DIMENSION(..) :: recvbuf
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Neighbor_alltoallv(sendbuf, sendcounts, sdispls, sendtype, recvbuf, recvcounts, rdispls, recvtype, comm, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcounts(*), recvcounts(*)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: sdispls(*), rdispls(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(*), DIMENSION(..) :: recvbuf
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_NEIGHBOR_ALLTOALLV(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPE, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPE, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPE, RECVCOUNTS(*), RDISPLS(*), RECVTYPE, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
