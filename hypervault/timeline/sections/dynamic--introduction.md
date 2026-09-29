---
title: "Introduction"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Introduction

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Introduction|MPI-2.0]], [[versions/v21/sections/dynamic#Introduction|MPI-2.1]], [[versions/v22/sections/dynamic#Introduction|MPI-2.2]], [[versions/v30/sections/dynamic#Introduction|MPI-3.0]], [[versions/v31/sections/dynamic#Introduction|MPI-3.1]], [[versions/v40/sections/dynamic#Introduction|MPI-4.0]], [[versions/v41/sections/dynamic#Introduction|MPI-4.1]], [[versions/v50/sections/dynamic#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

~~MPI-1 provides an interface that allows processes in a parallel program to communicate with one another. MPI-1 specifies neither how the processes are created, nor how they establish communication. Moreover, an MPI-1 application is static; that is, no processes can be added to or deleted from an application after it has been started.~~

~~MPI users have asked that the MPI-1 model be extended to allow process creation and management after an MPI application has been started. A major impetus comes from the PVM research effort, which has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.~~

~~The MPI Forum decided not to address resource control in MPI-2 because it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. Resource control can encompass a wide range of abilities, including adding and deleting nodes from a virtual parallel machine, reserving and scheduling resources, managing compute partitions of an MPP, and returning information about available resources. MPI-2 assumes that resource control is provided externally — probably by computer vendors, in the case of tightly coupled systems, or by a third party software package when the environment is a cluster of workstations.~~

~~The reasons for adding process management to MPI are both technical and practical. Important classes of message passing applications require process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started. On the practical side, users of workstation clusters who are migrating from PVM to MPI may be accustomed to using PVM’s capabilities for process and resource management. The lack of these features is a practical stumbling block to migration.~~

~~While process management is essential, adding it to MPI should not compromise the portability or performance of MPI applications. In particular:~~

~~- The MPI-2 process model must apply to the vast majority of current parallel environments. These include everything from tightly integrated MPPs to heterogeneous networks of workstations.~~

==MPI is primarily concerned with communication rather than process or resource management. However, it is necessary to address these issues to some degree in order to define a useful framework for communication. This chapter presents a set of MPI interfaces that allow for a variety of approaches to process management while placing minimal restrictions on the execution environment.==

==The MPI model for process creation allows both the creation of an intial set of processes related by their membership in a common MPI_COMM_WORLD and the creation and management of processes after an MPI application has been started. A major impetus for the later form of process creation comes from the PVM research effort. This work==

==has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.==

==The MPI Forum decided not to address resource==

==control because==

==it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. Resource control can encompass a wide range of abilities, including adding and deleting nodes from a virtual parallel machine, reserving and scheduling resources, managing compute partitions of an MPP, and returning information about available resources.==

==assumes that resource control is provided externally — probably by computer vendors, in the case of tightly coupled systems, or by a third party software package when the environment is a cluster of workstations.==

==The reasons for==

==including process management in MPI are both==

==technical and practical. Important classes of message-passing applications require process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started. On the practical side, users of workstation clusters who are migrating from PVM to MPI may be accustomed to using PVM’s capabilities for process and resource management. The lack of these features==

==would be==

==a practical stumbling block to migration.==

==The following goals are central to the design of MPI process management:==

==- The==

==  MPI==

==  process model must apply to the vast majority of current parallel environments. These include everything from tightly integrated MPPs to heterogeneous networks of workstations.==

- MPI must ~~continue to~~ guarantee communication ~~determinism,~~ ==determinism in the presense of dynamic processes,== i.e., ==dynamic== process management must not introduce unavoidable race conditions.

~~- MPI-1 programs must work under MPI-2, i.e., the MPI-1 static process model must be a special case of the MPI-2 dynamic model.~~

~~The MPI-2 process management model addresses these issues in two ways. First, MPI remains primarily a communication library. It does not manage the parallel environment in which a parallel program executes, though it provides a minimal interface between an application and external resource and process managers.~~

~~Second, MPI-2 does not change the concept of communicator. Once a communicator is built, it behaves as specified in MPI-1. A communicator is never changed once created, and it is always created using deterministic collective operations.~~

==The==

==process management model addresses these issues in two ways. First, MPI remains primarily a communication library. It does not manage the parallel environment in which a parallel program executes, though it provides a minimal interface between an application and external resource and process managers.==

==Second, MPI maintains a consistent concept of a communicator, regardless of how its members came into existence.==

==A communicator is never changed once created, and it is always created using deterministic collective operations.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The MPI model for process creation allows both the creation of an intial set of processes related by their membership in a common ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== and the creation and management of processes after an MPI application has been started. A major impetus for the later form of process creation comes from the PVM research effort. This work

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~MPI is primarily concerned with communication rather than process or resource management. However, it is necessary to address these issues to some degree in order to define a useful framework for communication. This chapter presents a set of MPI interfaces that allow for a variety of approaches to process management while placing minimal restrictions on the execution environment.~~

~~The MPI model for process creation allows both the creation of an intial set of processes related by their membership in a common `MPI_COMM_WORLD` and the creation and management of processes after an MPI application has been started. A major impetus for the later form of process creation comes from the PVM research effort. This work~~

~~has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.~~

==MPI is primarily concerned with communication rather than process or resource management. However, it is necessary to address these issues to some degree in order to define a useful framework for communication. This chapter presents a set of MPI interfaces that allows for a variety of approaches to process management while placing minimal restrictions on the execution environment.==

==The MPI model for process creation allows both the creation of an intial set of processes related by their membership in a common `MPI_COMM_WORLD` and the creation and management of processes after an MPI application has been started. A major impetus for the latter form of process creation comes from the PVM research effort. This work has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.==

~~control because~~

~~it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. Resource control can encompass a wide range of abilities, including adding and deleting nodes from a virtual parallel machine, reserving and scheduling resources, managing compute partitions of an MPP, and returning information about available resources.~~

~~assumes that resource control is provided externally — probably by computer vendors, in the case of tightly coupled systems, or by a third party software package when the environment is a cluster of workstations.~~

==control because it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. Resource control can encompass a wide range of abilities, including adding and deleting nodes from a virtual parallel machine, reserving and scheduling resources, managing compute partitions of an MPP, and returning information about available resources.==

==MPI assumes that resource control is provided externally — probably by computer vendors, in the case of tightly coupled systems, or by a third party software package when the environment is a cluster of workstations.==

~~including process management in MPI are both~~

~~technical and practical. Important classes of message-passing applications require process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started. On the practical side, users of workstation clusters who are migrating from PVM to MPI may be accustomed to using PVM’s capabilities for process and resource management. The lack of these features~~

~~would be~~

~~a practical stumbling block to migration.~~

==including process management in MPI are both technical and practical. Important classes of message-passing applications require process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started. On the practical side, users of workstation clusters who are migrating from PVM to MPI may be accustomed to using PVM’s capabilities for process and resource management. The lack of these features==

==would be a practical stumbling block to migration.==

~~  MPI~~

~~  process model must apply to the vast majority of current parallel environments. These include everything from tightly integrated MPPs to heterogeneous networks of workstations.~~

==  MPI process model must apply to the vast majority of current parallel environments. These include everything from tightly integrated MPPs to heterogeneous networks of workstations.==

~~Second, MPI maintains a consistent concept of a communicator, regardless of how its members came into existence.~~

~~A communicator is never changed once created, and it is always created using deterministic collective operations.~~

==Second, MPI maintains a consistent concept of a communicator, regardless of how its members came into existence. A communicator is never changed once created, and it is always created using deterministic collective operations.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~The MPI Forum decided not to address resource~~

~~control because it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. Resource control can encompass a wide range of abilities, including adding and deleting nodes from a virtual parallel machine, reserving and scheduling resources, managing compute partitions of an MPP, and returning information about available resources.~~

~~MPI assumes that resource control is provided externally — probably by computer vendors, in the case of tightly coupled systems, or by a third party software package when the environment is a cluster of workstations.~~

~~The reasons for~~

~~including process management in MPI are both technical and practical. Important classes of message-passing applications require process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started. On the practical side, users of workstation clusters who are migrating from PVM to MPI may be accustomed to using PVM’s capabilities for process and resource management. The lack of these features~~

~~would be a practical stumbling block to migration.~~

==The MPI Forum decided not to address resource control because it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. Resource control can encompass a wide range of abilities, including adding and deleting nodes from a virtual parallel machine, reserving and scheduling resources, managing compute partitions of an MPP, and returning information about available resources. MPI assumes that resource control is provided externally — probably by computer vendors, in the case of tightly coupled systems, or by a third party software package when the environment is a cluster of workstations.==

==The reasons for including process management in MPI are both technical and practical. Important classes of message-passing applications require process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started. On the practical side, users of workstation clusters who are migrating from PVM to MPI may be accustomed to using PVM’s capabilities for process and resource management. The lack of these features would be a practical stumbling block to migration.==

~~- The~~

~~  MPI process model must apply to the vast majority of current parallel environments. These include everything from tightly integrated MPPs to heterogeneous networks of workstations.~~

==- The MPI process model must apply to the vast majority of current parallel environments. These include everything from tightly integrated MPPs to heterogeneous networks of workstations.==

~~The~~

~~process management model addresses these issues in two ways. First, MPI remains primarily a communication library. It does not manage the parallel environment in which a parallel program executes, though it provides a minimal interface between an application and external resource and process managers.~~

==The process management model addresses these issues in two ways. First, MPI remains primarily a communication library. It does not manage the parallel environment in which a parallel program executes, though it provides a minimal interface between an application and external resource and process managers.==

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

~~MPI is primarily concerned with communication rather than process or resource management. However, it is necessary to address these issues to some degree in order to define a useful framework for communication. This chapter presents a set of MPI interfaces that allows for a variety of approaches to process management while placing minimal restrictions on the execution environment.~~

~~The MPI model for process creation allows both the creation of an intial set of processes related by their membership in a common `MPI_COMM_WORLD` and the creation and management of processes after an MPI application has been started. A major impetus for the latter form of process creation comes from the PVM research effort. This work has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.~~

~~The MPI Forum decided not to address resource control because it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. Resource control can encompass a wide range of abilities, including adding and deleting nodes from a virtual parallel machine, reserving and scheduling resources, managing compute partitions of an MPP, and returning information about available resources. MPI assumes that resource control is provided externally — probably by computer vendors, in the case of tightly coupled systems, or by a third party software package when the environment is a cluster of workstations.~~

~~The reasons for including process management in MPI are both technical and practical. Important classes of message-passing applications require process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started. On the practical side, users of workstation clusters who are migrating from PVM to MPI may be accustomed to using PVM’s capabilities for process and resource management. The lack of these features would be a practical stumbling block to migration.~~

==MPI is primarily concerned with communication rather than process or resource management. However, it is necessary to address these issues to some degree in order to define a useful framework for communication. This chapter presents a set of MPI interfaces that allows for several approaches to MPI initialization and process management while placing minimal restrictions on the execution environment.==

==One goal of MPI is to achieve *source code portability*. By this we mean that a program written using MPI and complying with the relevant language standards is portable as written, and must not require any source code changes when moved from one system to another. This explicitly does *not* say anything about how an MPI program is started or launched from the command line, nor what the user must do to set up the environment in which an MPI program will run. However, an implementation may require some setup or initialization procedure to be performed before the complete set of MPI routines may be called.==

==To this end, MPI presents two models for **MPI process initialization**. In the World Model, an initial set of processes is created that are related by their membership in a common `MPI_COMM_WORLD` (see Section [[versions/v40/sections/dynamic#The World Model|The World Model]] ) communicator. In the Sessions Model (Section [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] ), an initial set of processes is also created, but the application must explicitly manage the creation of MPI groups, and hence MPI communicators. `MPI_COMM_WORLD` is only valid for use as a communicator in the World Model, i.e., after a successful call to [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] and before a call to [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] . An application can employ both of these Process Models concurrently. In multi-component MPI applications, for example, a component such as a library can make use of the Sessions Model to instantiate MPI resources without impacting the rest of the application.==

==Both of these models also support the Dynamic Process Model (see Section [[versions/v40/sections/dynamic#The Dynamic Process Model|The Dynamic Process Model]] ), which provides for the creation and management of additional processes after an MPI application has been started. A major impetus for the Dynamic Process Model comes from the PVM research effort. This work has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.==

==In developing the Dynamic Process Model, the MPI Forum decided not to address resource control because it was not able to design a portable interface that would be appropriate for the broad spectrum of existing and potential resource and process controllers. MPI assumes that resource control is provided externally.==

==Process management functionality is included in MPI to enable its use in classes of message-passing applications requiring process control. These include task farms, serial applications with parallel modules, and problems that require a run-time assessment of the number and type of processes that should be started.==

- The MPI process model must apply to the vast majority of current parallel environments. ~~These include everything from tightly integrated MPPs to heterogeneous networks of workstations.~~

- MPI must guarantee communication determinism in the ~~presense~~ ==presence== of dynamic processes, i.e., dynamic process management must not introduce unavoidable race conditions.

The ~~process management model~~ ==Dynamic Process Model== addresses these issues in two ways. First, MPI remains primarily a communication library. It does not manage the parallel environment in which a parallel program executes, though it provides a minimal interface between an application and external resource and process managers.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~Both of these models also support the~~ ==The== Dynamic Process Model (see Section [[versions/v41/sections/dynamic#The Dynamic Process Model|The Dynamic Process Model]] ), ~~which~~ provides for the creation and management of additional processes after an MPI application has been started. A major impetus for the Dynamic Process Model comes from the PVM research effort. This work has provided a wealth of experience with process management and resource control that illustrates their benefits and potential pitfalls.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Introduction]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Introduction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Introduction]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Introduction]]
