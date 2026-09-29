---
title: "Window That Allocates Memory"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Window That Allocates Memory

Chapter **one-side** · in [[versions/v30/sections/one-side#Window That Allocates Memory|MPI-3.0]], [[versions/v31/sections/one-side#Window That Allocates Memory|MPI-3.1]], [[versions/v40/sections/one-side#Window That Allocates Memory|MPI-4.0]], [[versions/v41/sections/one-side#Window That Allocates Memory|MPI-4.1]], [[versions/v50/sections/one-side#Window That Allocates Memory|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

If the Fortran compiler provides `TYPE(C_PTR)`, then the following ==generic== interface must be provided in the `mpi` module and should be provided in `mpif.h` through overloading, i.e., with the same routine name as the routine with `INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`, but with a different ~~linker~~ ==specific procedure== name:

~~mmmmm̄mmmm̄mmm~~ INTERFACE ~~MPI_WIN_ALLOCATE\~~ ==MPI_WIN_ALLOCATE SUBROUTINE MPI_WIN_ALLOCATE(SIZE, DISP_UNIT, INFO, COMM, BASEPTR, & WIN, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR END SUBROUTINE== SUBROUTINE MPI_WIN_ALLOCATE_CPTR(SIZE, DISP_UNIT, INFO, COMM, BASEPTR, ~~&\~~ ==&== WIN, ~~IERROR)\~~ ==IERROR)== USE, INTRINSIC :: ISO_C_BINDING, ONLY : ~~C_PTR\~~ ==C_PTR IMPORT :: MPI_ADDRESS_KIND== INTEGER :: DISP_UNIT, INFO, COMM, WIN, ~~IERROR\~~ ==IERROR== INTEGER(KIND=MPI_ADDRESS_KIND) :: ~~SIZE\~~ ==SIZE== TYPE(C_PTR) :: ~~BASEPTR\~~ ==BASEPTR== END ~~SUBROUTINE\~~ ==SUBROUTINE== END INTERFACE

The ~~linker~~ ==base procedure== name ~~base~~ of this overloaded function is [[MPI_WIN_ALLOCATE_CPTR]] . The implied ~~linker~~ ==specific procedure== names are described in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] .

~~The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v31/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] and [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . The following info key is predefined:~~

~~`same_size` — if set to `true`, then the implementation may assume that the argument `size` is identical on all processes.~~

==The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v31/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] and [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] .==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

This is a collective call executed by all processes in the group of `comm`. On each process, it allocates memory of at least `size` bytes, returns a pointer to it, and returns a window object that can be used by all processes in `comm` to perform RMA operations. The returned memory consists of `size` bytes local to each process, starting at address `baseptr` and is associated with the window as if the user called [[versions/v40/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] on existing memory. The size argument may be different at each process and ~~`size =~~ ==`size``=== 0` is valid; however, a library might allocate and expose more memory in order to create a fast, globally symmetric allocation. The discussion of and rationales for [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v40/API/MPI_FREE_MEM|MPI_FREE_MEM]] in Section [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] also apply to [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] ; in particular, see the rationale in Section [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] for an explanation of the type used for `baseptr`.

INTERFACE MPI_WIN_ALLOCATE SUBROUTINE MPI_WIN_ALLOCATE(SIZE, DISP_UNIT, INFO, COMM, BASEPTR, & WIN, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER ==::== DISP_UNIT, INFO, COMM, WIN, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) ==::== SIZE, BASEPTR END SUBROUTINE SUBROUTINE MPI_WIN_ALLOCATE_CPTR(SIZE, DISP_UNIT, INFO, COMM, BASEPTR, & WIN, IERROR) USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR IMPORT :: MPI_ADDRESS_KIND INTEGER :: DISP_UNIT, INFO, COMM, WIN, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE TYPE(C_PTR) :: BASEPTR END SUBROUTINE END INTERFACE

==The default memory alignment requirements and the `mpi_minimum_memory_alignment` `info` key described for [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] apply to all processes with non-zero `size` argument.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

~~This is a collective call executed by all processes in the group of `comm`. On each process, it allocates memory of at least `size` bytes, returns a pointer to it, and returns a window object that can be used by all processes in `comm` to perform RMA operations. The returned memory consists of `size` bytes local to each process, starting at address `baseptr` and is associated with the window as if the user called [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] on existing memory. The size argument may be different at each process and `size``= 0` is valid; however, a library might allocate and expose more memory in order to create a fast, globally symmetric allocation. The discussion of and rationales for [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v41/API/MPI_FREE_MEM|MPI_FREE_MEM]] in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] also apply to [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] ; in particular, see the rationale in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] for an explanation of the type used for `baseptr`.~~

~~If the Fortran compiler provides `TYPE(C_PTR)`, then the following generic interface must be provided in the `mpi` module and should be provided in `mpif.h` through overloading, i.e., with the same routine name as the routine with `INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`, but with a different specific procedure name:~~

==This procedure is collective over the group of `comm`. On each MPI process, it allocates memory of at least `size` bytes and returns a pointer to it along with a handle to a new window that can be used by all MPI processes in the group of `comm` to perform RMA operations. The returned memory consists of `size` bytes local to each MPI process, starting at address `baseptr` and is associated with the window as if the user called [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] on existing memory. The size argument may be different at each MPI process and `size``= 0` is valid; however, a library might allocate and expose more memory in order to create a fast, globally symmetric allocation. The discussion of and rationales for [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v41/API/MPI_FREE_MEM|MPI_FREE_MEM]] in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] also apply to [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] ; in particular, see the rationale in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] for an explanation of the type used for `baseptr`.==

==Implementations may make allocated memory available for load/store accesses by MPI processes in the same *shared memory domain*. A communicator of such processes can be constructed as described in Section [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] using [[versions/v41/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] . Pointers to access a *shared memory segment* can be queried using [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . If *shared memory* is available it is not guaranteed to be *contiguous* (see Section [[versions/v41/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ).==

==If the Fortran compiler provides `TYPE(C_PTR)`, then the following generic interface must be provided in the `mpi` module and should be provided in the (deprecated) `mpif.h` include file through overloading, i.e., with the same routine name as the routine with `ADDRESS` `BASEPTR`, but with a different specific procedure name:==

> By allocating (potentially aligned) memory instead of allowing the user to pass in an arbitrary buffer, this call can improve the performance for systems with remote direct memory access. This also permits the collective allocation of memory and supports what is sometimes called the “symmetric allocation” model that can be more scalable (for example, the implementation can arrange to return an address for the allocated memory that is the same on all ==MPI== processes).

The default memory alignment requirements and the `mpi_minimum_memory_alignment` `info` key described for [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] apply to all ==MPI== processes with ~~non-zero~~ ==nonzero== `size` argument.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

~~Implementations may make allocated memory available for load/store accesses by MPI processes in the same *shared memory domain*. A communicator of such processes can be constructed as described in Section [[versions/v50/sections/context#Communicator Constructors|Communicator Constructors]] using [[versions/v50/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] . Pointers to access a *shared memory segment* can be queried using [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . If *shared memory* is available it is not guaranteed to be *contiguous* (see Section [[versions/v50/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ).~~

==Implementations may make allocated memory available for load/store accesses by MPI processes in the same *shared memory domain*. A communicator of such MPI processes can be constructed as described in Section [[versions/v50/sections/context#Communicator Constructors|Communicator Constructors]] using [[versions/v50/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] . Pointers to access a *shared memory segment* can be queried using [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . If *shared memory* is available it is not guaranteed to be *contiguous* (see Section [[versions/v50/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ).==

==The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v50/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] and [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] .==

==The default memory alignment requirements and the `mpi_minimum_memory_alignment` `info` key described for [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] apply to all MPI processes with nonzero `size` argument.==

~~The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v50/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] and [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] .~~

~~The default memory alignment requirements and the `mpi_minimum_memory_alignment` `info` key described for [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] apply to all MPI processes with nonzero `size` argument.~~

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Window That Allocates Memory]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Window That Allocates Memory]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Window That Allocates Memory]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Window That Allocates Memory]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Window That Allocates Memory]]
