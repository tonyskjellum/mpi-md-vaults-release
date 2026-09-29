---
title: MPI_FILE_IREAD_SHARED
c_name: MPI_File_iread_shared
lis_name: MPI_FILE_IREAD_SHARED
chapter: io
aliases: [MPI_FILE_IREAD_SHARED, MPI_File_iread_shared, MPI_File_iread_shared_c]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_IREAD_SHARED

**C**
```c
int MPI_File_iread_shared(MPI_File fh, void *buf, int count, MPI_Datatype datatype, MPI_Request *request)
int MPI_File_iread_shared_c(MPI_File fh, void *buf, MPI_Count count, MPI_Datatype datatype, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | OUT | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |
| `request` | OUT | request object (handle) |

**Fortran 2008**
```fortran
MPI_File_iread_shared(fh, buf, count, datatype, request, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_File_iread_shared(fh, buf, count, datatype, request, ierror) !(_c)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_IREAD_SHARED(FH, BUF, COUNT, DATATYPE, REQUEST, IERROR)
  INTEGER FH, COUNT, DATATYPE, REQUEST, IERROR
  <type> BUF(*)
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
