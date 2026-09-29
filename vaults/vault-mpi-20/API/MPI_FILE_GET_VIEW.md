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

**C++**
```cpp
void MPI::File::Get_view(MPI::Offset& disp, MPI::Datatype& etype, MPI::Datatype& filetype, char* datarep) const
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `disp` | OUT | displacement (integer) |
| `etype` | OUT | elementary datatype (handle) |
| `filetype` | OUT | filetype (handle) |
| `datarep` | OUT | data representation (string) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_VIEW(FH, DISP, ETYPE, FILETYPE, DATAREP, IERROR)
  INTEGER FH, ETYPE, FILETYPE, IERROR
  CHARACTER*(*) DATAREP, INTEGER(KIND=MPI_OFFSET_KIND) DISP
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
