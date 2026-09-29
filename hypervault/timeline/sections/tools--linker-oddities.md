---
title: "Linker Oddities"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Linker Oddities

Chapter **tools** · in [[versions/v13/sections/prof#Linker oddities|MPI-1.3]], [[versions/v21/sections/prof#Linker Oddities|MPI-2.1]], [[versions/v22/sections/prof#Linker Oddities|MPI-2.2]], [[versions/v30/sections/tools#Linker Oddities|MPI-3.0]], [[versions/v31/sections/tools#Linker Oddities|MPI-3.1]], [[versions/v40/sections/tools#Linker Oddities|MPI-4.0]], [[versions/v41/sections/tools#Linker Oddities|MPI-4.1]], [[versions/v50/sections/tools#Linker Oddities|MPI-5.0]]

Heading by release: MPI-1.3: “Linker oddities”; MPI-2.1: “Linker Oddities”; MPI-2.2: “Linker Oddities”; MPI-3.0: “Linker Oddities”; MPI-3.1: “Linker Oddities”; MPI-4.0: “Linker Oddities”; MPI-4.1: “Linker Oddities”; MPI-5.0: “Linker Oddities”

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

The Unix linker traditionally operates in one ~~pass :~~ ==pass:== the effect of this is that functions from libraries are only included in the image if they are needed at the time the library is scanned. When combined with weak symbols, or multiple definitions of the same function, this can cause odd (and unexpected) effects.

To overcome this we must ensure that the Fortran wrapper functions are included in the profiling version of the library. We ensure that this is possible by requiring that these be separable from the rest of the base MPI library. This allows them to be ~~`ar`ed~~ ==copied== out of the base library and into the profiling ~~one.~~ ==one using a tool such as `ar`.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Linker oddities]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Linker Oddities]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Linker Oddities]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Linker Oddities]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Linker Oddities]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Linker Oddities]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Linker Oddities]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Linker Oddities]]
