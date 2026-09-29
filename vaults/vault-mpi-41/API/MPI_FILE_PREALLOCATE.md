---
title: MPI_FILE_PREALLOCATE
c_name: MPI_File_preallocate
lis_name: MPI_FILE_PREALLOCATE
chapter: io
aliases: [MPI_FILE_PREALLOCATE, MPI_File_preallocate]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_PREALLOCATE

**C**
```c
int MPI_File_preallocate(MPI_File fh, MPI_Offset size)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `size` | IN | size to preallocate file (integer) |

**Fortran 2008**
```fortran
MPI_File_preallocate(fh, size, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_PREALLOCATE(FH, SIZE, IERROR)
  INTEGER FH, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) SIZE
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
