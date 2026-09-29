---
title: "`MPI::COMM_NULL`"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# `MPI::COMM_NULL`

Chapter **binding** · in [[versions/v20/sections/binding#MPI::COMM_NULL|MPI-2.0]], [[versions/v21/sections/binding#MPI::COMM_NULL|MPI-2.1]], [[versions/v22/sections/binding#`MPI::COMM_NULL`|MPI-2.2]]

Heading by release: MPI-2.0: “MPI::COMM_NULL”; MPI-2.1: “MPI::COMM_NULL”; MPI-2.2: “`MPI::COMM_NULL`”

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~`Dup()` is not defined as a member function of `MPI::Comm`, but it is defined for the derived classes of `MPI::Comm`. `Dup()` is not virtual and it returns its OUT/ parameter by value.~~

==`Dup()` is not defined as a member function of `MPI::Comm`, but it is defined for the derived classes of `MPI::Comm`. `Dup()` is not virtual and it returns its==

==OUT parameter==

==by value.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The specific type of ~~MPI::COMM_NULL~~ ==`MPI::COMM_NULL`== is implementation dependent. ~~MPI::COMM_NULL~~ ==`MPI::COMM_NULL`== must be able to be used in comparisons and initializations with all types of communicators. ~~MPI::COMM_NULL~~ ==`MPI::COMM_NULL`== must also be able to be passed to a function that expects a communicator argument in the parameter list (provided that ~~MPI::COMM_NULL~~ ==`MPI::COMM_NULL`== is an allowed value for the communicator argument).

> There are several possibilities for implementation of ~~MPI::COMM_NULL.~~ ==`MPI::COMM_NULL`.== Specifying its required behavior, rather than its realization, provides maximum flexibility to implementors.

The following example demonstrates the behavior of assignment and comparison using ~~MPI::COMM_NULL.~~ ==`MPI::COMM_NULL`.==

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#MPI::COMM_NULL]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#MPI::COMM_NULL]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#`MPI::COMM_NULL`]]
