---
title: MPI_FILE_CLOSE
c_name: MPI_File_close
lis_name: MPI_FILE_CLOSE
chapter: io
aliases: [MPI_FILE_CLOSE, MPI_File_close]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_CLOSE

**C**
```c
int MPI_File_close(MPI_File *fh)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |

**Fortran 2008**
```fortran
MPI_File_close(fh, ierror) BIND(C)
  TYPE(MPI_File), INTENT(INOUT) :: fh
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_CLOSE(FH, IERROR)
  INTEGER FH, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
