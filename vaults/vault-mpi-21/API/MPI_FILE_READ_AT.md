---
title: MPI_FILE_READ_AT
c_name: MPI_File_read_at
lis_name: MPI_FILE_READ_AT
chapter: io
aliases: [MPI_FILE_READ_AT, MPI_File_read_at]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ_AT

**C**
```c
int MPI_File_read_at(MPI_File fh, MPI_Offset offset, void *buf, int count, MPI_Datatype datatype, MPI_Status *status)
```

**C++**
```cpp
void MPI::File::Read_at(MPI::Offset offset, void* buf, int count, const MPI::Datatype& datatype, MPI::Status& status)
void MPI::File::Read_at(MPI::Offset offset, void* buf, int count, const MPI::Datatype& datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `offset` | IN | file offset (integer) |
| `buf` | OUT | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_READ_AT(FH, OFFSET, BUF, COUNT, DATATYPE, STATUS, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, STATUS(MPI_STATUS_SIZE), IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
