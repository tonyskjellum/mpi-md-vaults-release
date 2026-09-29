---
title: "Null MPI Processes"
chapter: pt2pt
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Null MPI Processes

Chapter **pt2pt** · in [[versions/v41/sections/pt2pt#Null MPI Processes|MPI-4.1]], [[versions/v50/sections/pt2pt#Null MPI Processes|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The special value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== can be used instead of a rank wherever a source or a destination argument is required in a call. A communication with process ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== has no effect. A send to ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== succeeds and returns as soon as possible. A receive from ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== succeeds and returns as soon as possible with no modifications to the receive buffer. When a receive with `source` = ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== is executed then the status object returns `source` = ~~MPI_PROC_NULL,~~ ==`MPI_PROC_NULL`,== `tag` = ~~MPI_ANY_TAG~~ ==`MPI_ANY_TAG`== and `count = 0`.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

==A probe or matching probe with source = `MPI_PROC_NULL` succeeds and returns as soon as possible, and the status object returns source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG` and count = 0.==

==A matching probe (cf. Section [[versions/v30/sections/pt2pt#Matching Probe|Matching Probe]] ) with `MPI_PROC_NULL` as source returns `flag = true`, `message = MPI_MESSAGE_NO_PROC`, and the status object returns `source = MPI_PROC_NULL`, `tag = MPI_ANY_TAG`, and `count = 0`.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The special value `MPI_PROC_NULL` can be used instead of a rank wherever a source or a destination argument is required in a call. A communication with process `MPI_PROC_NULL` has no effect. A send to `MPI_PROC_NULL` succeeds and returns as soon as possible. A receive from `MPI_PROC_NULL` succeeds and returns as soon as possible with no modifications to the receive buffer. When a receive with `source` = `MPI_PROC_NULL` is executed then the status object returns `source` = `MPI_PROC_NULL`, `tag` = `MPI_ANY_TAG` and `count = 0`.~~

~~A probe or matching probe with source = `MPI_PROC_NULL` succeeds and returns as soon as possible, and the status object returns source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG` and count = 0.~~

~~A matching probe (cf. Section [[versions/v31/sections/pt2pt#Matching Probe|Matching Probe]] ) with `MPI_PROC_NULL` as source returns `flag = true`, `message = MPI_MESSAGE_NO_PROC`, and the status object returns `source = MPI_PROC_NULL`, `tag = MPI_ANY_TAG`, and `count = 0`.~~

==The special value `MPI_PROC_NULL` can be used instead of a rank wherever a source or a destination argument is required in a call. A communication with process `MPI_PROC_NULL` has no effect. A send to `MPI_PROC_NULL` succeeds and returns as soon as possible. A receive from `MPI_PROC_NULL` succeeds and returns as soon as possible with no modifications to the receive buffer. When a receive with `source` = `MPI_PROC_NULL` is executed then the status object returns `source` = `MPI_PROC_NULL`, `tag` = `MPI_ANY_TAG` and `count = 0`. A probe or matching probe with source = `MPI_PROC_NULL` succeeds and returns as soon as possible, and the status object returns source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG` and count = 0. A matching probe (cf. Section [[versions/v31/sections/pt2pt#Matching Probe|Matching Probe]] ) with `MPI_PROC_NULL` as source returns `flag = true`, `message = MPI_MESSAGE_NO_PROC`, and the status object returns `source = MPI_PROC_NULL`, `tag = MPI_ANY_TAG`, and `count = 0`.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~In many instances, it is convenient to specify a “dummy” source or destination for communication. This simplifies the code that is needed for dealing with boundaries, for example, in the case of a non-circular shift done with calls to send-receive.~~

~~The special value `MPI_PROC_NULL` can be used instead of a rank wherever a source or a destination argument is required in a call. A communication with process `MPI_PROC_NULL` has no effect. A send to `MPI_PROC_NULL` succeeds and returns as soon as possible. A receive from `MPI_PROC_NULL` succeeds and returns as soon as possible with no modifications to the receive buffer. When a receive with `source` = `MPI_PROC_NULL` is executed then the status object returns `source` = `MPI_PROC_NULL`, `tag` = `MPI_ANY_TAG` and `count = 0`. A probe or matching probe with source = `MPI_PROC_NULL` succeeds and returns as soon as possible, and the status object returns source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG` and count = 0. A matching probe (cf. Section [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] ) with `MPI_PROC_NULL` as source returns `flag = true`, `message = MPI_MESSAGE_NO_PROC`, and the status object returns `source = MPI_PROC_NULL`, `tag = MPI_ANY_TAG`, and `count = 0`.~~

==In many instances, it is convenient to specify a “dummy” source or destination for communication. This simplifies the code that is needed for dealing with boundaries, for example, in the case of a noncircular shift done with calls to send-receive.==

==The special value `MPI_PROC_NULL` can be used instead of a rank wherever a source or a destination argument is required in a call. A communication with process `MPI_PROC_NULL` has no effect. A send to `MPI_PROC_NULL` succeeds and returns as soon as possible. A receive from `MPI_PROC_NULL` succeeds and returns as soon as possible with no modifications to the receive buffer. When a receive with `source``=``MPI_PROC_NULL` is executed then the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG` and `count``= 0`. A probe or matching probe with `source``=``MPI_PROC_NULL` succeeds and returns as soon as possible, and the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG` and `count``= 0`. A matching probe (cf. Section [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] ) with `source``=``MPI_PROC_NULL` returns `flag``=``true`, `message``=``MPI_MESSAGE_NO_PROC`, and the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`, and `count``= 0`.==

==[^1]: These types, such as `DOUBLE COMPLEX` and `INTEGER*4`, are not specified by any Fortran standard but are extensions commonly accepted by Fortran compilers.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The special value `MPI_PROC_NULL` can be used instead of a rank wherever a source or a destination argument is required in a call. A communication with ~~process~~ `MPI_PROC_NULL` has no effect. A send to `MPI_PROC_NULL` succeeds and returns as soon as possible. A receive from `MPI_PROC_NULL` succeeds and returns as soon as possible with no modifications to the receive buffer. When a receive with `source``=``MPI_PROC_NULL` is executed then the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG` and `count``= 0`. A probe or matching probe with `source``=``MPI_PROC_NULL` succeeds and returns as soon as possible, and the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG` and `count``= 0`. A matching probe (cf. Section [[versions/v41/sections/pt2pt#Matching Probe|Matching Probe]] ) with `source``=``MPI_PROC_NULL` returns `flag``=``true`, `message``=``MPI_MESSAGE_NO_PROC`, and the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`, and `count``= 0`.

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Null MPI Processes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Null MPI Processes]]
