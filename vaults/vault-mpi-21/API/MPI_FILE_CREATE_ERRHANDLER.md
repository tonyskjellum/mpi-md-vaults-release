---
title: MPI_FILE_CREATE_ERRHANDLER
c_name: MPI_File_create_errhandler
lis_name: MPI_FILE_CREATE_ERRHANDLER
chapter: inquiry
aliases: [MPI_FILE_CREATE_ERRHANDLER, MPI_File_create_errhandler, MPI_File_errhandler_fn]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FILE_CREATE_ERRHANDLER

**C**
```c
int MPI_File_create_errhandler(MPI_File_errhandler_fn *function, MPI_Errhandler *errhandler)
typedef void MPI_File_errhandler_fn(MPI_File *, int *, ...);
```

**C++**
```cpp
static MPI::Errhandler MPI::File::Create_errhandler(MPI::File::Errhandler_fn* function)
typedef void MPI::File::Errhandler_fn(MPI::File &, int *, ... );
```

| Parameter | Intent | Description |
|---|---|---|
| `function` | IN | user defined error handling procedure (function) |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_CREATE_ERRHANDLER(FUNCTION, ERRHANDLER, IERROR)
  EXTERNAL FUNCTION
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
