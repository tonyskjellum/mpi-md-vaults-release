---
title: MPI_FILE_SEEK
c_name: MPI_File_seek
lis_name: MPI_FILE_SEEK
chapter: io
aliases: [MPI_FILE_SEEK, MPI_File_seek]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_SEEK

**C**
```c
int MPI_File_seek(MPI_File fh, MPI_Offset offset, int whence)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `offset` | IN | file offset (integer) |
| `whence` | IN | update mode (state) |

**Fortran 2008**
```fortran
MPI_File_seek(fh, offset, whence, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: offset
  INTEGER, INTENT(IN) :: whence
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_SEEK(FH, OFFSET, WHENCE, IERROR)
  INTEGER FH, WHENCE, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
