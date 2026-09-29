---
title: MPI_FILE_GET_POSITION
c_name: MPI_File_get_position
lis_name: MPI_FILE_GET_POSITION
chapter: io
aliases: [MPI_FILE_GET_POSITION, MPI_File_get_position]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_POSITION

**C**
```c
int MPI_File_get_position(MPI_File fh, MPI_Offset *offset)
```

**C++**
```cpp
MPI::Offset MPI::File::Get_position() const
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `offset` | OUT | offset of individual pointer (integer) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_POSITION(FH, OFFSET, IERROR)
  INTEGER FH, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
