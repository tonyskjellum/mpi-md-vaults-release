---
title: MPI_FILE_SET_VIEW
c_name: MPI_File_set_view
lis_name: MPI_FILE_SET_VIEW
chapter: io
aliases: [MPI_FILE_SET_VIEW, MPI_File_set_view]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_SET_VIEW

**C**
```c
int MPI_File_set_view(MPI_File fh, MPI_Offset disp, MPI_Datatype etype, MPI_Datatype filetype, const char *datarep, MPI_Info info)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `disp` | IN | displacement (integer) |
| `etype` | IN | elementary datatype (handle) |
| `filetype` | IN | filetype (handle) |
| `datarep` | IN | data representation (string) |
| `info` | IN | info object (handle) |

**Fortran 2008**
```fortran
MPI_File_set_view(fh, disp, etype, filetype, datarep, info, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: disp
  TYPE(MPI_Datatype), INTENT(IN) :: etype, filetype
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_SET_VIEW(FH, DISP, ETYPE, FILETYPE, DATAREP, INFO, IERROR)
  INTEGER FH, ETYPE, FILETYPE, INFO, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) DISP
  CHARACTER*(*) DATAREP
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
