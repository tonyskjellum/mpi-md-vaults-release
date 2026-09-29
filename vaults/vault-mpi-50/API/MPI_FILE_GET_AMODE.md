---
title: MPI_FILE_GET_AMODE
c_name: MPI_File_get_amode
lis_name: MPI_FILE_GET_AMODE
chapter: io
aliases: [MPI_FILE_GET_AMODE, MPI_File_get_amode]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_AMODE

**C**
```c
int MPI_File_get_amode(MPI_File fh, int *amode)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `amode` | OUT | file access mode used to open the file (integer) |

**Fortran 2008**
```fortran
MPI_File_get_amode(fh, amode, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER, INTENT(OUT) :: amode
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_AMODE(FH, AMODE, IERROR)
  INTEGER FH, AMODE, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
