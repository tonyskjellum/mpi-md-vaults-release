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

**C++**
```cpp
void MPI::File::Close()
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_CLOSE(FH, IERROR)
  INTEGER FH, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
