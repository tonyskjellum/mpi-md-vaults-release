---
title: MPI_FILE_OPEN
c_name: MPI_File_open
lis_name: MPI_FILE_OPEN
chapter: io
aliases: [MPI_FILE_OPEN, MPI_File_open]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_OPEN

**C**
```c
int MPI_File_open(MPI_Comm comm, const char *filename, int amode, MPI_Info info, MPI_File *fh)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `filename` | IN | name of file to open (string) |
| `amode` | IN | file access mode (integer) |
| `info` | IN | info object (handle) |
| `fh` | OUT | new file handle (handle) |

**Fortran 2008**
```fortran
MPI_File_open(comm, filename, amode, info, fh, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  CHARACTER(LEN=*), INTENT(IN) :: filename
  INTEGER, INTENT(IN) :: amode
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_File), INTENT(OUT) :: fh
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_OPEN(COMM, FILENAME, AMODE, INFO, FH, IERROR)
  INTEGER COMM, AMODE, INFO, FH, IERROR
  CHARACTER*(*) FILENAME
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
