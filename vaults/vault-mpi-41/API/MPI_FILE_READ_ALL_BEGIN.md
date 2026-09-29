---
title: MPI_FILE_READ_ALL_BEGIN
c_name: MPI_File_read_all_begin
lis_name: MPI_FILE_READ_ALL_BEGIN
chapter: io
aliases: [MPI_FILE_READ_ALL_BEGIN, MPI_File_read_all_begin, MPI_File_read_all_begin_c]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ_ALL_BEGIN

**C**
```c
int MPI_File_read_all_begin(MPI_File fh, void *buf, int count, MPI_Datatype datatype)
int MPI_File_read_all_begin_c(MPI_File fh, void *buf, MPI_Count count, MPI_Datatype datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | OUT | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |

**Fortran 2008**
```fortran
MPI_File_read_all_begin(fh, buf, count, datatype, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_File_read_all_begin(fh, buf, count, datatype, ierror) !(_c)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_READ_ALL_BEGIN(FH, BUF, COUNT, DATATYPE, IERROR)
  INTEGER FH, COUNT, DATATYPE, IERROR
  <type> BUF(*)
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
