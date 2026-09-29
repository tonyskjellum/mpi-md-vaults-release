---
title: MPI_BCAST
c_name: MPI_Bcast
lis_name: MPI_BCAST
chapter: coll
aliases: [MPI_BCAST, MPI_Bcast, MPI_Bcast_c]
tags: [mpi/function, mpi/coll]
---

# MPI_BCAST

**C**
```c
int MPI_Bcast(void *buffer, int count, MPI_Datatype datatype, int root, MPI_Comm comm)
int MPI_Bcast_c(void *buffer, MPI_Count count, MPI_Datatype datatype, int root, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `buffer` | INOUT | starting address of buffer (choice) |
| `count` | IN | number of entries in buffer (non-negative integer) |
| `datatype` | IN | datatype of buffer (handle) |
| `root` | IN | rank of broadcast root (integer) |
| `comm` | IN | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Bcast(buffer, count, datatype, root, comm, ierror)
  TYPE(*), DIMENSION(..) :: buffer
  INTEGER, INTENT(IN) :: count, root
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Bcast(buffer, count, datatype, root, comm, ierror) !(_c)
  TYPE(*), DIMENSION(..) :: buffer
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: root
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_BCAST(BUFFER, COUNT, DATATYPE, ROOT, COMM, IERROR)
  <type> BUFFER(*)
  INTEGER COUNT, DATATYPE, ROOT, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.
