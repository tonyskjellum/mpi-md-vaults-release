---
title: "Transfer of Handles"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Transfer of Handles

Chapter **binding** · in [[versions/v21/sections/binding#Transfer of Handles|MPI-2.1]], [[versions/v22/sections/binding#Transfer of Handles|MPI-2.2]], [[versions/v30/sections/binding#Transfer of Handles|MPI-3.0]], [[versions/v31/sections/binding#Transfer of Handles|MPI-3.1]], [[versions/v40/sections/binding#Transfer of Handles|MPI-4.0]], [[versions/v41/sections/binding#Transfer of Handles|MPI-4.1]], [[versions/v50/sections/binding#Transfer of Handles|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The type definition ~~MPI_Fint~~ ==`MPI_Fint`== is provided in C/C++ for an integer of the size that matches a Fortran `INTEGER`; usually, ~~MPI_Fint~~ ==`MPI_Fint`== will be equivalent to ~~int.~~ ==`int`.==

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~Handles are passed between Fortran and C or C++ by using an explicit C wrapper to convert Fortran handles to C handles. There is no direct access to C or C++ handles in Fortran. Handles are passed between C and C++ using overloaded C++ operators called from C++ code. There is no direct access to C++ objects from C.~~

~~The type definition `MPI_Fint` is provided in C/C++ for an integer of the size that matches a Fortran `INTEGER`; usually, `MPI_Fint` will be equivalent to `int`.~~

~~The following functions are provided in C to convert from a Fortran communicator handle (which is an integer) to a C communicator handle, and vice versa.~~

~~See also Section [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] on page [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] .~~

==Handles are passed between Fortran and C by using an explicit C wrapper to convert Fortran handles to C handles. There is no direct access to C handles in Fortran.==

==The type definition `MPI_Fint` is provided in C for an integer of the size that matches a Fortran `INTEGER`; usually, `MPI_Fint` will be equivalent to `int`.==

==With the Fortran `mpi` module or the `mpif.h` include file, a Fortran handle is a Fortran `INTEGER` value that can be used in the following conversion functions. With the Fortran `mpi_f08` module, a Fortran handle is a `BIND(C)` derived type that contains==

==an `INTEGER` component named `MPI_VAL`. This `INTEGER` value can be used in the following conversion functions.==

==The following functions are provided in C to convert from a Fortran communicator handle (which is an integer) to a C communicator handle, and vice versa. See also Section [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] on page [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] .==

! FORTRAN PROCEDURE SUBROUTINE MPI_TYPE_COMMIT( DATATYPE, IERR) INTEGER ==::== DATATYPE, IERR CALL MPI_X_TYPE_COMMIT(DATATYPE, IERR) RETURN END

> The design here provides a convenient solution for the prevalent case, where a C wrapper is used to allow Fortran code to call a C library, or C code to call a Fortran library. The use of C wrappers is much more likely than the use of Fortran wrappers, because it is much more likely that a variable of type `INTEGER` can be passed to C, than a C handle can be passed to Fortran. > > Returning the converted value as a function value rather than through the argument list allows the generation of efficient inlined code when these functions are simple (e.g., the identity). ~~> >~~ The conversion function in the wrapper does not catch an invalid handle argument. Instead, an invalid handle is passed below to the library function, which, presumably, checks its input arguments.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~The type definition `MPI_Fint` is provided in C for an integer of the size that matches a Fortran `INTEGER`; usually, `MPI_Fint` will be equivalent to `int`.~~

~~With the Fortran `mpi` module or the `mpif.h` include file, a Fortran handle is a Fortran `INTEGER` value that can be used in the following conversion functions. With the Fortran `mpi_f08` module, a Fortran handle is a `BIND(C)` derived type that contains~~

==The type definition `MPI_Fint` is provided in C for an integer of the size that matches a Fortran `INTEGER`; usually, `MPI_Fint` will be equivalent to `int`. With the Fortran `mpi` module or the `mpif.h` include file, a Fortran handle is a Fortran `INTEGER` value that can be used in the following conversion functions. With the Fortran `mpi_f08` module, a Fortran handle is a `BIND(C)` derived type that contains==

The following functions are provided in C to convert from a Fortran communicator handle (which is an integer) to a C communicator handle, and vice versa. See also ~~Section [[versions/v31/sections/terms#Functions and Macros|Functions and Macros]] on page~~ [[versions/v31/sections/terms#Functions and Macros|Functions and Macros]] .

The same approach can be used for all other MPI functions. The call to ~~`MPI_xxx_f2c`~~ ==`MPI_XXX_f2c`== (resp. ~~`MPI_xxx_c2f`)~~ ==`MPI_XXX_c2f`)== can be omitted when the handle is an OUT (resp. IN) argument, rather than INOUT.

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

~~The type definition `MPI_Fint` is provided in C for an integer of the size that matches a Fortran `INTEGER`; usually, `MPI_Fint` will be equivalent to `int`. With the Fortran `mpi` module or the `mpif.h` include file, a Fortran handle is a Fortran `INTEGER` value that can be used in the following conversion functions. With the Fortran `mpi_f08` module, a Fortran handle is a `BIND(C)` derived type that contains~~

~~an `INTEGER` component named `MPI_VAL`. This `INTEGER` value can be used in the following conversion functions.~~

==The type definition `MPI_Fint` is provided in C for an integer of the size that matches a Fortran `INTEGER`; usually, `MPI_Fint` will be equivalent to `int`. With the Fortran `mpi` module or the `mpif.h` include file, a Fortran handle is a Fortran `INTEGER` value that can be used in the following conversion functions. With the Fortran `mpi_f08` module, a Fortran handle is a `BIND(C)` derived type that contains an `INTEGER` component named `MPI_VAL`. This `INTEGER` value can be used in the following conversion functions.==

If `comm` is a valid Fortran handle to a communicator, then `MPI_Comm_f2c` returns a valid C handle to that same communicator; if ~~`comm = MPI_COMM_NULL`~~ ==`comm``=``MPI_COMM_NULL`== (Fortran value), then `MPI_Comm_f2c` returns a null C handle; if `comm` is an invalid Fortran handle, then `MPI_Comm_f2c` returns an invalid C handle.

! FORTRAN PROCEDURE SUBROUTINE ~~MPI_TYPE_COMMIT( DATATYPE,~~ ==MPI_TYPE_COMMIT(DATATYPE,== IERR) INTEGER :: DATATYPE, IERR CALL MPI_X_TYPE_COMMIT(DATATYPE, IERR) RETURN END

void ~~MPI_X_TYPE_COMMIT( MPI_Fint~~ ==MPI_X_TYPE_COMMIT(MPI_Fint== *f_handle, MPI_Fint *ierr) { MPI_Datatype datatype;

datatype = ~~MPI_Type_f2c( *f_handle);~~ ==MPI_Type_f2c(*f_handle);== *ierr = ~~(MPI_Fint)MPI_Type_commit( &datatype);~~ ==(MPI_Fint)MPI_Type_commit(&datatype);== *f_handle = MPI_Type_c2f(datatype); return; }

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

The type definition `MPI_Fint` is provided in C for an integer of the size that matches a Fortran `INTEGER`; usually, `MPI_Fint` will be equivalent to `int`. With the Fortran `mpi` module or the ==(deprecated)== `mpif.h` include file, a Fortran handle is a Fortran `INTEGER` value that can be used in the following conversion functions. With the Fortran `mpi_f08` module, a Fortran handle is a `BIND(C)` derived type that contains an `INTEGER` component named `MPI_VAL`. This `INTEGER` value can be used in the following conversion functions.

The following functions are provided in C to convert from a Fortran communicator handle (which is an integer) to a C communicator handle, and vice versa. ~~See also [[versions/v41/sections/terms#Functions and Macros|Functions and Macros]] .~~

~~    ! FORTRAN PROCEDURE     SUBROUTINE MPI_TYPE_COMMIT(DATATYPE, IERR)     INTEGER :: DATATYPE, IERR     CALL MPI_X_TYPE_COMMIT(DATATYPE, IERR)     RETURN     END~~

~~    /* C wrapper */~~

~~    void MPI_X_TYPE_COMMIT(MPI_Fint *f_handle, MPI_Fint *ierr)     {        MPI_Datatype datatype;~~

~~       datatype = MPI_Type_f2c(*f_handle);        *ierr = (MPI_Fint)MPI_Type_commit(&datatype);        *f_handle = MPI_Type_c2f(datatype);        return;     }~~

==(code block added)==
``` [MPI]Fortran
! FORTRAN PROCEDURE
SUBROUTINE MPI_TYPE_COMMIT(DATATYPE, IERR)
INTEGER :: DATATYPE, IERR
CALL MPI_X_TYPE_COMMIT(DATATYPE, IERR)
RETURN
END
```

==(code block added)==
``` [MPI]C
/* C wrapper */

void MPI_X_TYPE_COMMIT(MPI_Fint *f_handle, MPI_Fint *ierr)
{
   MPI_Datatype datatype;

   datatype = MPI_Type_f2c(*f_handle);
   *ierr = (MPI_Fint)MPI_Type_commit(&datatype);
   *f_handle = MPI_Type_c2f(datatype);
   return;
}
```

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Transfer of Handles]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Transfer of Handles]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Transfer of Handles]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Transfer of Handles]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Transfer of Handles]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Transfer of Handles]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Transfer of Handles]]
