---
title: MPI_FILE_GET_VIEW
c_name: MPI_File_get_view
lis_name: MPI_FILE_GET_VIEW
chapter: io
aliases: [MPI_FILE_GET_VIEW, MPI_File_get_view]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_VIEW

**C**
```c
int MPI_File_get_view(MPI_File fh, MPI_Offset *disp, MPI_Datatype *etype, MPI_Datatype *filetype, char *datarep)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `disp` | OUT | displacement (integer) |
| `etype` | OUT | elementary datatype (handle) |
| `filetype` | OUT | filetype (handle) |
| `datarep` | OUT | data representation (string) |

**Fortran 2008**
```fortran
MPI_File_get_view(fh, disp, etype, filetype, datarep, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(OUT) :: disp
  TYPE(MPI_Datatype), INTENT(OUT) :: etype, filetype
  CHARACTER(LEN=*), INTENT(OUT) :: datarep
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_VIEW(FH, DISP, ETYPE, FILETYPE, DATAREP, IERROR)
  INTEGER FH, ETYPE, FILETYPE, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) DISP
  CHARACTER*(*) DATAREP
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
