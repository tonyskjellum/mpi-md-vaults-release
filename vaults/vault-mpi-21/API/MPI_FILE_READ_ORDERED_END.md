---
title: MPI_FILE_READ_ORDERED_END
c_name: MPI_File_read_ordered_end
lis_name: MPI_FILE_READ_ORDERED_END
chapter: io
aliases: [MPI_FILE_READ_ORDERED_END, MPI_File_read_ordered_end]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ_ORDERED_END

**C**
```c
int MPI_File_read_ordered_end(MPI_File fh, void *buf, MPI_Status *status)
```

**C++**
```cpp
void MPI::File::Read_ordered_end(void* buf, MPI::Status& status)
void MPI::File::Read_ordered_end(void* buf)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | OUT | initial address of buffer (choice) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_READ_ORDERED_END(FH, BUF, STATUS, IERROR)
  <type> BUF(*)
  INTEGER FH, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
