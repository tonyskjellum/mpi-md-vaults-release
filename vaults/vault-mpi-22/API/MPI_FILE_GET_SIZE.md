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

**C++**
```cpp
MPI::Offset MPI::File::Get_size() const
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `size` | OUT | size of the file in bytes (integer) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_SIZE(FH, SIZE, IERROR)
  INTEGER FH, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) SIZE
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
