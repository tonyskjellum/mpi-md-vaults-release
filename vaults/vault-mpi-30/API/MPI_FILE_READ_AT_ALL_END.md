---
title: MPI_FILE_READ_AT_ALL_END
c_name: MPI_File_read_at_all_end
lis_name: MPI_FILE_READ_AT_ALL_END
chapter: io
aliases: [MPI_FILE_READ_AT_ALL_END, MPI_File_read_at_all_end]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_READ_AT_ALL_END

**C**
```c
int MPI_File_read_at_all_end(MPI_File fh, void *buf, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `buf` | OUT | initial address of buffer (choice) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_File_read_at_all_end(fh, buf, status, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_READ_AT_ALL_END(FH, BUF, STATUS, IERROR)
  <type> BUF(*)
  INTEGER FH, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
