---
title: "Predefined Intra-Communicators"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Predefined Intra-Communicators

Chapter **context** · in [[versions/v13/sections/context#Predefined Intra-Communicators|MPI-1.3]], [[versions/v21/sections/context#Predefined Intra-Communicators|MPI-2.1]], [[versions/v22/sections/context#Predefined Intra-Communicators|MPI-2.2]], [[versions/v30/sections/context#Predefined Intra-Communicators|MPI-3.0]], [[versions/v31/sections/context#Predefined Intra-Communicators|MPI-3.1]], [[versions/v40/sections/context#Predefined Intra-Communicators|MPI-4.0]], [[versions/v41/sections/context#Predefined Intra-Communicators|MPI-4.1]], [[versions/v50/sections/context#Predefined Intra-Communicators|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~An initial intra-communicator MPI_COMM_WORLD of all processes the local process can communicate with after initialization (itself included) is defined once [[versions/v21/API/MPI_INIT|MPI_INIT]] has been called. In addition, the communicator MPI_COMM_SELF is provided, which includes only the process itself.~~

==An initial intra-communicator MPI_COMM_WORLD of all processes the local process can communicate with after initialization (itself included) is defined once [[versions/v21/API/MPI_INIT|MPI_INIT]]==

==or [[versions/v21/API/MPI_INIT_THREAD|MPI_INIT_THREAD]]==

==has been called. In addition, the communicator MPI_COMM_SELF is provided, which includes only the process itself.==

~~In a static-process-model implementation of MPI, all processes that participate in the computation are available after MPI is initialized. For this case, MPI_COMM_WORLD is a communicator of all processes available for the computation; this communicator has the same value in all processes. In an implementation of MPI where processes can dynamically join an MPI execution, it may be the case that a process starts an MPI computation without having access to all other processes. In such situations, MPI_COMM_WORLD is a communicator incorporating all processes with which the joining process can immediately communicate. Therefore, MPI_COMM_WORLD may simultaneously have different values in different processes.~~

==In a static-process-model implementation of MPI, all processes that participate in the computation are available after MPI is initialized. For this case, MPI_COMM_WORLD is a communicator of all processes available for the computation; this communicator has the same value in all processes. In an implementation of MPI where processes can dynamically join an MPI execution, it may be the case that a process starts an MPI computation without having access to all other processes. In such situations, MPI_COMM_WORLD is a communicator incorporating all processes with which the joining process can immediately communicate. Therefore, MPI_COMM_WORLD may simultaneously==

==represent disjoint groups==

==in different processes.==

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

An initial intra-communicator ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== of all processes the local process can communicate with after initialization (itself included) is defined once [[versions/v22/API/MPI_INIT|MPI_INIT]]

has been called. In addition, the communicator ~~MPI_COMM_SELF~~ ==`MPI_COMM_SELF`== is provided, which includes only the process itself.

The predefined constant ~~MPI_COMM_NULL~~ ==`MPI_COMM_NULL`== is the value used for invalid communicator handles.

In a static-process-model implementation of MPI, all processes that participate in the computation are available after MPI is initialized. For this case, ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== is a communicator of all processes available for the computation; this communicator has the same value in all processes. In an implementation of MPI where processes can dynamically join an MPI execution, it may be the case that a process starts an MPI computation without having access to all other processes. In such situations, ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== is a communicator incorporating all processes with which the joining process can immediately communicate. Therefore, ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== may simultaneously

All MPI implementations are required to provide the ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== communicator. It cannot be deallocated during the life of a process. The group corresponding to this communicator does not appear as a pre-defined constant, but it may be accessed using `MPI_COMM_GROUP` (see below). MPI does not specify the correspondence between the process rank in ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== and its (machine-dependent) absolute address. Neither does MPI specify the function of the host process, if any. Other implementation-dependent, predefined communicators may also be provided.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~An initial intra-communicator `MPI_COMM_WORLD` of all processes the local process can communicate with after initialization (itself included) is defined once [[versions/v30/API/MPI_INIT|MPI_INIT]]~~

~~or [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]]~~

~~has been called. In addition, the communicator `MPI_COMM_SELF` is provided, which includes only the process itself.~~

==An initial intra-communicator `MPI_COMM_WORLD` of all processes the local process can communicate with after initialization (itself included) is defined once [[versions/v30/API/MPI_INIT|MPI_INIT]] or [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] has been called. In addition, the communicator `MPI_COMM_SELF` is provided, which includes only the process itself.==

~~represent disjoint groups~~

~~in different processes.~~

==represent disjoint groups in different processes.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~In a static-process-model implementation of MPI, all processes that participate in the computation are available after MPI is initialized. For this case, `MPI_COMM_WORLD` is a communicator of all processes available for the computation; this communicator has the same value in all processes. In an implementation of MPI where processes can dynamically join an MPI execution, it may be the case that a process starts an MPI computation without having access to all other processes. In such situations, `MPI_COMM_WORLD` is a communicator incorporating all processes with which the joining process can immediately communicate. Therefore, `MPI_COMM_WORLD` may simultaneously~~

~~represent disjoint groups in different processes.~~

~~All MPI implementations are required to provide the `MPI_COMM_WORLD` communicator. It cannot be deallocated during the life of a process. The group corresponding to this communicator does not appear as a pre-defined constant, but it may be accessed using `MPI_COMM_GROUP` (see below). MPI does not specify the correspondence between the process rank in `MPI_COMM_WORLD` and its (machine-dependent) absolute address. Neither does MPI specify the function of the host process, if any. Other implementation-dependent, predefined communicators may also be provided.~~

==In a static-process-model implementation of MPI, all processes that participate in the computation are available after MPI is initialized. For this case, `MPI_COMM_WORLD` is a communicator of all processes available for the computation; this communicator has the same value in all processes. In an implementation of MPI where processes can dynamically join an MPI execution, it may be the case that a process starts an MPI computation without having access to all other processes. In such situations, `MPI_COMM_WORLD` is a communicator incorporating all processes with which the joining process can immediately communicate. Therefore, `MPI_COMM_WORLD` may simultaneously represent disjoint groups in different processes.==

==All MPI implementations are required to provide the `MPI_COMM_WORLD` communicator. It cannot be deallocated during the life of a process. The group corresponding to this communicator does not appear as a pre-defined constant, but it may be accessed using [[versions/v31/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] (see below). MPI does not specify the correspondence between the process rank in `MPI_COMM_WORLD` and its (machine-dependent) absolute address. Neither does MPI specify the function of the host process, if any. Other implementation-dependent, predefined communicators may also be provided.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~An~~ ==When using the World Model (Section [[versions/v40/sections/dynamic#The World Model|The World Model]] ) for MPI initialization, an== initial ~~intra-communicator~~ ==intra-/communicator== `MPI_COMM_WORLD` of all processes the local process can communicate with after initialization (itself included) is defined once [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] has been called. In addition, the communicator `MPI_COMM_SELF` is provided, which includes only the process itself. ==When using the Sessions Model (Section [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] ) for initialization of MPI resources, `MPI_COMM_WORLD` and `MPI_COMM_SELF` are not valid for use as a communicator. See the discussion concerning use of MPI named constants in [[versions/v40/sections/terms#Named Constants|Named Constants]] for valid uses of `MPI_COMM_WORLD` and `MPI_COMM_SELF` prior to initialization of MPI. See also the discussion concerning interoperability of the World Model and Sessions Model in Section [[versions/v40/sections/dynamic#Introduction|Introduction]] .==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

When using the World Model (Section [[versions/v41/sections/dynamic#The World Model|The World Model]] ) for MPI initialization, an initial intra-/communicator `MPI_COMM_WORLD` of all ==MPI== processes the local ==MPI== process can communicate with after initialization (itself included) is defined once [[versions/v41/API/MPI_INIT|MPI_INIT]] or [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] has been called. In addition, the communicator `MPI_COMM_SELF` is provided, which includes only the ==MPI== process itself. When using the Sessions Model (Section [[versions/v41/sections/dynamic#The Sessions Model|The Sessions Model]] ) for initialization of MPI resources, `MPI_COMM_WORLD` and `MPI_COMM_SELF` are not valid for use as a communicator. See the discussion concerning use of MPI named constants in [[versions/v41/sections/terms#Named Constants|Named Constants]] for valid uses of `MPI_COMM_WORLD` and `MPI_COMM_SELF` prior to initialization of MPI. See also the discussion concerning interoperability of the World Model and Sessions Model in Section [[versions/v41/sections/dynamic#Introduction|Introduction]] .

In a static-process-model implementation of MPI, all ==MPI== processes that participate in the computation are available after MPI is initialized. For this case, `MPI_COMM_WORLD` is a communicator of all ==MPI== processes available for the computation; this communicator has the same value in all ==MPI== processes. In an implementation of MPI where ==MPI== processes can dynamically join an MPI execution, it may be the case that ~~a~~ ==an MPI== process starts an MPI computation without having access to all other ==MPI== processes. In such situations, `MPI_COMM_WORLD` is a communicator incorporating all ==MPI== processes with which the joining ==MPI== process can immediately communicate. Therefore, `MPI_COMM_WORLD` may simultaneously represent disjoint groups in different ==MPI== processes.

All MPI implementations are required to provide the `MPI_COMM_WORLD` communicator. It cannot be deallocated during the life of ~~a~~ ==an MPI== process. The group corresponding to this communicator does not appear as a pre-defined constant, but it may be accessed using [[versions/v41/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] (see below). MPI does not specify the correspondence between the ==MPI== process rank in `MPI_COMM_WORLD` and its (machine-dependent) absolute address. ~~Neither does MPI specify the function of the host process, if any.~~ Other implementation-dependent, predefined communicators may also be provided.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Predefined Intra-Communicators]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Predefined Intra-Communicators]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Predefined Intra-Communicators]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Predefined Intra-Communicators]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Predefined Intra-Communicators]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Predefined Intra-Communicators]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Predefined Intra-Communicators]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Predefined Intra-Communicators]]
