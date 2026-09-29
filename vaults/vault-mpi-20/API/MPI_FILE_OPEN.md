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
int MPI_File_open(MPI_Comm comm, char *filename, int amode, MPI_Info info, MPI_File *fh)
```

**C++**
```cpp
static MPI::File MPI::File::Open(const MPI::Intracomm& comm, const char* filename, int amode, const MPI::Info& info)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `filename` | IN | name of file to open (string) |
| `amode` | IN | file access mode (integer) |
| `info` | IN | info object (handle) |
| `fh` | OUT | new file handle (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_OPEN(COMM, FILENAME, AMODE, INFO, FH, IERROR)
  CHARACTER*(*) FILENAME
  INTEGER COMM, AMODE, INFO, FH, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
