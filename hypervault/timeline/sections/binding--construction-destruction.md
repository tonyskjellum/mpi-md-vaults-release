---
title: "Construction / Destruction"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Construction / Destruction

Chapter **binding** · in [[versions/v20/sections/binding#Construction / Destruction|MPI-2.0]], [[versions/v21/sections/binding#Construction / Destruction|MPI-2.1]], [[versions/v22/sections/binding#Construction / Destruction|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~create corresponding MPI::\*\_­NULL handles. That is, when an MPI object is instantiated, comparing it with its corresponding MPI::\*\_­NULL object will return `true`. The default constructors do not create new MPI opaque objects. Some classes have a member function `Create()` for this purpose.~~

==create corresponding==

==MPI::\*\_NULL==

==handles. That is, when an MPI object is instantiated, comparing it with its corresponding==

==MPI::\*\_NULL object will return `true`. The default constructors do not create new MPI opaque objects. Some classes have a member function `Create()` for this purpose.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~MPI::\*\_NULL~~ ==`MPI::*_NULL`==

~~MPI::\*\_NULL~~ ==`MPI::*_NULL`== object will return `true`. The default constructors do not create new MPI opaque objects. Some classes have a member function `Create()` for this purpose.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Construction / Destruction]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Construction / Destruction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Construction / Destruction]]
