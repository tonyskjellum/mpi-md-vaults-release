---
title: "Background of MPI-4.1"
chapter: intro
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/intro]
---

# Background of MPI-4.1

Chapter **intro** · in [[versions/v41/sections/intro#Background of MPI-4.1|MPI-4.1]], [[versions/v50/sections/intro#Background of MPI-4.1|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~MPI sought to make use of the most attractive features of a number of existing message-passing systems, rather than selecting one of them and adopting it as the standard. Thus, MPI was strongly influenced by work at the IBM T. J. Watson Research Center , Intel’s NX/2 , Express , nCUBE’s Vertex ,~~

~~p4 , and PARMACS .~~

~~Other important contributions have come from Zipcode , Chimp , PVM , Chameleon , and PICL .~~

==MPI sought to make use of the most attractive features of a number of existing message-passing systems, rather than selecting one of them and adopting it as the standard. Thus, MPI was strongly influenced by work at the IBM T. J. Watson Research Center , Intel’s NX/2 , Express , nCUBE’s Vertex , p4 , and PARMACS . Other important contributions have come from Zipcode , Chimp , PVM , Chameleon , and PICL .==

A preliminary draft proposal, known as ~~<span class="sans-serif">MPI1</span>,~~ ==MPI-1,== was put forward by Dongarra, Hempel, Hey, and Walker in November 1992, and a revised version was completed in February 1993 . ~~MPI1~~ ==MPI-1== embodied the main features that were identified at the Williamsburg workshop as being necessary in a message passing standard. Since ~~MPI1~~ ==MPI-1== was primarily intended to promote discussion and “get the ball rolling,” it focused mainly on point-to-point communications. ~~MPI1~~ ==MPI-1== brought to the forefront a number of important standardization issues, but did not include any collective communication routines and was not thread-safe.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~MPI sought to make use of the most attractive features of a number of existing message-passing systems, rather than selecting one of them and adopting it as the standard. Thus, MPI was strongly influenced by work at the IBM T. J. Watson Research Center , Intel’s NX/2 , Express , nCUBE’s Vertex , p4 , and PARMACS . Other important contributions have come from Zipcode , Chimp , PVM , Chameleon , and PICL .~~

~~The MPI standardization effort involved about 60 people from 40 organizations mainly from the United States and Europe. Most of the major vendors of concurrent computers were involved in MPI, along with researchers from universities, government laboratories, and industry. The standardization process began with the Workshop on Standards for Message-Passing in a Distributed Memory Environment, sponsored by the Center for Research on Parallel Computing, held April 29-30, 1992, in Williamsburg, Virginia . At this workshop the basic features essential to a standard message-passing interface were discussed, and a working group established to continue the standardization process.~~

~~A preliminary draft proposal, known as MPI-1, was put forward by Dongarra, Hempel, Hey, and Walker in November 1992, and a revised version was completed in February 1993 . MPI-1 embodied the main features that were identified at the Williamsburg workshop as being necessary in a message passing standard. Since MPI-1 was primarily intended to promote discussion and “get the ball rolling,” it focused mainly on point-to-point communications. MPI-1 brought to the forefront a number of important standardization issues, but did not include any collective communication routines and was not thread-safe.~~

~~In November 1992, a meeting of the MPI working group was held in Minneapolis, at which it was decided to place the standardization process on a more formal footing, and to generally adopt the procedures and organization of the High Performance Fortran Forum. Subcommittees were formed for the major component areas of the standard, and an email discussion service established for each. In addition, the goal of producing a draft MPI standard by the Fall of 1993 was set. To achieve this goal the MPI working group met every 6 weeks for two days throughout the first 9 months of 1993, and presented the draft MPI standard at the Supercomputing 93 conference in November 1993. These meetings and the email discussion together constituted the MPI Forum, membership of which has been open to all members of the high performance computing community.~~

==MPI-3.1 is a minor update to the MPI standard. Most of the updates are corrections and clarifications to the standard, especially for the Fortran bindings. New functions added include routines to manipulate `MPI_Aint` values in a portable manner, nonblocking collective I/O routines, and routines to get the index value by name for [[MPI_T]] performance and control variables. A general index was also added.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~MPI-3.1 is a minor update to the MPI standard. Most of the updates are corrections and clarifications to the standard, especially for the Fortran bindings. New functions added include routines to manipulate `MPI_Aint` values in a portable manner, nonblocking collective I/O routines, and routines to get the index value by name for [[MPI_T]] performance and control variables. A general index was also added.~~

==MPI-4.0 is a major update to the MPI standard.==

==The largest changes are the addition of large-count versions of many routines to address the limitations of using an `int` or `INTEGER` for the count parameter, persistent collectives, partitioned communications, an alternative way to initialize MPI, application info assertions, and improvements to the definitions of error handling. In addition, there are a number of smaller improvements and corrections.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~MPI-4.0 is a major update to the MPI standard.~~

~~The largest changes are the addition of large-count versions of many routines to address the limitations of using an `int` or `INTEGER` for the count parameter, persistent collectives, partitioned communications, an alternative way to initialize MPI, application info assertions, and improvements to the definitions of error handling. In addition, there are a number of smaller improvements and corrections.~~

==MPI-4.1 is a minor update to the MPI standard. It contains mostly corrections and clarifications to the MPI-4.0 document. Several routines, the attribute key `MPI_HOST`, and the `mpif.h` Fortran include file are deprecated. A new routine provides a way to inquire about the hardware on which the MPI program is running. Any valid MPI-4.0 program is a valid MPI-4.1 program with the exception of semantic changes listed in Chapter [[chap-semantic-changes]] .==

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/intro#Background of MPI-4.1]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/intro#Background of MPI-4.1]]
