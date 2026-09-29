---
title: MPI_FILE_GET_ERRHANDLER
c_name: MPI_File_get_errhandler
lis_name: MPI_FILE_GET_ERRHANDLER
chapter: inquiry
aliases: [MPI_FILE_GET_ERRHANDLER, MPI_File_get_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FILE_GET_ERRHANDLER

**C**
```c
int MPI_File_get_errhandler(MPI_File file, MPI_Errhandler *errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `file` | IN | file (handle) |
| `errhandler` | OUT | error handler currently associated with file (handle) |

**Fortran 2008**
```fortran
MPI_File_get_errhandler(file, errhandler, ierror)
  TYPE(MPI_File), INTENT(IN) :: file
  TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_ERRHANDLER(FILE, ERRHANDLER, IERROR)
  INTEGER FILE, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
