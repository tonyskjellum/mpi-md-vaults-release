---
title: MPI_PACK_SIZE
c_name: MPI_Pack_size
lis_name: MPI_PACK_SIZE
chapter: datatypes
aliases: [MPI_PACK_SIZE, MPI_Pack_size]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK_SIZE

**C**
```c
int MPI_Pack_size(int incount, MPI_Datatype datatype, MPI_Comm comm, int *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `incount` | IN | count argument to packing call (non-negative integer) |
| `datatype` | IN | datatype argument to packing call (handle) |
| `comm` | IN | communicator argument to packing call (handle) |
| `size` | OUT | upper bound on size of packed message, in bytes (non-negative integer) |

**Fortran 2008**
```fortran
MPI_Pack_size(incount, datatype, comm, size, ierror)
  INTEGER, INTENT(IN) :: incount
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PACK_SIZE(INCOUNT, DATATYPE, COMM, SIZE, IERROR)
  INTEGER INCOUNT, DATATYPE, COMM, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
