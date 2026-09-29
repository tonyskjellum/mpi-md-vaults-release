---
title: MPI_FILE_GET_ATOMICITY
c_name: MPI_File_get_atomicity
lis_name: MPI_FILE_GET_ATOMICITY
chapter: io
aliases: [MPI_FILE_GET_ATOMICITY, MPI_File_get_atomicity]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_ATOMICITY

**C**
```c
int MPI_File_get_atomicity(MPI_File fh, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `flag` | OUT | `true` if atomic mode, `false` if nonatomic mode (logical) |

**Fortran 2008**
```fortran
MPI_File_get_atomicity(fh, flag, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_ATOMICITY(FH, FLAG, IERROR)
  INTEGER FH, IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
