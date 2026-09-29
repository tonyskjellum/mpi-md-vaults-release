---
title: MPI_FILE_SET_SIZE
c_name: MPI_File_set_size
lis_name: MPI_FILE_SET_SIZE
chapter: io
aliases: [MPI_FILE_SET_SIZE, MPI_File_set_size]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_SET_SIZE

**C**
```c
int MPI_File_set_size(MPI_File fh, MPI_Offset size)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `size` | IN | size to truncate or expand file (integer) |

**Fortran 2008**
```fortran
MPI_File_set_size(fh, size, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_SET_SIZE(FH, SIZE, IERROR)
  INTEGER FH, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) SIZE
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
