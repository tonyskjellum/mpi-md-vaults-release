---
title: "Special Constants"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Special Constants

Chapter **binding** · in [[versions/v20/sections/binding#Special Constants|MPI-2.0]], [[versions/v21/sections/binding#Special Constants|MPI-2.1]], [[versions/v22/sections/binding#Special Constants|MPI-2.2]], [[versions/v30/sections/binding#Special Constants|MPI-3.0]], [[versions/v31/sections/binding#Special Constants|MPI-3.1]], [[versions/v40/sections/binding#Special Constants|MPI-4.0]], [[versions/v41/sections/binding#Special Constants|MPI-4.1]], [[versions/v50/sections/binding#Special Constants|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~MPI requires a number of special “constants” that cannot be implemented as normal Fortran constants, including MPI_BOTTOM, MPI_STATUS_IGNORE, MPI_IN_PLACE, MPI_STATUSES_IGNORE and MPI_ERRCODES_IGNORE. In C, these are implemented as constant pointers, usually as `NULL` and are used where the function prototype calls for a pointer to a variable, not the variable itself.~~

==MPI requires a number of special “constants” that cannot be implemented as normal Fortran constants, e.g., `MPI_BOTTOM`. The complete list can be found in Section [[versions/v22/sections/terms#Named Constants|Named Constants]] on page [[versions/v22/sections/terms#Named Constants|Named Constants]] .==

==In C, these are implemented as constant pointers, usually as `NULL` and are used where the function prototype calls for a pointer to a variable, not the variable itself.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~MPI requires a number of special “constants” that cannot be implemented as normal Fortran constants, e.g., `MPI_BOTTOM`. The complete list can be found in Section [[versions/v30/sections/terms#Named Constants|Named Constants]] on page [[versions/v30/sections/terms#Named Constants|Named Constants]] .~~

~~In C, these are implemented as constant pointers, usually as `NULL` and are used where the function prototype calls for a pointer to a variable, not the variable itself.~~

~~In Fortran the implementation of these special constants may require the use of language constructs that are outside the Fortran standard. Using special values for the constants (e.g., by defining them through `parameter` statements) is not possible because an implementation cannot distinguish these values from legal data. Typically these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, this address can be extracted by some mechanism outside the Fortran standard (e.g., by Fortran extensions or by implementing the function in C).~~

==MPI requires a number of special “constants” that cannot be implemented as normal Fortran constants, e.g., `MPI_BOTTOM`. The complete list can be found in Section [[versions/v30/sections/terms#Named Constants|Named Constants]] on page [[versions/v30/sections/terms#Named Constants|Named Constants]] . In C, these are implemented as constant pointers, usually as `NULL` and are used where the function prototype calls for a pointer to a variable, not the variable itself.==

==In Fortran,==

==using==

==special values for the constants (e.g., by defining them through `parameter` statements) is not possible because an implementation cannot distinguish these values from valid data. Typically these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, the address of the actual choice buffer argument can be compared with the address of such a predefined static variable.==

==These special constants also cause an exception with the usage of Fortran `INTENT`: with `USE` `mpi_f08`, the attributes `INTENT(IN)`, `INTENT(OUT)`, and `INTENT(INOUT)` are used in the Fortran interface. In most cases, `INTENT(IN)` is used if the C interface uses call-by-value. For all buffer arguments and for dummy arguments that may be modified and allow one of these special constants as input, an `INTENT` is not specified.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~MPI requires a number of special “constants” that cannot be implemented as normal Fortran constants, e.g., `MPI_BOTTOM`. The complete list can be found in Section [[versions/v31/sections/terms#Named Constants|Named Constants]] on page [[versions/v31/sections/terms#Named Constants|Named Constants]] . In C, these are implemented as constant pointers, usually as `NULL` and are used where the function prototype calls for a pointer to a variable, not the variable itself.~~

~~In Fortran,~~

~~using~~

~~special values for the constants (e.g., by defining them through `parameter` statements) is not possible because an implementation cannot distinguish these values from valid data. Typically these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, the address of the actual choice buffer argument can be compared with the address of such a predefined static variable.~~

==MPI requires a number of special “constants” that cannot be implemented as normal Fortran constants, e.g., `MPI_BOTTOM`. The complete list can be found in [[versions/v31/sections/terms#Named Constants|Named Constants]] . In C, these are implemented as constant pointers, usually as `NULL` and are used where the function prototype calls for a pointer to a variable, not the variable itself.==

==In Fortran, using special values for the constants (e.g., by defining them through `parameter` statements) is not possible because an implementation cannot distinguish these values from valid data. Typically these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, the address of the actual choice buffer argument can be compared with the address of such a predefined static variable.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Special Constants]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Special Constants]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Special Constants]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Special Constants]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Special Constants]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Special Constants]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Special Constants]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Special Constants]]
