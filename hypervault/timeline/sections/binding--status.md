---
title: "Status"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Status

Chapter **binding** · in [[versions/v21/sections/binding#Status|MPI-2.1]], [[versions/v22/sections/binding#Status|MPI-2.2]], [[versions/v30/sections/binding#Status|MPI-3.0]], [[versions/v31/sections/binding#Status|MPI-3.1]], [[versions/v40/sections/binding#Status|MPI-4.0]], [[versions/v41/sections/binding#Status|MPI-4.1]], [[versions/v50/sections/binding#Status|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

If `f_status` is a valid Fortran status, but not the Fortran value of ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== or ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== then `MPI_Status_f2c` returns in `c_status` a valid C status with the same content. If `f_status` is the Fortran value of ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== or ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== or if `f_status` is not a valid Fortran status, then the call is erroneous.

Two global variables of type `MPI_Fint*`, ~~MPI_F_STATUS_IGNORE~~ ==`MPI_F_STATUS_IGNORE`== and ~~MPI_F_STATUSES_IGNORE~~ ==`MPI_F_STATUSES_IGNORE`== are declared in mpi.h. They can be used to test, in C, whether `f_status` is the Fortran value of ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== or ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== respectively. These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[versions/v22/API/MPI_INIT|MPI_INIT]] and [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] and should not be changed by user code.

This call converts a C status into a Fortran status, and has a behavior similar to `MPI_Status_f2c`. That is, the value of `c_status` must not be either ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== or ~~MPI_STATUSES_IGNORE.~~ ==`MPI_STATUSES_IGNORE`.==

> The handling of ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== is required in order to layer libraries with only a C wrapper: if the Fortran call has passed ~~MPI_STATUS_IGNORE,~~ ==`MPI_STATUS_IGNORE`,== then the C wrapper must handle this correctly. Note that this constant need not have the same value in Fortran and C. If `MPI_Status_f2c` were to handle ~~MPI_STATUS_IGNORE,~~ ==`MPI_STATUS_IGNORE`,== then the type of its result would have to be `MPI_Status**`, which was considered an inferior solution.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~The following two procedures are provided in C to convert from a Fortran status (which is an array of integers) to a C status (which is a structure), and vice versa.~~

~~The conversion occurs on all the information in status, including that which is hidden. That is, no status information is lost in the conversion.~~

==The following two procedures are provided in C to convert from a Fortran (with the `mpi` module or `mpif.h`) status (which is an array of integers) to a C status (which is a structure), and vice versa. The conversion occurs on all the information in status, including that which is hidden. That is, no status information is lost in the conversion.==

Two global variables of type `MPI_Fint*`, `MPI_F_STATUS_IGNORE` and `MPI_F_STATUSES_IGNORE` are declared in mpi.h. They can be used to test, in C, whether `f_status` is the Fortran value of `MPI_STATUS_IGNORE` or ~~`MPI_STATUSES_IGNORE`, respectively.~~ ==`MPI_STATUSES_IGNORE` defined in the `mpi` module or `mpif.h`.== These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[versions/v30/API/MPI_INIT|MPI_INIT]] and [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] and should not be changed by user code.

> There ~~is not a~~ ==exists no== separate conversion function for arrays of statuses, since one can simply loop through the array, converting each ~~status.~~ ==status with the routines in Fig. [[versions/v30/sections/binding#Status|Status]] on page [[versions/v30/sections/binding#Status|Status]] .==

==Using the `mpi_f08` Fortran module, a status is declared as `TYPE(MPI_Status)`. The C type `MPI_F08_status` can be used to pass a Fortran `TYPE(MPI_Status)` argument into a C routine. Figure [[versions/v30/sections/binding#Status|Status]] illustrates all status conversion routines. Some are only available in C, some in both C and Fortran.==

==*Figure: Status conversion routines*==

==This C routine converts a Fortran `mpi_f08` `TYPE(MPI_Status)` into a C `MPI_Status`.==

==This C routine converts a C `MPI_Status` into a Fortran `mpi_f08` `TYPE(MPI_Status)`. Two global variables of type `MPI_F08_status*`, `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` are declared in mpi.h. They can be used to test, in C, whether `f_status` is the Fortran value of `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` defined in the `mpi_f08` module. These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[versions/v30/API/MPI_INIT|MPI_INIT]] and [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] and should not be changed by user code.==

==Conversion between the two Fortran versions of a status can be done with:==

==![[versions/v30/API/MPI_STATUS_F2F08]]==

==This routine converts a Fortran `INTEGER`, `DIMENSION(MPI_STATUS_SIZE)` status array into a Fortran `mpi_f08` `TYPE(MPI_Status)`.==

==![[versions/v30/API/MPI_STATUS_F082F]]==

==This routine converts a Fortran `mpi_f08` `TYPE(MPI_Status)` into a Fortran `INTEGER`, `DIMENSION(MPI_STATUS_SIZE)` status array.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> There exists no separate conversion function for arrays of statuses, since one can simply loop through the array, converting each status with the routines in ~~Fig. [[versions/v31/sections/binding#Status|Status]] on page [[versions/v31/sections/binding#Status|Status]] .~~ ==[[Figure]] fig:fortran:status-conversion-triangle.==

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

== In C, such an `f_status` array can be defined with `MPI_Fint f_status[``MPI_F_STATUS_SIZE``]`. Within this array, one can use in C the indexes `MPI_F_SOURCE`, `MPI_F_TAG`, and `MPI_F_ERROR`, to access the same elements as in Fortran with `MPI_SOURCE`, `MPI_TAG` and `MPI_ERROR`. The C indexes are 1 less than the corresponding indexes in Fortran due to the different default array start indexes in both languages.==

Two global variables of type `MPI_Fint*`, `MPI_F_STATUS_IGNORE` and `MPI_F_STATUSES_IGNORE` are declared in ~~mpi.h.~~ ==`mpi.h`.== They can be used to test, in C, whether `f_status` is the Fortran value of `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` defined in the `mpi` module or `mpif.h`. These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[versions/v40/API/MPI_INIT|MPI_INIT]] and [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] and should not be changed by user code.

Using the `mpi_f08` Fortran module, a status is declared as `TYPE(MPI_Status)`. The C type `MPI_F08_status` can be used to pass a Fortran `TYPE(MPI_Status)` argument into a C routine. Figure [[versions/v40/sections/binding#Status|Status]] illustrates all status conversion routines. Some are only available in C, some in both C and ~~Fortran.~~ ==the Fortran `mpi` and `mpi_f08` interfaces (but not in the `mpif.h` interface).==

This C routine converts a C `MPI_Status` into a Fortran `mpi_f08` `TYPE(MPI_Status)`. Two global variables of type `MPI_F08_status*`, `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` are declared in ~~mpi.h.~~ ==`mpi.h`.== They can be used to test, in C, whether `f_status` is the Fortran value of `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` defined in the `mpi_f08` module. These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[versions/v40/API/MPI_INIT|MPI_INIT]] and [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] and should not be changed by user code.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

The following two procedures are provided in C to convert from a Fortran (with the `mpi` module or ==deprecated== `mpif.h`) status (which is an array of integers) to a C status (which is a structure), and vice versa. The conversion occurs on all the information in status, including that which is hidden. That is, no status information is lost in the conversion.

Two global variables of type `MPI_Fint*`, `MPI_F_STATUS_IGNORE` and `MPI_F_STATUSES_IGNORE` are declared in `mpi.h`. They can be used to test, in C, whether `f_status` is the Fortran value of `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` defined in the `mpi` module or ==(deprecated)== `mpif.h`. These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[versions/v41/API/MPI_INIT|MPI_INIT]] and [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] and should not be changed by user code.

Using the `mpi_f08` Fortran module, a status is declared as `TYPE(MPI_Status)`. The C type `MPI_F08_status` can be used to pass a Fortran `TYPE(MPI_Status)` argument into a C routine. Figure [[versions/v41/sections/binding#Status|Status]] illustrates all status conversion routines. Some are only available in C, some in both C and the Fortran `mpi` and `mpi_f08` interfaces (but not in the ==deprecated== `mpif.h` ~~interface).~~ ==include file).==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

Two global variables of type `MPI_Fint*`, `MPI_F_STATUS_IGNORE` and ~~`MPI_F_STATUSES_IGNORE`~~ ==`MPI_F_STATUSES_IGNORE`,== are declared in `mpi.h`. They can be used to test, in C, whether `f_status` is the Fortran value of `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` defined in the `mpi` module or (deprecated) `mpif.h`. These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[versions/v50/API/MPI_INIT|MPI_INIT]] and [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] and should not be changed by user code.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Status]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Status]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Status]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Status]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Status]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Status]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Status]]
