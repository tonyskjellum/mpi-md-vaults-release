---
title: MPI_FILE_GET_INFO
c_name: MPI_File_get_info
lis_name: MPI_FILE_GET_INFO
chapter: io
aliases: [MPI_FILE_GET_INFO, MPI_File_get_info]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_INFO

**C**
```c
int MPI_File_get_info(MPI_File fh, MPI_Info *info_used)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `info_used` | OUT | new info object (handle) |

**Fortran 2008**
```fortran
MPI_File_get_info(fh, info_used, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(MPI_Info), INTENT(OUT) :: info_used
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_INFO(FH, INFO_USED, IERROR)
  INTEGER FH, INFO_USED, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
