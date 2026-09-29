---
title: "Types of communicators"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Types of communicators

Chapter **binding** · in [[versions/v20/sections/binding#Types of communicators|MPI-2.0]], [[versions/v21/sections/binding#Types of communicators|MPI-2.1]], [[versions/v22/sections/binding#Types of communicators|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~There are five different types of communicators: `MPI::Comm`, `MPI::Intercomm`, `MPI::Intracomm`, `MPI::Cartcomm`, and `MPI::Graphcomm`.~~

==There are five different types of communicators:==

==`MPI::Comm`,==

==`MPI::Intercomm`,==

==`MPI::Intracomm`,==

==`MPI::Cartcomm`, and==

==`MPI::Graphcomm`.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

There are ~~five~~ ==six== different types of communicators:

~~`MPI::Cartcomm`, and~~

~~`MPI::Graphcomm`.~~

~~`MPI::Comm` is the abstract base communicator class, encapsulating the functionality common to all MPI communicators. `MPI::Intercomm` and `MPI::Intracomm` are derived from `MPI::Comm`. `MPI::Cartcomm` and `MPI::Graphcomm` are derived from `MPI::Intracomm`.~~

==`MPI::Cartcomm`,==

==`MPI::Graphcomm`, and==

==`MPI::Distgraphcomm`.==

==`MPI::Comm` is the abstract base communicator class, encapsulating the functionality common to all MPI communicators. `MPI::Intercomm` and `MPI::Intracomm` are derived from `MPI::Comm`. `MPI::Cartcomm`, `MPI::Graphcomm`, and `MPI::Distgraphcomm` are derived from `MPI::Intracomm`.==

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Types of communicators]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Types of communicators]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Types of communicators]]
