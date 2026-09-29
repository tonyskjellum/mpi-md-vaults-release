---
title: MPI_FILE_GET_BYTE_OFFSET
c_name: MPI_File_get_byte_offset
lis_name: MPI_FILE_GET_BYTE_OFFSET
chapter: io
aliases: [MPI_FILE_GET_BYTE_OFFSET, MPI_File_get_byte_offset]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_BYTE_OFFSET

**C**
```c
int MPI_File_get_byte_offset(MPI_File fh, MPI_Offset offset, MPI_Offset *disp)
```

**C++**
```cpp
MPI::Offset MPI::File::Get_byte_offset(const MPI::Offset disp) const
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `offset` | IN | offset (integer) |
| `disp` | OUT | absolute byte position of offset (integer) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_BYTE_OFFSET(FH, OFFSET, DISP, IERROR)
  INTEGER FH, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) OFFSET, DISP
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
