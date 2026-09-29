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
int MPI_File_set_view(MPI_File fh, MPI_Offset disp, MPI_Datatype etype, MPI_Datatype filetype, char *datarep, MPI_Info info)
```

**C++**
```cpp
void MPI::File::Set_view(MPI::Offset disp, const MPI::Datatype& etype, const MPI::Datatype& filetype, const char* datarep, const MPI::Info& info)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `disp` | IN | displacement (integer) |
| `etype` | IN | elementary datatype (handle) |
| `filetype` | IN | filetype (handle) |
| `datarep` | IN | data representation (string) |
| `info` | IN | info object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_SET_VIEW(FH, DISP, ETYPE, FILETYPE, DATAREP, INFO, IERROR)
  INTEGER FH, ETYPE, FILETYPE, INFO, IERROR
  CHARACTER*(*) DATAREP
  INTEGER(KIND=MPI_OFFSET_KIND) DISP
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
