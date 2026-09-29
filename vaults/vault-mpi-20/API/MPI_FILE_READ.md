---
title: MPI_FILE_READ
c_name: MPI_File_read
lis_name: MPI_FILE_READ
chapter: io
aliases: [MPI_FILE_READ, MPI_File_read]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ

**C**
```c
int MPI_File_read(MPI_File fh, void *buf, int count, MPI_Datatype datatype, MPI_Status *status)
```

**C++**
```cpp
void MPI::File::Read(void* buf, int count, const MPI::Datatype& datatype, MPI::Status& status)
void MPI::File::Read(void* buf, int count, const MPI::Datatype& datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | OUT | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_READ(FH, BUF, COUNT, DATATYPE, STATUS, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
