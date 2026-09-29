---
title: MPI_REGISTER_DATAREP
c_name: MPI_Register_datarep
lis_name: MPI_REGISTER_DATAREP
chapter: io
aliases: [MPI_REGISTER_DATAREP, MPI_Register_datarep, MPI_Register_datarep_c]
tags: [mpi/function, mpi/io]
---

# MPI_REGISTER_DATAREP

**C**
```c
int MPI_Register_datarep(const char *datarep, MPI_Datarep_conversion_function *read_conversion_fn, MPI_Datarep_conversion_function *write_conversion_fn, MPI_Datarep_extent_function *dtype_file_extent_fn, void *extra_state)
int MPI_Register_datarep_c(const char *datarep, MPI_Datarep_conversion_function_c *read_conversion_fn, MPI_Datarep_conversion_function_c *write_conversion_fn, MPI_Datarep_extent_function *dtype_file_extent_fn, void *extra_state)
```

| Parameter | Intent | Description |
|---|---|---|
| `datarep` | IN | data representation identifier (string) |
| `read_conversion_fn` | IN | function invoked to convert from file representation to native representation (function) |
| `write_conversion_fn` | IN | function invoked to convert from native representation to file representation (function) |
| `dtype_file_extent_fn` | IN | function invoked to get the extent of a datatype as represented in the file (function) |
| `extra_state` | IN | extra state |

**Fortran 2008**
```fortran
MPI_Register_datarep(datarep, read_conversion_fn, write_conversion_fn, dtype_file_extent_fn, extra_state, ierror)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  PROCEDURE(MPI_Datarep_conversion_function) :: read_conversion_fn, write_conversion_fn
  PROCEDURE(MPI_Datarep_extent_function) :: dtype_file_extent_fn
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Register_datarep_c(datarep, read_conversion_fn, write_conversion_fn, dtype_file_extent_fn, extra_state, ierror) !(_c)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  PROCEDURE(MPI_Datarep_conversion_function_c) :: read_conversion_fn, write_conversion_fn
  PROCEDURE(MPI_Datarep_extent_function) :: dtype_file_extent_fn
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

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
