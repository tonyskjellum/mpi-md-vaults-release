---
title: "Buffer Allocation and Usage"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Buffer Allocation and Usage

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Buffer allocation and usage|MPI-1.3]], [[versions/v21/sections/pt2pt#Buffer Allocation and Usage|MPI-2.1]], [[versions/v22/sections/pt2pt#Buffer Allocation and Usage|MPI-2.2]], [[versions/v30/sections/pt2pt#Buffer Allocation and Usage|MPI-3.0]], [[versions/v31/sections/pt2pt#Buffer Allocation and Usage|MPI-3.1]], [[versions/v40/sections/pt2pt#Buffer Allocation and Usage|MPI-4.0]], [[versions/v41/sections/pt2pt#Buffer Allocation and Usage|MPI-4.1]], [[versions/v50/sections/pt2pt#Buffer Allocation and Usage|MPI-5.0]]

Heading by release: MPI-1.3: “Buffer allocation and usage”; MPI-2.1: “Buffer Allocation and Usage”; MPI-2.2: “Buffer Allocation and Usage”; MPI-3.0: “Buffer Allocation and Usage”; MPI-3.1: “Buffer Allocation and Usage”; MPI-4.0: “Buffer Allocation and Usage”; MPI-4.1: “Buffer Allocation and Usage”; MPI-5.0: “Buffer Allocation and Usage”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

> Both arguments are defined to be of type void\* (rather than void\* and void\*\*, respectively), so as to avoid complex type casts. E.g., in the last example, `&buff`, which is of type char\*\*, can be passed as argument to ~~[[versions/v21/API/MPI_BUFFER_DETACH|MPI_Buffer_detach]]~~ ==`MPI_Buffer_detach`== without type casting. If the formal parameter had type void\*\* then we would need a type cast before and after the call.

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

#define BUFFSIZE 10000 int ~~size~~ ==size;== char *buff; MPI_Buffer_attach( malloc(BUFFSIZE), BUFFSIZE); /* a buffer of 10000 bytes can now be used by MPI_Bsend */ MPI_Buffer_detach( &buff, &size); /* Buffer size reduced to zero */ MPI_Buffer_attach( buff, size); /* Buffer of 10000 bytes available again */

> Even though the C functions `MPI_Buffer_attach` and `MPI_Buffer_detach` both have a first argument of type ~~void\*,~~ ==`void*`,== these arguments are used differently: A pointer to the buffer is passed to `MPI_Buffer_attach`; the address of the pointer is passed to `MPI_Buffer_detach`, so that this call can return the pointer value.

> Both arguments are defined to be of type ~~void\*~~ ==`void*`== (rather than ~~void\*~~ ==`void*`== and ~~void\*\*,~~ ==`void**`,== respectively), so as to avoid complex type casts. E.g., in the last example, `&buff`, which is of type ~~char\*\*,~~ ==`char**`,== can be passed as argument to `MPI_Buffer_detach` without type casting. If the formal parameter had type ~~void\*\*~~ ==`void**`== then we would need a type cast before and after the call.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

==In C, `buffer` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also Section [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] on page [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).==

> Even though the C functions `MPI_Buffer_attach` and `MPI_Buffer_detach` both have a first argument of type `void*`, these arguments are used differently: A pointer to the buffer is passed to `MPI_Buffer_attach`; the address of the pointer is passed to `MPI_Buffer_detach`, so that this call can return the pointer value. ==> > In Fortran with the `mpi` module or `mpif.h`, the type of the `buffer_addr` argument is wrongly defined and the argument is therefore unused. In Fortran with the `mpi_f08` module, the address of the buffer is returned as `TYPE(C_PTR)`, see also Example [[versions/v30/sections/inquiry#Memory Allocation|Memory Allocation]] on page [[versions/v30/sections/inquiry#Memory Allocation|Memory Allocation]] about the use of `C_PTR` pointers.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~Provides to MPI a buffer in the user’s memory to be used for buffering outgoing messages. The buffer is used only by messages sent in buffered mode. Only one buffer can be attached to a process at a time.~~

~~In C, `buffer` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also Section [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] on page [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).~~

==Provides to MPI a buffer in the user’s memory to be used for buffering outgoing messages. The buffer is used only by messages sent in buffered mode. Only one buffer can be attached to a process at a time. In C, `buffer` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).==

~~Z Calls to attach and detach buffers.~~

==Z==

==Calls to attach and detach buffers.==

> Even though the C functions `MPI_Buffer_attach` and `MPI_Buffer_detach` both have a first argument of type `void*`, these arguments are used differently: A pointer to the buffer is passed to `MPI_Buffer_attach`; the address of the pointer is passed to `MPI_Buffer_detach`, so that this call can return the pointer value. ~~> >~~ In Fortran with the `mpi` module or `mpif.h`, the type of the `buffer_addr` argument is wrongly defined and the argument is therefore unused. In Fortran with the `mpi_f08` module, the address of the buffer is returned as `TYPE(C_PTR)`, see also ~~Example [[versions/v31/sections/inquiry#Memory Allocation|Memory Allocation]] on page [[versions/v31/sections/inquiry#Memory Allocation|Memory Allocation]]~~ ==[[Example]] ex:1side-fmalloc-ptr== about the use of `C_PTR` pointers.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~Detach the buffer currently associated with MPI. The call returns the address and the size of the detached buffer. This operation will block until all messages currently in the buffer have been transmitted. Upon return of this function, the user may reuse or deallocate the space taken by the buffer.~~

==Detach the buffer currently associated with MPI. The call returns the address and the size of the detached buffer. This procedure will block until all messages currently in the buffer have been transmitted. Upon return of this function, the user may reuse or deallocate the space taken by the buffer.==

==If the size of the detached buffer cannot be represented in `size`, it is set to `MPI_UNDEFINED`.==

#define BUFFSIZE 10000 int size; char *buff; ~~MPI_Buffer_attach( malloc(BUFFSIZE),~~ ==MPI_Buffer_attach(malloc(BUFFSIZE),== BUFFSIZE); /* a buffer of 10000 bytes can now be used by MPI_Bsend */ ~~MPI_Buffer_detach( &buff,~~ ==MPI_Buffer_detach(&buff,== &size); /* Buffer size reduced to zero */ ~~MPI_Buffer_attach( buff,~~ ==MPI_Buffer_attach(buff,== size); /* Buffer of 10000 bytes available again */

### MPI-4.0 → MPI-4.1  (8 changed paragraphs)

~~A user may specify a buffer to be used for buffering messages sent in buffered mode. Buffering is done by the sender.~~

==A user may specify up to one buffer per communicator, up to one buffer per session, and up to one buffer per MPI process to be used for buffering messages sent in buffered mode. Buffering is done by the sender.==

==![[versions/v41/API/MPI_COMM_ATTACH_BUFFER]]==

==Provides to MPI a communicator-specific buffer in memory. This is to be used for buffering outgoing messages sent when a buffered mode send is started that uses the communicator `comm`.==

==If `MPI_BUFFER_AUTOMATIC` is passed as the argument `buffer`, no explicit buffer is attached; rather, automatic buffering is enabled for all buffered mode communication associated with the communicator `comm` (see Section [[versions/v41/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] ). Further, if `MPI_BUFFER_AUTOMATIC` is passed as the argument `buffer`, the value of `size` is irrelevant. Note that in Fortran `MPI_BUFFER_AUTOMATIC` is an object like `MPI_BOTTOM` (not usable for initialization or assignment), see Section [[versions/v41/sections/terms#Named Constants|Named Constants]] .==

==![[versions/v41/API/MPI_SESSION_ATTACH_BUFFER]]==

==Provides to MPI a session-specific buffer in memory. This buffer is to be used for buffering outgoing messages sent when using a communicator that is created from a group that is derived from the session `session`. However, if there is a communicator-specific buffer attached to the particular communicator at the time of the buffered mode send is started, that buffer is used.==

==If `MPI_BUFFER_AUTOMATIC` is passed as the argument `buffer`, no explicit buffer is attached; rather, automatic buffering is enabled for all buffered mode communication associated with the session `session` that is not explicitly covered by a buffer provided at communicator level (see Section [[versions/v41/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] ). Further, if `MPI_BUFFER_AUTOMATIC` is passed as the argument `buffer`, the value of `size` is irrelevant. Note that in Fortran `MPI_BUFFER_AUTOMATIC` is an object like `MPI_BOTTOM` (not usable for initialization or assignment), see Section [[versions/v41/sections/terms#Named Constants|Named Constants]] .==

~~Provides to MPI a buffer in the user’s memory to be used for buffering outgoing messages. The buffer is used only by messages sent in buffered mode. Only one buffer can be attached to a process at a time. In C, `buffer` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also [[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).~~

==Provides to MPI an MPI process-specific buffer in memory. This buffer is to be used for buffering outgoing messages sent when using a communicator to which no communicator-specific buffer is attached or which is derived from a session to which no session-specific buffer is attached at the time the buffered mode send is started.==

==If `MPI_BUFFER_AUTOMATIC` is passed as the argument `buffer`, no explicit buffer is attached; rather, automatic buffering is enabled for all buffered mode communication not explicitly covered by a buffer provided at session or communicator level (see Section [[versions/v41/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] ). Further, if `MPI_BUFFER_AUTOMATIC` is passed as the argument `buffer`, the value of `size` is irrelevant. Note that in Fortran `MPI_BUFFER_AUTOMATIC` is an object like `MPI_BOTTOM` (not usable for initialization or assignment), see Section [[versions/v41/sections/terms#Named Constants|Named Constants]] .==

==> [!note] Advice to users==

==> The use of a global shared buffer can be problematic when used for communication in different libraries, as the buffer represents a shared resource used for all buffered mode communication. Further, with the introduction of the Sessions Model, the use of a single shared buffer violates the concept of resource isolation that is intended with MPI Sessions. It is therefore recommended, especially for libraries and programs using the Sessions Model, to use only communicator-specific or session-specific buffers.==

==Any of these buffers are used only for messages sent in buffered mode. Only one MPI process-specific buffer can be attached to an MPI process at a time, only one session-specific buffer can be attached to a session at a time and only one communicator-specific buffer can be attached to a communicator at a time.==

==If automatic buffering is enabled at any level, no other buffer can be attached at that level.==

==A particular memory region can only be used in one buffer; reusing buffer space for multiple sessions, communicators and/or the global buffer is erroneous. Further, only one buffer is used for any one communication following the rules above; buffer space is not combined, even if two buffers are directly or indirectly provided to a communicator to be used for buffered sends.==

==In C, `buffer` is the starting address of a memory region. In Fortran, one can pass the first element of a memory region or a whole array, which must be ‘simply contiguous’ (for ‘simply contiguous,’ see also [[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] ).==

==![[versions/v41/API/MPI_COMM_DETACH_BUFFER]]==

==Detach the communicator-specific buffer currently attached to the communicator.==

==![[versions/v41/API/MPI_SESSION_DETACH_BUFFER]]==

==Detach the session-specific buffer currently attached to the session.==

~~Detach the buffer currently associated with MPI. The call returns the address and the size of the detached buffer. This procedure will block until all messages currently in the buffer have been transmitted. Upon return of this function, the user may reuse or deallocate the space taken by the buffer.~~

==Detach the MPI process-specific buffer buffer currently attached to MPI.==

==The procedure calls return the address and the size of the detached buffer. If `MPI_BUFFER_AUTOMATIC` was used in the corresponding attach procedure, then `MPI_BUFFER_AUTOMATIC` is also returned in the detach procedure and the value returned in argument `size` is undefined. In this case, automatic buffering is disabled upon return from the detach procedure. When using Fortran `mpi_f08`, the returned value is identical to `c_loc(MPI_BUFFER_AUTOMATIC)`. Note that `c_loc()` is an intrinsic in the Fortran `ISO_C_BINDING` module.==

==> [!warning] Advice to implementors==

==> In Fortran, the implementation of `MPI_BUFFER_AUTOMATIC` must allow the intrinsic `c_loc` to be applied to it.==

==These procedures will delay their return until all messages currently in the (explicit or automatic) buffer have been transmitted. Upon return of these procedures, the user may reuse or deallocate the space taken by the buffer.==

==The following `MPI_XXX_FLUSH_BUFFER` procedures will not return until all messages currently in the buffer have been transmitted without detaching the buffer.==

==> [!tip] Rationale==

==> These flush procedures provide the same functionality as an atomic combination of first detaching the buffer and then attaching it again (but without having to actually execute the detaching and the re-attaching of the buffer), but they may be implemented with less internal overhead.==

==![[versions/v41/API/MPI_COMM_FLUSH_BUFFER]]==

==[[versions/v41/API/MPI_COMM_FLUSH_BUFFER|MPI_COMM_FLUSH_BUFFER]] will not return until all messages currently in the communicator-/specific buffer of the calling MPI process have been transmitted.==

==![[versions/v41/API/MPI_SESSION_FLUSH_BUFFER]]==

==[[versions/v41/API/MPI_SESSION_FLUSH_BUFFER|MPI_SESSION_FLUSH_BUFFER]] will not return until all messages currently in the session-specific buffer of the calling MPI process have been transmitted.==

==![[versions/v41/API/MPI_BUFFER_FLUSH]]==

==[[versions/v41/API/MPI_BUFFER_FLUSH|MPI_BUFFER_FLUSH]] will not return until all messages currently in the MPI process-specific buffer of the calling MPI process have been transmitted.==

==For all `MPI_XXX_FLUSH_BUFFER` procedures, there also exist the following nonblocking variants, which start the respective flush operation. These operations will not complete until all messages currently in the respective buffer of the calling MPI process have been transmitted.==

==![[versions/v41/API/MPI_COMM_IFLUSH_BUFFER]]==

==![[versions/v41/API/MPI_SESSION_IFLUSH_BUFFER]]==

==![[versions/v41/API/MPI_BUFFER_IFLUSH]]==

~~    #define BUFFSIZE 10000     int size;     char *buff;     MPI_Buffer_attach(malloc(BUFFSIZE), BUFFSIZE);     /* a buffer of 10000 bytes can now be used by MPI_Bsend */     MPI_Buffer_detach(&buff, &size);     /* Buffer size reduced to zero */     MPI_Buffer_attach(buff, size);     /* Buffer of 10000 bytes available again */~~

==(code block added)==
``` [MPI]C
#define BUFFSIZE 10000+MPI_BSEND_OVERHEAD
int size;
char *buff;
MPI_Buffer_attach(malloc(BUFFSIZE), BUFFSIZE);
/* a buffer of 10000 bytes can now be used by MPI_Bsend */
/* on all communicators, assuming only one message at a time is sent */
MPI_Buffer_detach(&buff, &size);
/* Buffer size reduced to zero */
MPI_Buffer_attach(buff, size);
/* Buffer of 10000 bytes available again */
```

==Calls to attach and detach communicator-specific buffers.==

==(code block added)==
``` [MPI]C
#define BUFFSIZE1 10000+MPI_BSEND_OVERHEAD
#define BUFFSIZE2 20000+MPI_BSEND_OVERHEAD
int size;
char *buff1, *buff2;
MPI_Comm world_dup;
MPI_Comm_dup(MPI_COMM_WORLD, &world_dup);
MPI_Comm_attach_buffer(MPI_COMM_WORLD, malloc(BUFFSIZE2), BUFFSIZE2);
MPI_Buffer_attach(malloc(BUFFSIZE1), BUFFSIZE1);
/* a buffer of 20000 bytes can now be used by MPI_Bsend for */
/* communication using MPI_COMM_WORLD,  assuming only one message */
/* at a time is sent a buffer of 10000 bytes can now be used by */
/* MPI_Bsend for communication using any other communicator, */
/* including world_dup assuming only one message at a time is sent */
MPI_Comm_detach_buffer(MPI_COMM_WORLD, &buff1, &size);
MPI_Buffer_detach(&buff2, &size);
/* Both buffers are detached and no specific or MPI process-specific */
/* buffer can be used for further MPI_Bsend */
```

> Even though the C ~~functions `MPI_Buffer_attach`~~ ==procedures `MPI_Buffer_attach`, `MPI_Session_attach_buffer`, `MPI_Comm_attach_buffer`, `MPI_Buffer_detach`, `MPI_Session_detach_buffer`== and ~~`MPI_Buffer_detach` both~~ ==`MPI_Comm_detach_buffer`== have ~~a first~~ ==an== argument of type `void*`, these arguments are used differently: ~~A~~ ==a== pointer to the buffer is passed to ~~`MPI_Buffer_attach`;~~ ==`MPI_Buffer_attach`, `MPI_Session_attach_buffer` and `MPI_Comm_attach_buffer`;== the address of the pointer is passed to `MPI_Buffer_detach`, ==`MPI_Session_detach_buffer` and `MPI_Comm_detach_buffer`,== so that this call can return the pointer value. In Fortran with the `mpi` module or ==(deprecated)== `mpif.h`, the type of the `buffer_addr` argument is wrongly defined and the argument is therefore unused. In Fortran with the `mpi_f08` module, the address of the buffer is returned as `TYPE(C_PTR)`, see also [[Example]] ex:1side-fmalloc-ptr about the use of `C_PTR` pointers.

~~> Both arguments are defined to be of type `void*` (rather than `void*` and `void**`, respectively), so as to avoid complex type casts. E.g., in the last example, `&buff`, which is of type `char**`, can be passed as argument to `MPI_Buffer_detach` without type casting. If the formal parameter had type `void**` then we would need a type cast before and after the call.~~

~~The statements made in this section describe the behavior of MPI for buffered-mode sends. When no buffer is currently associated, MPI behaves as if a zero-sized buffer is associated with the process.~~

~~MPI must provide as much buffering for outgoing messages *as if* outgoing message data were buffered by the sending process, in the specified buffer space, using a circular, contiguous-space allocation policy. We outline below a model implementation that defines this policy. MPI may provide more buffering, and may use a better buffer allocation algorithm than described below. On the other hand, MPI may signal an error whenever the simple buffering allocator described below would run out of space. In particular, if no buffer is explicitly associated with the process, then any buffered send may cause an error.~~

==> In all cases, arguments are defined to be of type `void*` (rather than `void*` and `void**`, respectively), so as to avoid complex type casts. E.g., in the last two examples, `&buff`, which is of type `char**`, can be passed as argument to `MPI_Buffer_detach`, `MPI_Session_detach_buffer` and `MPI_Comm_detach_buffer` without type casting. If the formal parameter had type `void**` then we would need a type cast before and after each call.==

==**General semantics of buffered mode sends.** The statements made in this section describe the behavior of MPI for buffered-mode sends.==

==When no MPI process-specific buffer is currently (explicitly) attached and if no automatic buffering is enabled, MPI behaves as if a zero-sized MPI process-specific buffer is (implicitly) attached.==

==It is erroneous to detach a communicator-specific, session-specific, or MPI process-specific buffer, if no such buffer had been attached using a corresponding attach procedure. This includes attach procedure calls using `MPI_BUFFER_AUTOMATIC` as the buffer argument. It is erroneous to attach a communicator-specific, session-specific, or MPI process-specific buffer, if such buffer had already been attached using a corresponding attach procedure and not yet been detached again. This includes attach procedure calls using `MPI_BUFFER_AUTOMATIC` as the buffer argument. It is erroneous to flush a communicator-specific, session-specific or MPI process-specific buffer, if there is no buffer attached (including automatic buffering).==

==[[versions/v41/API/MPI_COMM_ATTACH_BUFFER|MPI_COMM_ATTACH_BUFFER]] , [[versions/v41/API/MPI_SESSION_ATTACH_BUFFER|MPI_SESSION_ATTACH_BUFFER]] , and [[versions/v41/API/MPI_BUFFER_ATTACH|MPI_BUFFER_ATTACH]] are local. [[versions/v41/API/MPI_COMM_DETACH_BUFFER|MPI_COMM_DETACH_BUFFER]] , [[versions/v41/API/MPI_SESSION_DETACH_BUFFER|MPI_SESSION_DETACH_BUFFER]] , [[versions/v41/API/MPI_BUFFER_DETACH|MPI_BUFFER_DETACH]] , [[versions/v41/API/MPI_COMM_FLUSH_BUFFER|MPI_COMM_FLUSH_BUFFER]] , [[versions/v41/API/MPI_SESSION_FLUSH_BUFFER|MPI_SESSION_FLUSH_BUFFER]] , and [[versions/v41/API/MPI_BUFFER_FLUSH|MPI_BUFFER_FLUSH]] are nonlocal; they must not return before all buffered messages in their related buffers are transmitted, and they must eventually return when all corresponding receive operations are started (provided that none are cancelled).==

==**Automatic buffering with buffered mode sends.** If the buffer used at the time of buffered mode send is set to the buffer address `MPI_BUFFER_AUTOMATIC`, then a buffer of sufficient size is automatically used by the MPI library.==

==> [!note] Advice to users==

==> When using automatic buffering, the user relinquishes control over buffer management, including allocation and deallocation decisions and timing, to the MPI library. If explicit control is needed over when and how much buffer space is allocated, automatic buffering must not be used.==

==> [!warning] Advice to implementors==

==> High-quality implementations of an MPI library should strive to support automatic buffering in a balanced fashion, i.e., providing the right balance between memory allocated for send operations and memory available for the end user.==

==The flush operations for the communicator-specific, session-specific, and MPI process-specific buffers can also be used for automatic buffering. The flush procedure will not return until all automatically allocated buffers for the communicator-specific, session-specific, or MPI process-specific buffers, respectively, no longer hold message data and could be deallocated by the MPI library, if it chooses to do so.==

==> [!note] Advice to users==

==> With standard mode send, the limitation of needed buffer space is implemented within the MPI library through switching from internal buffering to internal synchronous mode. If the user wants to limit the automatically allocated buffer space for buffered mode send using automatic buffering, the user may call explicitly the appropriate flush procedure to wait until automatically allocated buffers are deallocated.==

==**Further rules.** In the case of an attached buffer (i.e., not using automatic buffering), the user must provide as much buffering for outgoing messages as would be required if outgoing message data were buffered by the sending MPI process, in the specified buffer space, using a circular, contiguous-space allocation policy. We outline below a model implementation that defines this policy. MPI may provide more buffering, and may use a better buffer allocation algorithm than described below. On the other hand, MPI may signal an error whenever the simple buffering allocator described below would run out of space. MPI must not require more buffer space as described in the model implementation below.==

> There is a wide spectrum of possible implementations of buffered ~~communication:~~ ==communication operations:== buffering can be done at sender, at receiver, or both; buffers can be dedicated to one sender-receiver pair, or be shared by all ~~communications;~~ ==communication operations;== buffering can be done in real or in virtual memory; it can use dedicated memory, or memory shared by other ==MPI== processes; buffer space may be allocated statically or be changed dynamically; etc. It does not seem feasible to provide a portable mechanism for querying or controlling buffering that would be compatible with all these choices, yet provide meaningful information.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The following `MPI_XXX_FLUSH_BUFFER` ~~procedures~~ ==procedures, as well as [[versions/v50/API/MPI_BUFFER_FLUSH|MPI_BUFFER_FLUSH]] itself,== will not return until all messages currently in the buffer have been transmitted without detaching the buffer.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Buffer allocation and usage]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Buffer Allocation and Usage]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Buffer Allocation and Usage]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Buffer Allocation and Usage]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Buffer Allocation and Usage]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Buffer Allocation and Usage]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Buffer Allocation and Usage]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Buffer Allocation and Usage]]
