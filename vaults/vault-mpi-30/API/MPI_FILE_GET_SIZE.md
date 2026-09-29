---
title: MPI_FILE_GET_SIZE
c_name: MPI_File_get_size
lis_name: MPI_FILE_GET_SIZE
chapter: io
aliases: [MPI_FILE_GET_SIZE, MPI_File_get_size]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_SIZE

**C**
```c
int MPI_File_get_size(MPI_File fh, MPI_Offset *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `size` | OUT | size of the file in bytes (integer) |

**Fortran 2008**
```fortran
MPI_File_get_size(fh, size, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_SIZE(FH, SIZE, IERROR)
  INTEGER FH, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) SIZE
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
