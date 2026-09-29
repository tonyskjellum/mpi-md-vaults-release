---
title: "Extent Callback"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Extent Callback

Chapter **io** · in [[versions/v20/sections/io#Extent Callback|MPI-2.0]], [[versions/v21/sections/io#Extent Callback|MPI-2.1]], [[versions/v22/sections/io#Extent Callback|MPI-2.2]], [[versions/v30/sections/io#Extent Callback|MPI-3.0]], [[versions/v31/sections/io#Extent Callback|MPI-3.1]], [[versions/v40/sections/io#Extent Callback|MPI-4.0]], [[versions/v41/sections/io#Extent Callback|MPI-4.1]], [[versions/v50/sections/io#Extent Callback|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The function `dtype_file_extent_fn` must return, in `file_extent`, the number of bytes required to store `datatype` in the file representation.~~

~~The function is passed, in `extra_state`, the argument that was passed to the [[versions/v30/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call.~~

~~MPI will only call this routine with predefined datatypes~~

~~employed by the user.~~

==The function `dtype_file_extent_fn` must return, in `file_extent`, the number of bytes required to store `datatype` in the file representation. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v30/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call. MPI will only call this routine with predefined datatypes employed by the user.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

==> [!tip] Rationale==

==> This callback does not have a large count variant because it is anticipated that large counts will not be required to represent the `extent` output value.==

==`MPI_Datarep_conversion_function` also supports large count types in separate additional MPI procedures in C (suffixed with the “`_c`”) and multiple abstract interfaces in Fortran when using `USE mpi_f08`.==

==If the extent cannot be represented in `extent`, the callback function shall set `extent` to `MPI_UNDEFINED`. The MPI implementation will then raise an error of class `MPI_ERR_VALUE_TOO_LARGE`.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Extent Callback]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Extent Callback]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Extent Callback]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Extent Callback]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Extent Callback]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Extent Callback]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Extent Callback]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Extent Callback]]
