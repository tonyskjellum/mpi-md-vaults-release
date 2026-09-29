---
title: MPI_EXSCAN
c_name: MPI_Exscan
lis_name: MPI_EXSCAN
chapter: coll
aliases: [MPI_EXSCAN, MPI_Exscan, MPI_Exscan_c]
tags: [mpi/function, mpi/coll]
---

# MPI_EXSCAN

**C**
```c
int MPI_Exscan(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
int MPI_Exscan_c(const void *sendbuf, void *recvbuf, MPI_Count count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `count` | IN | number of elements in input buffer (non-negative integer) |
| `datatype` | IN | datatype of elements of input buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | intra-communicator (handle) |

**Fortran 2008**
```fortran
MPI_Exscan(sendbuf, recvbuf, count, datatype, op, comm, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Exscan(sendbuf, recvbuf, count, datatype, op, comm, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_EXSCAN(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER COUNT, DATATYPE, OP, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
