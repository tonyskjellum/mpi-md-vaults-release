---
title: MPI_FILE_CALL_ERRHANDLER
c_name: MPI_File_call_errhandler
lis_name: MPI_FILE_CALL_ERRHANDLER
chapter: inquiry
aliases: [MPI_FILE_CALL_ERRHANDLER, MPI_File_call_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FILE_CALL_ERRHANDLER

**C**
```c
int MPI_File_call_errhandler(MPI_File fh, int errorcode)
```

**C++**
```cpp
void MPI::File::Call_errhandler(int errorcode) const
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file with error handler (handle) |
| `errorcode` | IN | error code (integer) |

**Fortran (mpif.h)**
```fortran
MPI_FILE_CALL_ERRHANDLER(FH, ERRORCODE, IERROR)
  INTEGER FH, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.
