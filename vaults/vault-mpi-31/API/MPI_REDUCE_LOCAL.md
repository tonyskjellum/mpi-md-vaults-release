---
title: MPI_REDUCE_LOCAL
c_name: MPI_Reduce_local
lis_name: MPI_REDUCE_LOCAL
chapter: coll
aliases: [MPI_REDUCE_LOCAL, MPI_Reduce_local]
tags: [mpi/function, mpi/coll]
---

# MPI_REDUCE_LOCAL

**C**
```c
int MPI_Reduce_local(const void* inbuf, void* inoutbuf, int count, MPI_Datatype datatype, MPI_Op op)
```

| Parameter | Intent | Description |
|---|---|---|
| `inbuf` | IN | input buffer (choice) |
| `inoutbuf` | INOUT | combined input and output buffer (choice) |
| `count` | IN | number of elements in `inbuf` and `inoutbuf` buffers (non-negative integer) |
| `datatype` | IN | data type of elements of `inbuf` and `inoutbuf` buffers (handle) |
| `op` | IN | operation (handle) |

**Fortran 2008**
```fortran
MPI_Reduce_local(inbuf, inoutbuf, count, datatype, op, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: inbuf
  TYPE(*), DIMENSION(..) :: inoutbuf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REDUCE_LOCAL(INBUF, INOUTBUF, COUNT, DATATYPE, OP, IERROR)
  <type> INBUF(*), INOUTBUF(*)
  INTEGER COUNT, DATATYPE, OP, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
