---
title: "What Platforms Are Targets for Implementation?"
chapter: intro
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/intro]
---

# What Platforms Are Targets for Implementation?

Chapter **intro** · in [[versions/v13/sections/intro#What Platforms Are Targets For Implementation?|MPI-1.3]], [[versions/v21/sections/intro#What Platforms Are Targets For Implementation?|MPI-2.1]], [[versions/v22/sections/intro#What Platforms Are Targets For Implementation?|MPI-2.2]], [[versions/v30/sections/intro#What Platforms Are Targets For Implementation?|MPI-3.0]], [[versions/v31/sections/intro#What Platforms Are Targets For Implementation?|MPI-3.1]], [[versions/v40/sections/intro#What Platforms Are Targets for Implementation?|MPI-4.0]], [[versions/v41/sections/intro#What Platforms Are Targets for Implementation?|MPI-4.1]], [[versions/v50/sections/intro#What Platforms Are Targets for Implementation?|MPI-5.0]]

Heading by release: MPI-1.3: “What Platforms Are Targets For Implementation?”; MPI-2.1: “What Platforms Are Targets For Implementation?”; MPI-2.2: “What Platforms Are Targets For Implementation?”; MPI-3.0: “What Platforms Are Targets For Implementation?”; MPI-3.1: “What Platforms Are Targets For Implementation?”; MPI-4.0: “What Platforms Are Targets for Implementation?”; MPI-4.1: “What Platforms Are Targets for Implementation?”; MPI-5.0: “What Platforms Are Targets for Implementation?”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~The attractiveness of the message-passing paradigm at least partially stems from its wide portability. Programs expressed this way may run on distributed-memory multiprocessors, networks of workstations, and combinations of all of these. In addition, shared-memory implementations are possible. The paradigm will not be made obsolete by architectures combining the shared- and distributed-memory views, or by increases in network speeds. It thus should be both possible and useful to implement this standard on a great variety of machines, including those “machines" consisting of collections of other machines, parallel or not, connected by a communication network.~~

~~The interface is suitable for use by fully general MIMD programs, as well as those written in the more restricted style of SPMD. Although no explicit support for threads is provided, the interface has been designed so as not to prejudice their use. With this version of MPI no support is provided for dynamic spawning of tasks.~~

~~MPI provides many features intended to improve performance on scalable parallel computers with specialized interprocessor communication hardware. Thus, we expect that native, high-performance implementations of MPI will be provided on such machines. At the same time, implementations of MPI on top of standard Unix interprocessor communication protocols will provide portability to workstation clusters and heterogenous networks of workstations. Several proprietary, native implementations of MPI, and a public domain, portable implementation of MPI are in progress at the time of this writing .~~

==The attractiveness of the message-passing paradigm at least partially stems from its wide portability. Programs expressed this way may run on distributed-memory multiprocessors, networks of workstations, and combinations of all of these. In addition, shared-memory implementations, including those for multi-core processors and hybrid==

==architectures,==

==are possible. The paradigm will not be made obsolete by architectures combining the shared- and distributed-memory views, or by increases in network speeds. It thus should be both possible and useful to implement this standard on a great variety of machines, including those “machines” consisting of collections of other machines, parallel or not, connected by a communication network.==

==The interface is suitable for use by fully general MIMD programs, as well as those written in the more restricted style of==

==SPMD.==

==MPI provides many features intended to improve performance on scalable parallel computers with specialized interprocessor communication hardware. Thus, we expect that native, high-performance implementations of MPI will be provided on such machines. At the same time, implementations of MPI on top of standard Unix interprocessor communication protocols will provide portability to workstation clusters and heterogenous networks of workstations.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The attractiveness of the message-passing paradigm at least partially stems from its wide portability. Programs expressed this way may run on distributed-memory multiprocessors, networks of workstations, and combinations of all of these. In addition, shared-memory implementations, including those for multi-core processors and hybrid~~

~~architectures,~~

~~are possible. The paradigm will not be made obsolete by architectures combining the shared- and distributed-memory views, or by increases in network speeds. It thus should be both possible and useful to implement this standard on a great variety of machines, including those “machines” consisting of collections of other machines, parallel or not, connected by a communication network.~~

~~The interface is suitable for use by fully general MIMD programs, as well as those written in the more restricted style of~~

~~SPMD.~~

==The attractiveness of the message-passing paradigm at least partially stems from its wide portability. Programs expressed this way may run on distributed-memory multiprocessors, networks of workstations, and combinations of all of these. In addition, shared-memory implementations, including those for multi-core processors and hybrid architectures, are possible. The paradigm will not be made obsolete by architectures combining the shared- and distributed-memory views, or by increases in network speeds. It thus should be both possible and useful to implement this standard on a great variety of machines, including those “machines” consisting of collections of other machines, parallel or not, connected by a communication network.==

==The interface is suitable for use by fully general MIMD programs, as well as those written in the more restricted style of SPMD.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The interface is suitable for use by fully general MIMD programs, as well as those written in the more restricted style of SPMD.~~

~~MPI provides many features intended to improve performance on scalable parallel computers with specialized interprocessor communication hardware. Thus, we expect that native, high-performance implementations of MPI will be provided on such machines. At the same time, implementations of MPI on top of standard Unix interprocessor communication protocols will provide portability to workstation clusters and heterogenous networks of workstations.~~

==The interface is suitable for use by fully general MIMD programs, as well as those written in the more restricted style of SPMD. MPI provides many features intended to improve performance on scalable parallel computers with specialized interprocessor communication hardware. Thus, we expect that native, high-performance implementations of MPI will be provided on such machines. At the same time, implementations of MPI on top of standard Unix interprocessor communication protocols will provide portability to workstation clusters and heterogenous networks of workstations.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The interface is suitable for use by fully general MIMD ==(Multiple Instruction, Multiple Data)== programs, as well as those written in the more restricted style of ~~SPMD.~~ ==SPMD (Single Program, Multiple Data).== MPI provides many features intended to improve performance on scalable parallel computers with specialized interprocessor communication hardware. Thus, we expect that native, high-performance implementations of MPI will be provided on such machines. At the same time, implementations of MPI on top of standard Unix interprocessor communication protocols will provide portability to workstation clusters and heterogenous networks of workstations.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/intro#What Platforms Are Targets For Implementation?]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/intro#What Platforms Are Targets For Implementation?]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/intro#What Platforms Are Targets For Implementation?]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/intro#What Platforms Are Targets For Implementation?]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/intro#What Platforms Are Targets For Implementation?]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/intro#What Platforms Are Targets for Implementation?]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/intro#What Platforms Are Targets for Implementation?]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/intro#What Platforms Are Targets for Implementation?]]
