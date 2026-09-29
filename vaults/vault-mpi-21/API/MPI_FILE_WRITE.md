---
title: MPI_FILE_WRITE
c_name: MPI_File_write
lis_name: MPI_FILE_WRITE
chapter: io
aliases: [MPI_FILE_WRITE, MPI_File_write]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_WRITE

**C**
```c
int MPI_File_write(MPI_File fh, void *buf, int count, MPI_Datatype datatype, MPI_Status *status)
```

**C++**
```cpp
void MPI::File::Write(const void* buf, int count, const MPI::Datatype& datatype, MPI::Status& status)
void MPI::File::Write(const void* buf, int count, const MPI::Datatype& datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | IN | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_WRITE(FH, BUF, COUNT, DATATYPE, STATUS, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
