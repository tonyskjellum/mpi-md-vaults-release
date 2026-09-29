---
title: "Processes"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Processes

Chapter **terms** · in [[versions/v13/sections/terms#Processes|MPI-1.3]], [[versions/v20/sections/terms#Processes|MPI-2.0]], [[versions/v21/sections/terms#Processes|MPI-2.1]], [[versions/v22/sections/terms#Processes|MPI-2.2]], [[versions/v30/sections/terms#Processes|MPI-3.0]], [[versions/v31/sections/terms#Processes|MPI-3.1]], [[versions/v40/sections/terms#Processes|MPI-4.0]], [[versions/v41/sections/terms#Processes|MPI-4.1]], [[versions/v50/sections/terms#Processes|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~An MPI program consists of autonomous processes, executing their own code, in an MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible. This document specifies the behavior of a parallel program assuming that only MPI calls are used for communication. The interaction of an MPI program with other possible means of communication (e.g., shared memory) is not specified.~~

~~MPI does not specify the execution model for each process. A process can be sequential, or can be multi-threaded, with threads possibly executing concurrently. Care has been taken to make MPI “thread-safe,” by avoiding the use of implicit state. The desired interaction of MPI with threads is that concurrent threads be all allowed to execute MPI calls, and calls be reentrant; a blocking MPI call blocks only the invoking thread, allowing the scheduling of another thread.~~

~~MPI does not provide mechanisms to specify the initial allocation of processes to an MPI computation and their binding to physical processors. It is expected that vendors will provide mechanisms to do so either at load time or at run time. Such mechanisms will allow the specification of the initial number of required processes, the code to be executed by each initial process, and the allocation of processes to processors. Also, the current proposal does not provide for dynamic creation or deletion of processes during program execution (the total number of processes is fixed), although it is intended to be consistent with such extensions. Finally, we always identify processes according to their relative rank in a group, that is, consecutive integers in the range `0..groupsize-1`.~~

==An MPI program consists of autonomous processes, executing their own code, in==

==an==

==MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.==

==This document specifies the behavior of a parallel program assuming that only MPI calls are used. The interaction of an MPI program with other possible means of communication, I/O, and process management is not specified. Unless otherwise stated in the specification of the standard, MPI places no requirements on the result of its interaction with external mechanisms that provide similar or equivalent functionality. This includes, but is not limited to, interactions with external mechanisms for process control, shared and remote memory access, file system access and control, interprocess communication, process signaling, and terminal I/O. High quality implementations should strive to make the results of such interactions intuitive to users, and attempt to document restrictions where deemed necessary.==

==> [!warning] Advice to implementors==

==> Implementations that support such additional mechanisms for functionality supported within MPI are expected to document how these interact with MPI.==

==The interaction of MPI and threads is defined in Section [[versions/v21/sections/ei#MPI and Threads|MPI and Threads]] .==

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~An MPI program consists of autonomous processes, executing their own code, in a MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.~~

==An MPI program consists of autonomous processes, executing their own code, in==

==an==

==MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~an~~

~~MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.~~

==an MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~An MPI program consists of autonomous processes, executing their own code, in~~

~~an MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.~~

==An MPI program consists of autonomous processes, executing their own code, in an MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The interaction of MPI and threads is defined in Section ~~[[versions/v40/sections/ei#MPI~~ ==[[dynamic#MPI== and Threads|MPI and Threads]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==MPI processes reside in the same **shared memory domain** if it is possible to share a segment of memory between them, i.e., to make a segment of memory (**shared memory segment**) concurrently accessible from all of those MPI processes through load/store accesses. For a group of processes belonging to more than one *shared memory domain* the creation of a subgroup of processes belonging to the same *shared memory domain* is defined in Section [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] .==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Processes]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Processes]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Processes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Processes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Processes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Processes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Processes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Processes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Processes]]
