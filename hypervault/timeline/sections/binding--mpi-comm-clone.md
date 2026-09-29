---
title: "`MPI::Comm::Clone()`"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# `MPI::Comm::Clone()`

Chapter **binding** · in [[versions/v20/sections/binding#`MPI::Comm::Clone()`|MPI-2.0]], [[versions/v21/sections/binding#`MPI::Comm::Clone()`|MPI-2.1]], [[versions/v22/sections/binding#`MPI::Comm::Clone()`|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

> Within their class declarations, prototypes for `Clone()` and `Dup()` would look like the following: > > namespace MPI { > class Comm { > virtual Comm& Clone() const = 0; > }; > class Intracomm : public Comm { > Intracomm Dup() const { ... }; > virtual Intracomm& Clone() const { ... }; > }; > class Intercomm : public Comm { > Intercomm Dup() const { ... }; > virtual Intercomm& Clone() const { ... }; > }; > // Cartcomm and Graphcomm are similarly defined > }; ~~> > Compilers that do not support the variable return type feature of virtual functions may return a reference to `Comm`. Users can cast to the appropriate type as necessary.~~

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> Within their class declarations, prototypes for `Clone()` and `Dup()` would look like the following: > ==> ```== > namespace MPI { > class Comm { > virtual Comm& Clone() const = 0; > }; > class Intracomm : public Comm { > Intracomm Dup() const { ... }; > virtual Intracomm& Clone() const { ... }; > }; > class Intercomm : public Comm { > Intercomm Dup() const { ... }; > virtual Intercomm& Clone() const { ... }; > }; > // ~~Cartcomm~~ ==Cartcomm, Graphcomm, > //== and ~~Graphcomm~~ ==Distgraphcomm== are similarly defined > }; ==> ```==

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#`MPI::Comm::Clone()`]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#`MPI::Comm::Clone()`]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#`MPI::Comm::Clone()`]]
