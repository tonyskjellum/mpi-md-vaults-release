---
title: "Problems With Fortran Bindings for MPI"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Problems With Fortran Bindings for MPI

Chapter **binding** · in [[versions/v20/sections/binding#Problems With Fortran Bindings for MPI|MPI-2.0]], [[versions/v21/sections/binding#Problems With Fortran Bindings for MPI|MPI-2.1]], [[versions/v22/sections/binding#Problems With Fortran Bindings for MPI|MPI-2.2]], [[versions/v30/sections/binding#Problems With Fortran Bindings for MPI|MPI-3.0]], [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|MPI-3.1]], [[versions/v40/sections/binding#Problems With Fortran Bindings for MPI|MPI-4.0]], [[versions/v41/sections/binding#Problems With Fortran Bindings for MPI|MPI-4.1]], [[versions/v50/sections/binding#Problems With Fortran Bindings for MPI|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~MPI-1 contained several routines that take address-sized information as input or return address-sized information as output. In C such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of new MPI-2 functions also take `INTEGER` arguments of non-default `KIND`. See Section [[versions/v21/sections/terms#Language Binding|Language Binding]] on page [[versions/v21/sections/terms#Language Binding|Language Binding]] and Section [[versions/v21/sections/misc#New Datatype Manipulation Functions|New Datatype Manipulation Functions]] on page [[versions/v21/sections/misc#New Datatype Manipulation Functions|New Datatype Manipulation Functions]] for more information.~~

==MPI-1 contained several routines that take address-sized information as input or return address-sized information as output. In C==

==such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of new MPI-2 functions also take `INTEGER` arguments of non-default `KIND`. See Section [[versions/v21/sections/terms#Language Binding|Language Binding]] on page [[versions/v21/sections/terms#Language Binding|Language Binding]] and==

==Section [[versions/v21/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] on page [[versions/v21/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]]==

==for more information.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

5. Several named “constants,” such as ~~MPI_BOTTOM, MPI_IN_PLACE, MPI_STATUS_IGNORE, MPI_STATUSES_IGNORE, MPI_ERRCODES_IGNORE, MPI_ARGV_NULL,~~ ==`MPI_BOTTOM`, `MPI_IN_PLACE`, `MPI_STATUS_IGNORE`, `MPI_STATUSES_IGNORE`, `MPI_ERRCODES_IGNORE`, `MPI_UNWEIGHTED`, `MPI_ARGV_NULL`,== and ~~MPI_ARGVS_NULL~~ ==`MPI_ARGVS_NULL`== are not ordinary Fortran constants and require a special implementation. See Section [[versions/v22/sections/terms#Named Constants|Named Constants]] on page [[versions/v22/sections/terms#Named Constants|Named Constants]] for more information.

==Additionally, MPI is inconsistent with Fortran 77 in a number of ways, as noted below.==

==- MPI identifiers exceed 6 characters.==

==- MPI identifiers may contain underscores after the first character.==

==- MPI requires an include file, `mpif.h`. On systems that do not support include files, the implementation should specify the values of named constants.==

==- Many routines in==

==  MPI==

==  have KIND-parameterized integers (e.g., `MPI_ADDRESS_KIND` and `MPI_OFFSET_KIND`) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.==

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~This section discusses a number of problems that may arise when using MPI in a Fortran program. It is intended as advice to users, and clarifies how MPI interacts with Fortran. It does not add to the standard, but is intended to clarify the standard.~~

~~As noted in the original MPI specification, the interface violates the Fortran standard in several ways. While these cause few problems for Fortran 77 programs, they become more significant for Fortran 90 programs, so that users must exercise care when using new Fortran 90 features. The violations were originally adopted and have been retained because they are important for the usability of MPI. The rest of this section describes the potential problems in detail. It supersedes and replaces the discussion of Fortran bindings in the original MPI specification (for Fortran 90, not Fortran 77).~~

~~The following MPI features are inconsistent with Fortran 90.~~

~~1.  An MPI subroutine with a choice argument may be called with different argument types.~~

~~2.  An MPI subroutine with an assumed-size dummy argument may be passed an actual scalar argument.~~

~~3.  Many MPI routines assume that actual arguments are passed by address and that arguments are not copied on entrance to or exit from the subroutine.~~

~~4.  An MPI implementation may read or modify user data (e.g., communication buffers used by nonblocking communications) concurrently~~

~~    with a user program that is executing outside of MPI calls.~~

~~5.  Several named “constants,” such as `MPI_BOTTOM`, `MPI_IN_PLACE`, `MPI_STATUS_IGNORE`, `MPI_STATUSES_IGNORE`, `MPI_ERRCODES_IGNORE`, `MPI_UNWEIGHTED`, `MPI_ARGV_NULL`, and `MPI_ARGVS_NULL` are not ordinary Fortran constants and require a special implementation. See Section [[versions/v30/sections/terms#Named Constants|Named Constants]] on page [[versions/v30/sections/terms#Named Constants|Named Constants]] for more information.~~

~~6.  The memory allocation routine [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] can’t be usefully used in Fortran without a language extension that allows the allocated memory to be associated with a Fortran variable.~~

==This section discusses a number of problems that may arise when using MPI in a Fortran program. It is intended as advice to users, and clarifies how MPI interacts with Fortran. It is intended to clarify, not add to, this standard.==

==As noted in the original MPI specification, the interface violates the Fortran standard in several ways. While these may cause few problems for Fortran 77 programs, they become more significant for Fortran 90 programs, so that users must exercise care when using new Fortran 90 features.==

==With Fortran 2008 and the new semantics defined in TS 29113, most violations are resolved, and this is hinted at in an addendum to each item.==

==The violations were originally adopted and have been retained because they are important for the usability of MPI. The rest of this section describes the potential problems in detail.==

==The following MPI features are inconsistent with Fortran 90 and Fortran 77.==

==1.  An MPI subroutine with a choice argument may be called with different argument types. When using the `mpi_f08` module together with a compiler that supports Fortran 2008 + TS 29113, this problem is resolved.==

==2.  An MPI subroutine with an assumed-size dummy argument may be passed an actual scalar argument. This is only solved for choice buffers through the use of `DIMENSION(..)`.==

==3.  Nonblocking and split-collective MPI routines assume that actual arguments are passed by address or descriptor and that arguments and the associated data are not copied on entrance to or exit from the subroutine. This problem is solved with the use of the `ASYNCHRONOUS` attribute.==

==4.  An MPI implementation may read or modify user data (e.g., communication buffers used by nonblocking communications) concurrently with a user program that is executing outside of MPI calls. This problem is resolved by relying on the extended semantics of the `ASYNCHRONOUS` attribute as specified in TS 29113.==

==5.  Several named “constants,” such as `MPI_BOTTOM`, `MPI_IN_PLACE`, `MPI_STATUS_IGNORE`, `MPI_STATUSES_IGNORE`, `MPI_ERRCODES_IGNORE`, `MPI_UNWEIGHTED`, `MPI_WEIGHTS_EMPTY`, `MPI_ARGV_NULL`, and `MPI_ARGVS_NULL` are not ordinary Fortran constants and require a special implementation. See Section [[versions/v30/sections/terms#Named Constants|Named Constants]] on page [[versions/v30/sections/terms#Named Constants|Named Constants]] for more information.==

==6.  The memory allocation routine [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] cannot be used from Fortran 77/90/95 without a language extension (for example, Cray pointers) that allows the allocated memory to be associated with a Fortran variable.==

==    Therefore, address sized integers were used in MPI-2.0 – MPI-2.2. In Fortran 2003, `TYPE(C_PTR)` entities were added, which allow a standard-conforming implementation of the semantics of [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . In MPI-3.0 and later, [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] has an additional, overloaded interface to support this language feature. The use of Cray pointers is deprecated. The `mpi_f08` module only supports `TYPE(C_PTR)` pointers.==

~~  MPI~~

~~  have KIND-parameterized integers (e.g., `MPI_ADDRESS_KIND` and `MPI_OFFSET_KIND`) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.~~

==  MPI have `KIND`-parameterized integers (e.g., `MPI_ADDRESS_KIND` and `MPI_OFFSET_KIND`) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.==

~~such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of new MPI-2 functions also take `INTEGER` arguments of non-default `KIND`. See Section [[versions/v30/sections/terms#Language Binding|Language Binding]] on page [[versions/v30/sections/terms#Language Binding|Language Binding]] and~~

~~Section [[versions/v30/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] on page [[versions/v30/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]]~~

~~for more information.~~

==such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of new MPI-2 functions also take `INTEGER` arguments of non-default `KIND`. See Section [[versions/v30/sections/terms#Language Binding|Language Binding]] on page [[versions/v30/sections/terms#Language Binding|Language Binding]] and Section [[versions/v30/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] on page [[versions/v30/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] for more information.==

==Sections [[versions/v30/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] through [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] describe several problems in detail which concern the interaction of MPI and Fortran as well as their solutions. Some of these solutions require special capabilities from the compilers. Major requirements are summarized in Section [[versions/v30/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[versions/v30/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~As noted in the original MPI specification, the interface violates the Fortran standard in several ways. While these may cause few problems for Fortran 77 programs, they become more significant for Fortran 90 programs, so that users must exercise care when using new Fortran 90 features.~~

~~With Fortran 2008 and the new semantics defined in TS 29113, most violations are resolved, and this is hinted at in an addendum to each item.~~

~~The violations were originally adopted and have been retained because they are important for the usability of MPI. The rest of this section describes the potential problems in detail.~~

==As noted in the original MPI specification, the interface violates the Fortran standard in several ways. While these may cause few problems for Fortran 77 programs, they become more significant for Fortran 90 programs, so that users must exercise care when using new Fortran 90 features. With Fortran 2008 and the new semantics defined in TS 29113, most violations are resolved, and this is hinted at in an addendum to each item. The violations were originally adopted and have been retained because they are important for the usability of MPI. The rest of this section describes the potential problems in detail.==

~~5.  Several named “constants,” such as `MPI_BOTTOM`, `MPI_IN_PLACE`, `MPI_STATUS_IGNORE`, `MPI_STATUSES_IGNORE`, `MPI_ERRCODES_IGNORE`, `MPI_UNWEIGHTED`, `MPI_WEIGHTS_EMPTY`, `MPI_ARGV_NULL`, and `MPI_ARGVS_NULL` are not ordinary Fortran constants and require a special implementation. See Section [[versions/v31/sections/terms#Named Constants|Named Constants]] on page [[versions/v31/sections/terms#Named Constants|Named Constants]] for more information.~~

~~6.  The memory allocation routine [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] cannot be used from Fortran 77/90/95 without a language extension (for example, Cray pointers) that allows the allocated memory to be associated with a Fortran variable.~~

~~    Therefore, address sized integers were used in MPI-2.0 – MPI-2.2. In Fortran 2003, `TYPE(C_PTR)` entities were added, which allow a standard-conforming implementation of the semantics of [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . In MPI-3.0 and later, [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] has an additional, overloaded interface to support this language feature. The use of Cray pointers is deprecated. The `mpi_f08` module only supports `TYPE(C_PTR)` pointers.~~

==5.  Several named “constants,” such as `MPI_BOTTOM`, `MPI_IN_PLACE`, `MPI_STATUS_IGNORE`, `MPI_STATUSES_IGNORE`, `MPI_ERRCODES_IGNORE`, `MPI_UNWEIGHTED`, `MPI_WEIGHTS_EMPTY`, `MPI_ARGV_NULL`, and `MPI_ARGVS_NULL` are not ordinary Fortran constants and require a special implementation. See [[versions/v31/sections/terms#Named Constants|Named Constants]] for more information.==

==6.  The memory allocation routine [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] cannot be used from Fortran 77/90/95 without a language extension (for example, Cray pointers) that allows the allocated memory to be associated with a Fortran variable. Therefore, address sized integers were used in MPI-2.0 – MPI-2.2. In Fortran 2003, `TYPE(C_PTR)` entities were added, which allow a standard-conforming implementation of the semantics of [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . In MPI-3.0 and later, [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] has an additional, overloaded interface to support this language feature. The use of Cray pointers is deprecated. The `mpi_f08` module only supports `TYPE(C_PTR)` pointers.==

~~- Many routines in~~

~~  MPI have `KIND`-parameterized integers (e.g., `MPI_ADDRESS_KIND` and `MPI_OFFSET_KIND`) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.~~

==- Many routines in MPI have `KIND`-parameterized integers (e.g., `MPI_ADDRESS_KIND` and `MPI_OFFSET_KIND`) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.==

such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of new MPI-2 functions also take `INTEGER` arguments of non-default `KIND`. See ~~Section [[versions/v31/sections/terms#Language Binding|Language Binding]] on page~~ [[versions/v31/sections/terms#Language Binding|Language Binding]] and ~~Section [[versions/v31/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] on page~~ [[versions/v31/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] for more information.

Sections [[versions/v31/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] through [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] describe several problems in detail which concern the interaction of MPI and Fortran as well as their solutions. Some of these solutions require special capabilities from the compilers. Major requirements are summarized in ~~Section [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page~~ [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of ~~new~~ MPI-2 functions also take `INTEGER` arguments of ~~non-default~~ ==nondefault== `KIND`. See [[versions/v40/sections/terms#Language Binding|Language Binding]] and [[versions/v40/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] for more information.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

As noted in the original MPI specification, the interface violates the Fortran standard in several ways. While these may cause few problems for Fortran 77 programs, they become more significant for Fortran 90 programs, so that users must exercise care when using new Fortran 90 features. With Fortran 2008 and the ~~new~~ semantics defined in TS 29113, most violations are resolved, and this is hinted at in an addendum to each item. The violations were originally adopted and have been retained because they are important for the usability of MPI. The rest of this section describes the potential problems in detail.

1. An MPI subroutine with a choice argument may be called with different argument types. When using the `mpi_f08` module together with a compiler that supports Fortran 2008 ~~+~~ ==with== TS 29113, this problem is resolved.

- MPI requires an include file, ~~`mpif.h`.~~ ==`mpif.h` (deprecated).== On systems that do not support include files, the implementation should specify the values of named constants.

~~MPI-1 contained several routines that take address-sized information as input or return address-sized information as output. In C~~

~~such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of MPI-2 functions also take `INTEGER` arguments of nondefault `KIND`. See [[versions/v41/sections/terms#Language Binding|Language Binding]] and [[versions/v41/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] for more information.~~

~~Sections [[versions/v41/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] through [[versions/v41/sections/binding#Permanent Data Movement|Permanent Data Movement]] describe several problems in detail which concern the interaction of MPI and Fortran as well as their solutions. Some of these solutions require special capabilities from the compilers. Major requirements are summarized in [[versions/v41/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

==MPI-1 contained several routines that take address-sized information as input or return address-sized information as output. In C such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of MPI-2 functions also take `INTEGER` arguments of nondefault `KIND`. See [[versions/v41/sections/terms#Language Binding|Language Binding]] and [[versions/v41/sections/datatypes#Type Constructors with Explicit Addresses|Type Constructors with Explicit Addresses]] for more information.==

==Sections [[versions/v41/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] through [[versions/v41/sections/binding#Permanent Data Movement|Permanent Data Movement]] describe several problems in detail that concern the interaction of MPI and Fortran as well as their solutions. Some of these solutions require special capabilities from the compilers. Major requirements are summarized in [[versions/v41/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Problems With Fortran Bindings for MPI]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Problems With Fortran Bindings for MPI]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Problems With Fortran Bindings for MPI]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Problems With Fortran Bindings for MPI]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Problems With Fortran Bindings for MPI]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Problems With Fortran Bindings for MPI]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Problems With Fortran Bindings for MPI]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Problems With Fortran Bindings for MPI]]
