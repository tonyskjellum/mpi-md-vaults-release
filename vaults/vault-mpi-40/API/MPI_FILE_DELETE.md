---
title: MPI_FILE_DELETE
c_name: MPI_File_delete
lis_name: MPI_FILE_DELETE
chapter: io
aliases: [MPI_FILE_DELETE, MPI_File_delete]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_DELETE

**C**
```c
int MPI_File_delete(const char *filename, MPI_Info info)
```

| Parameter | Intent | Description |
|---|---|---|
| `filename` | IN | name of file to delete (string) |
| `info` | IN | info object (handle) |

**Fortran 2008**
```fortran
MPI_File_delete(filename, info, ierror)
  CHARACTER(LEN=*), INTENT(IN) :: filename
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_DELETE(FILENAME, INFO, IERROR)
  CHARACTER*(*) FILENAME
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
