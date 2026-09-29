---
title: "Fortran Support Through the `mpi` Module"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Fortran Support Through the `mpi` Module

Chapter **binding** · in [[versions/v30/sections/binding#Fortran Support Through the `mpi` Module|MPI-3.0]], [[versions/v31/sections/binding#Fortran Support Through the `mpi` Module|MPI-3.1]], [[versions/v40/sections/binding#Fortran Support Through the `mpi` Module|MPI-4.0]], [[versions/v41/sections/binding#Fortran Support Through the `mpi` Module|MPI-4.1]], [[versions/v50/sections/binding#Fortran Support Through the `mpi` Module|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

- Provide explicit interfaces according to the Fortran routine interface specifications. This module therefore guarantees compile-time argument checking and allows positional and keyword-based argument lists. ==If an implementation is paired with a compiler that either does not support `TYPE(*), DIMENSION(..)` from TS 29113, or is otherwise unable to ignore the types of choice buffers, then the implementation must provide explicit interfaces only for MPI routines with no choice buffer arguments. See [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for more details.==

~~- Define the derived type `MPI_Status` and all named handle types that are used in the `mpi_f08` module.~~

~~  For these named handle types, overload the operators `.EQ.` and `.NE.` to allow handle comparison via the `.EQ.`, `.NE.`, `==` and `/=` operators.~~

==- Define the derived type `MPI_Status` and all named handle types that are used in the `mpi_f08` module. For these named handle types, overload the operators `.EQ.` and `.NE.` to allow handle comparison via the `.EQ.`, `.NE.`, `==` and `/=` operators.==

> For an MPI implementation that fully supports nonblocking calls with the `ASYNCHRONOUS` attribute for choice buffers, an existing MPI-2.2 application may fail to compile even if it compiled and executed with expected results with an MPI-2.2 implementation. One reason may be that the application uses “contiguous” but not “simply contiguous” `ASYNCHRONOUS` arrays as actual arguments for choice buffers of nonblocking routines, e.g., by using subscript triplets with stride one or specifying `(1:n)` for a whole dimension instead of using `(:)`. This should be fixed to fulfill the Fortran constraints for `ASYNCHRONOUS` dummy arguments. This is not considered a violation of backward compatibility because existing applications can not use the `ASYNCHRONOUS` attribute to protect nonblocking calls. Another reason may be that the application does not conform either to MPI-2.2, or to MPI-3.0, or to the Fortran standard, typically because the program forces the compiler to perform copy-in/out for a choice buffer argument in a nonblocking MPI call. This is also not a violation of backward compatibility because the application itself is non-conforming. See ~~Section [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] on page~~ [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] for more details.

- A high quality MPI implementation may enhance the interface by using `TYPE(*), DIMENSION(..)` choice buffer dummy arguments instead of using non-standardized extensions such as `!$PRAGMA IGNORE_TKR` or a set of overloaded functions as described by M. Hennecke in , if the compiler supports this TS 29113 language feature. See ~~Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page~~ [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for further details.

- Set the `MPI_SUBARRAYS_SUPPORTED` compile-time constant to `.FALSE.` and declare choice buffers with a compiler-dependent mechanism that overrides type checking if the underlying Fortran compiler does not support the TS 29113 assumed-type and assumed-rank features. In this case, the use of non-contiguous sub-arrays in nonblocking calls may be disallowed. See ~~Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page~~ [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for details.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> For an MPI implementation that fully supports nonblocking calls with the `ASYNCHRONOUS` attribute for choice buffers, an existing MPI-2.2 application may fail to compile even if it compiled and executed with expected results with an MPI-2.2 implementation. One reason may be that the application uses “contiguous” but not “simply contiguous” `ASYNCHRONOUS` arrays as actual arguments for choice buffers of nonblocking routines, e.g., by using subscript triplets with stride one or specifying `(1:n)` for a whole dimension instead of using `(:)`. This should be fixed to fulfill the Fortran constraints for `ASYNCHRONOUS` dummy arguments. This is not considered a violation of backward compatibility because existing applications can not use the `ASYNCHRONOUS` attribute to protect nonblocking calls. Another reason may be that the application does not conform either to ~~MPI-2.2, or to MPI-3.0,~~ ==the MPI standard== or to the Fortran standard, typically because the program forces the compiler to perform copy-in/out for a choice buffer argument in a nonblocking MPI call. This is also not a violation of backward compatibility because the application itself is ~~non-conforming.~~ ==nonconforming.== See [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] for more details.

- A high quality MPI implementation may enhance the interface by using `TYPE(*), DIMENSION(..)` choice buffer dummy arguments instead of using ~~non-standardized~~ ==nonstandardized== extensions such as `!$PRAGMA IGNORE_TKR` or a set of overloaded functions as described by M. Hennecke in , if the compiler supports this TS 29113 language feature. See [[versions/v40/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for further details.

- Set the `LOGICAL` compile-time constant `MPI_SUBARRAYS_SUPPORTED` to `.TRUE.` if all choice buffer arguments in all nonblocking, split collective and persistent communication routines are declared with `TYPE(*), DIMENSION(..)`, otherwise set it to `.FALSE.`. When `MPI_SUBARRAYS_SUPPORTED` is defined as `.TRUE.`, ~~non-contiguous~~ ==noncontiguous== sub-arrays can be used as buffers in nonblocking routines.

- Set the `MPI_SUBARRAYS_SUPPORTED` compile-time constant to `.FALSE.` and declare choice buffers with a compiler-dependent mechanism that overrides type checking if the underlying Fortran compiler does not support the TS 29113 assumed-type and assumed-rank features. In this case, the use of ~~non-contiguous~~ ==noncontiguous== sub-arrays in nonblocking calls may be disallowed. See [[versions/v40/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for details.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

- Define all named MPI ~~constants~~ ==constants.==

- Provide explicit interfaces according to the Fortran routine interface specifications. This module therefore guarantees compile-time argument checking and allows positional and keyword-based argument lists. If an implementation is paired with a compiler that either does not support `TYPE(*), DIMENSION(..)` from ~~TS 29113,~~ ==Fortran 2018,== or is otherwise unable to ignore the types of choice buffers, then the implementation must provide explicit interfaces only for MPI routines with no choice buffer arguments. See [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for more details.

- Set the `LOGICAL` ~~compile-time~~ constant `MPI_ASYNC_PROTECTS_NONBLOCKING` to `.TRUE.` if the `ASYNCHRONOUS` attribute is used in all nonblocking interfaces **and** the underlying Fortran compiler supports the `ASYNCHRONOUS` attribute for MPI communication (as part of ~~TS 29113),~~ ==Fortran 2018),== otherwise to `.FALSE.`.

- A high quality MPI implementation may enhance the interface by using `TYPE(*), DIMENSION(..)` choice buffer dummy arguments instead of using nonstandardized extensions such as `!$PRAGMA IGNORE_TKR` or a set of overloaded functions as described by M. Hennecke in , if the compiler supports this ~~TS 29113~~ ==Fortran 2018== language feature. See [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for further details.

- Set the `LOGICAL` ~~compile-time~~ constant `MPI_SUBARRAYS_SUPPORTED` to `.TRUE.` if all choice buffer arguments in all nonblocking, split collective and persistent communication routines are declared with `TYPE(*), DIMENSION(..)`, otherwise set it to `.FALSE.`. When `MPI_SUBARRAYS_SUPPORTED` is defined as `.TRUE.`, noncontiguous sub-arrays can be used as buffers in nonblocking routines.

- Set the `MPI_SUBARRAYS_SUPPORTED` ~~compile-time~~ constant to `.FALSE.` and declare choice buffers with a compiler-dependent mechanism that overrides type checking if the underlying Fortran compiler does not support the ~~TS 29113~~ ==Fortran 2018== assumed-type and assumed-rank features. In this case, the use of noncontiguous sub-arrays in nonblocking calls may be disallowed. See [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for details.

> The Fortran 2008 standard illustrates in its Note 5.17 that “INTENT(OUT) means that the value of the argument after invoking the procedure is entirely the result of executing that procedure. If an argument should retain its value rather than being redefined, INTENT(INOUT) should be used rather than INTENT(OUT), even if there is no explicit reference to the value of the dummy argument. Furthermore, INTENT(INOUT) is not equivalent to omitting the INTENT attribute, because INTENT(INOUT) always requires that the associated actual argument is definable.” Applications that include ==the (deprecated)== `mpif.h` may not expect that `INTENT(OUT)` is used. In particular, output array arguments are expected to keep their content as long as the MPI routine does not modify them. To keep this behavior, it is recommended that implementations not use `INTENT(OUT)` in the `mpi` module and the ==(deprecated)== `mpif.h` include file, even though `INTENT(OUT)` is specified in an interface description of the `mpi_f08` module.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Fortran Support Through the `mpi` Module]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Fortran Support Through the `mpi` Module]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Fortran Support Through the `mpi` Module]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Fortran Support Through the `mpi` Module]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Fortran Support Through the `mpi` Module]]
