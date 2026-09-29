---
title: "Discussion"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Discussion

Chapter **tools** · in [[versions/v13/sections/prof#Discussion|MPI-1.3]], [[versions/v21/sections/prof#Discussion|MPI-2.1]], [[versions/v22/sections/prof#Discussion|MPI-2.2]], [[versions/v30/sections/tools#Discussion|MPI-3.0]], [[versions/v31/sections/tools#Discussion|MPI-3.1]], [[versions/v40/sections/tools#Discussion|MPI-4.0]], [[versions/v41/sections/tools#Discussion|MPI-4.1]], [[versions/v50/sections/tools#Discussion|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~Since MPI is a machine independent standard with many different implementations, it is unreasonable to expect that the authors of profiling tools for MPI will have access to the source code which implements MPI on any particular machine. It is therefore necessary to provide a mechanism by which the implementors of such tools can collect whatever performance information they wish *without* access to the underlying implementation.~~

==Since MPI is a machine independent standard with many different implementations, it is unreasonable to expect that the authors of profiling tools for MPI will have access to the source code==

==that==

==implements MPI on any particular machine. It is therefore necessary to provide a mechanism by which the implementors of such tools can collect whatever performance information they wish *without* access to the underlying implementation.==

~~The examples below show one way in which an implementation could be constructed to meet the requirements on a Unix system (there are doubtless others which would be equally valid).~~

==The examples below show one way in which an implementation could be constructed to meet the requirements on a Unix system (there are doubtless others==

==that==

==would be equally valid).==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~Since MPI is a machine independent standard with many different implementations, it is unreasonable to expect that the authors of profiling tools for MPI will have access to the source code~~

~~that~~

~~implements MPI on any particular machine. It is therefore necessary to provide a mechanism by which the implementors of such tools can collect whatever performance information they wish *without* access to the underlying implementation.~~

==Since MPI is a machine independent standard with many different implementations, it is unreasonable to expect that the authors of profiling tools for MPI will have access to the source code that implements MPI on any particular machine. It is therefore necessary to provide a mechanism by which the implementors of such tools can collect whatever performance information they wish *without* access to the underlying implementation.==

~~As the issues being addressed here are intimately tied up with the way in which executable images are built, which may differ greatly on different machines, the examples given below should be treated solely as one way of implementing the objective of the MPI profiling interface. The actual requirements made of an implementation are those detailed in the Requirements section above, the whole of the rest of this chapter is only present as justification and discussion of the logic for those requirements.~~

~~The examples below show one way in which an implementation could be constructed to meet the requirements on a Unix system (there are doubtless others~~

~~that~~

~~would be equally valid).~~

==As the issues being addressed here are intimately tied up with the way in which executable images are built, which may differ greatly on different machines, the examples given below should be treated solely as one way of implementing the objective of the MPI profiling interface. The actual requirements made of an implementation are those detailed in the Requirements section above, the whole of the rest of this section is only present as justification and discussion of the logic for those requirements.==

==The examples below show one way in which an implementation could be constructed to meet the requirements on a Unix system (there are doubtless others that would be equally valid).==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

While the initial impetus for the development of this interface arose from the desire to permit the implementation of profiling tools, it is clear that an interface like that specified may also prove useful for other purposes, such as “internetworking” multiple MPI implementations. Since all that is defined is an interface, there is no objection to ~~its~~ ==it== being used wherever it is useful.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~The examples below~~ ==Examples [[versions/v50/sections/tools#Logic of the Design|Logic of the Design]] , [[versions/v50/sections/tools#MPI Library Implementation|MPI Library Implementation]] , [[versions/v50/sections/tools#MPI Library Implementation|MPI Library Implementation]] , and [[versions/v50/sections/tools#MPI Library Implementation|MPI Library Implementation]]== show ~~one way~~ ==ways== in which an implementation could be constructed to meet the requirements on a Unix system (there ~~are doubtless~~ ==may be== others that would be equally valid).

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Discussion]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Discussion]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Discussion]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Discussion]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Discussion]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Discussion]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Discussion]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Discussion]]
