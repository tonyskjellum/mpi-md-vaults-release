---
title: MPI_FILE_SET_INFO
c_name: MPI_File_set_info
lis_name: MPI_FILE_SET_INFO
chapter: io
aliases: [MPI_FILE_SET_INFO, MPI_File_set_info]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_SET_INFO

**C**
```c
int MPI_File_set_info(MPI_File fh, MPI_Info info)
```

**C++**
```cpp
void MPI::File::Set_info(const MPI::Info& info)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `info` | IN | info object (handle) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_SET_INFO(FH, INFO, IERROR)
  INTEGER FH, INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
