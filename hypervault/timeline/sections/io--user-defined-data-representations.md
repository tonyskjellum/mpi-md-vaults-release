---
title: "User-Defined Data Representations"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# User-Defined Data Representations

Chapter **io** · in [[versions/v20/sections/io#User-Defined Data Representations|MPI-2.0]], [[versions/v21/sections/io#User-Defined Data Representations|MPI-2.1]], [[versions/v22/sections/io#User-Defined Data Representations|MPI-2.2]], [[versions/v30/sections/io#User-Defined Data Representations|MPI-3.0]], [[versions/v31/sections/io#User-Defined Data Representations|MPI-3.1]], [[versions/v40/sections/io#User-Defined Data Representations|MPI-4.0]], [[versions/v41/sections/io#User-Defined Data Representations|MPI-4.1]], [[versions/v50/sections/io#User-Defined Data Representations|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The length of a data representation string is limited to the value of ~~MPI_MAX_DATAREP_STRING. MPI_MAX_DATAREP_STRING~~ ==`MPI_MAX_DATAREP_STRING`. `MPI_MAX_DATAREP_STRING`== must have a value of at least 64. No routines are provided to delete data representations and free the associated resources; it is not expected that an application will generate them in significant numbers.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~using the default file error handler (see Section [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] ).~~

~~The length of a data representation string is limited to the value of `MPI_MAX_DATAREP_STRING`. `MPI_MAX_DATAREP_STRING` must have a value of at least 64. No routines are provided to delete data representations and free the associated resources; it is not expected that an application will generate them in significant numbers.~~

==using the default file error handler (see Section [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] ). The length of a data representation string is limited to the value of `MPI_MAX_DATAREP_STRING`. `MPI_MAX_DATAREP_STRING` must have a value of at least 64. No routines are provided to delete data representations and free the associated resources; it is not expected that an application will generate them in significant numbers.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The call associates `read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn` with the data representation identifier `datarep`. `datarep` can then be used as an argument to `MPI_FILE_SET_VIEW`, causing subsequent data access operations to call the conversion functions to convert all data items accessed between file data representation and native representation. `MPI_REGISTER_DATAREP` is a local operation and only registers the data representation~~

~~for the calling MPI process. If `datarep` is already defined, an error in the error class `MPI_ERR_DUP_DATAREP` is raised~~

~~using the default file error handler (see Section [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] ). The length of a data representation string is limited to the value of `MPI_MAX_DATAREP_STRING`. `MPI_MAX_DATAREP_STRING` must have a value of at least 64. No routines are provided to delete data representations and free the associated resources; it is not expected that an application will generate them in significant numbers.~~

==The call associates `read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn` with the data representation identifier `datarep`. `datarep` can then be used as an argument to [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , causing subsequent data access operations to call the conversion functions to convert all data items accessed between file data representation and native representation. [[versions/v31/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] is a local operation and only registers the data representation for the calling MPI process. If `datarep` is already defined, an error in the error class `MPI_ERR_DUP_DATAREP` is raised using the default file error handler (see [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] ). The length of a data representation string is limited to the value of `MPI_MAX_DATAREP_STRING`. `MPI_MAX_DATAREP_STRING` must have a value of at least 64. No routines are provided to delete data representations and free the associated resources; it is not expected that an application will generate them in significant numbers.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#User-Defined Data Representations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#User-Defined Data Representations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#User-Defined Data Representations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#User-Defined Data Representations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#User-Defined Data Representations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#User-Defined Data Representations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#User-Defined Data Representations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#User-Defined Data Representations]]
