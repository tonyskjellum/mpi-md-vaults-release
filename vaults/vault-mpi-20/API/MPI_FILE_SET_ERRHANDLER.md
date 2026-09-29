---
title: MPI_FILE_SET_ERRHANDLER
c_name: MPI_File_set_errhandler
lis_name: MPI_FILE_SET_ERRHANDLER
chapter: misc
aliases: [MPI_FILE_SET_ERRHANDLER, MPI_File_set_errhandler]
tags: [mpi/function, mpi/misc]
---

# MPI_FILE_SET_ERRHANDLER

**C**
```c
int MPI_File_set_errhandler(MPI_File file, MPI_Errhandler errhandler)
```

**C++**
```cpp
void MPI::File::Set_errhandler(const MPI::Errhandler& errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `file` | INOUT | file (handle) |
| `errhandler` | IN | new error handler for file (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_SET_ERRHANDLER(FILE, ERRHANDLER, IERROR)
  INTEGER FILE, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
