---
title: MPI_FILE_READ_ALL
c_name: MPI_File_read_all
lis_name: MPI_FILE_READ_ALL
chapter: io
aliases: [MPI_FILE_READ_ALL, MPI_File_read_all]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ_ALL

**C**
```c
int MPI_File_read_all(MPI_File fh, void *buf, int count, MPI_Datatype datatype, MPI_Status *status)
```

**C++**
```cpp
void MPI::File::Read_all(void* buf, int count, const MPI::Datatype& datatype, MPI::Status& status)
void MPI::File::Read_all(void* buf, int count, const MPI::Datatype& datatype)
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
MPI_FILE_READ_ALL(FH, BUF, COUNT, DATATYPE, STATUS, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
