---
title: "Support for Size-specific MPI Datatypes"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Support for Size-specific MPI Datatypes

Chapter **binding** · in [[versions/v20/sections/binding#Support for Size-specific MPI Datatypes|MPI-2.0]], [[versions/v21/sections/binding#Support for Size-specific MPI Datatypes|MPI-2.1]], [[versions/v22/sections/binding#Support for Size-specific MPI Datatypes|MPI-2.2]], [[versions/v30/sections/binding#Support for Size-specific MPI Datatypes|MPI-3.0]], [[versions/v31/sections/binding#Support for Size-specific MPI Datatypes|MPI-3.1]], [[versions/v40/sections/binding#Support for Size-specific MPI Datatypes|MPI-4.0]], [[versions/v41/sections/binding#Support for Size-specific MPI Datatypes|MPI-4.1]], [[versions/v50/sections/binding#Support for Size-specific MPI Datatypes|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

~~MPI-1 provides named datatypes corresponding to optional Fortran 77 numeric types that contain explicit byte lengths — MPI_REAL4, MPI_INTEGER8, etc. This section describes a mechanism that generalizes this model to support all Fortran numeric intrinsic types.~~

==MPI==

==provides named datatypes corresponding to optional Fortran 77 numeric types that contain explicit byte lengths — MPI_REAL4, MPI_INTEGER8, etc. This section describes a mechanism that generalizes this model to support all Fortran numeric intrinsic types.==

~~In MPI-1 these datatypes are all optional and correspond to the optional, nonstandard declarations supported by many Fortran compilers. In MPI-2, one datatype is required for each representation supported by the compiler. To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, always create a variable whose representation is of size **n**. All these datatypes are predefined.~~

==One==

==datatype is required for each representation supported by the compiler. To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, always create a variable whose representation is of size **n**. All these datatypes are predefined.==

> This function could be implemented as a series of tests. > > int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *rtype) > { > switch(typeclass) { > case MPI_TYPECLASS_REAL: switch(size) { > case 4: *rtype = MPI_REAL4; return MPI_SUCCESS; > case 8: *rtype = MPI_REAL8; return MPI_SUCCESS; > default: error(...); > } > case MPI_TYPECLASS_INTEGER: switch(size) { > case 4: *rtype = MPI_INTEGER4; return MPI_SUCCESS; > case 8: *rtype = MPI_INTEGER8; return MPI_SUCCESS; > default: error(...); } > ... ~~etc~~ ==etc.== ... > } > }

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

provides named datatypes corresponding to optional Fortran 77 numeric types that contain explicit byte lengths — ~~MPI_REAL4, MPI_INTEGER8,~~ ==`MPI_REAL4`, `MPI_INTEGER8`,== etc. This section describes a mechanism that generalizes this model to support all Fortran numeric intrinsic types.

`typeclass` is one of ~~MPI_TYPECLASS_REAL, MPI_TYPECLASS_INTEGER~~ ==`MPI_TYPECLASS_REAL`, `MPI_TYPECLASS_INTEGER`== and ~~MPI_TYPECLASS_COMPLEX,~~ ==`MPI_TYPECLASS_COMPLEX`,== corresponding to the desired **typeclass**. The function returns an MPI datatype matching a local variable of type (**typeclass**, **size**).

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~MPI~~

~~provides named datatypes corresponding to optional Fortran 77 numeric types that contain explicit byte lengths — `MPI_REAL4`, `MPI_INTEGER8`, etc. This section describes a mechanism that generalizes this model to support all Fortran numeric intrinsic types.~~

~~We assume that for each **typeclass** (integer, real, complex) and each word size there is a unique machine representation. For every pair (**typeclass**, **n**) supported by a compiler, MPI must provide a named size-specific datatype. The name of this datatype is of the form `MPI_`$`<`$`TYPE`$`>`$`n` in C and Fortran and of the form `MPI::`$`<`$`TYPE`$`>`$`n` in C++ where $`<`$`TYPE`$`>`$ is one of `REAL`, `INTEGER` and `COMPLEX`, and **n** is the length in bytes of the machine representation. This datatype locally matches all variables of type (**typeclass**, **n**). The list of names for such types includes:~~

==MPI provides named datatypes corresponding to optional Fortran 77 numeric types that contain explicit byte lengths — `MPI_REAL4`, `MPI_INTEGER8`, etc. This section describes a mechanism that generalizes this model to support all Fortran numeric intrinsic types.==

==We assume that for each **typeclass** (integer, real, complex) and each word size there is a unique machine representation. For every pair (**typeclass**, **n**) supported by a compiler, MPI must provide a named size-specific datatype. The name of this datatype is of the form `MPI_`$`<`$`TYPE`$`>`$`n` in C and Fortran where $`<`$`TYPE`$`>`$ is one of `REAL`, `INTEGER` and `COMPLEX`, and **n** is the length in bytes of the machine representation. This datatype locally matches all variables of type (**typeclass**, **n**). The list of names for such types includes:==

~~One~~

~~datatype is required for each representation supported by the compiler. To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, always create a variable whose representation is of size **n**. All these datatypes are predefined.~~

==One datatype is required for each representation supported by the compiler. To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, always create a variable whose representation is of size **n**.==

==These datatypes may also be used for variables declared with `KIND=INT8/16/32/64` or `KIND=REAL32/64/128`, which are defined in the `ISO_FORTRAN_ENV` intrinsic module. Note that the MPI datatypes and the `REAL*n`, `INTEGER*n` declarations count bytes whereas the Fortran `KIND` values count bits.==

==All these datatypes are predefined.==

> This function is similar to the C ~~and C++~~ *sizeof* operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.

~~This function returns a reference (handle) to one of the predefined named datatypes, not a duplicate. This type cannot be freed.~~

~~[[versions/v30/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] can be used to obtain a size-specific type that matches a Fortran numeric intrinsic type by first calling [[versions/v30/API/MPI_SIZEOF|MPI_SIZEOF]] in order to compute the variable size, and then calling [[versions/v30/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] to find a suitable datatype.~~

~~In C and C++, one can use the C function [[sizeof]] , instead of [[versions/v30/API/MPI_SIZEOF|MPI_SIZEOF]] . In addition, for variables of default kind the variable’s size can be computed by a call to [[versions/v30/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] , if the `typeclass` is known. It is erroneous to specify a size not supported by the compiler.~~

==This function returns a reference (handle) to one of the predefined named datatypes, not a duplicate. This type cannot be freed. [[versions/v30/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] can be used to obtain a size-specific type that matches a Fortran numeric intrinsic type by first calling [[versions/v30/API/MPI_SIZEOF|MPI_SIZEOF]] in order to compute the variable size, and then calling [[versions/v30/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] to find a suitable datatype. In C, one can use the C function [[sizeof]] , instead of [[versions/v30/API/MPI_SIZEOF|MPI_SIZEOF]] . In addition, for variables of default kind the variable’s size can be computed by a call to [[versions/v30/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] , if the `typeclass` is known. It is erroneous to specify a size not supported by the compiler.==

> This function could be implemented as a series of tests. > > int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *rtype) > { > switch(typeclass) { > case MPI_TYPECLASS_REAL: switch(size) { > case 4: *rtype = MPI_REAL4; return MPI_SUCCESS; > case 8: *rtype = MPI_REAL8; return MPI_SUCCESS; > default: error(...); > } > case MPI_TYPECLASS_INTEGER: switch(size) { > case 4: *rtype = MPI_INTEGER4; return MPI_SUCCESS; > case 8: *rtype = MPI_INTEGER8; return MPI_SUCCESS; > default: error(...); ==>== } > ... etc. ... > } > ==> return MPI_SUCCESS; >== }

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

We assume that for each **typeclass** (integer, real, complex) and each word size there is a unique machine representation. For every pair (**typeclass**, **n**) supported by a compiler, MPI must provide a named size-specific datatype. The name of this datatype is of the form `MPI_`$`<`$`TYPE`$`>`$`n` in C and Fortran where $`<`$`TYPE`$`>`$ is one of `REAL`, `INTEGER` and `COMPLEX`, and **n** is the length in bytes of the machine representation. This datatype locally matches all variables of type (**typeclass**, ~~**n**).~~ ==**n**) in Fortran.== The list of names for such types includes:

~~One datatype is required for each representation supported by the compiler. To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, always create a variable whose representation is of size **n**.~~

~~These datatypes may also be used for variables declared with `KIND=INT8/16/32/64` or `KIND=REAL32/64/128`, which are defined in the `ISO_FORTRAN_ENV` intrinsic module. Note that the MPI datatypes and the `REAL*n`, `INTEGER*n` declarations count bytes whereas the Fortran `KIND` values count bits.~~

~~All these datatypes are predefined.~~

==One datatype is required for each representation supported by the Fortran compiler.==

==> [!tip] Rationale==

==> Particularly for the longer floating-point types, C and Fortran may use different representations. For example, a Fortran compiler may define a 16-byte `REAL` type with 33 decimal digits of precision while a C compiler may define a 16-byte `long double` type that implements an 80-bit (10 byte) extended precision floating point value. Both of these types are 16 bytes long, but they are not interoperable. Thus, these types are defined by Fortran, even though C may define types of the same length.==

==To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, always create a variable whose representation is of size **n**. These datatypes may also be used for variables declared with `KIND=INT8/16/32/64` or `KIND=REAL32/64/128`, which are defined in the `ISO_FORTRAN_ENV` intrinsic module. Note that the MPI datatypes and the `REAL*n`, `INTEGER*n` declarations count bytes whereas the Fortran `KIND` values count bits. All these datatypes are predefined.==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

MPI provides named datatypes corresponding to optional Fortran 77 numeric types that contain explicit byte ~~lengths — `MPI_REAL4`,~~ ==lengths—`MPI_REAL4`,== `MPI_INTEGER8`, etc. This section describes a mechanism that generalizes this model to support all Fortran numeric intrinsic types.

MPI_REAL4 MPI_REAL8 MPI_REAL16 MPI_COMPLEX8 MPI_COMPLEX16 MPI_COMPLEX32 MPI_INTEGER1 MPI_INTEGER2 MPI_INTEGER4 MPI_INTEGER8 MPI_INTEGER16

~~The following functions allow a user to obtain a size-specific MPI datatype for any intrinsic Fortran type.~~

~~![[versions/v40/API/MPI_SIZEOF]]~~

~~This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.~~

~~> [!note] Advice to users~~

~~> This function is similar to the C *sizeof* operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.~~

~~> [!tip] Rationale~~

~~> This function is not available in other languages because it would not be useful.~~

==The following function allows a user to obtain a size-specific MPI datatype for any intrinsic Fortran type.==

This function returns a reference (handle) to one of the predefined named datatypes, not a duplicate. This type cannot be freed. [[versions/v40/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] can be used to obtain a size-specific type that matches a Fortran numeric intrinsic type by first calling ~~[[versions/v40/API/MPI_SIZEOF|MPI_SIZEOF]]~~ ==`storage_size()`== in order to compute the variable ~~size,~~ ==size in bits, dividing it by eight,== and then calling [[versions/v40/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] to find a suitable datatype. In C, one can use the C function ~~[[sizeof]] ,~~ ==`sizeof()` (which returns the size in bytes)== instead of ~~[[versions/v40/API/MPI_SIZEOF|MPI_SIZEOF]] .~~ ==`storage_size()` (which returns the size in bits).== In addition, for variables of default kind the variable’s size can be computed by a call to [[versions/v40/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] , if the `typeclass` is known. It is erroneous to specify a size not supported by the compiler.

> This function could be implemented as a series of tests. > > int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *rtype) > { > switch(typeclass) { > case MPI_TYPECLASS_REAL: switch(size) { > case 4: *rtype = MPI_REAL4; return MPI_SUCCESS; > case 8: *rtype = MPI_REAL8; return MPI_SUCCESS; > default: error(...); > } > case MPI_TYPECLASS_INTEGER: switch(size) { > case 4: *rtype = MPI_INTEGER4; return MPI_SUCCESS; > case 8: *rtype = MPI_INTEGER8; return MPI_SUCCESS; > default: error(...); > } > ... etc. ... > } > > return MPI_SUCCESS; > }

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

We assume that for each **typeclass** (integer, real, complex) and each word size ==**n**== there is a unique machine representation. For every pair (**typeclass**, **n**) supported by a compiler, MPI must provide a named size-specific datatype. The name of this datatype is of the form ~~`MPI_`$`<`$`TYPE`$`>`$`n`~~ ==`MPI_`$`<`$`TYPECLASS`$`><`$**`n`**$`>`$== in C and Fortran where ~~$`<`$`TYPE`$`>`$~~ ==$`<`$`TYPECLASS`$`>`$== is one of `REAL`, ~~`INTEGER` and~~ ==`INTEGER`, or== `COMPLEX`, and ~~**n**~~ ==$`<`$**`n`**$`>`$== is the length in bytes of the machine representation. This datatype locally matches all variables of type (**typeclass**, **n**) in Fortran. The list of names for such types includes:

This function returns a reference (handle) to one of the predefined named datatypes, not a duplicate. This type cannot be freed. [[versions/v41/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] can be used to obtain a size-specific type that matches a Fortran numeric intrinsic type by first calling `storage_size()` in order to compute the variable size in bits, dividing it by eight, and then calling [[versions/v41/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] to find a suitable datatype. In C, one can use the C ~~function~~ ==operator== `sizeof()` (which returns the size in bytes) instead of `storage_size()` (which returns the size in bits). In addition, for variables of default kind the variable’s size can be computed by a call to [[versions/v41/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] , if the `typeclass` is known. It is erroneous to specify a size not supported by the compiler.

> This function could be implemented as a series of tests. > ==> > > Example of an implementation of [[versions/v41/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] . > > [language={[MPI]C},basicstyle=]== > int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *rtype) > { > switch(typeclass) { > case MPI_TYPECLASS_REAL: switch(size) { > case 4: *rtype = MPI_REAL4; return MPI_SUCCESS; > case 8: *rtype = MPI_REAL8; return MPI_SUCCESS; > default: error(...); > } > case MPI_TYPECLASS_INTEGER: switch(size) { > case 4: *rtype = MPI_INTEGER4; return MPI_SUCCESS; > case 8: *rtype = MPI_INTEGER8; return MPI_SUCCESS; > default: error(...); > } > ... etc. ... > } > > return MPI_SUCCESS; > } ==> >==

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~MPI_REAL4 MPI_REAL8 MPI_REAL16 MPI_COMPLEX8 MPI_COMPLEX16 MPI_COMPLEX32 MPI_INTEGER1 MPI_INTEGER2 MPI_INTEGER4 MPI_INTEGER8 MPI_INTEGER16~~ ==`MPI_REAL4` `MPI_REAL8` `MPI_REAL16` `MPI_COMPLEX8` `MPI_COMPLEX16` `MPI_COMPLEX32` `MPI_INTEGER1` `MPI_INTEGER2` `MPI_INTEGER4` `MPI_INTEGER8` `MPI_INTEGER16` `MPI_LOGICAL1` `MPI_LOGICAL2` `MPI_LOGICAL4` `MPI_LOGICAL8` `MPI_LOGICAL16`==

To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, ==`LOGICAL*n`,== always create a variable whose representation is of size **n**. These datatypes may also be used for variables declared with `KIND=INT8/16/32/64` or `KIND=REAL32/64/128`, which are defined in the `ISO_FORTRAN_ENV` intrinsic module. Note that the MPI datatypes and the `REAL*n`, `INTEGER*n` ==`LOGICAL*n`== declarations count bytes whereas the Fortran `KIND` values count bits. All these datatypes are predefined.

~~`typeclass` is one of `MPI_TYPECLASS_REAL`, `MPI_TYPECLASS_INTEGER` and `MPI_TYPECLASS_COMPLEX`, corresponding to the desired **typeclass**. The function returns an MPI datatype matching a local variable of type (**typeclass**, **size**).~~

==`typeclass` is one of `MPI_TYPECLASS_REAL`, `MPI_TYPECLASS_INTEGER`, and==

==`MPI_TYPECLASS_COMPLEX`, corresponding to the desired **typeclass**. The function returns an MPI datatype matching a local variable of type (**typeclass**, **size**).==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Support for Size-specific MPI Datatypes]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Support for Size-specific MPI Datatypes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Support for Size-specific MPI Datatypes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Support for Size-specific MPI Datatypes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Support for Size-specific MPI Datatypes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Support for Size-specific MPI Datatypes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Support for Size-specific MPI Datatypes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Support for Size-specific MPI Datatypes]]
