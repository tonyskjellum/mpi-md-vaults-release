---
title: "Memory Allocation"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Memory Allocation

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Memory Allocation|MPI-2.1]], [[versions/v22/sections/inquiry#Memory Allocation|MPI-2.2]], [[versions/v30/sections/inquiry#Memory Allocation|MPI-3.0]], [[versions/v31/sections/inquiry#Memory Allocation|MPI-3.1]], [[versions/v40/sections/inquiry#Memory Allocation|MPI-4.0]], [[versions/v41/sections/inquiry#Memory Allocation|MPI-4.1]], [[versions/v50/sections/inquiry#Memory Allocation|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> The C and C++ bindings of [[versions/v22/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v22/API/MPI_FREE_MEM|MPI_FREE_MEM]] are similar to the bindings for the `malloc` and `free` C library calls: a call to `MPI_Alloc_mem(..., &base)` should be paired with a call to `MPI_Free_mem(base)` (one less level of indirection). Both arguments are declared to be of same type ~~void\*~~ ==`void*`== so as to facilitate type casting. > > The Fortran binding is consistent with the C and C++ bindings: the Fortran [[versions/v22/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] call returns in `baseptr` the (integer valued) address of the allocated memory. The `base` argument of [[versions/v22/API/MPI_FREE_MEM|MPI_FREE_MEM]] is a choice argument, which passes (a reference to) the variable stored at that location.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~In some systems, message-passing and remote-memory-access (RMA) operations run faster when accessing specially allocated memory (e.g., memory that is shared by the other processes in the communicating group on an SMP). MPI provides a mechanism for allocating and freeing such special memory. The use of such memory for message-passing or RMA is not mandatory, and this memory can be used without restrictions as any other dynamically allocated memory. However, implementations may restrict the use of the [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] functions to windows allocated in such memory (see Section [[versions/v30/sections/one-side#Lock|Lock]] .)~~

==In some systems, message-passing and remote-memory-access (RMA) operations run faster when accessing specially allocated memory (e.g., memory that is shared by the other processes in the communicating group on an SMP). MPI provides a mechanism for allocating and freeing such special memory. The use of such memory for message-passing or RMA is not mandatory, and this memory can be used without restrictions as any other dynamically allocated memory.==

==However, implementations may restrict the use of some RMA functionality as defined in Section [[versions/v30/sections/one-side#Lock|Lock]] .==

==If the Fortran compiler provides `TYPE(C_PTR)`, then the following interface must be provided in the `mpi` module and should be provided in `mpif.h` through overloading, i.e., with the same routine name as the routine with `INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`, but with a different linker name:==

==mmmmm̄mmm INTERFACE MPI_ALLOC_MEM\ SUBROUTINE MPI_ALLOC_MEM_CPTR(SIZE, INFO, BASEPTR, IERROR)\ USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR\ INTEGER :: INFO, IERROR\ INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE\ TYPE(C_PTR) :: BASEPTR\ END SUBROUTINE\ END INTERFACE==

==The linker name base of this overloaded function is [[MPI_ALLOC_MEM_CPTR]] . The implied linker names are described in Section [[versions/v30/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names and the Profiling Interface]] on page [[versions/v30/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names and the Profiling Interface]] .==

> The C ~~and C++~~ bindings of [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v30/API/MPI_FREE_MEM|MPI_FREE_MEM]] are similar to the bindings for the `malloc` and `free` C library calls: a call to `MPI_Alloc_mem(..., &base)` should be paired with a call to `MPI_Free_mem(base)` (one less level of indirection). Both arguments are declared to be of same type `void*` so as to facilitate type casting. ~~> >~~ The Fortran binding is consistent with the C ~~and C++~~ bindings: the Fortran [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] call returns in `baseptr` ==the `TYPE(C_PTR)` pointer or== the (integer valued) address of the allocated memory. The `base` argument of [[versions/v30/API/MPI_FREE_MEM|MPI_FREE_MEM]] is a choice argument, which passes (a reference to) the variable stored at that location.

~~ Example of use of [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with pointer support. We assume 4-byte `REAL`s, and assume that pointers are address-sized.~~

~~    REAL A     POINTER (P, A(100,100))   ! no memory is allocated     CALL MPI_ALLOC_MEM(4*100*100, MPI_INFO_NULL, P, IERR)     ! memory is allocated     ...     A(3,5) = 2.71;     ...     CALL MPI_FREE_MEM(A, IERR) ! memory is freed~~

~~Since standard Fortran does not support (C-like) pointers, this code is not Fortran 77 or Fortran 90 code. Some compilers (in particular, at the time of writing, g77 and Fortran compilers for Intel) do not support this code.~~

~~Same example, in C~~

~~    float  (* f)[100][100] ;     /* no memory is allocated */     MPI_Alloc_mem(sizeof(float)*100*100, MPI_INFO_NULL, &f);     /* memory allocated */     ...     (*f)[5][3] = 2.71;     ...     MPI_Free_mem(f);~~

== Example of use of [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with `TYPE(C_PTR)` pointers. We assume 4-byte `REAL`s.==

==      USE mpi_f08   !  or  USE mpi      (not guaranteed with INCLUDE 'mpif.h')       USE, INTRINSIC :: ISO_C_BINDING       TYPE(C_PTR) :: p       REAL, DIMENSION(:,:), POINTER :: a            ! no memory is allocated       INTEGER, DIMENSION(2) :: shape       INTEGER(KIND=MPI_ADDRESS_KIND) :: size        shape = (/100,100/)       size = 4 * shape(1) * shape(2)                ! assuming 4 bytes per REAL       CALL MPI_Alloc_mem(size,MPI_INFO_NULL,p,ierr) ! memory is allocated and       CALL C_F_POINTER(p, a, shape) ! intrinsic     ! now accessible via a(i,j)       ...                           ! in ISO_C_BINDING       a(3,5) = 2.71;       ...       CALL MPI_Free_mem(a, ierr)                    ! memory is freed==

== Example of use of [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with non-standard *Cray-pointers*. We assume 4-byte `REAL`s, and assume that these pointers are address-sized.==

==      REAL A       POINTER (P, A(100,100))   ! no memory is allocated       INTEGER(KIND=MPI_ADDRESS_KIND) SIZE       SIZE = 4*100*100        CALL MPI_ALLOC_MEM(SIZE, MPI_INFO_NULL, P, IERR)       ! memory is allocated       ...       A(3,5) = 2.71;       ...       CALL MPI_FREE_MEM(A, IERR) ! memory is freed==

==This code is not Fortran 77 or Fortran 90 code. Some compilers may not support this code or need a special option, e.g., the GNU gFortran compiler needs `-fcray-pointer`.==

==> [!warning] Advice to implementors==

==> Some compilers map Cray-pointers to address-sized integers, some to `TYPE(C_PTR)` pointers (e.g., Cray Fortran, version 7.3.3). From the user’s viewpoint, this mapping is irrelevant because Examples [[versions/v30/sections/inquiry#Memory Allocation|Memory Allocation]] should work correctly with an MPI-3.0 (or later) library if Cray-pointers are available.==

==Same example, in C.==

==      float  (* f)[100][100];       /* no memory is allocated */       MPI_Alloc_mem(sizeof(float)*100*100, MPI_INFO_NULL, &f);       /* memory allocated */       ...       (*f)[5][3] = 2.71;       ...       MPI_Free_mem(f);==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~In some systems, message-passing and remote-memory-access (RMA) operations run faster when accessing specially allocated memory (e.g., memory that is shared by the other processes in the communicating group on an SMP). MPI provides a mechanism for allocating and freeing such special memory. The use of such memory for message-passing or RMA is not mandatory, and this memory can be used without restrictions as any other dynamically allocated memory.~~

~~However, implementations may restrict the use of some RMA functionality as defined in Section [[versions/v31/sections/one-side#Lock|Lock]] .~~

==In some systems, message-passing and remote-memory-access (RMA) operations run faster when accessing specially allocated memory (e.g., memory that is shared by the other processes in the communicating group on an SMP). MPI provides a mechanism for allocating and freeing such special memory. The use of such memory for message-passing or RMA is not mandatory, and this memory can be used without restrictions as any other dynamically allocated memory. However, implementations may restrict the use of some RMA functionality as defined in Section [[versions/v31/sections/one-side#Lock|Lock]] .==

If the Fortran compiler provides `TYPE(C_PTR)`, then the following ==generic== interface must be provided in the `mpi` module and should be provided in `mpif.h` through overloading, i.e., with the same routine name as the routine with `INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`, but with a different ~~linker~~ ==specific procedure== name:

~~mmmmm̄mmm~~ INTERFACE ~~MPI_ALLOC_MEM\~~ ==MPI_ALLOC_MEM SUBROUTINE MPI_ALLOC_MEM(SIZE, INFO, BASEPTR, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER INFO, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR END SUBROUTINE== SUBROUTINE MPI_ALLOC_MEM_CPTR(SIZE, INFO, BASEPTR, ~~IERROR)\~~ ==IERROR)== USE, INTRINSIC :: ISO_C_BINDING, ONLY : ~~C_PTR\~~ ==C_PTR IMPORT :: MPI_ADDRESS_KIND== INTEGER :: INFO, ~~IERROR\~~ ==IERROR== INTEGER(KIND=MPI_ADDRESS_KIND) :: ~~SIZE\~~ ==SIZE== TYPE(C_PTR) :: ~~BASEPTR\~~ ==BASEPTR== END ~~SUBROUTINE\~~ ==SUBROUTINE== END INTERFACE

The ~~linker~~ ==base procedure== name ~~base~~ of this overloaded function is [[MPI_ALLOC_MEM_CPTR]] . The implied ~~linker~~ ==specific procedure== names are described in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] .

> The C bindings of [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v31/API/MPI_FREE_MEM|MPI_FREE_MEM]] are similar to the bindings for the `malloc` and `free` C library calls: a call to ~~`MPI_Alloc_mem(...,~~ ==`MPI_Alloc_mem(`$`...`$`,== &base)` should be paired with a call to `MPI_Free_mem(base)` (one less level of indirection). Both arguments are declared to be of same type `void*` so as to facilitate type casting. The Fortran binding is consistent with the C bindings: the Fortran [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] call returns in `baseptr` the `TYPE(C_PTR)` pointer or the (integer valued) address of the allocated memory. The `base` argument of [[versions/v31/API/MPI_FREE_MEM|MPI_FREE_MEM]] is a choice argument, which passes (a reference to) the variable stored at that location.

Example of use of [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with `TYPE(C_PTR)` pointers. We assume 4-byte `REAL`s.

USE mpi_f08 ! or USE mpi (not guaranteed with INCLUDE 'mpif.h') USE, INTRINSIC :: ISO_C_BINDING TYPE(C_PTR) :: p REAL, DIMENSION(:,:), POINTER :: a ! no memory is allocated INTEGER, DIMENSION(2) :: shape INTEGER(KIND=MPI_ADDRESS_KIND) :: size shape = (/100,100/) size = 4 * shape(1) * shape(2) ! assuming 4 bytes per REAL CALL MPI_Alloc_mem(size,MPI_INFO_NULL,p,ierr) ! memory is allocated and CALL C_F_POINTER(p, a, shape) ! intrinsic ! now accessible via a(i,j) ... ! in ISO_C_BINDING a(3,5) = 2.71; ... CALL MPI_Free_mem(a, ierr) ! memory is freed

Example of use of [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with non-standard *Cray-pointers*. We assume 4-byte `REAL`s, and assume that these pointers are address-sized.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

INTERFACE MPI_ALLOC_MEM SUBROUTINE MPI_ALLOC_MEM(SIZE, INFO, BASEPTR, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER ==::== INFO, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) ==::== SIZE, BASEPTR END SUBROUTINE SUBROUTINE MPI_ALLOC_MEM_CPTR(SIZE, INFO, BASEPTR, IERROR) USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR IMPORT :: MPI_ADDRESS_KIND INTEGER :: INFO, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE TYPE(C_PTR) :: BASEPTR END SUBROUTINE END INTERFACE

~~The `info` argument can be used to provide directives that control the desired location of the allocated memory. Such a directive does not affect the semantics of the call. Valid `info` values are implementation-dependent; a null directive value of `info = MPI_INFO_NULL` is always valid.~~

==By default, the allocated memory shall be aligned to at least the alignment required for load/store accesses of any datatype corresponding to a predefined MPI datatype.==

==The `info` argument may be used to specify a desired alternative minimum alignment in bytes for the allocated memory by setting the value of the key `mpi_minimum_memory_alignment` to an integral number equal to a power of two. An implementation may ignore values smaller than the default required alignment. The `info` argument can also be used to provide directives that control the desired location of the allocated memory. Such a directive does not affect the semantics of the call. The corresponding `info` values are implementation-dependent. A null directive value of `info``=``MPI_INFO_NULL` is always valid.==

USE mpi_f08 ! or USE mpi (not guaranteed with INCLUDE 'mpif.h') USE, INTRINSIC :: ISO_C_BINDING TYPE(C_PTR) :: p REAL, DIMENSION(:,:), POINTER :: a ! no memory is allocated INTEGER, DIMENSION(2) :: shape INTEGER(KIND=MPI_ADDRESS_KIND) :: size shape = (/100,100/) size = 4 * shape(1) * shape(2) ! assuming 4 bytes per REAL CALL MPI_Alloc_mem(size,MPI_INFO_NULL,p,ierr) ! memory is allocated and CALL C_F_POINTER(p, a, shape) ! intrinsic ! now accessible via a(i,j) ... ! in ISO_C_BINDING a(3,5) = ~~2.71;~~ ==2.71== ... CALL MPI_Free_mem(a, ierr) ! memory is freed

Example of use of [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with ~~non-standard~~ ==nonstandard== *Cray-pointers*. We assume 4-byte `REAL`s, and assume that these pointers are address-sized.

REAL A POINTER (P, A(100,100)) ! no memory is allocated INTEGER(KIND=MPI_ADDRESS_KIND) SIZE SIZE = 4*100*100 CALL MPI_ALLOC_MEM(SIZE, MPI_INFO_NULL, P, IERR) ! memory is allocated ... A(3,5) = ~~2.71;~~ ==2.71== ... CALL MPI_FREE_MEM(A, IERR) ! memory is freed

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

If the Fortran compiler provides `TYPE(C_PTR)`, then the following generic interface must be provided in the `mpi` module and should be provided in ==the (deprecated)== `mpif.h` ==include file== through overloading, i.e., with the same routine name as the routine with ~~`INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`,~~ ==`ADDRESS` `BASEPTR`,== but with a different specific procedure name:

The function [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] may ~~return~~ ==raise== an error ~~code~~ of class `MPI_ERR_NO_MEM` to indicate it failed because memory is exhausted.

The function [[versions/v41/API/MPI_FREE_MEM|MPI_FREE_MEM]] may ~~return~~ ==raise== an error ~~code~~ of class `MPI_ERR_BASE` to indicate an invalid base argument.

~~      USE mpi_f08   !  or  USE mpi      (not guaranteed with INCLUDE 'mpif.h')       USE, INTRINSIC :: ISO_C_BINDING       TYPE(C_PTR) :: p       REAL, DIMENSION(:,:), POINTER :: a            ! no memory is allocated       INTEGER, DIMENSION(2) :: shape       INTEGER(KIND=MPI_ADDRESS_KIND) :: size       shape = (/100,100/)       size = 4 * shape(1) * shape(2)                ! assuming 4 bytes per REAL       CALL MPI_Alloc_mem(size,MPI_INFO_NULL,p,ierr) ! memory is allocated and       CALL C_F_POINTER(p, a, shape) ! intrinsic     ! now accessible via a(i,j)       ...                           ! in ISO_C_BINDING       a(3,5) = 2.71       ...       CALL MPI_Free_mem(a, ierr)                    ! memory is freed~~

~~Example of use of [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with nonstandard *Cray-pointers*. We assume 4-byte `REAL`s, and assume that these pointers are address-sized.~~

~~      REAL A       POINTER (P, A(100,100))   ! no memory is allocated       INTEGER(KIND=MPI_ADDRESS_KIND) SIZE       SIZE = 4*100*100       CALL MPI_ALLOC_MEM(SIZE, MPI_INFO_NULL, P, IERR)       ! memory is allocated       ...       A(3,5) = 2.71       ...       CALL MPI_FREE_MEM(A, IERR) ! memory is freed~~

==    [language={[MPI08]Fortran},basicstyle=]     USE mpi_f08   !  or  USE mpi      (not guaranteed with INCLUDE 'mpif.h')     USE, INTRINSIC :: ISO_C_BINDING     TYPE(C_PTR) :: p     REAL, DIMENSION(:,:), POINTER :: a            ! no memory is allocated     INTEGER, DIMENSION(2) :: shape     INTEGER(KIND=MPI_ADDRESS_KIND) :: size     shape = (/100,100/)     size = 4 * shape(1) * shape(2)                ! assuming 4 bytes per REAL     CALL MPI_ALLOC_MEM(size,MPI_INFO_NULL,p,ierr) ! memory is allocated and     CALL C_F_POINTER(p, a, shape) ! intrinsic     ! now accessible via a(i,j)     ...                           ! in ISO_C_BINDING     a(3,5) = 2.71     ...     CALL MPI_FREE_MEM(a, ierr)                    ! memory is freed==

==Example of use of [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , in Fortran with nonstandard **Cray-pointers**. We assume 4-byte `REAL`s, and assume that these pointers are address-sized.==

==(code block added)==
``` [MPI]Fortran
REAL A
POINTER (P, A(100,100))   ! no memory is allocated
INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
SIZE = 4*100*100
CALL MPI_ALLOC_MEM(SIZE, MPI_INFO_NULL, P, IERR)
! memory is allocated
...
A(3,5) = 2.71
...
CALL MPI_FREE_MEM(A, IERR) ! memory is freed
```

~~      float  (* f)[100][100];       /* no memory is allocated */       MPI_Alloc_mem(sizeof(float)*100*100, MPI_INFO_NULL, &f);       /* memory allocated */       ...       (*f)[5][3] = 2.71;       ...       MPI_Free_mem(f);~~

==(code block added)==
``` [MPI]C
float  (* f)[100][100];
/* no memory is allocated */
MPI_Alloc_mem(sizeof(float)*100*100, MPI_INFO_NULL, &f);
/* memory allocated */
...
(*f)[5][3] = 2.71;
...
MPI_Free_mem(f);
```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

Example ~~of~~ use of [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] ~~,~~ in Fortran with `TYPE(C_PTR)` pointers. We assume 4-byte `REAL`s.

Example ~~of~~ use of [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] ~~,~~ in Fortran with nonstandard **Cray-pointers**. We assume 4-byte `REAL`s, and assume that these pointers are address-sized.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Memory Allocation]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Memory Allocation]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Memory Allocation]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Memory Allocation]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Memory Allocation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Memory Allocation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Memory Allocation]]
