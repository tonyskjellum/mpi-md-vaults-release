---
title: MPI_FILE_WRITE_ALL_END
c_name: MPI_File_write_all_end
lis_name: MPI_FILE_WRITE_ALL_END
chapter: io
aliases: [MPI_FILE_WRITE_ALL_END, MPI_File_write_all_end]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_WRITE_ALL_END

**C**
```c
int MPI_File_write_all_end(MPI_File fh, const void *buf, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `buf` | IN | initial address of buffer (choice) |
| `status` | OUT | status object (status) |

**Fortran 2008**
```fortran
MPI_File_write_all_end(fh, buf, status, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_WRITE_ALL_END(FH, BUF, STATUS, IERROR)
  INTEGER FH, STATUS(MPI_STATUS_SIZE), IERROR
  <type> BUF(*)
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
