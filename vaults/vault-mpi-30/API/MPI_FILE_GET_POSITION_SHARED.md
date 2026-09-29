---
title: MPI_FILE_GET_POSITION_SHARED
c_name: MPI_File_get_position_shared
lis_name: MPI_FILE_GET_POSITION_SHARED
chapter: io
aliases: [MPI_FILE_GET_POSITION_SHARED, MPI_File_get_position_shared]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_POSITION_SHARED

**C**
```c
int MPI_File_get_position_shared(MPI_File fh, MPI_Offset *offset)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `offset` | OUT | offset of shared pointer (integer) |

**Fortran 2008**
```fortran
MPI_File_get_position_shared(fh, offset, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(OUT) :: offset
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_POSITION_SHARED(FH, OFFSET, IERROR)
  INTEGER FH, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
