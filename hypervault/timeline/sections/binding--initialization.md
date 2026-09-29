---
title: "Initialization"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Initialization

Chapter **binding** · in [[versions/v21/sections/binding#Initialization|MPI-2.1]], [[versions/v22/sections/binding#Initialization|MPI-2.2]], [[versions/v30/sections/binding#Initialization|MPI-3.0]], [[versions/v31/sections/binding#Initialization|MPI-3.1]], [[versions/v40/sections/binding#Initialization|MPI-4.0]], [[versions/v41/sections/binding#Initialization|MPI-4.1]], [[versions/v50/sections/binding#Initialization|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The MPI environment is initialized in the same manner for all languages by [[versions/v22/API/MPI_INIT|MPI_INIT]] . E.g., ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== carries the same information regardless of language: same processes, same environmental attributes, same error handlers.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~[[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] ,~~

~~from any language,~~

~~initializes MPI for execution in all languages.~~

==[[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , from any language, initializes MPI for execution in all languages.==

> Certain implementations use the (inout) `argc`, `argv` arguments of the ~~C/C++~~ ==C== version of [[versions/v30/API/MPI_INIT|MPI_INIT]] in order to propagate values for `argc` and `argv` to all executing processes. ~~> >~~ Use of the Fortran version of [[versions/v30/API/MPI_INIT|MPI_INIT]] to initialize MPI may result in a loss of this ability.

~~The function~~

~~[[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]]~~

~~finalizes the MPI environments for all languages.~~

==The function [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] finalizes the MPI environments for all languages.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~A call to [[versions/v40/API/MPI_INIT|MPI_INIT]] or~~

~~[[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , from any language, initializes MPI for execution in all languages.~~

==A call to [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , from any language, initializes MPI for execution in all languages.==

> Implementations may selectively link language specific MPI libraries only to codes that need them, so as not to increase the size of binaries for codes that use only one language. The MPI initialization code ~~need~~ ==needs to== perform initialization for a language only if that language library is loaded.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~A call to [[versions/v41/API/MPI_INIT|MPI_INIT]] or [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , from any language, initializes MPI for execution in all languages.~~

~~> [!note] Advice to users~~

~~> Certain implementations use the (inout) `argc`, `argv` arguments of the C version of [[versions/v41/API/MPI_INIT|MPI_INIT]] in order to propagate values for `argc` and `argv` to all executing processes. Use of the Fortran version of [[versions/v41/API/MPI_INIT|MPI_INIT]] to initialize MPI may result in a loss of this ability.~~

~~The function [[versions/v41/API/MPI_INITIALIZED|MPI_INITIALIZED]] returns the same answer in all languages.~~

~~The function [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] finalizes the MPI environments for all languages.~~

~~The function [[versions/v41/API/MPI_FINALIZED|MPI_FINALIZED]] returns the same answer in all languages.~~

~~The function [[versions/v41/API/MPI_ABORT|MPI_ABORT]] kills processes, irrespective of the language used by the caller or by the processes killed.~~

~~The MPI environment is initialized in the same manner for all languages by [[versions/v41/API/MPI_INIT|MPI_INIT]] . E.g., `MPI_COMM_WORLD` carries the same information regardless of language: same processes, same environmental attributes, same error handlers.~~

~~Information can be added to info objects in one language and retrieved in another.~~

~~> [!note] Advice to users~~

~~> The use of several languages in one MPI program may require the use of special options at compile and/or link time.~~

~~> [!warning] Advice to implementors~~

~~> Implementations may selectively link language specific MPI libraries only to codes that need them, so as not to increase the size of binaries for codes that use only one language. The MPI initialization code needs to perform initialization for a language only if that language library is loaded.~~

==Two approaches are available for initializing MPI: the World Model(Section [[versions/v41/sections/dynamic#The World Model|The World Model]] ) , and the Sessions Model(Section [[versions/v41/sections/dynamic#The Sessions Model|The Sessions Model]] ).==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

Two approaches are available for initializing MPI: the World ~~Model(Section~~ ==Model (Section== [[versions/v50/sections/dynamic#The World Model|The World Model]] ~~) ,~~ ==),== and the Sessions ~~Model(Section~~ ==Model (Section== [[versions/v50/sections/dynamic#The Sessions Model|The Sessions Model]] ).

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Initialization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Initialization]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Initialization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Initialization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Initialization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Initialization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Initialization]]
