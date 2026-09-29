---
title: MPI_PRECV_INIT
c_name: MPI_Precv_init
lis_name: MPI_PRECV_INIT
chapter: part
aliases: [MPI_PRECV_INIT, MPI_Precv_init]
tags: [mpi/function, mpi/part]
---

# MPI_PRECV_INIT

**C**
```c
int MPI_Precv_init(void *buf, int partitions, MPI_Count count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Info info, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | IN | initial address of recv buffer (choice) |
| `partitions` | IN | number of partitions (non-negative integer) |
| `count` | IN | number of elements received per partition (non-negative integer) |
| `datatype` | IN | type of each element (handle) |
| `source` | IN | rank of source (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |
| `info` | IN | info argument (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Precv_init(buf, partitions, count, datatype, source, tag, comm, info, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: buf
  INTEGER, INTENT(IN) :: partitions, source, tag
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PRECV_INIT(BUF, PARTITIONS, COUNT, DATATYPE, SOURCE, TAG, COMM, INFO, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER PARTITIONS, DATATYPE, SOURCE, TAG, COMM, INFO, REQUEST, IERROR
  INTEGER(KIND=MPI_COUNT_KIND) COUNT
```


> [!info] Semantics
> See the chapter note [[part]] for the normative text.
