---
title: "Universe Size"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Universe Size

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Universe Size|MPI-2.0]], [[versions/v21/sections/dynamic#Universe Size|MPI-2.1]], [[versions/v22/sections/dynamic#Universe Size|MPI-2.2]], [[versions/v30/sections/dynamic#Universe Size|MPI-3.0]], [[versions/v31/sections/dynamic#Universe Size|MPI-3.1]], [[versions/v40/sections/dynamic#Universe Size|MPI-4.0]], [[versions/v41/sections/dynamic#Universe Size|MPI-4.1]], [[versions/v50/sections/dynamic#Universe Size|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

MPI provides an attribute on ~~MPI_COMM_WORLD, MPI_UNIVERSE_SIZE,~~ ==`MPI_COMM_WORLD`, `MPI_UNIVERSE_SIZE`,== that allows the application to obtain this information in a portable manner. This attribute indicates the total number of processes that are expected. In Fortran, the attribute is the integer value. In C, the attribute is a pointer to the integer value. An application typically subtracts the size of ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== from ~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== to find out how many processes it should spawn. ~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== is initialized in [[versions/v22/API/MPI_INIT|MPI_INIT]] and is not changed by MPI. If defined, it has the same value on all processes of ~~MPI_COMM_WORLD. MPI_UNIVERSE_SIZE~~ ==`MPI_COMM_WORLD`. `MPI_UNIVERSE_SIZE`== is determined by the application startup mechanism in a way not specified by MPI. (The size of ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== is another example of such a parameter.)

Possibilities for how ~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== might be set include

An implementation must document how ~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== is set. An implementation may not support the ability to set ~~MPI_UNIVERSE_SIZE,~~ ==`MPI_UNIVERSE_SIZE`,== in which case the attribute ~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== is not set.

~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== is a recommendation, not necessarily a hard limit. For instance, some implementations may allow an application to spawn 50 processes per processor, if they are requested. However, it is likely that the user only wants to spawn one process per processor.

~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== is assumed to have been specified when an application was started, and is in essence a portable mechanism to allow the user to pass to the application (through the MPI process startup mechanism, such as `mpiexec`) a piece of critical runtime information. Note that no interaction with the runtime environment is required. If the runtime environment changes size while an application is running, ~~MPI_UNIVERSE_SIZE~~ ==`MPI_UNIVERSE_SIZE`== is not updated, and the application must find out about the change through direct communication with the runtime system.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Many “dynamic” MPI applications are expected to exist in a static runtime environment, in which resources have been allocated before the application is run. When ~~a~~ ==running one of these quasi-static applications, the== user (or possibly a batch system) ~~runs one of these quasi-static applications, she~~ will usually specify a number of processes to start and a total number of processes that are expected. An application simply needs to know how many slots there are, i.e., how many processes it should spawn.

Possibilities for how `MPI_UNIVERSE_SIZE` might be set ~~include~~ ==include:==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Universe Size]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Universe Size]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Universe Size]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Universe Size]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Universe Size]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Universe Size]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Universe Size]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Universe Size]]
