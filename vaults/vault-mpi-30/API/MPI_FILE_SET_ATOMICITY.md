---
title: MPI_FILE_SET_ATOMICITY
c_name: MPI_File_set_atomicity
lis_name: MPI_FILE_SET_ATOMICITY
chapter: io
aliases: [MPI_FILE_SET_ATOMICITY, MPI_File_set_atomicity]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_SET_ATOMICITY

**C**
```c
int MPI_File_set_atomicity(MPI_File fh, int flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | INOUT | file handle (handle) |
| `flag` | IN | `true` to set atomic mode, `false` to set nonatomic mode (logical) |

**Fortran 2008**
```fortran
MPI_File_set_atomicity(fh, flag, ierror) BIND(C)
  TYPE(MPI_File), INTENT(IN) :: fh
  LOGICAL, INTENT(IN) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_SET_ATOMICITY(FH, FLAG, IERROR)
  INTEGER FH, IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
