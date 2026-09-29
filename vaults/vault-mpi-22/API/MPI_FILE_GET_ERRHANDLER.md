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

**C++**
```cpp
MPI::Errhandler MPI::File::Get_errhandler() const
```

| Parameter | Intent | Description |
|---|---|---|
| `file` | IN | file (handle) |
| `errhandler` | OUT | error handler currently associated with file (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_ERRHANDLER(FILE, ERRHANDLER, IERROR)
  INTEGER FILE, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
