---
title: MPI_FILE_IWRITE_AT
c_name: MPI_File_iwrite_at
lis_name: MPI_FILE_IWRITE_AT
chapter: io
aliases: [MPI_FILE_IWRITE_AT, MPI_File_iwrite_at]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_IWRITE_AT

**C**
```c
int MPI_File_iwrite_at(MPI_File fh, MPI_Offset offset, const void *buf, int count, MPI_Datatype datatype, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `offset` | IN | file offset (integer) |
| `buf` | IN | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |
| `request` | OUT | request object (handle) |

**Fortran 2008**
```fortran
MPI_File_iwrite_at(fh, offset, buf, count, datatype, request, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: offset
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_IWRITE_AT(FH, OFFSET, BUF, COUNT, DATATYPE, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, REQUEST, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
