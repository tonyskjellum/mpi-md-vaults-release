---
title: MPI_FILE_IREAD
c_name: MPI_File_iread
lis_name: MPI_FILE_IREAD
chapter: io
aliases: [MPI_FILE_IREAD, MPI_File_iread]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_IREAD

**C**
```c
int MPI_File_iread(MPI_File fh, void *buf, int count, MPI_Datatype datatype, MPI_Request *request)
```

**C++**
```cpp
MPI::Request MPI::File::Iread(void* buf, int count, const MPI::Datatype& datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | OUT | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |
| `request` | OUT | request object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_IREAD(FH, BUF, COUNT, DATATYPE, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
