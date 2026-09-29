---
title: MPI_FILE_GET_GROUP
c_name: MPI_File_get_group
lis_name: MPI_FILE_GET_GROUP
chapter: io
aliases: [MPI_FILE_GET_GROUP, MPI_File_get_group]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_GROUP

**C**
```c
int MPI_File_get_group(MPI_File fh, MPI_Group *group)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `group` | OUT | group which opened the file (handle) |

**Fortran 2008**
```fortran
MPI_File_get_group(fh, group, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(MPI_Group), INTENT(OUT) :: group
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_GROUP(FH, GROUP, IERROR)
  INTEGER FH, GROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
