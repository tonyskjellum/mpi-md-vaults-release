---
title: "Communication Initiation"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Communication Initiation

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Communication initiation|MPI-1.3]], [[versions/v21/sections/pt2pt#Communication Initiation|MPI-2.1]], [[versions/v22/sections/pt2pt#Communication Initiation|MPI-2.2]], [[versions/v30/sections/pt2pt#Communication Initiation|MPI-3.0]], [[versions/v31/sections/pt2pt#Communication Initiation|MPI-3.1]], [[versions/v40/sections/pt2pt#Communication Initiation|MPI-4.0]], [[versions/v41/sections/pt2pt#Communication Initiation|MPI-4.1]], [[versions/v50/sections/pt2pt#Communication Initiation|MPI-5.0]]

Heading by release: MPI-1.3: “Communication initiation”; MPI-2.1: “Communication Initiation”; MPI-2.2: “Communication Initiation”; MPI-3.0: “Communication Initiation”; MPI-3.1: “Communication Initiation”; MPI-4.0: “Communication Initiation”; MPI-4.1: “Communication Initiation”; MPI-5.0: “Communication Initiation”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with ==Register Optimization”== > > ~~Register Optimization”~~ in Section ~~10.2.2 of the MPI-2 Standard,~~ ==[[versions/v21/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] on== pages ~~286~~ ==[[versions/v21/sections/binding#Problems Due to Data Copying== and ~~289.~~ ==Sequence Association|Problems Due to Data Copying and Sequence Association]] and [[versions/v21/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] .==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

A nonblocking send call indicates that the system may start copying data out of the send buffer. The sender should not ~~access~~ ==modify== any part of the send buffer after a nonblocking send operation is called, until the send completes.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in ~~subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with Register Optimization”~~ > > ~~in Section~~ ==Sections== [[versions/v30/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] ==- [[versions/v30/sections/binding#Comparison with C|Comparison with C]] , especially in > > Sections [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]]== on pages [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence ~~Association|Problems~~ ==Association with Subscript Triplets|Problems== Due to Data Copying and Sequence ~~Association]]~~ ==Association with Subscript Triplets]] - [[versions/v30/sections/binding#Problems Due to Data Copying== and ~~[[binding#A Problem~~ ==Sequence Association== with ==Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”, > > and in Sections [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and== Register ~~Optimization|A Problem with Register Optimization]] .~~ ==Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

We use the same naming conventions as for blocking communication: a prefix of ~~<span class="sans-serif">B</span>, <span class="sans-serif">S</span>,~~ ==`B`, `S`,== or ~~<span class="sans-serif">R</span>~~ ==`R`== is used for ~~<span class="sans-serif">buffered</span>, <span class="sans-serif">synchronous</span>~~ ==**buffered**, **synchronous**== or ~~<span class="sans-serif">ready</span>~~ ==**ready**== mode. In addition a prefix of ~~<span class="sans-serif">I</span>~~ ==`I`== (for ~~<span class="sans-serif">immediate</span>)~~ ==**immediate**)== indicates that the call is nonblocking.

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in ~~> >~~ Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] ~~-~~ ==–== [[versions/v31/sections/binding#Comparison with C|Comparison with C]] ~~, especially in > > Sections [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] - [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”, > > and in Sections [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and Register Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”.~~ ==.==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

~~We~~ ==For the functions defined in this section, we== use the same naming conventions as for blocking communication: a prefix of `B`, `S`, or `R` is used for ~~**buffered**, **synchronous**~~ ==*buffered*, *synchronous*,== or ~~**ready**~~ ==*ready*== mode. In ~~addition~~ ==addition, for these functions== a prefix of `I` (for ~~**immediate**)~~ ==*immediate* and *incomplete*)== indicates that the call is nonblocking.

Start a standard ~~mode,~~ ==mode== nonblocking send.

Start a buffered ~~mode,~~ ==mode== nonblocking send.

Start a synchronous ~~mode,~~ ==mode== nonblocking send.

==![[versions/v40/API/MPI_ISENDRECV]]==

==Initiate a nonblocking communication request for a *send and receive* operation.==

==![[versions/v40/API/MPI_ISENDRECV_REPLACE]]==

==Initiate a nonblocking communication request for a *send and receive* operation. The same buffer is used both for the send and for the receive, so that the message sent is replaced by the message received.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Communication initiation]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Communication Initiation]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Communication Initiation]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Communication Initiation]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Communication Initiation]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Communication Initiation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Communication Initiation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Communication Initiation]]
