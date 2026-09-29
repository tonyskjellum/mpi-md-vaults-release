---
title: MPI_SCATTERV_INIT
c_name: MPI_Scatterv_init
lis_name: MPI_SCATTERV_INIT
chapter: coll
aliases: [MPI_SCATTERV_INIT, MPI_Scatterv_init, MPI_Scatterv_init_c]
tags: [mpi/function, mpi/coll]
---

# MPI_SCATTERV_INIT

**C**
```c
int MPI_Scatterv_init(const void *sendbuf, const int sendcounts[], const int displs[], MPI_Datatype sendtype, void *recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
int MPI_Scatterv_init_c(const void *sendbuf, const MPI_Count sendcounts[], const MPI_Aint displs[], MPI_Datatype sendtype, void *recvbuf, MPI_Count recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice, significant only at root) |
| `sendcounts` | IN | nonnegative integer array (of length group size) specifying the number of elements to send to each MPI process (significant only at root) |
| `displs` | IN | integer array (of length group size). Entry `i` specifies the displacement (relative to `sendbuf`) from which to take the outgoing data to MPI process `i` (significant only at root) |
| `sendtype` | IN | datatype of send buffer elements (handle, significant only at root) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `recvcount` | IN | number of elements in receive buffer (non-negative integer) |
| `recvtype` | IN | datatype of receive buffer elements (handle) |
| `root` | IN | rank of sending MPI process (integer) |
| `comm` | IN | communicator (handle) |
| `info` | IN | info argument (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Scatterv_init(sendbuf, sendcounts, displs, sendtype, recvbuf, recvcount, recvtype, root, comm, info, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
  INTEGER, INTENT(IN), ASYNCHRONOUS :: sendcounts(*), displs(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
  INTEGER, INTENT(IN) :: recvcount, root
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Scatterv_init(sendbuf, sendcounts, displs, sendtype, recvbuf, recvcount, recvtype, root, comm, info, request, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN), ASYNCHRONOUS :: sendcounts(*)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN), ASYNCHRONOUS :: displs(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: recvcount
  INTEGER, INTENT(IN) :: root
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SCATTERV_INIT(SENDBUF, SENDCOUNTS, DISPLS, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNTS(*), DISPLS(*), SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, INFO, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
