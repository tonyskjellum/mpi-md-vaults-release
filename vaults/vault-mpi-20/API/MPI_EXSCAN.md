---
title: MPI_EXSCAN
c_name: MPI_Exscan
lis_name: MPI_EXSCAN
chapter: collective
aliases: [MPI_EXSCAN, MPI_Exscan]
tags: [mpi/function, mpi/collective]
---

# MPI_EXSCAN

**C**
```c
int MPI_Exscan(void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Intracomm::Exscan(const void* sendbuf, void* recvbuf, int count, const MPI::Datatype& datatype, const MPI::Op& op) const
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `count` | IN | number of elements in input buffer (integer) |
| `datatype` | IN | data type of elements of input buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | intracommunicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_EXSCAN(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER COUNT, DATATYPE, OP, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.
