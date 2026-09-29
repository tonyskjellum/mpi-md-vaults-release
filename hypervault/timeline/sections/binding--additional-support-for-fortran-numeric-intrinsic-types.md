---
title: "Additional Support for Fortran Numeric Intrinsic Types"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Additional Support for Fortran Numeric Intrinsic Types

Chapter **binding** · in [[versions/v20/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-2.0]], [[versions/v21/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-2.1]], [[versions/v22/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-2.2]], [[versions/v30/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-3.0]], [[versions/v31/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-3.1]], [[versions/v40/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-4.0]], [[versions/v41/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-4.1]], [[versions/v50/sections/binding#Additional Support for Fortran Numeric Intrinsic Types|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~MPI-1 provides a small number of named datatypes that correspond to named intrinsic types supported by C and Fortran. These include MPI_INTEGER, MPI_REAL, MPI_INT, MPI_DOUBLE, etc., as well as the optional types MPI_REAL4, MPI_REAL8, etc. There is a one-to-one correspondence between language declarations and MPI types.~~

==MPI==

==provides a small number of named datatypes that correspond to named intrinsic types supported by C and Fortran. These include MPI_INTEGER, MPI_REAL, MPI_INT, MPI_DOUBLE, etc., as well as the optional types MPI_REAL4, MPI_REAL8, etc. There is a one-to-one correspondence between language declarations and MPI types.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

provides a small number of named datatypes that correspond to named intrinsic types supported by C and Fortran. These include ~~MPI_INTEGER, MPI_REAL, MPI_INT, MPI_DOUBLE,~~ ==`MPI_INTEGER`, `MPI_REAL`, `MPI_INT`, `MPI_DOUBLE`,== etc., as well as the optional types ~~MPI_REAL4, MPI_REAL8,~~ ==`MPI_REAL4`, `MPI_REAL8`,== etc. There is a one-to-one correspondence between language declarations and MPI types.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~The routines in this section are part of Extended Fortran Support described in Section [[f90-extended]] .~~

~~MPI~~

~~provides a small number of named datatypes that correspond to named intrinsic types supported by C and Fortran. These include `MPI_INTEGER`, `MPI_REAL`, `MPI_INT`, `MPI_DOUBLE`, etc., as well as the optional types `MPI_REAL4`, `MPI_REAL8`, etc. There is a one-to-one correspondence between language declarations and MPI types.~~

~~Fortran (starting with Fortran 90) provides so-called `KIND`-parameterized types. These types are declared using an intrinsic type (one of `INTEGER`, `REAL`, `COMPLEX`, `LOGICAL` and `CHARACTER`) with an optional integer `KIND` parameter that selects from among one or more variants. The specific meaning of different `KIND` values themselves are implementation dependent and not specified by the language. Fortran provides the `KIND` selection functions `selected_real_kind` for `REAL` and `COMPLEX` types, and `selected_int_kind` for `INTEGER` types that allow users to declare variables with a minimum precision or number of digits. These functions provide a portable way to declare `KIND`-parameterized `REAL`, `COMPLEX` and `INTEGER` variables in Fortran.~~

~~This scheme is backward compatible with Fortran 77. `REAL` and `INTEGER` Fortran variables have a default `KIND` if none is specified. Fortran DOUBLE PRECISION variables are of intrinsic type `REAL` with a non-default `KIND`. The following two declarations are equivalent:~~

==MPI provides a small number of named datatypes that correspond to named intrinsic types supported by C and Fortran. These include `MPI_INTEGER`, `MPI_REAL`, `MPI_INT`, `MPI_DOUBLE`, etc., as well as the optional types `MPI_REAL4`, `MPI_REAL8`, etc. There is a one-to-one correspondence between language declarations and MPI types.==

==Fortran (starting with Fortran 90) provides so-called `KIND`-parameterized types. These types are declared using an intrinsic type (one of `INTEGER`, `REAL`, `COMPLEX`, `LOGICAL`, and `CHARACTER`) with an optional integer `KIND` parameter that selects from among one or more variants. The specific meaning of different `KIND` values themselves are implementation dependent and not specified by the language. Fortran provides the `KIND` selection functions `selected_real_kind` for `REAL` and `COMPLEX` types, and `selected_int_kind` for `INTEGER` types that allow users to declare variables with a minimum precision or number of digits. These functions provide a portable way to declare `KIND`-parameterized `REAL`, `COMPLEX`, and `INTEGER` variables in Fortran. This scheme is backward compatible with Fortran 77. `REAL` and `INTEGER` Fortran variables have a default `KIND` if none is specified. Fortran `DOUBLE PRECISION` variables are of intrinsic type `REAL` with a non-default `KIND`. The following two declarations are equivalent:==

MPI provides two orthogonal methods ~~to communicate using~~ ==for handling communication buffers of== numeric intrinsic types. The first method ==(see the following section)== can be used when variables have been declared in a portable way — using default `KIND` or using `KIND` parameters obtained with the `selected_int_kind` or `selected_real_kind` functions. With this method, MPI automatically selects the correct data size (e.g., 4 or 8 bytes) and provides representation conversion in heterogeneous environments. The second method ==(see “Support for size-specific MPI Datatypes” on page [[versions/v30/sections/binding#Support for Size-specific MPI Datatypes|Support for Size-specific MPI Datatypes]] )== gives the user complete control over communication by exposing machine representations.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Fortran (starting with Fortran 90) provides so-called `KIND`-parameterized types. These types are declared using an intrinsic type (one of `INTEGER`, `REAL`, `COMPLEX`, `LOGICAL`, and `CHARACTER`) with an optional integer `KIND` parameter that selects from among one or more variants. The specific meaning of different `KIND` values themselves are implementation dependent and not specified by the language. Fortran provides the `KIND` selection functions `selected_real_kind` for `REAL` and `COMPLEX` types, and `selected_int_kind` for `INTEGER` types that allow users to declare variables with a minimum precision or number of digits. These functions provide a portable way to declare `KIND`-parameterized `REAL`, `COMPLEX`, and `INTEGER` variables in Fortran. This scheme is backward compatible with Fortran 77. `REAL` and `INTEGER` Fortran variables have a default `KIND` if none is specified. Fortran `DOUBLE PRECISION` variables are of intrinsic type `REAL` with a ~~non-default~~ ==nondefault== `KIND`. The following two declarations are equivalent:

MPI provides two orthogonal methods for handling communication buffers of numeric intrinsic types. The first method (see the following section) can be used when variables have been declared in a portable ~~way — using~~ ==way—using== default `KIND` or using `KIND` parameters obtained with the `selected_int_kind` or `selected_real_kind` functions. With this method, MPI automatically selects the correct data size (e.g., 4 or 8 bytes) and provides representation conversion in heterogeneous environments. The second method (see “Support for size-specific MPI Datatypes” on page [[versions/v40/sections/binding#Support for Size-specific MPI Datatypes|Support for Size-specific MPI Datatypes]] ) gives the user complete control over communication by exposing machine representations.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~        double precision x         real(KIND(0.0d0)) x~~

==(code block added)==
``` fortran
double precision x
real(KIND(0.0d0)) x
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

MPI provides two orthogonal methods for handling communication buffers of numeric intrinsic types. The first method (see the following section) can be used when variables have been declared in a portable way—using default `KIND` or using `KIND` parameters obtained with the `selected_int_kind` or `selected_real_kind` functions. With this method, MPI automatically selects the correct data size (e.g., 4 or 8 bytes) and provides representation conversion in heterogeneous environments. The second method (see ~~“Support for size-specific MPI Datatypes”~~ ==“”== on page [[versions/v50/sections/binding#Support for Size-specific MPI Datatypes|Support for Size-specific MPI Datatypes]] ) gives the user complete control over communication by exposing machine representations.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Additional Support for Fortran Numeric Intrinsic Types]]
