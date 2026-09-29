---
title: "Window That Allocates Shared Memory"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Window That Allocates Shared Memory

Chapter **one-side** · in [[versions/v30/sections/one-side#Window That Allocates Shared Memory|MPI-3.0]], [[versions/v31/sections/one-side#Window That Allocates Shared Memory|MPI-3.1]], [[versions/v40/sections/one-side#Window That Allocates Shared Memory|MPI-4.0]], [[versions/v41/sections/one-side#Window That Allocates Shared Memory|MPI-4.1]], [[versions/v50/sections/one-side#Window That Allocates Shared Memory|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~This is a collective call executed by all processes in the group of `comm`. On each process $`i`$, it allocates memory of at least `size` bytes that is shared among all processes in `comm`, and returns a pointer to the locally allocated segment in `baseptr` that can be used for load/store accesses on the calling process. The locally allocated memory can be the target of load/store accesses by remote processes; the base pointers for other processes can be queried using the function [[versions/v31/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . The call also returns a window object that can be used by all processes in `comm` to perform RMA operations. The size argument may be different at each process and `size = 0` is valid. It is the user’s responsibility to ensure that the communicator `comm` represents a group of processes that can create a shared memory segment that can be accessed by all processes in the group.~~

==This is a collective call executed by all processes in the group of `comm`. On each process==

==, it allocates memory of at least `size` bytes that is shared among all processes in `comm`, and returns a pointer to the locally allocated segment in `baseptr` that can be used for load/store accesses on the calling process. The locally allocated memory can be the target of load/store accesses by remote processes; the base pointers for other processes can be queried using the function [[versions/v31/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . The call also returns a window object that can be used by all processes in `comm` to perform RMA operations. The size argument may be different at each process and `size = 0` is valid. It is the user’s responsibility to ensure that the communicator `comm` represents a group of processes that can create a shared memory segment that can be accessed by all processes in the group.==

If the Fortran compiler provides `TYPE(C_PTR)`, then the following ==generic== interface must be provided in the `mpi` module and should be provided in `mpif.h` through overloading, i.e., with the same routine name as the routine with `INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`, but with a different ~~linker~~ ==specific procedure== name:

~~mmmmm̄mmmm̄mmm~~ INTERFACE ~~MPI_WIN_ALLOCATE_SHARED\~~ ==MPI_WIN_ALLOCATE_SHARED SUBROUTINE MPI_WIN_ALLOCATE_SHARED(SIZE, DISP_UNIT, INFO, COMM, & BASEPTR, WIN, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR END SUBROUTINE== SUBROUTINE MPI_WIN_ALLOCATE_SHARED_CPTR(SIZE, DISP_UNIT, INFO, COMM, ~~&\~~ ==&== BASEPTR, WIN, ~~IERROR)\~~ ==IERROR)== USE, INTRINSIC :: ISO_C_BINDING, ONLY : ~~C_PTR\~~ ==C_PTR IMPORT :: MPI_ADDRESS_KIND== INTEGER :: DISP_UNIT, INFO, COMM, WIN, ~~IERROR\~~ ==IERROR== INTEGER(KIND=MPI_ADDRESS_KIND) :: ~~SIZE\~~ ==SIZE== TYPE(C_PTR) :: ~~BASEPTR\~~ ==BASEPTR== END ~~SUBROUTINE\~~ ==SUBROUTINE== END INTERFACE

The ~~linker~~ ==base procedure== name ~~base~~ of this overloaded function is [[MPI_WIN_ALLOCATE_SHARED_CPTR]] . The implied ~~linker~~ ==specific procedure== names are described in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] .

The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v31/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , ~~[[MPI_WIN_ALLOC]]~~ ==[[versions/v31/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]]== , and [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . The additional info key `alloc_shared_noncontig` allows the library to optimize the layout of the shared memory segments in memory.

The consistency of load/store accesses from/to the shared memory as observed by the user program depends on the architecture. A consistent view can be created in the ~~unified~~ ==*unified== memory ~~model~~ ==model*== (see Section [[versions/v31/sections/one-side#Memory Model|Memory Model]] ) by utilizing the window synchronization functions (see Section [[versions/v31/sections/one-side#Synchronization Calls|Synchronization Calls]] ) or explicitly completing outstanding store accesses (e.g., by calling [[versions/v31/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] ). MPI does not define semantics for accessing shared memory windows in the ~~separate~~ ==*separate== memory ~~model.~~ ==model*.==

This function queries the process-local address for remote memory segments created with [[versions/v31/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] . This function can return different process-local addresses for the same physical memory on different processes. The returned memory can be used for load/store accesses subject to the constraints defined in Section [[versions/v31/sections/one-side#Semantics and Correctness|Semantics and Correctness]] . This function can only be called with windows of ~~type~~ ==flavor== `MPI_WIN_FLAVOR_SHARED`. If the passed window is not of flavor `MPI_WIN_FLAVOR_SHARED`, the error `MPI_ERR_RMA_FLAVOR` is raised. When `rank` is `MPI_PROC_NULL`, the pointer, `disp_unit`, and `size` returned are the pointer, `disp_unit`, and `size` of the memory segment belonging the lowest rank that specified `size` $`> 0`$. If all processes in the group attached to the window specified `size` $`= 0`$, then the call returns `size` $`= 0`$ and a `baseptr` as if [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] was called with `size` $`= 0`$.

If the Fortran compiler provides `TYPE(C_PTR)`, then the following ==generic== interface must be provided in the `mpi` module and should be provided in `mpif.h` through overloading, i.e., with the same routine name as the routine with `INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`, but with a different ~~linker~~ ==specific procedure== name:

~~mmmmm̄mmmm̄mmm~~ INTERFACE ~~MPI_WIN_SHARED_QUERY\~~ ==MPI_WIN_SHARED_QUERY SUBROUTINE MPI_WIN_SHARED_QUERY(WIN, RANK, SIZE, DISP_UNIT, & BASEPTR, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER WIN, RANK, DISP_UNIT, IERROR INTEGER (KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR END SUBROUTINE== SUBROUTINE MPI_WIN_SHARED_QUERY_CPTR(WIN, RANK, SIZE, DISP_UNIT, ~~&\~~ ==&== BASEPTR, ~~IERROR)\~~ ==IERROR)== USE, INTRINSIC :: ISO_C_BINDING, ONLY : ~~C_PTR\~~ ==C_PTR IMPORT :: MPI_ADDRESS_KIND== INTEGER :: WIN, RANK, DISP_UNIT, ~~IERROR\~~ ==IERROR== INTEGER(KIND=MPI_ADDRESS_KIND) :: ~~SIZE\~~ ==SIZE== TYPE(C_PTR) :: ~~BASEPTR\~~ ==BASEPTR== END ~~SUBROUTINE\~~ ==SUBROUTINE== END INTERFACE

The ~~linker~~ ==base procedure== name ~~base~~ of this overloaded function is [[MPI_WIN_SHARED_QUERY_CPTR]] . The implied ~~linker~~ ==specific procedure== names are described in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] .

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

, it allocates memory of at least `size` bytes that is shared among all processes in `comm`, and returns a pointer to the locally allocated segment in `baseptr` that can be used for load/store accesses on the calling process. The locally allocated memory can be the target of load/store accesses by remote processes; the base pointers for other processes can be queried using the function [[versions/v40/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . The call also returns a window object that can be used by all processes in `comm` to perform RMA operations. The size argument may be different at each process and ~~`size =~~ ==`size``=== 0` is valid. It is the user’s responsibility to ensure that the communicator `comm` represents a group of processes that can create a shared memory segment that can be accessed by all processes in the group.

INTERFACE MPI_WIN_ALLOCATE_SHARED SUBROUTINE MPI_WIN_ALLOCATE_SHARED(SIZE, DISP_UNIT, INFO, COMM, & BASEPTR, WIN, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER ==::== DISP_UNIT, INFO, COMM, WIN, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) ==::== SIZE, BASEPTR END SUBROUTINE SUBROUTINE MPI_WIN_ALLOCATE_SHARED_CPTR(SIZE, DISP_UNIT, INFO, COMM, & BASEPTR, WIN, IERROR) USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR IMPORT :: MPI_ADDRESS_KIND INTEGER :: DISP_UNIT, INFO, COMM, WIN, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE TYPE(C_PTR) :: BASEPTR END SUBROUTINE END INTERFACE

==For contiguous shared memory allocations, the default alignment requirements outlined for [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] and the `mpi_minimum_memory_alignment` `info` key apply to the start of the contiguous memory that is returned in `baseptr` to the first process with non-zero `size` argument. For noncontiguous memory allocations, the default alignment requirements and the `mpi_minimum_memory_alignment` `info` key apply to all processes with non-zero `size` argument.==

==> [!note] Advice to users==

==> If the `info` key `alloc_shared_noncontig` is not set to true (or ignored by the MPI implementation), the alignment of the memory returned in `baseptr` to all but the first process with non-zero `size` argument depends on the value of the `size` argument provided by other processes. It is thus the user’s responsibility to control the alignment of contiguous memory allocated for these processes by ensuring that each process provides a `size` argument that is an integral multiple of the alignment required for the application.==

INTERFACE MPI_WIN_SHARED_QUERY SUBROUTINE MPI_WIN_SHARED_QUERY(WIN, RANK, SIZE, DISP_UNIT, & BASEPTR, IERROR) IMPORT :: MPI_ADDRESS_KIND INTEGER ==::== WIN, RANK, DISP_UNIT, IERROR ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND) ::== SIZE, BASEPTR END SUBROUTINE SUBROUTINE MPI_WIN_SHARED_QUERY_CPTR(WIN, RANK, SIZE, DISP_UNIT, & BASEPTR, IERROR) USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR IMPORT :: MPI_ADDRESS_KIND INTEGER :: WIN, RANK, DISP_UNIT, IERROR INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE TYPE(C_PTR) :: BASEPTR END SUBROUTINE END INTERFACE

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

This ==procedure== is ~~a~~ collective ~~call executed by all processes in~~ ==over== the group of `comm`. On each ==MPI== process

, it allocates memory of at least `size` bytes that is shared among all ==MPI== processes in `comm`, and returns a pointer to the locally allocated segment in `baseptr` that can be used for load/store accesses on the calling ==MPI== process. The locally allocated memory can be the target of load/store accesses by remote ==MPI== processes; the base pointers for other ==MPI== processes can be queried using the function [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . The call also returns a ==handle to a new== window ~~object~~ that can be used by all ==MPI== processes in `comm` to perform RMA operations. The size argument may be different at each ==MPI== process and `size``= 0` is valid. It is the user’s responsibility to ensure that the communicator `comm` represents a group of ==MPI== processes that ==are in the same *shared memory domain*, i.e., that they== can create a ~~shared~~ ==*shared== memory ~~segment~~ ==segment*== that can be accessed by all processes in the group.

The discussions of rationales for [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v41/API/MPI_FREE_MEM|MPI_FREE_MEM]] in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] also apply to [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] ; in particular, see the rationale in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] for an explanation of the type used for `baseptr`. The allocated memory is ~~contiguous~~ ==*contiguous== across ~~process ranks~~ ==processes in rank order*== unless the info key `alloc_shared_noncontig` is specified. Contiguous across ~~process ranks~~ ==processes in rank order== means that the first address in the memory segment of ==MPI== process $`i`$ is consecutive with the last address in the memory segment of ==MPI== process $`i-1`$. This may enable the user to calculate remote address offsets with local information only.

If the Fortran compiler provides `TYPE(C_PTR)`, then the following generic interface must be provided in the `mpi` module and should be provided in ==the (deprecated)== `mpif.h` ==include file== through overloading, i.e., with the same routine name as the routine with ~~`INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`,~~ ==`ADDRESS` `BASEPTR`,== but with a different specific procedure name:

The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , and [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . The additional info key `alloc_shared_noncontig` allows the library to optimize the layout of the ~~shared~~ ==*shared== memory ~~segments~~ ==segments*== in memory.

> If the info key `alloc_shared_noncontig` is not set to true, the allocation strategy is to allocate ~~contiguous memory~~ ==*contiguous memory*== across ==MPI== process ranks. This may limit the performance on some architectures because it does not allow the implementation to modify the data layout (e.g., padding to reduce access latency).

> If the user sets the info key `alloc_shared_noncontig` to true, the implementation can allocate the memory requested by each ==MPI== process in a location that is close to this ==MPI== process. This can be achieved by padding or allocating memory in special memory segments. Both techniques may make the address space across consecutive ranks ~~noncontiguous.~~ ==*noncontiguous*.==

For ~~contiguous~~ ==*contiguous== shared ~~memory~~ ==memory*== allocations, the default alignment requirements outlined for [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] and the `mpi_minimum_memory_alignment` `info` key apply to the start of the ~~contiguous memory~~ ==*contiguous memory*== that is returned in `baseptr` to the first ==MPI== process with ~~non-zero~~ ==nonzero== `size` argument. For noncontiguous memory allocations, the default alignment requirements and the `mpi_minimum_memory_alignment` `info` key apply to all ==MPI== processes with ~~non-zero~~ ==nonzero== `size` argument.

> If the `info` key `alloc_shared_noncontig` is not set to true (or ignored by the MPI implementation), the alignment of the memory returned in `baseptr` to all but the first ==MPI== process with ~~non-zero~~ ==nonzero== `size` argument depends on the value of the `size` argument provided by other ==MPI== processes. It is thus the user’s responsibility to control the alignment of contiguous memory allocated for these ==MPI== processes by ensuring that each ==MPI== process provides a `size` argument that is an integral multiple of the alignment required for the application.

The consistency of load/store accesses from/to the shared memory as observed by the user program depends on the architecture. ~~A~~ ==For details on how to create a== consistent view ~~can be created in~~ ==see== the ~~*unified memory model* (see Section [[versions/v41/sections/one-side#Memory Model|Memory Model]] ) by utilizing the window synchronization functions (see Section [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] ) or explicitly completing outstanding store accesses (e.g., by calling [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] ). MPI does not define semantics for accessing shared memory windows in the *separate memory model*.~~ ==description of [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] .==

~~This function queries the process-local address for remote memory segments created with [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] . This function can return different process-local addresses for the same physical memory on different processes. The returned memory can be used for load/store accesses subject to the constraints defined in Section [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] . This function can only be called with windows of flavor `MPI_WIN_FLAVOR_SHARED`. If the passed window is not of flavor `MPI_WIN_FLAVOR_SHARED`, the error `MPI_ERR_RMA_FLAVOR` is raised. When `rank` is `MPI_PROC_NULL`, the pointer, `disp_unit`, and `size` returned are the pointer, `disp_unit`, and `size` of the memory segment belonging the lowest rank that specified `size` $`> 0`$. If all processes in the group attached to the window specified `size` $`= 0`$, then the call returns `size` $`= 0`$ and a `baseptr` as if [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] was called with `size` $`= 0`$.~~

~~If the Fortran compiler provides `TYPE(C_PTR)`, then the following generic interface must be provided in the `mpi` module and should be provided in `mpif.h` through overloading, i.e., with the same routine name as the routine with `INTEGER(KIND=MPI_ADDRESS_KIND) BASEPTR`, but with a different specific procedure name:~~

==This function queries the MPI process-local address for remote memory segments created with [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , and [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] . This function can return different MPI process-local addresses for the same physical memory when called by different MPI processes. The returned memory can be used for load/store accesses subject to the constraints defined in Section [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] . When `rank` is `MPI_PROC_NULL`, the `baseptr`, `disp_unit`, and `size` returned are the base, displacement unit, and size of the memory segment belonging to the MPI process with the lowest rank in the *shared memory domain* that specified `size``> 0`. If all MPI processes in the group attached to the window specified `size``= 0`, then the call returns `size``= 0` and a `baseptr` as if [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] was called with `size``= 0`.==

==Only [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] is guaranteed to allocate *shared memory*. Implementations are permitted, where possible, to provide *shared memory* for windows created with [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] and [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] . However, availability of *shared memory* is not guaranteed. When the remote memory segment corresponding to a particular process cannot be accessed directly, this call returns `size``= 0` and a `baseptr` as if [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] was called with `size``= 0`.==

==> [!tip] Rationale==

==> [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] may only be called on windows created by a call to [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , or [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] . The potential for multiple memory regions in windows created through [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] means that these windows cannot be used as input for [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] .==

==> [!note] Advice to users==

==> For windows allocated using [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] or [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , the group of MPI processes for which the implementation may provide shared memory can be determined using [[versions/v41/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] described in Section [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] .==

==The consistency of load/store accesses from/to the *shared memory* as observed by the user program depends on the architecture. A consistent view can be created in the *unified memory model* (see Section [[versions/v41/sections/one-side#Memory Model|Memory Model]] ) by utilizing the window synchronization functions (see Section [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] ) or explicitly completing outstanding store accesses (e.g., by calling [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] ). MPI does not define the semantics for accessing *shared window memory* in the *separate memory model*.==

==If the Fortran compiler provides `TYPE(C_PTR)`, then the following generic interface must be provided in the `mpi` module and should be provided in the (deprecated) `mpif.h` include file through overloading, i.e., with the same routine name as the routine with `ADDRESS` `BASEPTR`, but with a different specific procedure name:==

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~, it allocates memory of at least `size` bytes that is shared among all MPI processes in `comm`, and returns a pointer to the locally allocated segment in `baseptr` that can be used for load/store accesses on the calling MPI process. The locally allocated memory can be the target of load/store accesses by remote MPI processes; the base pointers for other MPI processes can be queried using the function [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . The call also returns a handle to a new window that can be used by all MPI processes in `comm` to perform RMA operations. The size argument may be different at each MPI process and `size``= 0` is valid. It is the user’s responsibility to ensure that the communicator `comm` represents a group of MPI processes that are in the same *shared memory domain*, i.e., that they can create a *shared memory segment* that can be accessed by all processes in the group.~~

~~The discussions of rationales for [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v50/API/MPI_FREE_MEM|MPI_FREE_MEM]] in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] also apply to [[versions/v50/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] ; in particular, see the rationale in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] for an explanation of the type used for `baseptr`. The allocated memory is *contiguous across processes in rank order* unless the info key `alloc_shared_noncontig` is specified. Contiguous across processes in rank order means that the first address in the memory segment of MPI process $`i`$ is consecutive with the last address in the memory segment of MPI process $`i-1`$. This may enable the user to calculate remote address offsets with local information only.~~

==, it allocates memory of at least `size` bytes that is shared among all MPI processes in `comm`, and returns a pointer to the locally allocated segment in `baseptr` that can be used for load/store accesses on the calling MPI process. The locally allocated memory can be the target of load/store accesses by remote MPI processes; the base pointers for other MPI processes can be queried using the function [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] . The call also returns a handle to a new window that can be used by all MPI processes in `comm` to perform RMA operations. The size argument may be different at each MPI process and `size``= 0` is valid. It is the user’s responsibility to ensure that the communicator `comm` represents a group of MPI processes that are in the same *shared memory domain*, i.e., that they can create a *shared memory segment* that can be accessed by all MPI processes in the group.==

==The discussions of rationales for [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[versions/v50/API/MPI_FREE_MEM|MPI_FREE_MEM]] in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] also apply to [[versions/v50/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] ; in particular, see the rationale in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] for an explanation of the type used for `baseptr`. The allocated memory is *contiguous across MPI processes in rank order* unless the info key `alloc_shared_noncontig` is specified. Contiguous across MPI processes in rank order means that the first address in the memory segment of MPI process $`i`$ is consecutive with the last address in the memory segment of MPI process $`i-1`$. This may enable the user to calculate remote address offsets with local information only.==

==The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v50/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , [[versions/v50/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , and [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . The additional info key `alloc_shared_noncontig` allows the library to optimize the layout of the *shared memory segments* in memory.==

==> [!note] Advice to users==

==> If the info key `alloc_shared_noncontig` is not set to `true`, the allocation strategy is to allocate *contiguous memory* across MPI process ranks. This may limit the performance on some architectures because it does not allow the implementation to modify the data layout (e.g., padding to reduce access latency).==

==> [!warning] Advice to implementors==

==> If the user sets the info key `alloc_shared_noncontig` to `true`, the implementation can allocate the memory requested by each MPI process in a location that is close to this MPI process. This can be achieved by padding or allocating memory in special memory segments. Both techniques may make the address space across consecutive ranks *noncontiguous*.==

==For *contiguous shared memory* allocations, the default alignment requirements outlined for [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] and the `mpi_minimum_memory_alignment` `info` key apply to the start of the *contiguous memory* that is returned in `baseptr` to the first MPI process with nonzero `size` argument. For noncontiguous memory allocations, the default alignment requirements and the `mpi_minimum_memory_alignment` `info` key apply to all MPI processes with nonzero `size` argument.==

==> [!note] Advice to users==

==> If the `info` key `alloc_shared_noncontig` is not set to `true` (or ignored by the MPI implementation), the alignment of the memory returned in `baseptr` to all but the first MPI process with nonzero `size` argument depends on the value of the `size` argument provided by other MPI processes. It is thus the user’s responsibility to control the alignment of contiguous memory allocated for these MPI processes by ensuring that each MPI process provides a `size` argument that is an integral multiple of the alignment required for the application.==

==The consistency of load/store accesses from/to the shared memory as observed by the user program depends on the architecture. For details on how to create a consistent view see the description of [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] .==

~~The `info` argument can be used to specify hints similar to the `info` argument for [[versions/v50/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , [[versions/v50/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , and [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . The additional info key `alloc_shared_noncontig` allows the library to optimize the layout of the *shared memory segments* in memory.~~

~~> [!note] Advice to users~~

~~> If the info key `alloc_shared_noncontig` is not set to true, the allocation strategy is to allocate *contiguous memory* across MPI process ranks. This may limit the performance on some architectures because it does not allow the implementation to modify the data layout (e.g., padding to reduce access latency).~~

~~> [!warning] Advice to implementors~~

~~> If the user sets the info key `alloc_shared_noncontig` to true, the implementation can allocate the memory requested by each MPI process in a location that is close to this MPI process. This can be achieved by padding or allocating memory in special memory segments. Both techniques may make the address space across consecutive ranks *noncontiguous*.~~

~~For *contiguous shared memory* allocations, the default alignment requirements outlined for [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] in Section [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] and the `mpi_minimum_memory_alignment` `info` key apply to the start of the *contiguous memory* that is returned in `baseptr` to the first MPI process with nonzero `size` argument. For noncontiguous memory allocations, the default alignment requirements and the `mpi_minimum_memory_alignment` `info` key apply to all MPI processes with nonzero `size` argument.~~

~~> [!note] Advice to users~~

~~> If the `info` key `alloc_shared_noncontig` is not set to true (or ignored by the MPI implementation), the alignment of the memory returned in `baseptr` to all but the first MPI process with nonzero `size` argument depends on the value of the `size` argument provided by other MPI processes. It is thus the user’s responsibility to control the alignment of contiguous memory allocated for these MPI processes by ensuring that each MPI process provides a `size` argument that is an integral multiple of the alignment required for the application.~~

~~The consistency of load/store accesses from/to the shared memory as observed by the user program depends on the architecture. For details on how to create a consistent view see the description of [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] .~~

Only [[versions/v50/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] is guaranteed to allocate *shared memory*. Implementations are permitted, where possible, to provide *shared memory* for windows created with [[versions/v50/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] and [[versions/v50/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] . However, availability of *shared memory* is not guaranteed. When the remote memory segment corresponding to a particular ==MPI== process cannot be accessed directly, this call returns `size``= 0` and a `baseptr` as if [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] was called with `size``= 0`.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Window That Allocates Shared Memory]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Window That Allocates Shared Memory]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Window That Allocates Shared Memory]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Window That Allocates Shared Memory]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Window That Allocates Shared Memory]]
