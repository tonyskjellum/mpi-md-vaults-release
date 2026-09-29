---
title: MPI_FILE_SET_ERRHANDLER
c_name: MPI_File_set_errhandler
lis_name: MPI_FILE_SET_ERRHANDLER
chapter: inquiry
aliases: [MPI_FILE_SET_ERRHANDLER, MPI_File_set_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FILE_SET_ERRHANDLER

**C**
```c
int MPI_File_set_errhandler(MPI_File file, MPI_Errhandler errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `file` | INOUT | file (handle) |
| `errhandler` | IN | new error handler for file (handle) |

**Fortran 2008**
```fortran
MPI_File_set_errhandler(file, errhandler, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: file
  TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_SET_ERRHANDLER(FILE, ERRHANDLER, IERROR)
  INTEGER FILE, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
