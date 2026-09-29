---
title: MPI_FILE_SYNC
c_name: MPI_File_sync
lis_name: MPI_FILE_SYNC
chapter: io
aliases: [MPI_FILE_SYNC, MPI_File_sync]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_SYNC

**C**
```c
int MPI_File_sync(MPI_File fh)
```

**C++**
```cpp
void MPI::File::Sync()
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_SYNC(FH, IERROR)
  INTEGER FH, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
