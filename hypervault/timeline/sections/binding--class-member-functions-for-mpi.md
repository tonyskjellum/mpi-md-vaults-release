---
title: "Class Member Functions for MPI"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Class Member Functions for MPI

Chapter **binding** · in [[versions/v20/sections/binding#Class Member Functions for MPI|MPI-2.0]], [[versions/v21/sections/binding#Class Member Functions for MPI|MPI-2.1]], [[versions/v22/sections/binding#Class Member Functions for MPI|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

~~The complete set of C++ language bindings for MPI-1 is presented in Annex [[versions/v20/sections/appendix-c++#MPI-1 C++ Language Binding|MPI-1 C++ Language Binding]] .~~

==The complete set of C++ language bindings for==

==MPI==

==is presented in Annex [[versions/v21/sections/appLang-C++#C++ Bindings|C++ Bindings]] .==

~~To maintain consistency with what has gone before, the binding definitions are given in the same order as given for the C bindings in .~~

class foo_comm : public MPI::Intracomm { public: void ~~Send(void*~~ ==Send(const void*== buf, int count, const MPI::Datatype& type, int dest, int tag) const { // Class library functionality MPI::Intracomm::Send(buf, count, type, dest, tag); // More class library functionality } };

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

is presented in Annex [[versions/v22/sections/appLang-C++#C++ ~~Bindings|C++ Bindings]]~~ ==Bindings (deprecated)|C++ Bindings (deprecated)]]== .

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Class Member Functions for MPI]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Class Member Functions for MPI]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Class Member Functions for MPI]]
