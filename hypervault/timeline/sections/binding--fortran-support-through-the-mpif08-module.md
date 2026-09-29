---
title: "Fortran Support Through the `mpi_f08` Module"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Fortran Support Through the `mpi_f08` Module

Chapter **binding** · in [[versions/v30/sections/binding#Fortran Support Through the `mpi_f08` Module|MPI-3.0]], [[versions/v31/sections/binding#Fortran Support Through the `mpi_f08` Module|MPI-3.1]], [[versions/v40/sections/binding#Fortran Support Through the `mpi_f08` Module|MPI-4.0]], [[versions/v41/sections/binding#Fortran Support Through the `mpi_f08` Module|MPI-4.1]], [[versions/v50/sections/binding#Fortran Support Through the `mpi_f08` Module|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (9 changed paragraphs)

An MPI implementation providing a Fortran interface must provide a module named `mpi_f08` that can be used in a Fortran program. ~~Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page~~ [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] describes restrictions if the compiler does not support all the needed features. Within all MPI function specifications, the first of the set of two Fortran routine interface specifications is provided by this module. This module must:

~~- Provide explicit interfaces according to the Fortran routine interface specifications. This module therefore guarantees compile-time argument checking for all arguments which are not `TYPE(*)`,~~

~~  with the following exception:~~

~~  - Only one Fortran interface is defined for functions that are deprecated as of MPI-3.0. This interface must be provided as an explicit interface according to the rules defined for the `mpi` module, see Section [[f90-extended]] on page [[f90-extended]] .~~

==- Provide explicit interfaces according to the Fortran routine interface specifications. This module therefore guarantees compile-time argument checking for all arguments which are not `TYPE(*)`, with the following exception:==

==  - Only one Fortran interface is defined for functions that are deprecated as of MPI-3.0. This interface must be provided as an explicit interface according to the rules defined for the `mpi` module, see [[f90-extended]] .==

~~- Define all MPI handles with uniquely named handle types (instead of `INTEGER` handles, as in the `mpi` module). This is reflected in the first Fortran binding in each MPI function definition throughout this document~~

~~  (except for the deprecated routines).~~

==- Define the derived type `MPI_Status`, and define all MPI handles with uniquely named handle types (instead of `INTEGER` handles, as in the `mpi` module). This is reflected in the first Fortran binding in each MPI function definition throughout this document (except for the deprecated routines).==

- Use the `ASYNCHRONOUS` attribute to protect the buffers of nonblocking operations, and set the `LOGICAL` compile-time constant `MPI_ASYNC_PROTECTS_NONBLOCKING` to `.TRUE.` if the underlying Fortran compiler supports the `ASYNCHRONOUS` attribute for MPI communication (as part of TS 29113). See ~~Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page~~ [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for older compiler versions.

- Set the `MPI_SUBARRAYS_SUPPORTED` compile-time constant to `.FALSE.` and declare choice buffers with a compiler-dependent mechanism that overrides type checking if the underlying Fortran compiler does not support the Fortran 2008 TS 29113 assumed-type and assumed-rank notation. In this case, the use of non-contiguous sub-arrays as buffers in nonblocking calls may be invalid. See ~~Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page~~ [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for details.

> For these definitions in the `mpi_f08` bindings, in most cases, `INTENT(IN)` is used if the C interface uses call-by-value. For all buffer arguments and for `OUT` and `INOUT` dummy arguments that allow one of the non-ordinary Fortran constants (see `MPI_BOTTOM`, etc. in ~~Section [[versions/v31/sections/terms#Named Constants|Named Constants]] on page~~ [[versions/v31/sections/terms#Named Constants|Named Constants]] ) as input, an `INTENT` is not specified.

> If a dummy argument is declared with `INTENT(OUT)`, then the Fortran standard stipulates that the actual argument becomes undefined upon invocation of the MPI routine, i.e., it may be overwritten by some other values, e.g. zeros; according to , 12.5.2.4 Ordinary dummy variables, Paragraph 17: “If a dummy argument has INTENT(OUT), the actual argument becomes undefined at the time the association is established, except ~~\[...\]”.~~ ==\[$`...`$\]”.== For example, if the dummy argument is an assumed-size array and the actual argument is a strided array, the call may be implemented with copy-in and copy-out of the argument. In the case of `INTENT(OUT)` the copy-in may be suppressed by the optimization and the routine ~~is~~ starts execution using an array of undefined values. If the routine stores fewer elements into the dummy argument than is provided in the actual argument, then the remaining locations are overwritten with these undefined values. See also both advices to implementors in ~~Section [[f90-extended]] on page~~ [[f90-extended]] .

~~  `COMM_COPY_ATTR_FUNCTION`~~

~~  ) and predefined callbacks (e.g., [[versions/v31/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ).~~

==  `COMM_COPY_ATTR_FUNCTION` ) and predefined callbacks (e.g., [[versions/v31/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ).==

> The features in TS 29113 on further interoperability with C were decided on by ISO/IEC JTC1/SC22/WG5 and designed by PL22.3 (formerly J3) to support a higher level of integration between Fortran-specific features and C than was provided in the Fortran 2008 standard; part of this design is based on requirements from the MPI Forum to support MPI-3.0. According to , “an ISO/IEC TS is reviewed after three years in order to decide whether it will be confirmed for a further three years, revised to become an International Standard, or withdrawn. If the ISO/IEC TS is confirmed, it is reviewed again after a further three years, at which time it must either be transformed into an International Standard or be withdrawn.” > > The TS 29113 contains the following language features that are needed for the MPI bindings in the `mpi_f08` module: assumed-type and assumed-rank. It is important that any possible actual argument can be used for such dummy arguments, e.g., scalars, arrays, assumed-shape arrays, assumed-size arrays, allocatable arrays, and with any element type, e.g., `REAL`, `CHARACTER*5`, `CHARACTER*(*)`, sequence derived types, or `BIND(C)` derived types. Especially for backward compatibility reasons, it is important that any possible actual argument in an implicit interface implementation of a choice buffer dummy argument (e.g., with `mpif.h` without argument-checking) can be used in an implementation with assumed-type and assumed-rank argument in an explicit interface (e.g., with the `mpi_f08` module). > > ~~The `INTERFACE` construct in combination with `BIND(C)` allows the implementation of the Fortran `mpi_f08` interface with a single set of portable wrapper routines written in C, which supports all desired features in the `mpi_f08` interface. TS 29113 also has a provision for `OPTIONAL` arguments in `BIND(C)` interfaces. > >~~ A further feature useful for MPI is the extension of the semantics of the `ASYNCHRONOUS` attribute: In F2003 and F2008, this attribute could be used only to protect buffers of Fortran asynchronous I/O. With TS 29113, this attribute now also covers asynchronous communication occurring within library routines written in C. > > The MPI Forum hereby wishes to acknowledge this important effort by the Fortran PL22.3 and WG5 committee.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

- Set the `LOGICAL` compile-time constant `MPI_SUBARRAYS_SUPPORTED` to `.TRUE.` and declare choice buffers using the Fortran 2008 TS 29113 features assumed-type and assumed-rank, i.e., `TYPE(*), DIMENSION(..)` in all nonblocking, split collective and persistent communication routines, if the underlying Fortran compiler supports it. With this, ~~non-contiguous~~ ==noncontiguous== sub-arrays can be used as buffers in nonblocking routines.

> In all blocking routines, i.e., if the choice-buffer is not declared as `ASYNCHRONOUS`, the TS 29113 feature is not needed for the support of ~~non-contiguous~~ ==noncontiguous== buffers because the compiler can pass the buffer by in-and-out-copy through a contiguous scratch array.

- Set the `MPI_SUBARRAYS_SUPPORTED` compile-time constant to `.FALSE.` and declare choice buffers with a compiler-dependent mechanism that overrides type checking if the underlying Fortran compiler does not support the Fortran 2008 TS 29113 assumed-type and assumed-rank notation. In this case, the use of ~~non-contiguous~~ ==noncontiguous== sub-arrays as buffers in nonblocking calls may be invalid. See [[versions/v40/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for details.

> For these definitions in the `mpi_f08` bindings, in most cases, `INTENT(IN)` is used if the C interface uses call-by-value. For all buffer arguments and for `OUT` and `INOUT` dummy arguments that allow one of the ~~non-ordinary~~ ==nonordinary== Fortran constants (see `MPI_BOTTOM`, etc. in [[versions/v40/sections/terms#Named Constants|Named Constants]] ) as input, an `INTENT` is not specified.

~~- Declare all `ierror` output arguments as `OPTIONAL`, except for user-defined callback functions (e.g.,~~

~~  `COMM_COPY_ATTR_FUNCTION` ) and predefined callbacks (e.g., [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ).~~

==- Declare all `ierror` output arguments as `OPTIONAL`, except for user-defined callback functions (e.g., of type `MPI_Comm_copy_attr_function` or `COMM_COPY_ATTR_FUNCTION`) and predefined callbacks (e.g., [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ).==

> For user-defined callback functions (e.g., ==of type `MPI_Comm_copy_attr_function` or== `COMM_COPY_ATTR_FUNCTION`) and their predefined callbacks (e.g., [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ), the `ierror` argument is not optional. The MPI library must always call these routines with an actual `ierror` argument. Therefore, these user-defined functions need not check whether the MPI library calls these routines with or without an actual `ierror` output argument.

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

- Provide explicit interfaces according to the Fortran routine interface specifications. This module therefore guarantees compile-time argument checking for all arguments ~~which~~ ==that== are not `TYPE(*)`, with the following exception:

> It is strongly recommended that developers substitute calls to deprecated routines when upgrading from ==the (deprecated)== `mpif.h` or the `mpi` module to the `mpi_f08` module.

- Use the `ASYNCHRONOUS` attribute to protect the buffers of nonblocking operations, and set the `LOGICAL` ~~compile-time~~ constant `MPI_ASYNC_PROTECTS_NONBLOCKING` to `.TRUE.` if the underlying Fortran compiler supports the `ASYNCHRONOUS` attribute for MPI communication (as part of TS 29113). See [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for older compiler versions.

- Set the `LOGICAL` ~~compile-time~~ constant `MPI_SUBARRAYS_SUPPORTED` to `.TRUE.` and declare choice buffers using the Fortran ~~2008 TS 29113~~ ==2018== features assumed-type and assumed-rank, i.e., `TYPE(*), DIMENSION(..)` in all nonblocking, split collective and persistent communication routines, if the underlying Fortran compiler supports it. With this, noncontiguous sub-arrays can be used as buffers in nonblocking routines.

> In all blocking routines, i.e., if the choice-buffer is not declared as `ASYNCHRONOUS`, the ~~TS 29113~~ ==Fortran 2018== feature is not needed for the support of noncontiguous buffers because the compiler can pass the buffer by in-and-out-copy through a contiguous scratch array.

- Set the `MPI_SUBARRAYS_SUPPORTED` ~~compile-time~~ constant to `.FALSE.` and declare choice buffers with a compiler-dependent mechanism that overrides type checking if the underlying Fortran compiler does not support the Fortran ~~2008 TS 29113~~ ==2018== assumed-type and assumed-rank notation. In this case, the use of noncontiguous sub-arrays as buffers in nonblocking calls may be invalid. See [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] for details.

The MPI Fortran bindings in the `mpi_f08` module are designed based on the Fortran 2008 standard together with the Technical Specification “TS 29113 Further Interoperability with C” of the ISO/IEC JTC1/SC22/WG5 (Fortran) working ~~group.~~ ==group, which is now integrated in Fortran 2018 standard .==

> The features in TS 29113 on further interoperability with C were decided on by ISO/IEC JTC1/SC22/WG5 and designed by PL22.3 (formerly J3) to support a higher level of integration between Fortran-specific features and C than was provided in the Fortran 2008 standard; part of this design is based on requirements from the MPI Forum to support MPI-3.0. ~~According~~ ==These features became part of Fortran 2018 , so references== to ~~, “an ISO/IEC~~ TS ~~is reviewed after three years in order~~ ==29113 are obsolete, except insofar as== to ~~decide whether it will be confirmed for~~ ==specify== a ~~further three years, revised~~ ==particular feature set from Fortran 2018 or minimal requirements== to ~~become an International Standard, or withdrawn. If the ISO/IEC TS is confirmed, it is reviewed again after~~ a ~~further three years, at which time it must either be transformed into an International Standard or be withdrawn.”~~ ==compiler.== > > ~~The TS 29113~~ ==Fortran 2018== contains the following language features that are needed for the MPI bindings in the `mpi_f08` module: assumed-type and assumed-rank. It is important that any possible actual argument can be used for such dummy arguments, e.g., scalars, arrays, assumed-shape arrays, assumed-size arrays, allocatable arrays, and with any element type, e.g., `REAL`, `CHARACTER*5`, `CHARACTER*(*)`, sequence derived types, or `BIND(C)` derived types. Especially for backward compatibility reasons, it is important that any possible actual argument in an implicit interface implementation of a choice buffer dummy argument (e.g., with ==the deprecated== `mpif.h` without argument-checking) can be used in an implementation with assumed-type and assumed-rank argument in an explicit interface (e.g., with the `mpi_f08` module). > > A further feature useful for MPI is the extension of the semantics of the `ASYNCHRONOUS` attribute: In F2003 and F2008, this attribute could be used only to protect buffers of Fortran asynchronous I/O. With TS ~~29113,~~ ==29113 and now Fortran 2018,== this attribute ~~now~~ also covers asynchronous communication occurring within library routines written in C. > > The MPI Forum hereby wishes to acknowledge this important effort by the Fortran PL22.3 and WG5 committee.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Fortran Support Through the `mpi_f08` Module]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Fortran Support Through the `mpi_f08` Module]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Fortran Support Through the `mpi_f08` Module]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Fortran Support Through the `mpi_f08` Module]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Fortran Support Through the `mpi_f08` Module]]
