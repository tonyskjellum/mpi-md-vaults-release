---
title: MPI_FILE_SEEK_SHARED
c_name: MPI_File_seek_shared
lis_name: MPI_FILE_SEEK_SHARED
chapter: io
aliases: [MPI_FILE_SEEK_SHARED, MPI_File_seek_shared]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_SEEK_SHARED

**C**
```c
int MPI_File_seek_shared(MPI_File fh, MPI_Offset offset, int whence)
```

**C++**
```cpp
void MPI::File::Seek_shared(MPI::Offset offset, int whence)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `offset` | IN | file offset (integer) |
| `whence` | IN | update mode (state) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_SEEK_SHARED(FH, OFFSET, WHENCE, IERROR)
  INTEGER FH, WHENCE, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
