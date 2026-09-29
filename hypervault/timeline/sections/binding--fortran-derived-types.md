---
title: "Fortran Derived Types"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Fortran Derived Types

Chapter **binding** · in [[versions/v30/sections/binding#Fortran Derived Types|MPI-3.0]], [[versions/v31/sections/binding#Fortran Derived Types|MPI-3.1]], [[versions/v40/sections/binding#Fortran Derived Types|MPI-4.0]], [[versions/v41/sections/binding#Fortran Derived Types|MPI-4.1]], [[versions/v50/sections/binding#Fortran Derived Types|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~MPI does not explicitly support passing Fortran 90 derived types to choice dummy arguments. Indeed, for MPI implementations that provide explicit interfaces through the `mpi` module~~

~~a compiler will reject derived type actual arguments at compile time. Even when~~

~~no explicit interfaces are given, users should be aware that Fortran 90 provides no guarantee of sequence association for derived types or arrays of derived types. For instance, an array of a derived type consisting of two elements may be implemented as an array of the first elements followed by an array of the second. Use of the `SEQUENCE` attribute may help here, somewhat.~~

~~The following code fragment shows one possible way to send a derived type in Fortran. The example assumes that all data is passed by address.~~

~~        type mytype            integer i            real x            double precision d         end type mytype~~

~~        type(mytype) foo         integer blocklen(3), type(3)         integer(MPI_ADDRESS_KIND) disp(3), base~~

~~        call MPI_GET_ADDRESS(foo%i, disp(1), ierr)         call MPI_GET_ADDRESS(foo%x, disp(2), ierr)         call MPI_GET_ADDRESS(foo%d, disp(3), ierr)~~

~~        base = disp(1)         disp(1) = disp(1) - base         disp(2) = disp(2) - base         disp(3) = disp(3) - base~~

~~        blocklen(1) = 1         blocklen(2) = 1         blocklen(3) = 1~~

~~        type(1) = MPI_INTEGER         type(2) = MPI_REAL         type(3) = MPI_DOUBLE_PRECISION~~

~~        call MPI_TYPE_CREATE_STRUCT(3, blocklen, disp, type, newtype, ierr)         call MPI_TYPE_COMMIT(newtype, ierr)~~

~~    ! unpleasant to send foo%i instead of foo, but it works for scalar     ! entities of type mytype         call MPI_SEND(foo%i, 1, newtype, ...)~~

==MPI supports passing Fortran entities of `BIND(C)` and `SEQUENCE` derived types to choice dummy arguments, provided no type component has the `ALLOCATABLE` or `POINTER` attribute.==

==The following code fragment shows some possible ways to send scalars or arrays of interoperable derived type in Fortran. The example assumes that all data is passed by address.==

==        type, BIND(C) :: mytype            integer :: i            real :: x            double precision :: d            logical :: l          end type mytype==

==        type(mytype) :: foo, fooarr(5)         integer :: blocklen(4), type(4)         integer(KIND=MPI_ADDRESS_KIND) :: disp(4), base, lb, extent==

==        call MPI_GET_ADDRESS(foo%i, disp(1), ierr)         call MPI_GET_ADDRESS(foo%x, disp(2), ierr)         call MPI_GET_ADDRESS(foo%d, disp(3), ierr)         call MPI_GET_ADDRESS(foo==

==        base = disp(1)         disp(1) = disp(1) - base         disp(2) = disp(2) - base         disp(3) = disp(3) - base         disp(4) = disp(4) - base==

==        blocklen(1) = 1         blocklen(2) = 1         blocklen(3) = 1         blocklen(4) = 1==

==        type(1) = MPI_INTEGER         type(2) = MPI_REAL         type(3) = MPI_DOUBLE_PRECISION         type(4) = MPI_LOGICAL==

==        call MPI_TYPE_CREATE_STRUCT(4, blocklen, disp, type, newtype, ierr)         call MPI_TYPE_COMMIT(newtype, ierr)==

==        call MPI_SEND(foo%i, 1, newtype, dest, tag, comm, ierr)         ! or         call MPI_SEND(foo, 1, newtype, dest, tag, comm, ierr)         ! expects that base == address(foo==

==        call MPI_GET_ADDRESS(fooarr(1), disp(1), ierr)         call MPI_GET_ADDRESS(fooarr(2), disp(2), ierr)         extent = disp(2) - disp(1)         lb = 0         call MPI_TYPE_CREATE_RESIZED(newtype, lb, extent, newarrtype, ierr)         call MPI_TYPE_COMMIT(newarrtype, ierr)==

==        call MPI_SEND(fooarr, 5, newarrtype, dest, tag, comm, ierr)==

==Using the derived type variable `foo` instead of its first basic type element `foo%i` may be impossible if the MPI library implements choice buffer arguments through overloading instead of using `TYPE(*), DIMENSION(..)`, or through a non-standardized extension such as `!$PRAGMA IGNORE_TKR`; see Section [[versions/v30/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page [[versions/v30/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] .==

==To use a derived type in an array requires a correct extent of the datatype handle to take care of the alignment rules applied by the compiler. These alignment rules may imply that there are gaps between the components of a derived type, and also between the subsuquent elements of an array of a derived type.==

==The extent of an interoperable derived type (i.e., defined with `BIND(C)`) and a `SEQUENCE` derived type with the same content may be different because C and Fortran may apply different alignment rules.==

==As recommended in the advice to users in Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] , one should add an additional fifth structure element with one numerical storage unit at the end of this structure to force in most cases that the array of structures is contiguous. Even with such an additional element, one should keep this resizing due to the special alignment rules that can be used by the compiler for structures, as also mentioned in this advice.==

==Using the extended semantics defined in TS 29113, it is also possible to use entities or derived types without either the `BIND(C)` or the `SEQUENCE` attribute as choice buffer arguments; some additional constraints must be observed, e.g., no `ALLOCATABLE` or `POINTER` type components may exist. In this case, the `base` address in the example must be changed to become the address of `foo` instead of `foo%i`, because the Fortran compiler may rearrange type components or add padding. Sending the structure `foo` should then also be performed by providing it (and not `foo%i`) as actual argument for `MPI_Send`.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

call MPI_GET_ADDRESS(foo%i, disp(1), ierr) call MPI_GET_ADDRESS(foo%x, disp(2), ierr) call MPI_GET_ADDRESS(foo%d, disp(3), ierr) call ~~MPI_GET_ADDRESS(foo~~ ==MPI_GET_ADDRESS(foo%l, disp(4), ierr)==

call MPI_SEND(foo%i, 1, newtype, dest, tag, comm, ierr) ! or call MPI_SEND(foo, 1, newtype, dest, tag, comm, ierr) ! expects that base == ~~address(foo~~ ==address(foo%i) == address(foo)==

~~Using the derived type variable `foo` instead of its first basic type element `foo%i` may be impossible if the MPI library implements choice buffer arguments through overloading instead of using `TYPE(*), DIMENSION(..)`, or through a non-standardized extension such as `!$PRAGMA IGNORE_TKR`; see Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] .~~

~~To use a derived type in an array requires a correct extent of the datatype handle to take care of the alignment rules applied by the compiler. These alignment rules may imply that there are gaps between the components of a derived type, and also between the subsuquent elements of an array of a derived type.~~

~~The extent of an interoperable derived type (i.e., defined with `BIND(C)`) and a `SEQUENCE` derived type with the same content may be different because C and Fortran may apply different alignment rules.~~

~~As recommended in the advice to users in Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] , one should add an additional fifth structure element with one numerical storage unit at the end of this structure to force in most cases that the array of structures is contiguous. Even with such an additional element, one should keep this resizing due to the special alignment rules that can be used by the compiler for structures, as also mentioned in this advice.~~

==Using the derived type variable `foo` instead of its first basic type element `foo%i` may be impossible if the MPI library implements choice buffer arguments through overloading instead of using `TYPE(*), DIMENSION(..)`, or through a non-standardized extension such as `!$PRAGMA IGNORE_TKR`; see [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] .==

==To use a derived type in an array requires a correct extent of the datatype handle to take care of the alignment rules applied by the compiler. These alignment rules may imply that there are gaps between the components of a derived type, and also between the subsuquent elements of an array of a derived type. The extent of an interoperable derived type (i.e., defined with `BIND(C)`) and a `SEQUENCE` derived type with the same content may be different because C and Fortran may apply different alignment rules. As recommended in the advice to users in Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] , one should add an additional fifth structure element with one numerical storage unit at the end of this structure to force in most cases that the array of structures is contiguous. Even with such an additional element, one should keep this resizing due to the special alignment rules that can be used by the compiler for structures, as also mentioned in this advice.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The following code fragment shows some possible ways to send scalars or arrays of interoperable derived ~~type~~ ==types== in Fortran. The example assumes that all data is passed by address.

type, BIND(C) :: mytype integer :: i real :: x double precision :: d logical :: l end type mytype

type(mytype) :: foo, fooarr(5) integer :: blocklen(4), type(4) integer(KIND=MPI_ADDRESS_KIND) :: disp(4), base, lb, extent

call MPI_GET_ADDRESS(foo%i, disp(1), ierr) call MPI_GET_ADDRESS(foo%x, disp(2), ierr) call MPI_GET_ADDRESS(foo%d, disp(3), ierr) call MPI_GET_ADDRESS(foo%l, disp(4), ierr)

base = disp(1) disp(1) = disp(1) - base disp(2) = disp(2) - base disp(3) = disp(3) - base disp(4) = disp(4) - base

blocklen(1) = 1 blocklen(2) = 1 blocklen(3) = 1 blocklen(4) = 1

type(1) = MPI_INTEGER type(2) = MPI_REAL type(3) = MPI_DOUBLE_PRECISION type(4) = MPI_LOGICAL

call MPI_TYPE_CREATE_STRUCT(4, blocklen, disp, type, newtype, ierr) call MPI_TYPE_COMMIT(newtype, ierr)

call MPI_SEND(foo%i, 1, newtype, dest, tag, comm, ierr) ! or call MPI_SEND(foo, 1, newtype, dest, tag, comm, ierr) ! expects that base == address(foo%i) == address(foo)

call MPI_GET_ADDRESS(fooarr(1), disp(1), ierr) call MPI_GET_ADDRESS(fooarr(2), disp(2), ierr) extent = disp(2) - disp(1) lb = 0 call MPI_TYPE_CREATE_RESIZED(newtype, lb, extent, newarrtype, ierr) call MPI_TYPE_COMMIT(newarrtype, ierr)

call MPI_SEND(fooarr, 5, newarrtype, dest, tag, comm, ierr)

Using the derived type variable `foo` instead of its first basic type element `foo%i` may be impossible if the MPI library implements choice buffer arguments through overloading instead of using `TYPE(*), DIMENSION(..)`, or through a ~~non-standardized~~ ==nonstandardized== extension such as `!$PRAGMA IGNORE_TKR`; see [[versions/v40/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    type, BIND(C) :: mytype        integer :: i        real :: x        double precision :: d        logical :: l     end type mytype~~

~~    type(mytype) :: foo, fooarr(5)     integer :: blocklen(4), type(4)     integer(KIND=MPI_ADDRESS_KIND) :: disp(4), base, lb, extent~~

~~    call MPI_GET_ADDRESS(foo%i, disp(1), ierr)     call MPI_GET_ADDRESS(foo%x, disp(2), ierr)     call MPI_GET_ADDRESS(foo%d, disp(3), ierr)     call MPI_GET_ADDRESS(foo%l, disp(4), ierr)~~

~~    base = disp(1)     disp(1) = disp(1) - base     disp(2) = disp(2) - base     disp(3) = disp(3) - base     disp(4) = disp(4) - base~~

~~    blocklen(1) = 1     blocklen(2) = 1     blocklen(3) = 1     blocklen(4) = 1~~

~~    type(1) = MPI_INTEGER     type(2) = MPI_REAL     type(3) = MPI_DOUBLE_PRECISION     type(4) = MPI_LOGICAL~~

~~    call MPI_TYPE_CREATE_STRUCT(4, blocklen, disp, type, newtype, ierr)     call MPI_TYPE_COMMIT(newtype, ierr)~~

~~    call MPI_SEND(foo%i, 1, newtype, dest, tag, comm, ierr)     ! or     call MPI_SEND(foo, 1, newtype, dest, tag, comm, ierr)     ! expects that base == address(foo%i) == address(foo)~~

~~    call MPI_GET_ADDRESS(fooarr(1), disp(1), ierr)     call MPI_GET_ADDRESS(fooarr(2), disp(2), ierr)     extent = disp(2) - disp(1)     lb = 0     call MPI_TYPE_CREATE_RESIZED(newtype, lb, extent, newarrtype, ierr)     call MPI_TYPE_COMMIT(newarrtype, ierr)~~

~~    call MPI_SEND(fooarr, 5, newarrtype, dest, tag, comm, ierr)~~

==Fortran array of derived Fortran types: the struct MPI derived type should be resized.==

==(code block added)==
``` [MPI]Fortran
type, BIND(C) :: mytype
   integer :: i
   real :: x
   double precision :: d
   logical :: l
end type mytype

type(mytype) :: foo, fooarr(5)
integer :: blocklen(4), dtype(4)
integer(KIND=MPI_ADDRESS_KIND) :: disp(4), base, lb, extent

call MPI_GET_ADDRESS(foo%i, disp(1), ierr)
call MPI_GET_ADDRESS(foo%x, disp(2), ierr)
call MPI_GET_ADDRESS(foo%d, disp(3), ierr)
call MPI_GET_ADDRESS(foo%l, disp(4), ierr)

base = disp(1)
disp(1) = disp(1) - base
disp(2) = disp(2) - base
disp(3) = disp(3) - base
disp(4) = disp(4) - base

blocklen(1) = 1
blocklen(2) = 1
blocklen(3) = 1
blocklen(4) = 1

dtype(1) = MPI_INTEGER
dtype(2) = MPI_REAL
dtype(3) = MPI_DOUBLE_PRECISION
dtype(4) = MPI_LOGICAL

call MPI_TYPE_CREATE_STRUCT(4, blocklen, disp, dtype, newtype, ierr)
call MPI_TYPE_COMMIT(newtype, ierr)

call MPI_SEND(foo%i, 1, newtype, dest, tag, comm, ierr)
! or
call MPI_SEND(foo, 1, newtype, dest, tag, comm, ierr)
! expects that base == address(foo%i) == address(foo)

call MPI_GET_ADDRESS(fooarr(1), disp(1), ierr)
call MPI_GET_ADDRESS(fooarr(2), disp(2), ierr)
extent = disp(2) - disp(1)
lb = 0
call MPI_TYPE_CREATE_RESIZED(newtype, lb, extent, newarrtype, ierr)
call MPI_TYPE_COMMIT(newarrtype, ierr)

call MPI_SEND(fooarr, 5, newarrtype, dest, tag, comm, ierr)
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The following code fragment shows some possible ways to send scalars or arrays of interoperable derived types in Fortran. ~~The example~~ ==Example [[versions/v50/sections/binding#Fortran Derived Types|Fortran Derived Types]]== assumes that all data is passed by address.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Fortran Derived Types]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Fortran Derived Types]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Fortran Derived Types]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Fortran Derived Types]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Fortran Derived Types]]
