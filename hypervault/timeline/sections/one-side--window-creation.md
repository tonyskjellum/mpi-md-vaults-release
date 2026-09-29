---
title: "Window Creation"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Window Creation

Chapter **one-side** · in [[versions/v20/sections/one-side#Window Creation|MPI-2.0]], [[versions/v21/sections/one-side#Window Creation|MPI-2.1]], [[versions/v22/sections/one-side#Window Creation|MPI-2.2]], [[versions/v30/sections/one-side#Window Creation|MPI-3.0]], [[versions/v31/sections/one-side#Window Creation|MPI-3.1]], [[versions/v40/sections/one-side#Window Creation|MPI-4.0]], [[versions/v41/sections/one-side#Window Creation|MPI-4.1]], [[versions/v50/sections/one-side#Window Creation|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

> A window can be created in any part of the process memory. However, on some systems, the performance of windows in memory allocated by [[versions/v21/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] (Section ~~[[versions/v21/sections/misc#Memory~~ ==[[inquiry#Memory== Allocation|Memory Allocation]] , page ~~[[versions/v21/sections/misc#Memory~~ ==[[inquiry#Memory== Allocation|Memory Allocation]] ) will be better. Also, on some systems, performance is improved when window boundaries are aligned at “natural” boundaries (word, double-word, cache line, page frame, etc.).

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

> In cases where RMA operations use different mechanisms in different memory areas (e.g., load/store in a shared memory segment, and an asynchronous handler in private memory), the [[versions/v22/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] call needs to figure out which type of memory is used for the window. To do so, MPI maintains, internally, the list of memory segments allocated by [[versions/v22/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , or by other, implementation specific, mechanisms, together with information on the type of memory segment allocated. When a call to [[versions/v22/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] occurs, then MPI checks which segment contains each window, and decides, accordingly, which mechanism to use for RMA operations. > > Vendors may provide additional, implementation-specific mechanisms to ~~allow “good”~~ ==allocate or to specify== memory ~~to~~ ==regions that are preferable for use in one-sided communication. In particular, such mechanisms can== be used ~~for~~ ==to place== static ~~variables.~~ ==variables into such preferred regions.== > > Implementors should document any performance impact of window alignment.

Frees the window object `win` and returns a null handle (equal to ~~MPI_WIN_NULL).~~ ==`MPI_WIN_NULL`).== This is a collective call executed by all processes in the group associated with `win`. [[versions/v22/API/MPI_WIN_FREE|MPI_WIN_FREE]] can be invoked by a process only after it has completed its involvement in RMA communications on window `win`: i.e., the process has called [[versions/v22/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , or called [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] to match a previous call to [[versions/v22/API/MPI_WIN_POST|MPI_WIN_POST]] or called [[versions/v22/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] to match a previous call to `MPI_WIN_START` or called `MPI_WIN_UNLOCK` to match a previous call to `MPI_WIN_LOCK`. When the call returns, the window memory can be freed.

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~The initialization operation allows each process in an intracommunicator~~

~~group to specify, in a collective operation, a “window” in its memory that is made accessible to accesses by remote processes. The call returns an opaque object that represents the group of processes that own and access the set of windows, and the attributes of each window, as specified by the initialization call.~~

~~This is a collective call executed by all processes in the group of `comm`. It returns a window object that can be used by these processes to perform RMA operations. Each process specifies a window of existing memory that it exposes to RMA accesses by the processes in the group of `comm`. The window consists of `size` bytes, starting at address `base`. A process may elect to expose no memory by specifying `size = 0`.~~

==This is a collective call executed by all processes in the group of `comm`. It returns a window object that can be used by these processes to perform RMA operations. Each process specifies a window of existing memory that it exposes to RMA accesses by the processes in the group of `comm`. The window consists of `size` bytes, starting at address `base`.==

==In C, `base` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous’, see also Section [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] on page [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).==

==A process may elect to expose no memory by specifying `size = 0`.==

> The window size is specified using an ~~address sized~~ ==address-sized== integer, ~~so as~~ to allow windows that span more than 4 GB of address space. (Even if the physical memory size is less than 4 GB, the address range may be larger than 4 GB, if addresses are not contiguous.)

~~The `info` argument provides optimization hints to the runtime about the expected usage pattern of the window. The following info key is predefined:~~

~~`no_locks` — if set to `true`, then the implementation may assume that the local window is never locked (by a call to [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] ). This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this process.~~

~~The various processes in the group of `comm` may specify completely different target windows, in location, size, displacement units and info arguments. As long as all the get, put and accumulate accesses to a particular process fit their specific target window this should pose no problem. The same area in memory may appear in multiple windows, each associated with a different window object. However, concurrent communications to distinct, overlapping windows may lead to erroneous results.~~

==The `info` argument provides optimization hints to the runtime about the expected usage pattern of the window. The following info keys are predefined:==

==`no_locks` — if set to `true`, then the implementation may assume that passive target synchronization (i.e., [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[MPI_LOCK_ALL]] ) will not be used on the given window. This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this process.==

==`accumulate_ordering` — controls the ordering of accumulate operations at the target. See Section [[versions/v30/sections/one-side#Ordering|Ordering]] for details.==

==`accumulate_ops` — if set to `same_op`, the implementation will assume that all concurrent accumulate calls to the same target address will use the same operation. If set to `same_op_no_op`, then the implementation will assume that all concurrent accumulate calls to the same target address will use the same operation or `MPI_NO_OP`. This can eliminate the need to protect access for certain operation types where the hardware can guarantee atomicity. The default is `same_op_no_op`.==

==> [!note] Advice to users==

==> The info query mechanism described in Section [[versions/v30/sections/one-side#Window Info|Window Info]] can be used to query the specified info arguments windows that have been passed to a library. It is recommended that libraries check attached info keys for each passed window.==

==The various processes in the group of `comm` may specify completely different target windows, in location, size, displacement units, and info arguments. As long as all the get, put and accumulate accesses to a particular process fit their specific target window this should pose no problem. The same area in memory may appear in multiple windows, each associated with a different window object. However, concurrent communications to distinct, overlapping windows may lead to undefined results.==

==> [!tip] Rationale==

==> The reason for specifying the memory that may be accessed from another process in an RMA operation is to permit the programmer to specify what memory can be a target of RMA operations and for the implementation to enforce that specification. For example, with this definition, a server process can safely allow a client process to use RMA operations, knowing that (under the assumption that the MPI implementation does enforce the specified limits on the exposed memory) an error in the client cannot affect any memory other than what was explicitly exposed.==

~~> In cases where RMA operations use different mechanisms in different memory areas (e.g., load/store in a shared memory segment, and an asynchronous handler in private memory), the [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] call needs to figure out which type of memory is used for the window. To do so, MPI maintains, internally, the list of memory segments allocated by [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , or by other, implementation specific, mechanisms, together with information on the type of memory segment allocated. When a call to [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] occurs, then MPI checks which segment contains each window, and decides, accordingly, which mechanism to use for RMA operations. > > Vendors may provide additional, implementation-specific mechanisms to allocate or to specify memory regions that are preferable for use in one-sided communication. In particular, such mechanisms can be used to place static variables into such preferred regions. > > Implementors should document any performance impact of window alignment.~~

~~![[versions/v30/API/MPI_WIN_FREE]]~~

~~Frees the window object `win` and returns a null handle (equal to `MPI_WIN_NULL`). This is a collective call executed by all processes in the group associated with `win`. [[versions/v30/API/MPI_WIN_FREE|MPI_WIN_FREE]] can be invoked by a process only after it has completed its involvement in RMA communications on window `win`: i.e., the process has called [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , or called [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] to match a previous call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] or called [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] to match a previous call to `MPI_WIN_START` or called `MPI_WIN_UNLOCK` to match a previous call to `MPI_WIN_LOCK`. When the call returns, the window memory can be freed.~~

~~> [!warning] Advice to implementors~~

~~> [[versions/v30/API/MPI_WIN_FREE|MPI_WIN_FREE]] requires a barrier synchronization: no process can return from free until all processes in the group of `win` called free. This, to ensure that no process will attempt to access a remote window (e.g., with lock/unlock) after it was freed.~~

==> In cases where RMA operations use different mechanisms in different memory areas (e.g., load/store in a shared memory segment, and an asynchronous handler in private memory), the [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] call needs to figure out which type of memory is used for the window. To do so, MPI maintains, internally, the list of memory segments allocated by [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , or by other, implementation-specific, mechanisms, together with information on the type of memory segment allocated. When a call to [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] occurs, then MPI checks which segment contains each window, and decides, accordingly, which mechanism to use for RMA operations. > > Vendors may provide additional, implementation-specific mechanisms to allocate or to specify memory regions that are preferable for use in one-sided communication. In particular, such mechanisms can be used to place static variables into such preferred regions. > > Implementors should document any performance impact of window alignment.==

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~This is a collective call executed by all processes in the group of `comm`. It returns a window object that can be used by these processes to perform RMA operations. Each process specifies a window of existing memory that it exposes to RMA accesses by the processes in the group of `comm`. The window consists of `size` bytes, starting at address `base`.~~

~~In C, `base` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous’, see also Section [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] on page [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).~~

~~A process may elect to expose no memory by specifying `size = 0`.~~

==This is a collective call executed by all processes in the group of `comm`. It returns a window object that can be used by these processes to perform RMA operations. Each process specifies a window of existing memory that it exposes to RMA accesses by the processes in the group of `comm`. The window consists of `size` bytes, starting at address `base`. In C, `base` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ). A process may elect to expose no memory by specifying `size = 0`.==

> The window size is specified using an address-sized integer, ==rather than a basic integer type,== to allow windows that span more ==memory== than ~~4 GB of address space. (Even if the physical memory size is less than 4 GB, the address range may~~ ==can== be ~~larger than 4 GB, if addresses are not contiguous.)~~ ==described with a basic integer type.==

> Common choices for `disp_unit` are 1 (no scaling), and (in C syntax) `sizeof(type)`, for a window that consists of an array of elements of type `type`. The ~~later~~ ==latter== choice will allow one to use array indices in RMA calls, and have those scaled correctly to byte displacements, even in a heterogeneous environment.

`no_locks` — if set to `true`, then the implementation may assume that passive target synchronization (i.e., [[versions/v31/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , ~~[[MPI_LOCK_ALL]]~~ ==[[versions/v31/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]]== ) will not be used on the given window. This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this process.

==`same_size` — if set to `true`, then the implementation may assume that the argument `size` is identical on all processes, and that all processes have provided this info key with the same value.==

==`same_disp_unit` — if set to `true`, then the implementation may assume that the argument `disp_unit` is identical on all processes, and that all processes have provided this info key with the same value.==

> The info query mechanism described in Section [[versions/v31/sections/one-side#Window Info|Window Info]] can be used to query the specified info arguments ==for== windows that have been passed to a library. It is recommended that libraries check attached info keys for each passed window.

> A window can be created in any part of the process memory. However, on some systems, the performance of windows in memory allocated by [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] ~~(Section [[versions/v31/sections/inquiry#Memory Allocation|Memory Allocation]] , page~~ ==(== [[versions/v31/sections/inquiry#Memory Allocation|Memory Allocation]] ) will be better. Also, on some systems, performance is improved when window boundaries are aligned at “natural” boundaries (word, double-word, cache line, page frame, etc.).

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

This is a collective call executed by all processes in the group of `comm`. It returns a window object that can be used by these processes to perform RMA operations. Each process specifies a window of existing memory that it exposes to RMA accesses by the processes in the group of `comm`. The window consists of `size` bytes, starting at address `base`. In C, `base` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ). A process may elect to expose no memory by specifying ~~`size =~~ ==`size``=== 0`.

~~`no_locks` — if~~ ==`no_locks`—if== set to `true`, then the implementation may assume that passive target synchronization (i.e., [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v40/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] ) will not be used on the given window. This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this process.

~~`accumulate_ordering` — controls~~ ==`accumulate_ordering`—controls== the ordering of accumulate operations at the target. See Section [[versions/v40/sections/one-side#Ordering|Ordering]] for details.

~~`accumulate_ops` — if~~ ==`accumulate_ops`—if== set to `same_op`, the implementation will assume that all concurrent accumulate calls to the same target address will use the same operation. If set to `same_op_no_op`, then the implementation will assume that all concurrent accumulate calls to the same target address will use the same operation or `MPI_NO_OP`. This can eliminate the need to protect access for certain operation types where the hardware can guarantee atomicity. The default is `same_op_no_op`.

~~`same_size` — if~~ ==`same_size`—if== set to `true`, then the implementation may assume that the argument `size` is identical on all processes, and that all processes have provided this info key with the same value.

~~`same_disp_unit` — if~~ ==`same_disp_unit`—if== set to `true`, then the implementation may assume that the argument `disp_unit` is identical on all processes, and that all processes have provided this info key with the same value.

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

This ==procedure== is ~~a~~ collective ~~call executed by all processes in~~ ==over== the group of `comm`. It returns a ==handle to a== window ~~object~~ that can be used by ~~these~~ ==the MPI== processes ==in this group== to perform RMA operations. Each ==MPI== process specifies a window of existing memory that it exposes to RMA accesses by ~~the~~ ==any MPI== processes in the group of `comm`. The window consists of `size` bytes, starting at address `base`. In C, `base` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also [[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ). ~~A~~ ==An MPI== process may elect to expose no memory by specifying `size``= 0`.

~~`no_locks`—if set to `true`, then the implementation may assume that passive target synchronization (i.e., [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] ) will not be used on the given window. This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this process.~~

~~`accumulate_ordering`—controls the ordering of accumulate operations at the target. See Section [[versions/v41/sections/one-side#Ordering|Ordering]] for details.~~

~~`accumulate_ops`—if set to `same_op`, the implementation will assume that all concurrent accumulate calls to the same target address will use the same operation. If set to `same_op_no_op`, then the implementation will assume that all concurrent accumulate calls to the same target address will use the same operation or `MPI_NO_OP`. This can eliminate the need to protect access for certain operation types where the hardware can guarantee atomicity. The default is `same_op_no_op`.~~

~~`same_size`—if set to `true`, then the implementation may assume that the argument `size` is identical on all processes, and that all processes have provided this info key with the same value.~~

~~`same_disp_unit`—if set to `true`, then the implementation may assume that the argument `disp_unit` is identical on all processes, and that all processes have provided this info key with the same value.~~

==if set to `true`, then the implementation may assume that passive target synchronization (i.e., [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] ) will not be used on the given window. This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this process.==

==controls the ordering of accumulate operations at the target. See Section [[versions/v41/sections/one-side#Ordering|Ordering]] for details.==

==if set to `same_op`, the implementation will assume that all concurrent accumulate calls to the same target address will use the same operator. If set to `same_op_no_op`, then the implementation will assume that all concurrent accumulate calls to the same target address will use the same operator or `MPI_NO_OP`. This can eliminate the need to protect access for certain operators where the hardware can guarantee atomicity.==

==provides a hint to implementations about the desired synchronization granularity for accumulate operations, i.e., the size of memory ranges in bytes for which the implementation should acquire a synchronization primitive to ensure atomicity of updates. If the specified granularity is not divisible by the size of the type used in an accumulate operation, it should be treated as if it was the next multiple of the element size. For example, a granularity of `1` byte should be treated as `8` in an accumulate operation using `MPI_UINT64_T`. By default, this info key is set to `0`, which leaves the choice of synchronization granularity to the implementation. If specified, all MPI processes in the group of a window must supply the same value.==

==> [!note] Advice to users==

==> Small synchronization granularities may provide improved latencies for accumulate operations with few elements and potentially increase concurrency of updates, at the cost of lower throughput. For example, a value matching the size of a type involved in an accumulate operation may enable implementations to use atomic memory operations instead of mutual exclusion devices. Larger synchronization granularities may yield higher throughput of accumulate operation with large numbers of elements due to lower synchronization costs, potentially at the expense of higher latency for accumulate operations with few elements, e.g., if atomic memory operations are not employed. By dividing larger accumulate operations into smaller segments, concurrent accumulate operations to the same window memory may update different segments in parallel.==

==> [!warning] Advice to implementors==

==> Implementations are encouraged to avoid mutual exclusion devices in cases where the granularity is small enough to warrant the use of atomic memory operations. For larger granularities, implementations should use this info value as a hint to partition the window memory into zones of mutual exclusion to enable segmentation of large accumulate operations.==

==if set to `true`, then the implementation may assume that the argument `size` is identical on all MPI processes, and that all MPI processes have provided this info key with the same value.==

==if set to `true`, then the implementation may assume that the argument `disp_unit` is identical on all MPI processes, and that all MPI processes have provided this info key with the same value.==

==If set, the implementation may assume that the memory for all communication buffers passed to MPI operations performed by the calling MPI process on the given window will use only the memory allocation kinds listed in the value string. See Section [[versions/v41/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] . This info hint also applies to the window buffer provided in a call to [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] or [[versions/v41/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] . It does not apply to the memory allocated in a call to [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] or [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] .==

~~The various processes in the group of `comm` may specify completely different target windows, in location, size, displacement units, and info arguments. As long as all the get, put and accumulate accesses to a particular process fit their specific target window this should pose no problem. The same area in memory may appear in multiple windows, each associated with a different window object. However, concurrent communications to distinct, overlapping windows may lead to undefined results.~~

==The various MPI processes in the group of `comm` may specify completely different target windows, in location, size, displacement units, and info arguments. As long as all the get, put and accumulate accesses to a particular MPI process fit their specific target window this should pose no problem. The same area in memory may appear in multiple windows, each associated with a different window object. However, concurrent communications to distinct, overlapping windows may lead to undefined results.==

==Implementations may make the memory provided by the user available for load/store accesses by MPI processes in the same *shared memory domain*. A communicator of such processes can be constructed as described in Section [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] using [[versions/v41/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] . Pointers to access a *shared memory segment* can be queried using [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] .==

> The reason for specifying the memory that may be accessed from another ==MPI== process in an RMA operation is to permit the programmer to specify what memory can be a target of RMA operations and for the implementation to enforce that specification. For example, with this definition, a server ==MPI== process can safely allow a client ==MPI== process to use RMA operations, knowing that (under the assumption that the MPI implementation does enforce the specified limits on the exposed memory) an error in the client cannot affect any memory other than what was explicitly exposed.

> A window can be created in any part of the ==MPI== process memory. However, on some systems, the performance of windows in memory allocated by [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] ( [[versions/v41/sections/inquiry#Memory Allocation|Memory Allocation]] ) will be better. Also, on some systems, performance is improved when window boundaries are aligned at “natural” boundaries (word, double-word, cache line, page frame, etc.).

> In cases where RMA operations use different mechanisms in different memory areas (e.g., load/store ==accesses== in a ~~shared~~ ==*shared== memory ~~segment,~~ ==segment*,== and an asynchronous handler in private memory), the [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] call needs to figure out which type of memory is used for the window. To do so, MPI maintains, internally, the list of memory segments allocated by [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , or by other, implementation-specific, mechanisms, together with information on the type of memory segment allocated. When a call to [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] occurs, then MPI checks which segment contains each window, and decides, accordingly, which mechanism to use for RMA operations. > > Vendors may provide additional, implementation-specific mechanisms to allocate or to specify memory regions that are preferable for use in one-sided communication. In particular, such mechanisms can be used to place static variables into such preferred regions. > > Implementors should document any performance impact of window alignment.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

if set to `true`, then the implementation may assume that passive target synchronization (i.e., [[versions/v50/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v50/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] ) will not be used on the given window. This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this ==MPI== process.

Implementations may make the memory provided by the user available for load/store accesses by MPI processes in the same *shared memory domain*. A communicator of such ==MPI== processes can be constructed as described in Section [[versions/v50/sections/context#Communicator Constructors|Communicator Constructors]] using [[versions/v50/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] . Pointers to access a *shared memory segment* can be queried using [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] .

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Window Creation]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Window Creation]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Window Creation]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Window Creation]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Window Creation]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Window Creation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Window Creation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Window Creation]]
