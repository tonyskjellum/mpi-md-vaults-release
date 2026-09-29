---
title: "The Runtime Environment"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# The Runtime Environment

Chapter **dynamic** · in [[versions/v20/sections/dynamic#The Runtime Environment|MPI-2.0]], [[versions/v21/sections/dynamic#The Runtime Environment|MPI-2.1]], [[versions/v22/sections/dynamic#The Runtime Environment|MPI-2.2]], [[versions/v30/sections/dynamic#The Runtime Environment|MPI-3.0]], [[versions/v31/sections/dynamic#The Runtime Environment|MPI-3.1]], [[versions/v40/sections/dynamic#The Runtime Environment|MPI-4.0]], [[versions/v41/sections/dynamic#The Runtime Environment|MPI-4.1]], [[versions/v50/sections/dynamic#The Runtime Environment|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

- An attribute ~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== on ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== tells a program how “large” the initial runtime environment is, namely how many processes can usefully be started in all. One can subtract the size of ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== from this value to find out how many processes might usefully be started in addition to those already running.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

Complex interaction of an MPI application with its runtime environment should be done through an environment-specific API. An example of such an API would be the PVM task and machine management routines — `pvm_addhosts`, `pvm_config`, `pvm_tasks`, etc., possibly modified to return an MPI ~~(group,rank)~~ ==(group, rank)== when possible. A Condor or PBS API would be another possibility.

- An attribute `MPI_UNIVERSE_SIZE` ==(See Section [[versions/v30/sections/dynamic#Universe Size|Universe Size]] on page [[versions/v30/sections/dynamic#Universe Size|Universe Size]] )== on `MPI_COMM_WORLD` tells a program how “large” the initial runtime environment is, namely how many processes can usefully be started in all. One can subtract the size of `MPI_COMM_WORLD` from this value to find out how many processes might usefully be started in addition to those already running.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

- An attribute `MPI_UNIVERSE_SIZE` (See ~~Section [[versions/v31/sections/dynamic#Universe Size|Universe Size]] on page~~ [[versions/v31/sections/dynamic#Universe Size|Universe Size]] ) on `MPI_COMM_WORLD` tells a program how “large” the initial runtime environment is, namely how many processes can usefully be started in all. One can subtract the size of `MPI_COMM_WORLD` from this value to find out how many processes might usefully be started in addition to those already running.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~The [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] and [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] routines provide an interface between MPI and the *runtime environment* of an MPI application. The difficulty is that there is an enormous range of runtime environments and application requirements, and MPI must not be tailored to any particular one. Examples of such environments are:~~

~~- **MPP managed by a batch queueing system**. Batch queueing systems generally allocate resources before an application begins, enforce limits on resource use (CPU time, memory use, etc.), and do not allow a change in resource allocation after a job begins. Moreover, many MPPs have special limitations or extensions, such as a limit on the number of processes that may run on one processor, or the ability to gang-schedule processes of a parallel application.~~

~~- **Network of workstations with PVM**. PVM (Parallel Virtual Machine) allows a user to create a “virtual machine” out of a network of workstations. An application may extend the virtual machine or manage processes (create, kill, redirect output, etc.) through the PVM library. Requests to manage the machine or processes may be intercepted and handled by an external resource manager.~~

~~- **Network of workstations managed by a load balancing system**. A load balancing system may choose the location of spawned processes based on dynamic quantities, such as load average. It may transparently migrate processes from one machine to another when a resource becomes unavailable.~~

~~- **Large SMP with Unix**. Applications are run directly by the user. They are scheduled at a low level by the operating system. Processes may have special scheduling characteristics (gang-scheduling, processor affinity, deadline scheduling, processor locking, etc.) and be subject to OS resource limits (number of processes, amount of memory, etc.).~~

~~MPI assumes, implicitly, the existence of an environment in which an application runs. It does not provide “operating system” services, such as a general ability to query what processes are running, to kill arbitrary processes, to find out properties of the runtime environment (how many processors, how much memory, etc.).~~

~~Complex interaction of an MPI application with its runtime environment should be done through an environment-specific API. An example of such an API would be the PVM task and machine management routines — `pvm_addhosts`, `pvm_config`, `pvm_tasks`, etc., possibly modified to return an MPI (group, rank) when possible. A Condor or PBS API would be another possibility.~~

==The [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] and [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] routines provide an interface between MPI and the *runtime environment* of an MPI application. The difficulty is that there is an enormous range of runtime environments and application requirements, and MPI must not be tailored to any particular one.==

==MPI assumes, implicitly, the existence of an environment in which an application runs. It does not provide “operating system” services, such as a general ability to query what processes are running, to kill arbitrary processes, to find out properties of the runtime environment (how many processors, how much memory, etc.). Complex interaction of an MPI application with its runtime environment should be done through an environment-specific API.==

In many cases, it is impossible to keep environment-specific information out of the MPI interface without seriously compromising MPI functionality. To permit applications to take advantage of environment-specific functionality, many MPI routines take an `info` argument that allows an application to specify environment-specific information. There is a tradeoff between functionality and portability: applications that make use of ==environment-specific== `info` are not portable.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

At some low level, ~~obviously,~~ MPI must be able to interact with the runtime system, but the interaction is not visible at the application level and the details of the interaction are not specified by the MPI standard.

MPI does not require the existence of an underlying “virtual machine” model, in which there is a consistent global view of an MPI application and an implicit “operating system” managing resources and processes. For instance, ==MPI== processes spawned by one ~~task~~ ==MPI process== may not be visible to another; additional hosts added to the runtime environment by one ==MPI== process may not be visible in another ==MPI== process; ~~tasks~~ ==MPI processses== spawned by different processes may not be automatically distributed over available resources.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#The Runtime Environment]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#The Runtime Environment]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#The Runtime Environment]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#The Runtime Environment]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#The Runtime Environment]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The Runtime Environment]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#The Runtime Environment]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#The Runtime Environment]]
