---
title: MPI_PSEND_INIT
c_name: MPI_Psend_init
lis_name: MPI_PSEND_INIT
chapter: part
aliases: [MPI_PSEND_INIT, MPI_Psend_init]
tags: [mpi/function, mpi/part]
---

# MPI_PSEND_INIT

**C**
```c
int MPI_Psend_init(const void *buf, int partitions, MPI_Count count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | IN | initial address of send buffer (choice) |
| `partitions` | IN | number of partitions (nonnegative integer) |
| `count` | IN | number of elements sent per partition (nonnegative integer) |
| `datatype` | IN | type of each element (handle) |
| `dest` | IN | rank of destination (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |
| `info` | IN | info argument (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Psend_init(buf, partitions, count, datatype, dest, tag, comm, info, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
  INTEGER, INTENT(IN) :: partitions, dest, tag
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PSEND_INIT(BUF, PARTITIONS, COUNT, DATATYPE, DEST, TAG, COMM, INFO, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER PARTITIONS, DATATYPE, DEST, TAG, COMM, INFO, REQUEST, IERROR
  INTEGER(KIND=MPI_COUNT_KIND) COUNT
```


> [!info] Semantics
> See the chapter note [[part]] for the normative text.
