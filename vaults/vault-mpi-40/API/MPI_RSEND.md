---
title: MPI_RSEND
c_name: MPI_Rsend
lis_name: MPI_RSEND
chapter: pt2pt
aliases: [MPI_RSEND, MPI_Rsend, MPI_Rsend_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_RSEND

**C**
```c
int MPI_Rsend(const void *buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm)
int MPI_Rsend_c(const void *buf, MPI_Count count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | IN | initial address of send buffer (choice) |
| `count` | IN | number of elements in send buffer (non-negative integer) |
| `datatype` | IN | datatype of each send buffer element (handle) |
| `dest` | IN | rank of destination (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Rsend(buf, count, datatype, dest, tag, comm, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
  INTEGER, INTENT(IN) :: count, dest, tag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Rsend(buf, count, datatype, dest, tag, comm, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: dest, tag
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_RSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, DEST, TAG, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
