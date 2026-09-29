---
title: MPI_FILE_READ_AT_ALL_BEGIN
c_name: MPI_File_read_at_all_begin
lis_name: MPI_FILE_READ_AT_ALL_BEGIN
chapter: io
aliases: [MPI_FILE_READ_AT_ALL_BEGIN, MPI_File_read_at_all_begin]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ_AT_ALL_BEGIN

**C**
```c
int MPI_File_read_at_all_begin(MPI_File fh, MPI_Offset offset, void *buf, int count, MPI_Datatype datatype)
```

**C++**
```cpp
void MPI::File::Read_at_all_begin(MPI::Offset offset, void* buf, int count, const MPI::Datatype& datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `offset` | IN | file offset (integer) |
| `buf` | OUT | initial address of buffer (choice) |
| `count` | IN | number of elements in buffer (integer) |
| `datatype` | IN | datatype of each buffer element (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_READ_AT_ALL_BEGIN(FH, OFFSET, BUF, COUNT, DATATYPE, IERROR)
  <type> BUF(*)
  INTEGER FH, COUNT, DATATYPE, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
