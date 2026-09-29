---
title: MPI_REGISTER_DATAREP
c_name: MPI_Register_datarep
lis_name: MPI_REGISTER_DATAREP
chapter: io
aliases: [MPI_REGISTER_DATAREP, MPI_Register_datarep]
tags: [mpi/function, mpi/io]
---

# MPI_REGISTER_DATAREP

**C**
```c
int MPI_Register_datarep(char *datarep, MPI_Datarep_conversion_function *read_conversion_fn, MPI_Datarep_conversion_function *write_conversion_fn, MPI_Datarep_extent_function *dtype_file_extent_fn, void *extra_state)
```

**C++**
```cpp
void MPI::Register_datarep(const char* datarep, MPI::Datarep_conversion_function* read_conversion_fn, MPI::Datarep_conversion_function* write_conversion_fn, MPI::Datarep_extent_function* dtype_file_extent_fn, void* extra_state)
```

| Parameter | Intent | Description |
|---|---|---|
| `datarep` | IN | data representation identifier (string) |
| `read_conversion_fn` | IN | function invoked to convert from file representation to native representation (function) |
| `write_conversion_fn` | IN | function invoked to convert from native representation to file representation (function) |
| `dtype_file_extent_fn` | IN | function invoked to get the extent of a datatype as represented in the file (function) |
| `extra_state` | IN | extra state |

**Fortran (mpif.h)**
```fortran
MPI_REGISTER_DATAREP(DATAREP, READ_CONVERSION_FN, WRITE_CONVERSION_FN, DTYPE_FILE_EXTENT_FN, EXTRA_STATE, IERROR)
  CHARACTER*(*) DATAREP
  EXTERNAL READ_CONVERSION_FN, WRITE_CONVERSION_FN, DTYPE_FILE_EXTENT_FN
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.
