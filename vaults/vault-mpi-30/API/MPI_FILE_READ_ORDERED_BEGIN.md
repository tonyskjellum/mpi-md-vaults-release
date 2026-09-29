---
title: MPI_FILE_READ_ORDERED_BEGIN
c_name: MPI_File_read_ordered_begin
lis_name: MPI_FILE_READ_ORDERED_BEGIN
chapter: io
aliases: [MPI_FILE_READ_ORDERED_BEGIN, MPI_File_read_ordered_begin]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ_ORDERED_BEGIN

**C**
```c
int MPI_File_read_ordered_begin(MPI_File fh, void *buf, int count, MPI_Datatype datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | OUT | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |

**Fortran 2008**
```fortran
MPI_File_read_ordered_begin(fh, buf, count, datatype, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_READ_ORDERED_BEGIN(FH, BUF, COUNT, DATATYPE, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
