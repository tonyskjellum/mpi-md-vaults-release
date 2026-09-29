---
title: "Fortran Binding Issues"
chapter: terms
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Fortran Binding Issues

Chapter **terms** · in [[versions/v20/sections/terms#Fortran Binding Issues|MPI-2.0]], [[versions/v21/sections/terms#Fortran Binding Issues|MPI-2.1]], [[versions/v22/sections/terms#Fortran Binding Issues|MPI-2.2]], [[versions/v30/sections/terms#Fortran Binding Issues|MPI-3.0]], [[versions/v31/sections/terms#Fortran Binding Issues|MPI-3.1]], [[versions/v40/sections/terms#Fortran Binding Issues|MPI-4.0]], [[versions/v41/sections/terms#Fortran Binding Issues|MPI-4.1]], [[versions/v50/sections/terms#Fortran Binding Issues|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~All MPI names have an `MPI_` prefix, and all characters are capitals. Programs must not declare variables or functions with names beginning with the prefix, `MPI_`. This is mandated to avoid possible name collisions.~~

~~All MPI Fortran subroutines have a return code in the last argument. A few MPI operations are functions, which do not have the return code argument. The return code value for successful completion is MPI_SUCCESS. Other error codes are implementation dependent; see Chapter [[versions/v21/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] .~~

==Originally,==

==MPI-1.1==

==provided bindings for Fortran 77.==

==These bindings are retained,==

==but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below.==

==When the term Fortran is used it means Fortran 90.==

==All MPI names have an `MPI_` prefix, and all characters are capitals. Programs must not declare variables, parameters, or functions with names beginning with the prefix `MPI_`. To avoid conflicting with the profiling interface, programs should also avoid functions with the prefix `PMPI_`. This is mandated to avoid possible name collisions.==

==All MPI Fortran subroutines have a return code in the last argument. A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is MPI_SUCCESS. Other error codes are implementation dependent; see the error codes in==

==Chapter [[versions/v21/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[versions/v21/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .==

==Constants representing the maximum length of a string are one smaller in Fortran than in C and C++ as discussed in Section [[versions/v21/sections/binding#Constants|Constants]] .==

~~Unless explicitly stated, the MPI F77 binding is consistent with ANSI standard Fortran 77. There are several points where this standard diverges from the ANSI Fortran 77 standard. These exceptions are consistent with common practice in the Fortran community. In particular:~~

~~- MPI identifiers are limited to thirty, not six, significant characters.~~

==The MPI Fortran binding is inconsistent with the Fortran 90 standard in several respects. These==

==inconsistencies, such as register optimization problems,==

==have implications for user codes that are discussed in detail in Section [[versions/v21/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] . They are also inconsistent with Fortran 77.==

==- An MPI subroutine with a choice argument may be called with different argument types.==

==- An MPI subroutine with an assumed-size dummy argument may be passed an actual scalar argument.==

==- Many MPI routines assume that actual arguments are passed by address and that arguments are not copied on entrance to or exit from the subroutine.==

==- An MPI implementation may read or modify user data (e.g., communication buffers used by nonblocking communications) concurrently with a user program executing outside MPI calls.==

==- Several named “constants,” such as MPI_BOTTOM, MPI_STATUS_IGNORE, and MPI_ERRCODES_IGNORE, are not ordinary Fortran constants and require a special implementation. See Section [[versions/v21/sections/terms#Named Constants|Named Constants]] on page [[versions/v21/sections/terms#Named Constants|Named Constants]] for more information.==

==Additionally, MPI is inconsistent with Fortran 77 in a number of ways, as noted below.==

==- MPI identifiers exceed 6 characters.==

~~- An MPI subroutine with a choice argument may be called with different argument types. An example is shown in Figure [[versions/v21/sections/terms#Fortran 77 Binding Issues|Fortran 77 Binding Issues]] . This violates the letter of the Fortran standard, but such a violation is common practice. An alternative would be to have a separate version of `MPI_SEND` for each data type.~~

~~- Although not required, it is strongly suggested that named MPI constants (`PARAMETER`s) be provided in an include file, called `mpif.h`. On systems that do not support include files, the implementation should specify the values of named constants.~~

~~- Vendors are encouraged to provide type declarations in the `mpif.h` file on Fortran systems that support user-defined types. One should define, if possible, the type~~

~~  `MPI_ADDRESS_TYPE`, which is an `INTEGER` of the size needed to hold an address in the execution environment. On systems where type definition is not supported, it is up to the user to use an `INTEGER` of the right kind to represent addresses (i.e., `INTEGER*4` on a 32 bit machine, `INTEGER*8` on a 64 bit machine, etc.).~~

~~*Figure: An example of calling a routine with mismatched formal and actual arguments.*~~

~~All MPI named constants can be used wherever an entity declared with the `PARAMETER` attribute can be used in Fortran. There is one exception to this rule: the MPI constant MPI_BOTTOM (section [[versions/v21/sections/pt2pt#Address and extent functions|Address and extent functions]] ) can only be used as a buffer argument.~~

==- MPI requires an include file, `mpif.h`. On systems that do not support include files, the implementation should specify the values of named constants.==

==- Many routines in==

==  MPI==

==  have KIND-parameterized integers (e.g., MPI_ADDRESS_KIND and MPI_OFFSET_KIND) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.==

==- The memory allocation routine [[versions/v21/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]]==

==  cannot==

==  be usefully used in Fortran without a language extension that allows the allocated memory to be associated with a Fortran variable.==

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

==Originally,==

~~provided bindings for Fortran 77. MPI-2 retains these bindings but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below.~~

==provided bindings for Fortran 77.==

==These bindings are retained,==

==but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below.==

~~All MPI Fortran subroutines have a return code in the last argument. A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is MPI_SUCCESS. Other error codes are implementation dependent; see the error codes in Chapter 7 of the MPI-1 document and Annex [[versions/v20/sections/appLang#Language Binding|Language Binding]] in the MPI-2 document.~~

~~Constants representing the maximum length of a string are one smaller in Fortran than in C and C++ as discussed in Section [[versions/v21/sections/misc#Constants|Constants]] .~~

==All MPI Fortran subroutines have a return code in the last argument. A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is MPI_SUCCESS. Other error codes are implementation dependent; see the error codes in==

==Chapter [[versions/v21/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[versions/v21/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .==

==Constants representing the maximum length of a string are one smaller in Fortran than in C and C++ as discussed in Section [[versions/v21/sections/binding#Constants|Constants]] .==

~~- Many routines in MPI-2 have KIND-parameterized integers (e.g., MPI_ADDRESS_KIND and MPI_OFFSET_KIND) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.~~

~~- The memory allocation routine [[versions/v21/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] can’t be usefully used in Fortran without a language extension that allows the allocated memory to be associated with a Fortran variable.~~

==- Many routines in==

==  MPI==

==  have KIND-parameterized integers (e.g., MPI_ADDRESS_KIND and MPI_OFFSET_KIND) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.==

==- The memory allocation routine [[versions/v21/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]]==

==  cannot==

==  be usefully used in Fortran without a language extension that allows the allocated memory to be associated with a Fortran variable.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

All MPI Fortran subroutines have a return code in the last argument. A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.== Other error codes are implementation dependent; see the error codes in

~~- An MPI subroutine with a choice argument may be called with different argument types.~~

~~- An MPI subroutine with an assumed-size dummy argument may be passed an actual scalar argument.~~

~~- Many MPI routines assume that actual arguments are passed by address and that arguments are not copied on entrance to or exit from the subroutine.~~

~~- An MPI implementation may read or modify user data (e.g., communication buffers used by nonblocking communications) concurrently with a user program executing outside MPI calls.~~

~~- Several named “constants,” such as MPI_BOTTOM, MPI_STATUS_IGNORE, and MPI_ERRCODES_IGNORE, are not ordinary Fortran constants and require a special implementation. See Section [[versions/v22/sections/terms#Named Constants|Named Constants]] on page [[versions/v22/sections/terms#Named Constants|Named Constants]] for more information.~~

~~Additionally, MPI is inconsistent with Fortran 77 in a number of ways, as noted below.~~

~~- MPI identifiers exceed 6 characters.~~

~~- MPI identifiers may contain underscores after the first character.~~

~~- MPI requires an include file, `mpif.h`. On systems that do not support include files, the implementation should specify the values of named constants.~~

~~- Many routines in~~

~~  MPI~~

~~  have KIND-parameterized integers (e.g., MPI_ADDRESS_KIND and MPI_OFFSET_KIND) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.~~

~~- The memory allocation routine [[versions/v22/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]]~~

~~  cannot~~

~~  be usefully used in Fortran without a language extension that allows the allocated memory to be associated with a Fortran variable.~~

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~Originally,~~

~~MPI-1.1~~

~~provided bindings for Fortran 77.~~

~~These bindings are retained,~~

~~but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below.~~

~~When the term Fortran is used it means Fortran 90.~~

~~All MPI names have an `MPI_` prefix, and all characters are capitals. Programs must not declare variables, parameters, or functions with names beginning with the prefix `MPI_`. To avoid conflicting with the profiling interface, programs should also avoid functions with the prefix `PMPI_`. This is mandated to avoid possible name collisions.~~

~~All MPI Fortran subroutines have a return code in the last argument. A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is `MPI_SUCCESS`. Other error codes are implementation dependent; see the error codes in~~

==Originally, MPI-1.1 provided bindings for Fortran 77.==

==These bindings are retained, but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below. When the term “Fortran” is used it means Fortran 90 or later; it means Fortran 2008 + TR 29113 and later if the `mpi_f08` module is used.==

==All MPI names have an `MPI_` prefix, and all characters are capitals. Programs must not declare names, e.g., for variables, subroutines, functions, parameters, derived types, abstract interfaces, or modules, beginning with the prefix `MPI_`. To avoid conflicting with the profiling interface, programs must also avoid subroutines and functions with the prefix `PMPI_`. This is mandated to avoid possible name collisions.==

==All MPI Fortran subroutines have a return code in the last argument. With `USE` `mpi_f08`, this last argument is declared as `OPTIONAL`, except for user-defined callback functions (e.g., `COMM_COPY_ATTR_FUNCTION` ) and their predefined callbacks (e.g., [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] ). A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is `MPI_SUCCESS`. Other error codes are implementation dependent; see the error codes in==

~~Constants representing the maximum length of a string are one smaller in Fortran than in C and C++ as discussed in Section [[versions/v30/sections/binding#Constants|Constants]] .~~

~~Handles are represented in Fortran as `INTEGER`s. Binary-valued variables are of type `LOGICAL`.~~

==Constants representing the maximum length of a string are one smaller in Fortran than in C as discussed in Section [[versions/v30/sections/binding#Constants|Constants]] .==

==Handles are represented in Fortran as `INTEGER`s, or as a `BIND(C)` derived type with the `mpi_f08` module;==

==see Section [[terms-opaque-objects]] on page [[terms-opaque-objects]] . Binary-valued variables are of type `LOGICAL`.==

~~The MPI Fortran binding is inconsistent with the Fortran 90 standard in several respects. These~~

~~inconsistencies, such as register optimization problems,~~

~~have implications for user codes that are discussed in detail in Section [[versions/v30/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] . They are also inconsistent with Fortran 77.~~

==The older MPI Fortran bindings (`mpif.h` and `use mpi`) are inconsistent with the Fortran standard in several respects. These inconsistencies, such as register optimization problems, have implications for user codes that are discussed in detail in Section [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] .==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~Originally, MPI-1.1 provided bindings for Fortran 77.~~

~~These bindings are retained, but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below. When the term “Fortran” is used it means Fortran 90 or later; it means Fortran 2008 + TR 29113 and later if the `mpi_f08` module is used.~~

==Originally, MPI-1.1 provided bindings for Fortran 77. These bindings are retained, but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below. When the term “Fortran” is used it means Fortran 90 or later; it means Fortran 2008 + TR 29113 and later if the `mpi_f08` module is used.==

~~All MPI Fortran subroutines have a return code in the last argument. With `USE` `mpi_f08`, this last argument is declared as `OPTIONAL`, except for user-defined callback functions (e.g., `COMM_COPY_ATTR_FUNCTION` ) and their predefined callbacks (e.g., [[versions/v31/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] ). A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is `MPI_SUCCESS`. Other error codes are implementation dependent; see the error codes in~~

~~Chapter [[versions/v31/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[versions/v31/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .~~

==All MPI Fortran subroutines have a return code in the last argument. With `USE` `mpi_f08`, this last argument is declared as `OPTIONAL`, except for user-defined callback functions (e.g., `COMM_COPY_ATTR_FUNCTION` ) and their predefined callbacks (e.g., [[versions/v31/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] ). A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is `MPI_SUCCESS`. Other error codes are implementation dependent; see the error codes in Chapter [[versions/v31/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[versions/v31/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .==

~~Handles are represented in Fortran as `INTEGER`s, or as a `BIND(C)` derived type with the `mpi_f08` module;~~

~~see Section [[terms-opaque-objects]] on page [[terms-opaque-objects]] . Binary-valued variables are of type `LOGICAL`.~~

==Handles are represented in Fortran as `INTEGER`s, or as a `BIND(C)` derived type with the `mpi_f08` module; see [[terms-opaque-objects]] . Binary-valued variables are of type `LOGICAL`.==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

Originally, MPI-1.1 provided bindings for Fortran 77. These bindings are retained, but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below. When the term “Fortran” is used it means Fortran 90 or later; it means Fortran 2008 + ~~TR~~ ==TS== 29113 and later if the `mpi_f08` module is used.

All MPI Fortran subroutines have a return code in the last argument. With `USE` `mpi_f08`, this last argument is declared as `OPTIONAL`, except for user-defined callback functions (e.g., `COMM_COPY_ATTR_FUNCTION` ) and their predefined callbacks (e.g., ~~[[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]]~~ ==[[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]]== ). A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is `MPI_SUCCESS`. Other error codes are implementation dependent; see the error codes in Chapter [[versions/v40/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[versions/v40/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .

==The support for large count and displacement in Fortran is only available when using newer MPI Fortran bindings (`USE mpi_f08`). For better readability, all Fortran large count procedure declarations are marked with a comment “`!(_c)`”.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~Originally, MPI-1.1 provided bindings for Fortran 77. These bindings are retained, but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below. When the term “Fortran” is used it means Fortran 90 or later; it means Fortran 2008 + TS 29113 and later if the `mpi_f08` module is used.~~

~~All MPI names have an `MPI_` prefix, and all characters are capitals. Programs must not declare names, e.g., for variables, subroutines, functions, parameters, derived types, abstract interfaces, or modules, beginning with the prefix `MPI_`. To avoid conflicting with the profiling interface, programs must also avoid subroutines and functions with the prefix `PMPI_`. This is mandated to avoid possible name collisions.~~

~~All MPI Fortran subroutines have a return code in the last argument. With `USE` `mpi_f08`, this last argument is declared as `OPTIONAL`, except for user-defined callback functions (e.g., `COMM_COPY_ATTR_FUNCTION` ) and their predefined callbacks (e.g., [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ). A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is `MPI_SUCCESS`. Other error codes are implementation dependent; see the error codes in Chapter [[versions/v41/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[versions/v41/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .~~

==Originally, MPI-1.1 provided bindings for Fortran 77. These bindings are retained, but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below. When the term “Fortran” is used it means Fortran 90 or later; it means Fortran 2008 with TS 29113, which is now an integral part of Fortran 2018 and later if the `mpi_f08` module is used.==

==All Fortran MPI names have an `MPI_` prefix. Although Fortran is not case sensitive, if the `mpi_f08` module is used, the first character after the `MPI_` prefix is capital and all others are lower case. If the `mpi_f08` module is not used, all characters are capitals.==

==Programs must not declare names, e.g., for variables, subroutines, functions, parameters, derived types, abstract interfaces, or modules, beginning with the prefix `MPI_`. To avoid conflicting with the profiling interface, programs must also avoid subroutines and functions with the prefix `PMPI_`. This is mandated to avoid possible name collisions.==

==All MPI Fortran subroutines have an error code in the last argument. With `USE` `mpi_f08`, this last argument is declared as `OPTIONAL`, except for user-defined callback functions (e.g., `COMM_COPY_ATTR_FUNCTION` ) and their predefined callbacks (e.g., [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ). A few MPI operations that are functions do not have the error code argument. The error code value for successful completion is `MPI_SUCCESS`. Other error codes are implementation dependent; see the error codes in Chapter [[versions/v41/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[versions/v41/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .==

The older MPI Fortran ~~bindings (`mpif.h`~~ ==bindings—`use mpi`== and ~~`use mpi`) are~~ ==(deprecated) `mpif.h`—are== inconsistent with the Fortran standard in several respects. These inconsistencies, such as register optimization problems, have implications for user codes that are discussed in detail in Section [[versions/v41/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] .

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Fortran Binding Issues]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Fortran Binding Issues]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Fortran Binding Issues]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Fortran Binding Issues]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Fortran Binding Issues]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Fortran Binding Issues]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Fortran Binding Issues]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Fortran Binding Issues]]
