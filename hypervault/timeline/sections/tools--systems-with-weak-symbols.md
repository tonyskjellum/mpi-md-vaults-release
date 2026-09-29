---
title: "Systems with Weak Symbols"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# Systems with Weak Symbols

Chapter **tools** · in [[versions/v13/sections/prof#Systems with weak symbols|MPI-1.3]], [[versions/v21/sections/prof#Systems with Weak Symbols|MPI-2.1]], [[versions/v22/sections/prof#Systems with Weak Symbols|MPI-2.2]], [[versions/v30/sections/tools#Systems with Weak Symbols|MPI-3.0]], [[versions/v31/sections/tools#Systems with Weak Symbols|MPI-3.1]]

Heading by release: MPI-1.3: “Systems with weak symbols”; MPI-2.1: “Systems with Weak Symbols”; MPI-2.2: “Systems with Weak Symbols”; MPI-3.0: “Systems with Weak Symbols”; MPI-3.1: “Systems with Weak Symbols”

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

If the compiler and linker support weak external symbols ~~(e.g.~~ ==(e.g.,== Solaris 2.x, other ~~system~~ ==System== V.4 machines), then only a single library is required ~~through~~ ==as== the ~~use of `#pragma weak` thus~~ ==following example shows:==

The effect of this `#pragma` is to define the external symbol `MPI_Example` as a weak definition. This means that the linker will not complain if there is another definition of the symbol (for instance in the profiling ~~library),~~ ==library);== however if no other definition exists, then the linker will use the weak definition.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Systems with weak symbols]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Systems with Weak Symbols]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Systems with Weak Symbols]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Systems with Weak Symbols]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Systems with Weak Symbols]]
