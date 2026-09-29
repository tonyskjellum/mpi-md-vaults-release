---
title: "Put"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Put

Chapter **one-side** · in [[versions/v20/sections/one-side#Put|MPI-2.0]], [[versions/v21/sections/one-side#Put|MPI-2.1]], [[versions/v22/sections/one-side#Put|MPI-2.2]], [[versions/v30/sections/one-side#Put|MPI-3.0]], [[versions/v31/sections/one-side#Put|MPI-3.1]], [[versions/v40/sections/one-side#Put|MPI-4.0]], [[versions/v41/sections/one-side#Put|MPI-4.1]], [[versions/v50/sections/one-side#Put|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

> A ~~high quality~~ ==high-quality > >== implementation will attempt to prevent remote accesses to memory outside the window that was exposed by the process. This, both for debugging purposes, and for protection with client-server codes that use RMA. I.e., a high-quality implementation will check, if possible, window bounds on each RMA call, and raise an MPI exception at the origin call if an out-of-bound situation occurred. Note that the condition can be checked at the origin. Of course, the added safety achieved by such checks has to be weighed against the added cost of such checks.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

Transfers `origin_count` successive entries of the type specified by the `origin_datatype`, starting at address `origin_addr` on the origin ~~node~~ ==node,== to the target node specified by the `win`, `target_rank` pair. The data are written in the target buffer at address ~~`target_addr~~ ==$`\texttt{target_addr}== = ~~window_base~~ ==\texttt{window_base}== + ~~target_disp`$`\times`$`disp_unit`,~~ ==\texttt{target_disp}\times\texttt{disp_unit}`$,== where `window_base` and `disp_unit` are the base address and window displacement unit specified at window initialization, by the target process.

~~The data transfer is the same as that which would occur if the origin process executed a send operation with arguments `origin_addr, origin_count, origin_datatype, target_rank, tag, comm`, and the target process executed a receive operation with arguments `target_addr, target_count, target_datatype, source, tag, comm`, where `target_addr` is the target buffer address computed as explained above, and `comm` is a communicator for the group of `win`.~~

~~The communication must satisfy the same constraints as for a similar message-passing communication. The `target_datatype` may not specify overlapping entries in the target buffer. The message sent must fit, without truncation, in the target buffer. Furthermore, the target buffer must fit in the target window.~~

~~The `target_datatype` argument is a handle to a datatype object defined at the origin process. However, this object is interpreted at the target process: the outcome is as if the target datatype object was defined at the target process, by the same sequence of calls used to define it at the origin process.~~

~~The target datatype must contain only relative displacements, not absolute addresses. The same holds for get and accumulate.~~

==The data transfer is the same as that which would occur if the origin process executed a send operation with arguments `origin_addr`, `origin_count`, `origin_datatype`, `target_rank`, `tag`, `comm`, and the target process executed a receive operation with arguments `target_addr, target_count, target_datatype, source, tag, comm`, where `target_addr` is the target buffer address computed as explained above, the values of `tag` are arbitrary valid matching tag values, and `comm` is a communicator for the group of `win`.==

==The communication must satisfy the same constraints as for a similar message-passing communication. The `target_datatype` may not specify overlapping entries in the target buffer. The message sent must fit, without truncation, in the target buffer. Furthermore, the target buffer must fit in the target window or in attached memory in a dynamic window.==

==The `target_datatype` argument is a handle to a datatype object defined at the origin process. However, this object is interpreted at the target process: the outcome is as if the target datatype object was defined at the target process by the same sequence of calls used to define it at the origin process. The target datatype must contain only relative displacements, not absolute addresses. The same holds for get and accumulate.==

> The `target_datatype` argument is a handle to a datatype object that is defined at the origin process, even though it defines a data layout in the target process memory. This causes no problems in a homogeneous environment, or in a heterogeneous ~~environment,~~ ==environment== if only portable datatypes are used (portable datatypes are defined in Section [[terms-semantic]] , page [[terms-semantic]] ). > > The performance of a put transfer can be significantly affected, on some systems, ~~from~~ ==by== the choice of window location and the shape and location of the origin and target buffer: transfers to a target window in memory allocated by [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] ==or [[versions/v30/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]]== may be much faster on shared memory systems; transfers from contiguous buffers will be faster on most, if not all, systems; the alignment of the communication buffers may also impact performance.

> A high-quality ~~> >~~ implementation will attempt to prevent remote accesses to memory outside the window that was exposed by the process. This, both for debugging purposes, and for protection with client-server codes that use RMA. I.e., a high-quality implementation will check, if possible, window bounds on each RMA call, and raise an MPI exception at the origin call if an out-of-bound situation ~~occurred.~~ ==occurs.== Note that the condition can be checked at the origin. Of course, the added safety achieved by such checks has to be weighed against the added cost of such checks.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

The `target_datatype` argument is a handle to a datatype object defined at the origin process. However, this object is interpreted at the target process: the outcome is as if the target datatype object was defined at the target process by the same sequence of calls used to define it at the origin process. The target datatype must contain only relative displacements, not absolute addresses. The same holds for get and ~~accumulate.~~ ==accumulate operations.==

> The `target_datatype` argument is a handle to a datatype object that is defined at the origin process, even though it defines a data layout in the target process memory. This causes no problems in a homogeneous environment, or in a heterogeneous environment if only portable datatypes are used (portable datatypes are defined in ~~Section [[terms-semantic]] , page~~ [[terms-semantic]] ). > > The performance of a put transfer can be significantly affected, on some systems, by the choice of window location and the shape and location of the origin and target buffer: transfers to a target window in memory allocated by [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] or [[versions/v31/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] may be much faster on shared memory systems; transfers from contiguous buffers will be faster on most, if not all, systems; the alignment of the communication buffers may also impact performance.

> A high-quality implementation will attempt to prevent remote accesses to memory outside the window that was exposed by the process. ~~This,~~ ==This is important== both for debugging ~~purposes,~~ ==purposes== and for protection with client-server codes that use RMA. ~~I.e.,~~ ==That is,== a high-quality implementation will check, if possible, window bounds on each RMA call, and raise an MPI exception at the origin call if an out-of-bound situation occurs. Note that the condition can be checked at the origin. Of course, the added safety achieved by such checks has to be weighed against the added cost of such checks.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The execution of a put operation is similar to the execution of a send by the origin process and a matching receive by the target process. The obvious difference is that all arguments are provided by one ~~call — the~~ ==call—the== call executed by the origin process.

> A high-quality implementation will attempt to prevent remote accesses to memory outside the window that was exposed by the process. This is important both for debugging purposes and for protection with client-server codes that use RMA. That is, a high-quality implementation will check, if possible, window bounds on each RMA call, and raise an ~~MPI exception~~ ==error== at the origin call if an out-of-bound situation occurs. Note that the condition can be checked at the origin. Of course, the added safety achieved by such checks has to be weighed against the added cost of such checks.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Transfers `origin_count` successive entries of the type specified by the `origin_datatype`, starting at address `origin_addr` on the origin ~~node,~~ ==process,== to the target ~~node~~ ==process== specified by the `win`, `target_rank` pair. The data are written in the target buffer at address $`\texttt{target_addr} = \texttt{window_base} + \texttt{target_disp}\times\texttt{disp_unit}`$, where `window_base` and `disp_unit` are the base address and window displacement unit specified at window initialization, by the target process.

> A high-quality implementation will attempt to prevent remote accesses to memory outside the window that was exposed by the ==MPI== process. This is important both for debugging purposes and for protection with client-server codes that use RMA. That is, a high-quality implementation will check, if possible, window bounds on each RMA call, and raise an error at the origin call if an out-of-bound situation occurs. Note that the condition can be checked at the origin. Of course, the added safety achieved by such checks has to be weighed against the added cost of such checks.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Put]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Put]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Put]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Put]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Put]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Put]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Put]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Put]]
