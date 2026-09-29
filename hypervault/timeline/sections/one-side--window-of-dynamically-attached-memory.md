---
title: "Window of Dynamically Attached Memory"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Window of Dynamically Attached Memory

Chapter **one-side** · in [[versions/v30/sections/one-side#Window of Dynamically Attached Memory|MPI-3.0]], [[versions/v31/sections/one-side#Window of Dynamically Attached Memory|MPI-3.1]], [[versions/v40/sections/one-side#Window of Dynamically Attached Memory|MPI-4.0]], [[versions/v41/sections/one-side#Window of Dynamically Attached Memory|MPI-4.1]], [[versions/v50/sections/one-side#Window of Dynamically Attached Memory|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~The MPI-2 RMA model requires the user to identify the local memory that may be a target of RMA calls at the time the window is created. This has advantages for both the programmer (only this memory can be updated by one-sided operations and provides greater safety) and the MPI implementation (special steps may be taken to make one-sided access to such memory more efficient).~~

~~However, consider implementing a modifiable linked list using RMA operations; as new items are added to the list, memory must be allocated. In a C or C++ program, this memory is typically allocated using `malloc` or `new` respectively. In MPI-2 RMA, the programmer must create a window with a predefined amount of memory and then implement routines for allocating memory from within the window’s memory. In addition, there is no easy way to handle the situation where the predefined amount of memory turns out to be inadequate. To support this model, the routine [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] creates a window that makes it possible to expose memory without remote synchronization. It must be used in combination with the local routines [[versions/v31/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] and [[versions/v31/API/MPI_WIN_DETACH|MPI_WIN_DETACH]] .~~

==The MPI-2 RMA model requires the user to identify the local memory that may be a target of RMA calls at the time the window is created. This has advantages for both the programmer (only this memory can be updated by one-sided operations and provides greater safety) and the MPI implementation (special steps may be taken to make one-sided access to such memory more efficient). However, consider implementing a modifiable linked list using RMA operations; as new items are added to the list, memory must be allocated. In a C or C++ program, this memory is typically allocated using `malloc` or `new` respectively. In MPI-2 RMA, the programmer must create a window with a predefined amount of memory and then implement routines for allocating memory from within the window’s memory. In addition, there is no easy way to handle the situation where the predefined amount of memory turns out to be inadequate. To support this model, the routine [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] creates a window that makes it possible to expose memory without remote synchronization. It must be used in combination with the local routines [[versions/v31/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] and [[versions/v31/API/MPI_WIN_DETACH|MPI_WIN_DETACH]] .==

~~This is a collective call executed by all processes in the group of `comm`. It returns a window `win` without memory attached. Existing process memory can be attached as described below.~~

~~This routine returns a window object that can be used by these processes to perform RMA operations on attached memory.~~

~~Because this window has special properties, it will sometimes be referred to as a *dynamic* window.~~

==This is a collective call executed by all processes in the group of `comm`. It returns a window `win` without memory attached. Existing process memory can be attached as described below. This routine returns a window object that can be used by these processes to perform RMA operations on attached memory. Because this window has special properties, it will sometimes be referred to as a *dynamic* window.==

> Users are cautioned that displacement arithmetic can overflow in variables of type `MPI_Aint` and result in unexpected values on some platforms. ~~This issue may~~ ==The [[versions/v31/API/MPI_AINT_ADD|MPI_AINT_ADD]] and [[versions/v31/API/MPI_AINT_DIFF|MPI_AINT_DIFF]] functions can== be ~~addressed in a future version of MPI.~~ ==used to safely perform address arithmetic with `MPI_Aint` displacements.==

> In environments with heterogeneous data representations, care must be exercised in communicating addresses between processes. For example, it is possible that an address valid at the target process (for example, a 64-bit pointer) cannot be expressed as an address at the origin (for example, the origin uses 32-bit pointers). For this reason, a portable MPI implementation should ensure that the type `MPI_AINT` (see ~~Table [[versions/v31/sections/pt2pt#Message Data|Message Data]] on Page [[versions/v31/sections/pt2pt#Message Data|Message Data]] )~~ ==[[Table]] table:pttopt:datatypes:c_f)== is able to store addresses from any process.

Memory ~~in this window may not be used as~~ ==at== the target ~~of one-sided accesses in~~ ==cannot be accessed with== this window until ~~it is~~ ==that memory has been== attached using the function [[versions/v31/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] . That is, in addition to using [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] to create an MPI window, the user must use [[versions/v31/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] before any local memory may be the target of an MPI RMA operation. Only memory that is currently accessible may be attached.

Attaches a local memory region beginning at `base` for remote access within the given window. The memory region specified must not contain any part that is already attached to the window `win`, that is, attaching overlapping memory concurrently within the same window is erroneous. The argument `win` must be a window that was created with [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] . ==The local memory region attached to the window consists of `size` bytes, starting at address `base`. In C, `base` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).== Multiple (but non-overlapping) memory regions may be attached to the same window.

> Requiring that memory be explicitly attached before it is exposed to one-sided access by other processes can ~~significantly~~ ==> >== simplify implementations and improve performance. The ability to make memory available for RMA operations without requiring a collective [[versions/v31/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] call is needed for some one-sided programming models.

> Detaching memory may permit the implementation to make more efficient use of special memory or provide memory that may be needed by a subsequent [[versions/v31/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] . Users are encouraged to detach memory that is no longer needed. ~~> >~~ Memory should be detached before it is freed by the user.

### MPI-4.0 → MPI-4.1  (9 changed paragraphs)

The ~~MPI-2 RMA model requires~~ ==previously described window creation procedures require== the user to identify the local memory that may be a target of RMA calls at the time the window is created. This has advantages for both the programmer (only this memory can be updated by one-sided operations and provides greater safety) and the MPI implementation (special steps may be taken to make one-sided access to such memory more efficient). However, consider implementing a modifiable linked list using RMA operations; as new items are added to the list, memory must be allocated. In a C or C++ program, this memory is typically allocated using `malloc` or `new` respectively. ~~In MPI-2 RMA,~~ ==With the previously described window creation procedures,== the programmer must create a window with a predefined amount of memory and then implement routines for allocating memory from within the window’s memory. In addition, there is no easy way to handle the situation where the predefined amount of memory turns out to be inadequate. To support this model, the routine [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] creates a window that makes it possible to expose memory without remote synchronization. It must be used in combination with the local routines [[versions/v41/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] and [[versions/v41/API/MPI_WIN_DETACH|MPI_WIN_DETACH]] .

This ==procedure== is ~~a~~ collective ~~call executed by all processes in~~ ==over== the group of `comm`. It returns a window `win` without memory attached. Existing ==MPI== process memory can be attached as described below. This ~~routine~~ ==procedure== returns a ==handle to a new== window ~~object~~ that can be used by ~~these~~ ==MPI== processes ==in the group of `comm`== to perform RMA operations on attached memory. Because this window has special properties, it will sometimes be referred to as a ~~*dynamic*~~ ==**dynamic**== window.

In the case of a window created with [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , the `target_disp` for all RMA functions is the address at the target; i.e., the effective `window_base` is `MPI_BOTTOM` and the `disp_unit` is one. For dynamic windows, the `target_disp` argument to RMA communication operations is not restricted to ~~non-negative~~ ==nonnegative== values. Users should use [[versions/v41/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] at the target process to determine the address of a target memory location and communicate this address to the origin process.

> In environments with heterogeneous data representations, care must be exercised in communicating addresses between ==MPI== processes. For example, it is possible that an address valid at the target ==MPI== process (for example, a 64-bit pointer) cannot be expressed as an address at the origin (for example, the origin uses 32-bit pointers). For this reason, a portable MPI implementation should ensure that the type `MPI_AINT` (see [[Table]] table:pttopt:datatypes:c_f) is able to store addresses from any ==MPI== process.

Attaches a local memory region beginning at `base` for remote access within the given window. The memory region specified must not contain any part that is already attached to the window `win`, that is, attaching overlapping memory concurrently within the same window is erroneous. The argument `win` must be a window that was created with [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] . The local memory region attached to the window consists of `size` bytes, starting at address `base`. In C, `base` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see [[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ). Multiple (but ~~non-overlapping)~~ ==nonoverlapping)== memory regions may be attached to the same window.

> Requiring that memory be explicitly attached before it is exposed to one-sided access by other ==MPI== processes can > > simplify implementations and improve performance. The ability to make memory available for RMA operations without requiring a collective [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] call is needed for some one-sided programming models.

> Attaching memory to a window may require the use of scarce resources; thus, attaching large regions of memory is not recommended in portable programs. Attaching memory to a window may fail if sufficient resources are not available; this is similar to the behavior of [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] . > > The user is also responsible for ensuring that [[versions/v41/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] at the target has returned before ~~a~~ ==an MPI== process attempts to target that memory with an MPI RMA ~~call.~~ ==operation.== > > Performing an RMA operation ~~to~~ ==on== memory that has not been attached to a window created with [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] is erroneous.

~~Attaching memory~~ ==[[versions/v41/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]]== is a local ~~operation as defined by MPI, which means~~ ==procedure== that ~~the call~~ is not ~~collective and completes without requiring any MPI routine to be called in any other process.~~ ==collective.==

Memory may be detached with the ~~routine~~ ==procedure== [[versions/v41/API/MPI_WIN_DETACH|MPI_WIN_DETACH]] . After memory has been detached, it may not be the target of an MPI RMA operation on that window (unless the memory is re-attached with [[versions/v41/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] ).

Detaches a previously attached memory region beginning at `base`. The arguments `base` and `win` must match the arguments passed to a previous call to [[versions/v41/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] . ==[[versions/v41/API/MPI_WIN_DETACH|MPI_WIN_DETACH]] is a local procedure that is not collective.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Window of Dynamically Attached Memory]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Window of Dynamically Attached Memory]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Window of Dynamically Attached Memory]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Window of Dynamically Attached Memory]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Window of Dynamically Attached Memory]]
