---
title: MPI_ALLTOALLW
c_name: MPI_Alltoallw
lis_name: MPI_ALLTOALLW
chapter: coll
aliases: [MPI_ALLTOALLW, MPI_Alltoallw]
tags: [mpi/function, mpi/coll]
---

# MPI_ALLTOALLW

**C**
```c
int MPI_Alltoallw(void *sendbuf, int sendcounts[], int sdispls[], MPI_Datatype sendtypes[], void *recvbuf, int recvcounts[], int rdispls[], MPI_Datatype recvtypes[], MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Alltoallw(const void* sendbuf, const int sendcounts[], const int sdispls[], const MPI::Datatype sendtypes[], void* recvbuf, const int recvcounts[], const int rdispls[], const MPI::Datatype recvtypes[]) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcounts` | IN | non-negative integer array (of length group size) specifying the number of elements to send to each processor |
| `sdispls` | IN | integer array (of length group size). Entry `j` specifies the displacement in bytes (relative to `sendbuf`) from which to take the outgoing data destined for process `j` (array of integers) |
| `sendtypes` | IN | array of datatypes (of length group size). Entry `j` specifies the type of data to send to process `j` (array of handles) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcounts` | IN | non-negative integer array (of length group size) specifying the number of elements that can be received from each processor |
| `rdispls` | IN | integer array (of length group size). Entry `i` specifies the displacement in bytes (relative to `recvbuf`) at which to place the incoming data from process `i` (array of integers) |
| `recvtypes` | IN | array of datatypes (of length group size). Entry `i` specifies the type of data received from process `i` (array of handles) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ALLTOALLW(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPES, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPES, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPES(*), RECVCOUNTS(*), RDISPLS(*), RECVTYPES(*), COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
