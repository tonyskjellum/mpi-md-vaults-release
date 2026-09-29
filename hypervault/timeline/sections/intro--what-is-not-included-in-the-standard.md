---
title: "What Is Not Included in the Standard?"
chapter: intro
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/intro]
---

# What Is Not Included in the Standard?

Chapter **intro** · in [[versions/v13/sections/intro#What Is Not Included In The Standard?|MPI-1.3]], [[versions/v21/sections/intro#What Is Not Included In The Standard?|MPI-2.1]], [[versions/v22/sections/intro#What Is Not Included In The Standard?|MPI-2.2]], [[versions/v30/sections/intro#What Is Not Included In The Standard?|MPI-3.0]], [[versions/v31/sections/intro#What Is Not Included In The Standard?|MPI-3.1]], [[versions/v40/sections/intro#What Is Not Included in the Standard?|MPI-4.0]]

Heading by release: MPI-1.3: “What Is Not Included In The Standard?”; MPI-2.1: “What Is Not Included In The Standard?”; MPI-2.2: “What Is Not Included In The Standard?”; MPI-3.0: “What Is Not Included In The Standard?”; MPI-3.1: “What Is Not Included In The Standard?”; MPI-4.0: “What Is Not Included in the Standard?”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~- Explicit shared-memory operations~~

~~- Operations that require more operating system support than is currently standard; for example, interrupt-driven receives, remote execution, or active messages~~

~~- Program construction tools~~

~~- Debugging facilities~~

~~- Explicit support for threads~~

~~- Support for task management~~

~~- I/O functions~~

==- Operations that require more operating system support than is currently standard; for example, interrupt-driven receives, remote execution, or active messages,==

==- Program construction tools,==

==- Debugging facilities.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The standard does not specify:~~

~~- Operations that require more operating system support than is currently standard; for example, interrupt-driven receives, remote execution, or active messages,~~

~~- Program construction tools,~~

~~- Debugging facilities.~~

~~There are many features that have been considered and not included in this standard. This happened for a number of reasons, one of which is the time constraint that was self-imposed in finishing the standard. Features that are not included can always be offered as extensions by specific implementations. Perhaps future versions of MPI will address some of these issues.~~

==The standard includes:==

==- Point-to-point communication,==

==- Partitioned communication,==

==- Datatypes,==

==- Collective operations,==

==- Process groups,==

==- Communication contexts,==

==- Virtual Topologies for MPI Processes,==

==- Environmental management and inquiry,==

==- The Info object,==

==- Process initialization, creation, and management,==

==- One-sided communication,==

==- External interfaces,==

==- Parallel file I/O,==

==- Tool support,==

==- Language bindings for Fortran and C, and==

==- Additional topics in side-documents.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~- Language bindings for Fortran and C, and~~

==- Language bindings for Fortran and C,==

==- Application Binary Interface, and==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/intro#What Is Not Included In The Standard?]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/intro#What Is Not Included In The Standard?]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/intro#What Is Not Included In The Standard?]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/intro#What Is Not Included In The Standard?]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/intro#What Is Not Included In The Standard?]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/intro#What Is Not Included in the Standard?]]
