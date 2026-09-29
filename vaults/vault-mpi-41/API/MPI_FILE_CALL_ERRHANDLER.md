---
title: MPI_FILE_CALL_ERRHANDLER
c_name: MPI_File_call_errhandler
lis_name: MPI_FILE_CALL_ERRHANDLER
chapter: inquiry
aliases: [MPI_FILE_CALL_ERRHANDLER, MPI_File_call_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FILE_CALL_ERRHANDLER

**C**
```c
int MPI_File_call_errhandler(MPI_File fh, int errorcode)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file with error handler (handle) |
| `errorcode` | IN | error code (integer) |

**Fortran 2008**
```fortran
MPI_File_call_errhandler(fh, errorcode, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER, INTENT(IN) :: errorcode
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_CALL_ERRHANDLER(FH, ERRORCODE, IERROR)
  INTEGER FH, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
