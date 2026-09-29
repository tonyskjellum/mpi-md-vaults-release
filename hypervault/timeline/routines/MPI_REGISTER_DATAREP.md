---
title: MPI_REGISTER_DATAREP
c_name: MPI_Register_datarep
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_REGISTER_DATAREP, MPI_Register_datarep]
tags: [mpi/routine, mpi/io]
---

# MPI_REGISTER_DATAREP

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_REGISTER_DATAREP|MPI-2.0]] · [[versions/v21/API/MPI_REGISTER_DATAREP|MPI-2.1]] · [[versions/v22/API/MPI_REGISTER_DATAREP|MPI-2.2]] · [[versions/v30/API/MPI_REGISTER_DATAREP|MPI-3.0]] Δ · [[versions/v31/API/MPI_REGISTER_DATAREP|MPI-3.1]] Δ · [[versions/v40/API/MPI_REGISTER_DATAREP|MPI-4.0]] Δ · [[versions/v41/API/MPI_REGISTER_DATAREP|MPI-4.1]] · [[versions/v50/API/MPI_REGISTER_DATAREP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Register_datarep(char *datarep, MPI_Datarep_conversion_function *read_conversion_fn, MPI_Datarep_conversion_function *write_conversion_fn, MPI_Datarep_extent_function *dtype_file_extent_fn, void *extra_state)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Register_datarep(const char *datarep, MPI_Datarep_conversion_function *read_conversion_fn, MPI_Datarep_conversion_function *write_conversion_fn, MPI_Datarep_extent_function *dtype_file_extent_fn, void *extra_state)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Register_datarep(const char *datarep, MPI_Datarep_conversion_function *read_conversion_fn, MPI_Datarep_conversion_function *write_conversion_fn, MPI_Datarep_extent_function *dtype_file_extent_fn, void *extra_state)
int MPI_Register_datarep_c(const char *datarep, MPI_Datarep_conversion_function_c *read_conversion_fn, MPI_Datarep_conversion_function_c *write_conversion_fn, MPI_Datarep_extent_function *dtype_file_extent_fn, void *extra_state)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Register_datarep(const char* datarep, MPI::Datarep_conversion_function* read_conversion_fn, MPI::Datarep_conversion_function* write_conversion_fn, MPI::Datarep_extent_function* dtype_file_extent_fn, void* extra_state)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Register_datarep(datarep, read_conversion_fn, write_conversion_fn, dtype_file_extent_fn, extra_state, ierror) BIND(C)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    PROCEDURE(MPI_Datarep_conversion_function) :: read_conversion_fn
    PROCEDURE(MPI_Datarep_conversion_function) :: write_conversion_fn
    PROCEDURE(MPI_Datarep_extent_function) :: dtype_file_extent_fn
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Register_datarep(datarep, read_conversion_fn, write_conversion_fn, dtype_file_extent_fn, extra_state, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    PROCEDURE(MPI_Datarep_conversion_function) :: read_conversion_fn
    PROCEDURE(MPI_Datarep_conversion_function) :: write_conversion_fn
    PROCEDURE(MPI_Datarep_extent_function) :: dtype_file_extent_fn
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Register_datarep(datarep, read_conversion_fn, write_conversion_fn, dtype_file_extent_fn, extra_state, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    PROCEDURE(MPI_Datarep_conversion_function) :: read_conversion_fn, write_conversion_fn
    PROCEDURE(MPI_Datarep_extent_function) :: dtype_file_extent_fn
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Register_datarep_c(datarep, read_conversion_fn, write_conversion_fn, dtype_file_extent_fn, extra_state, ierror) !(_c)
    CHARACTER(LEN=*), INTENT(IN) :: datarep
    PROCEDURE(MPI_Datarep_conversion_function_c) :: read_conversion_fn, write_conversion_fn
    PROCEDURE(MPI_Datarep_extent_function) :: dtype_file_extent_fn
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_REGISTER_DATAREP(DATAREP, READ_CONVERSION_FN, WRITE_CONVERSION_FN, DTYPE_FILE_EXTENT_FN, EXTRA_STATE, IERROR)
    CHARACTER*(*) DATAREP
    EXTERNAL READ_CONVERSION_FN, WRITE_CONVERSION_FN, DTYPE_FILE_EXTENT_FN
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
    INTEGER IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datarep` | IN | **MPI-2.0–MPI-5.0:** data representation identifier (string) |
| `read_conversion_fn` | IN | **MPI-2.0–MPI-5.0:** function invoked to convert from file representation to native representation (function) |
| `write_conversion_fn` | IN | **MPI-2.0–MPI-5.0:** function invoked to convert from native representation to file representation (function) |
| `dtype_file_extent_fn` | IN | **MPI-2.0–MPI-5.0:** function invoked to get the extent of a datatype as represented in the file (function) |
| `extra_state` | IN | **MPI-2.0–MPI-5.0:** extra state |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_REGISTER_DATAREP|API note]] · chapter [[versions/v50/sections/io|io]]
