---
title: MPI_GATHERV
c_name: MPI_Gatherv
lis_name: MPI_GATHERV
chapter: coll
aliases: [MPI_GATHERV, MPI_Gatherv]
tags: [mpi/function, mpi/coll]
---

# MPI_GATHERV

**C**
```c
int MPI_Gatherv(void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int *recvcounts, int *displs, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Gatherv(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, const int recvcounts[], const int displs[], const MPI::Datatype& recvtype, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (non-negative integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `recvcounts` | IN | non-negative integer array (of length group size) containing the number of elements that are received from each process (significant only at root) |
| `displs` | IN | integer array (of length group size). Entry `i` specifies the displacement relative to `recvbuf` at which to place the incoming data from process `i` (significant only at root) |
| `recvtype` | IN | data type of recv buffer elements (significant only at root) (handle) |
| `root` | IN | rank of receiving process (integer) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GATHERV(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNTS, DISPLS, RECVTYPE, ROOT, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNT, SENDTYPE, RECVCOUNTS(*), DISPLS(*), RECVTYPE, ROOT, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
