---
title: "Overview and Goals"
chapter: intro
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/intro]
---

# Overview and Goals

Chapter **intro** · in [[versions/v13/sections/intro#Overview and Goals|MPI-1.3]], [[versions/v21/sections/intro#Overview and Goals|MPI-2.1]], [[versions/v22/sections/intro#Overview and Goals|MPI-2.2]], [[versions/v30/sections/intro#Overview and Goals|MPI-3.0]], [[versions/v31/sections/intro#Overview and Goals|MPI-3.1]], [[versions/v40/sections/intro#Overview and Goals|MPI-4.0]], [[versions/v41/sections/intro#Overview and Goals|MPI-4.1]], [[versions/v50/sections/intro#Overview and Goals|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (5 changed paragraphs)

~~Message passing is a paradigm used widely on certain classes of parallel machines, especially those with distributed memory. Although there are many variations, the basic concept of processes communicating through messages is well understood. Over the last ten years, substantial progress has been made in casting significant applications in this paradigm. Each vendor has implemented its own variant. More recently, several systems have demonstrated that a message passing system can be efficiently and portably implemented. It is thus an appropriate time to try to define both the syntax and semantics of a core of library routines that will be useful to a wide range of users and efficiently implementable on a wide range of computers.~~

~~In designing MPI we have sought to make use of the most attractive features of a number of existing message passing systems, rather than selecting one of them and adopting it as the standard. Thus, MPI has been strongly influenced by work at the IBM T. J. Watson Research Center , Intel’s NX/2 , Express , nCUBE’s Vertex , p4 , and PARMACS . Other important contributions have come from Zipcode , Chimp , PVM , Chameleon , and PICL .~~

~~The MPI standardization effort involved about 60 people from 40 organizations mainly from the United States and Europe. Most of the major vendors of concurrent computers were involved in MPI, along with researchers from universities, government laboratories, and industry. The standardization process began with the Workshop on Standards for Message Passing in a Distributed Memory Environment, sponsored by the Center for Research on Parallel Computing, held April 29-30, 1992, in Williamsburg, Virginia . At this workshop the basic features essential to a standard message passing interface were discussed, and a working group established to continue the standardization process.~~

~~A preliminary draft proposal, known as MPI1, was put forward by Dongarra, Hempel, Hey, and Walker in November 1992, and a revised version was completed in February 1993 . MPI1 embodied the main features that were identified at the Williamsburg workshop as being necessary in a message passing standard. Since MPI1 was primarily intended to promote discussion and “get the ball rolling,” it focused mainly on point-to-point communications. MPI1 brought to the forefront a number of important standardization issues, but did not include any collective communication routines and was not thread-safe.~~

~~In November 1992, a meeting of the MPI working group was held in Minneapolis, at which it was decided to place the standardization process on a more formal footing, and to generally adopt the procedures and organization of the High Performance Fortran Forum. Subcommittees were formed for the major component areas of the standard, and an email discussion service established for each. In addition, the goal of producing a draft MPI standard by the Fall of 1993 was set. To achieve this goal the MPI working group met every 6 weeks for two days throughout the first 9 months of 1993, and presented the draft MPI standard at the Supercomputing 93 conference in November 1993. These meetings and the email discussion together constituted the MPI Forum, membership of which has been open to all members of the high performance computing community.~~

~~The main advantages of establishing a message-passing standard are portability and ease-of-use. In a distributed memory communication environment in which the higher level routines and/or abstractions are build upon lower level message passing routines the benefits of standardization are particularly apparent. Furthermore, the definition of a message passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases provide hardware support for, thereby enhancing scalability.~~

~~The goal of the Message Passing Interface simply stated is to develop a widely used standard for writing message-passing programs. As such the interface should establish a practical, portable, efficient, and flexible standard for message passing.~~

==MPI (Message-Passing Interface) is a *message-passing library interface specification*. All parts of this definition are significant. MPI addresses primarily the message-passing parallel programming model, in which data is moved from the address space of one process to that of another process through cooperative operations on each process. (Extensions to the “classical” message-passing model are provided in collective operations, remote-memory access operations, dynamic process creation, and parallel I/O.) MPI is a *specification*, not an implementation; there are multiple implementations of MPI. This specification is for a *library interface*; MPI is not a language, and all MPI operations are expressed as functions, subroutines, or methods, according to the appropriate language bindings, which for C, C++, Fortran-77, and Fortran-95, are part of the MPI standard. The standard has been defined through an open process by a community of parallel computing vendors, computer scientists, and application developers. The next few sections provide an overview of the history of MPI’s development.==

==The main advantages of establishing a message-passing standard are portability and ease of use. In a distributed memory communication environment in which the higher level routines and/or abstractions are==

==built==

==upon lower level message-passing routines the benefits of standardization are particularly apparent. Furthermore, the definition of a message-passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases provide hardware support for, thereby enhancing scalability.==

==The goal of the Message-Passing Interface simply stated is to develop a widely used standard for writing message-passing programs. As such the interface should establish a practical, portable, efficient, and flexible standard for message passing.==

~~- Allow efficient communication: Avoid memory-to-memory copying and allow overlap of computation and communication and offload to communication co-processor, where available.~~

==- Allow efficient communication: Avoid memory-to-memory copying,==

==  allow overlap of computation and communication, and offload to communication co-processor, where available.==

~~- Allow convenient C and Fortran 77 bindings for the interface.~~

==- Allow convenient==

==  C, C++, Fortran-77, and Fortran-95==

==  bindings for the interface.==

~~- Define an interface that is not too different from current practice, such as PVM, NX, Express, p4, etc., and provides extensions that allow greater flexibility.~~

- The interface should be designed to allow for ~~thread-safety.~~ ==thread safety.==

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

MPI (Message-Passing Interface) is a *message-passing library interface specification*. All parts of this definition are significant. MPI addresses primarily the message-passing parallel programming model, in which data is moved from the address space of one process to that of another process through cooperative operations on each process. ~~(Extensions~~ ==Extensions== to the “classical” message-passing model are provided in collective operations, remote-memory access operations, dynamic process creation, and parallel ~~I/O.)~~ ==I/O.== MPI is a *specification*, not an implementation; there are multiple implementations of MPI. This specification is for a *library interface*; MPI is not a language, and all MPI operations are expressed as functions, subroutines, or methods, according to the appropriate language ~~bindings, which~~ ==bindings which,== for ~~C, C++, Fortran-77,~~ ==C== and ~~Fortran-95,~~ ==Fortran,== are part of the MPI standard. The standard has been defined through an open process by a community of parallel computing vendors, computer scientists, and application developers. The next few sections provide an overview of the history of MPI’s development.

~~built~~

~~upon lower level message-passing routines the benefits of standardization are particularly apparent. Furthermore, the definition of a message-passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases provide hardware support for, thereby enhancing scalability.~~

==built upon lower level message-passing routines the benefits of standardization are particularly apparent. Furthermore, the definition of a message-passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases for which they can provide hardware support, thereby enhancing scalability.==

allow overlap of computation and communication, and offload to communication ~~co-processor,~~ ==co-processors,== where available.

~~- Allow convenient~~

~~  C, C++, Fortran-77, and Fortran-95~~

~~  bindings for the interface.~~

==- Allow convenient C and Fortran bindings for the interface.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~The main advantages of establishing a message-passing standard are portability and ease of use. In a distributed memory communication environment in which the higher level routines and/or abstractions are~~

~~built upon lower level message-passing routines the benefits of standardization are particularly apparent. Furthermore, the definition of a message-passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases for which they can provide hardware support, thereby enhancing scalability.~~

==The main advantages of establishing a message-passing standard are portability and ease of use. In a distributed memory communication environment in which the higher level routines and/or abstractions are built upon lower level message-passing routines the benefits of standardization are particularly apparent. Furthermore, the definition of a message-passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases for which they can provide hardware support, thereby enhancing scalability.==

~~- Allow efficient communication: Avoid memory-to-memory copying,~~

~~  allow overlap of computation and communication, and offload to communication co-processors, where available.~~

==- Allow efficient communication: Avoid memory-to-memory copying, allow overlap of computation and communication, and offload to communication co-processors, where available.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The main advantages of establishing a message-passing standard are portability and ease of use. In a distributed memory communication environment in which the higher level routines and/or abstractions are built upon lower level message-passing ~~routines~~ ==routines,== the benefits of standardization are particularly apparent. Furthermore, the definition of a message-passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases for which they can provide hardware support, thereby enhancing scalability.

The goal of the Message-Passing ~~Interface~~ ==Interface,== simply ~~stated~~ ==stated,== is to develop a widely used standard for writing message-passing programs. As such the interface should establish a practical, portable, efficient, and flexible standard for message passing.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

MPI (Message-Passing Interface) is a *message-passing library interface specification*. All parts of this definition are significant. MPI addresses primarily the message-passing parallel programming model, in which data is moved from the address space of one process to that of another process through cooperative operations on each process. Extensions to the “classical” message-passing model are provided in collective operations, remote-memory access operations, dynamic process creation, and parallel I/O. MPI is a *specification*, not an implementation; there are multiple implementations of MPI. This specification is for a *library interface*; MPI is not a language, and all MPI operations are expressed as functions, subroutines, or methods, according to the appropriate language bindings ~~which,~~ ==that,== for C and Fortran, are part of the MPI standard. The standard has been defined through an open process by a community of parallel computing vendors, computer scientists, and application developers. The next few sections provide an overview of the history of MPI’s development.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/intro#Overview and Goals]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/intro#Overview and Goals]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/intro#Overview and Goals]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/intro#Overview and Goals]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/intro#Overview and Goals]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/intro#Overview and Goals]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/intro#Overview and Goals]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/intro#Overview and Goals]]
