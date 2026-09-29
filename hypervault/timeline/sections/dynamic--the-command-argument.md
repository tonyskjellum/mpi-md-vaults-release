---
title: "The `command` argument"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/dynamic]
---

# The `command` argument

Chapter **dynamic** · in [[versions/v20/sections/dynamic#The `command` argument|MPI-2.0]], [[versions/v21/sections/dynamic#The `command` argument|MPI-2.1]], [[versions/v22/sections/dynamic#The `command` argument|MPI-2.2]], [[versions/v30/sections/dynamic#The `command` argument|MPI-3.0]], [[versions/v31/sections/dynamic#The `command` argument|MPI-3.1]], [[versions/v40/sections/dynamic#The `command` argument|MPI-4.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> The implementation should use a natural rule for finding executables and determining working directories. For instance, a homogeneous system with a global file system might look first in the working directory of the spawning process, or might search the directories in a PATH environment variable as do Unix shells. An implementation ~~on top of PVM would use PVM’s rules for finding executables (usually in `$HOME/pvm3/bin/$PVM_ARCH`). An MPI implementation running under POE on an IBM SP would use POE’s method of finding executables. An implementation~~ should document its rules for finding executables and determining working directories, and a high-quality implementation should give the user some control over these rules.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#The `command` argument]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#The `command` argument]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#The `command` argument]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#The `command` argument]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#The `command` argument]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The `command` argument]]
