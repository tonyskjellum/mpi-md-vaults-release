---
title: MPI_FILE_CREATE_ERRHANDLER
c_name: MPI_File_create_errhandler
lis_name: MPI_FILE_CREATE_ERRHANDLER
chapter: inquiry
aliases: [MPI_FILE_CREATE_ERRHANDLER, MPI_File_create_errhandler, MPI_File_errhandler_function]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FILE_CREATE_ERRHANDLER

**C**
```c
int MPI_File_create_errhandler(MPI_File_errhandler_function *file_errhandler_fn, MPI_Errhandler *errhandler)
typedef void MPI_File_errhandler_function(MPI_File *file, int *error_code, ...);
```

| Parameter | Intent | Description |
|---|---|---|
| `file_errhandler_fn` | IN | user defined error handling procedure (function) |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran 2008**
```fortran
MPI_File_create_errhandler(file_errhandler_fn, errhandler, ierror)
  PROCEDURE(MPI_File_errhandler_function) :: file_errhandler_fn
  TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_CREATE_ERRHANDLER(FILE_ERRHANDLER_FN, ERRHANDLER, IERROR)
  EXTERNAL FILE_ERRHANDLER_FN
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
