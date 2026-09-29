# Introduction to MPI



## Overview and Goals

MPI (Message-Passing Interface) is a *message-passing library interface specification*. All parts of this definition are significant. MPI addresses primarily the message-passing parallel programming model, in which data is moved from the address space of one process to that of another process through cooperative operations on each process. Extensions to the “classical” message-passing model are provided in collective operations, remote-memory access operations, dynamic process creation, and parallel I/O. MPI is a *specification*, not an implementation; there are multiple implementations of MPI. This specification is for a *library interface*; MPI is not a language, and all MPI operations are expressed as functions, subroutines, or methods, according to the appropriate language bindings that, for C and Fortran, are part of the MPI standard. The standard has been defined through an open process by a community of parallel computing vendors, computer scientists, and application developers. The next few sections provide an overview of the history of MPI’s development.

The main advantages of establishing a message-passing standard are portability and ease of use. In a distributed memory communication environment in which the higher level routines and/or abstractions are built upon lower level message-passing routines, the benefits of standardization are particularly apparent. Furthermore, the definition of a message-passing standard, such as that proposed here, provides vendors with a clearly defined base set of routines that they can implement efficiently, or in some cases for which they can provide hardware support, thereby enhancing scalability.

The goal of the Message-Passing Interface, simply stated, is to develop a widely used standard for writing message-passing programs. As such the interface should establish a practical, portable, efficient, and flexible standard for message passing.

A complete list of goals follows.

- Design an application programming interface (not necessarily for compilers or a system implementation library).

- Allow efficient communication: Avoid memory-to-memory copying, allow overlap of computation and communication, and offload to communication co-processors, where available.

- Allow for implementations that can be used in a heterogeneous environment.

- Allow convenient C and Fortran bindings for the interface.

- Assume a reliable communication interface: the user need not cope with communication failures. Such failures are dealt with by the underlying communication subsystem.

- Define an interface that can be implemented on many vendor’s platforms, with no significant changes in the underlying communication and system software.

- Semantics of the interface should be language independent.

- The interface should be designed to allow for thread safety.

## Background of MPI-1/



MPI sought to make use of the most attractive features of a number of existing message-passing systems, rather than selecting one of them and adopting it as the standard. Thus, MPI was strongly influenced by work at the IBM T. J. Watson Research Center , Intel’s NX/2 , Express , nCUBE’s Vertex , p4 , and PARMACS . Other important contributions have come from Zipcode , Chimp , PVM , Chameleon , and PICL .

The MPI standardization effort involved about 60 people from 40 organizations mainly from the United States and Europe. Most of the major vendors of concurrent computers were involved in MPI, along with researchers from universities, government laboratories, and industry. The standardization process began with the Workshop on Standards for Message-Passing in a Distributed Memory Environment, sponsored by the Center for Research on Parallel Computing, held April 29–30, 1992, in Williamsburg, Virginia . At this workshop the basic features essential to a standard message-passing interface were discussed, and a working group established to continue the standardization process.

A preliminary draft proposal, known as MPI-1, was put forward by Dongarra, Hempel, Hey, and Walker in November 1992, and a revised version was completed in February 1993 . MPI-1 embodied the main features that were identified at the Williamsburg workshop as being necessary in a message passing standard. Since MPI-1 was primarily intended to promote discussion and “get the ball rolling,” it focused mainly on point-to-point communications. MPI-1 brought to the forefront a number of important standardization issues, but did not include any collective communication routines and was not thread-safe.

In November 1992, a meeting of the MPI working group was held in Minneapolis, at which it was decided to place the standardization process on a more formal footing, and to generally adopt the procedures and organization of the High Performance Fortran Forum. Subcommittees were formed for the major component areas of the standard, and an email discussion service established for each. In addition, the goal of producing a draft MPI standard by the Fall of 1993 was set. To achieve this goal the MPI working group met every 6 weeks for two days throughout the first 9 months of 1993, and presented the draft MPI standard at the Supercomputing 93 conference in November 1993. These meetings and the email discussion together constituted the MPI Forum, membership of which has been open to all members of the high performance computing community.

## Background of MPI-1.1, MPI-1.2, and MPI-2.0



Beginning in March 1995, the MPI Forum began meeting to consider corrections and extensions to the original MPI standard document . The first product of these deliberations was Version 1.1 of the MPI specification, released in June of 1995 (see\
http://www.mpi-forum.org for official MPI document releases). At that time, effort focused in five areas.

1.  Further corrections and clarifications for the MPI-1.1 document.

2.  Additions to MPI-1.1 that do not significantly change its types of functionality (new datatype constructors, language interoperability, etc.).

3.  Completely new types of functionality (dynamic processes, one-sided communication, parallel I/O, etc.) that are what everyone thinks of as “MPI-2 functionality.”

4.  Bindings for Fortran 90 and C++. MPI-2 specifies C++ bindings for both MPI-1 and MPI-2 functions, and extensions to the Fortran 77 binding of MPI-1 and MPI-2 to handle Fortran 90 issues.

5.  Discussions of areas in which the MPI process and framework seem likely to be useful, but where more discussion and experience are needed before standardization (e.g., zero-copy semantics on shared-memory machines, real-time specifications).

Corrections and clarifications (items of type 1 in the above list) were collected in Chapter 3 of the MPI-2 document: “Version 1.2 of MPI.” That chapter also contains the function for identifying the version number. Additions to MPI-1.1 (items of types 2, 3, and 4 in the above list) are in the remaining chapters of the MPI-2 document, and constitute the specification for MPI-2. Items of type 5 in the above list have been moved to a separate document, the “MPI Journal of Development” (JOD), and are not part of the MPI-2 standard.

This structure makes it easy for users and implementors to understand what level of MPI compliance a given implementation has:

- MPI-1 compliance will mean compliance with MPI-1.3. This is a useful level of compliance. It means that the implementation conforms to the clarifications of MPI-1.1 function behavior given in Chapter 3 of the MPI-2 document. Some implementations may require changes to be MPI-1 compliant.

- MPI-2 compliance will mean compliance with all of MPI-2.1.

- The MPI Journal of Development is not part of the MPI standard.

It is to be emphasized that forward compatibility is preserved. That is, a valid MPI-1.1 program is both a valid MPI-1.3 program and a valid MPI-2.1 program, and a valid MPI-1.3 program is a valid MPI-2.1 program.

## Background of MPI-1.3 and MPI-2.1

 After the release of MPI-2.0, the MPI Forum kept working on errata and clarifications for both standard documents (MPI-1.1 and MPI-2.0). The short document “Errata for MPI-1.1” was released October 12, 1998. On July 5, 2001, a first ballot of errata and clarifications for MPI-2.0 was released, and a second ballot was voted on May 22, 2002. Both votes were done electronically. Both ballots were combined into one document: “Errata for MPI-2,” May 15, 2002. This errata process was then interrupted, but the Forum and its e-mail reflectors kept working on new requests for clarification.

Restarting regular work of the MPI Forum was initiated in three meetings, at EuroPVM/MPI’06 in Bonn, at EuroPVM/MPI’07 in Paris, and at SC’07 in Reno. In December 2007, a steering committee started the organization of new MPI Forum meetings at regular 8-weeks intervals. At the January 14–16, 2008 meeting in Chicago, the MPI Forum decided to combine the existing and future MPI documents to one document for each version of the MPI standard. For technical and historical reasons, this series was started with MPI-1.3. Additional Ballots 3 and 4 solved old questions from the errata list started in 1995 up to new questions from the last years. After all documents (MPI-1.1, MPI-2, Errata for MPI-1.1 (Oct. 12, 1998), and MPI-2.1 Ballots 1–4) were combined into one draft document, for each chapter, a chapter author and review team were defined. They cleaned up the document to achieve a consistent MPI-2.1 document. The final MPI-2.1 standard document was finished in June 2008, and finally released with a second vote in September 2008 in the meeting at Dublin, just before EuroPVM/MPI’08.

## Background of MPI-2.2

MPI-2.2 is a minor update to the MPI-2.1 standard. This version addresses additional errors and ambiguities that were not corrected in the MPI-2.1 standard as well as a small number of extensions to MPI-2.1 that met the following criteria:

- Any correct MPI-2.1 program is a correct MPI-2.2 program.

- Any extension must have significant benefit for users.

- Any extension must not require significant implementation effort. To that end, all such changes are accompanied by an open source implementation.

The discussions of MPI-2.2 proceeded concurrently with the MPI-3 discussions; in some cases, extensions were proposed for MPI-2.2 but were later moved to MPI-3.

## Background of MPI-3.0

MPI-3.0 is a major update to the MPI standard. The updates include the extension of collective operations to include nonblocking versions, extensions to the one-sided operations, and a new Fortran 2008 binding. In addition, the deprecated C++ bindings have been removed, as well as many of the deprecated routines and MPI objects (such as the `MPI_UB` datatype). Any valid MPI-2.2 program not using any of these removed MPI procedures or objects is a valid MPI-3.0 program.

## Background of MPI-3.1

MPI-3.1 is a minor update to the MPI standard. Most of the updates are corrections and clarifications to the standard, especially for the Fortran bindings. New functions added include routines to manipulate `MPI_Aint` values in a portable manner, nonblocking collective I/O routines, and routines to get the index value by name for [[MPI_T]] performance and control variables. A general index was also added. Any valid MPI-3.0 program is a valid MPI-3.1 program.

## Background of MPI-4.0

MPI-4.0 is a major update to the MPI standard. The largest changes are the addition of large-count versions of many routines to address the limitations of using an `int` or `INTEGER` for the count parameter, persistent collectives, partitioned communications, an alternative way to initialize MPI, application info assertions, and improvements to the definitions of error handling. In addition, there are a number of smaller improvements and corrections. Any valid MPI-3.1 program is a valid MPI-4.0 program with the exception of semantic changes listed in Chapter [[chap-semantic-changes]] .

## Background of 2022 Draft Specification

The 2022 draft specification is expected to become the MPI-4.1 specification once all features have been merged.

## Background of MPI-4.1

MPI-4.1 is a minor update to the MPI standard. It contains mostly corrections and clarifications to the MPI-4.0 document. Several routines, the attribute key `MPI_HOST`, and the `mpif.h` Fortran include file are deprecated. A new routine provides a way to inquire about the hardware on which the MPI program is running. Any valid MPI-4.0 program is a valid MPI-4.1 program with the exception of semantic changes listed in Chapter [[chap-semantic-changes]] .

## Who Should Use This Standard?

This standard is intended for use by all those who want to write portable message-passing programs in Fortran and C (and access the C bindings from C++). This includes individual application programmers, developers of software designed to run on parallel machines, and creators of environments and tools. In order to be attractive to this wide audience, the standard must provide a simple, easy-to-use interface for the basic user while not semantically precluding the high-performance message-passing operations available on advanced machines.

## What Platforms Are Targets for Implementation?

The attractiveness of the message-passing paradigm at least partially stems from its wide portability. Programs expressed this way may run on distributed-memory multiprocessors, networks of workstations, and combinations of all of these. In addition, shared-memory implementations, including those for multi-core processors and hybrid architectures, are possible. The paradigm will not be made obsolete by architectures combining the shared- and distributed-memory views, or by increases in network speeds. It thus should be both possible and useful to implement this standard on a great variety of machines, including those “machines” consisting of collections of other machines, parallel or not, connected by a communication network.

The interface is suitable for use by fully general MIMD (Multiple Instruction, Multiple Data) programs, as well as those written in the more restricted style of SPMD (Single Program, Multiple Data). MPI provides many features intended to improve performance on scalable parallel computers with specialized interprocessor communication hardware. Thus, we expect that native, high-performance implementations of MPI will be provided on such machines. At the same time, implementations of MPI on top of standard Unix interprocessor communication protocols will provide portability to workstation clusters and heterogenous networks of workstations.

## What Is Included in the Standard?

The standard includes:

- Point-to-point communication,

- Partitioned communication,

- Datatypes,

- Collective operations,

- Process groups,

- Communication contexts,

- Virtual Topologies for MPI Processes,

- Environmental management and inquiry,

- The Info object,

- Process initialization, creation, and management,

- One-sided communication,

- External interfaces,

- Parallel file I/O,

- Tool support,

- Language bindings for Fortran and C, and

- Additional topics in side-documents.

## Side-documents



Side-documents extend and/or modify features, semantics, language bindings, and other aspects covered in this document. Side-documents shall not modify any aspects defined in the MPI Standard without providing a mechanism that explicitly enables these deviations. Execution of a program that does not explicitly enable deviations from the MPI Standard will comply with the MPI Standard, even when using an MPI implementation that implements a side-document that modifies any aspects.

Each side-document is versioned with a scheme that is independent from the MPI Standard version and from other side-documents. All side-documents specify compatibility and interoperability with versions of the MPI Standard and may define interoperability with features and semantics from other side-documents. Side-documents are not required to provide full coverage of all MPI concepts, but shall document which MPI concepts are affected. A compliant implementation is not required to comply with any side-documents. However, if compliance with a particular version of a side-document is claimed, the implementation must comply with the entire side-document. Side-documents will be found at the same location as the MPI Standard.

## Organization of This Document

The following is a list of the remaining chapters in this document, along with a brief description of each.

- Chapter [[terms#MPI Terms and Conventions|MPI Terms and Conventions]] , , explains notational terms and conventions used throughout the MPI document.

- Chapter [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] , , defines the basic, pairwise communication subset of MPI. *Send* and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.

- Chapter [[part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] , , defines a method of performing partitioned communication in MPI. Partitioned communication allows multiple contributions of data to be made, potentially, from multiple actors (e.g., threads or tasks) in an MPI process to a single message.

- Chapter [[datatypes#Datatypes|Datatypes]] , , defines a method to describe any data layout, e.g., an array of structures.

- Chapter [[coll#Collective Communication|Collective Communication]] , , defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes).

- Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , , shows how groups of processes are formed and manipulated, how unique communication contexts are obtained, and how the two are bound together into a *communicator*.

- Chapter [[topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]] , , explains a set of utility functions meant to assist in the mapping of MPI process groups (a linearly ordered set) to richer topological structures such as multi-dimensional grids.

- Chapter [[inquiry#MPI Environmental Management|MPI Environmental Management]] , , explains how the programmer can manage and make inquiries of the current MPI environment. These functions are needed for the writing of correct, robust programs, and are especially important for the construction of highly-portable message-passing programs.

<!-- -->

- Chapter [[misc#The Info Object|The Info Object]] , , defines an opaque object that is used as input in several MPI routines.

- Chapter [[dynamic#Process Initialization, Creation, and Management|Process Initialization, Creation, and Management]] , , defines several approaches to MPI initialization, process creation, and process management while placing minimal restrictions on the execution environment.

- Chapter [[one-side#One-Sided Communications|One-Sided Communications]] , , defines communication routines that can be completed by a single process. These include shared-memory operations (put/get) and remote accumulate operations.

- Chapter [[ei#External Interfaces|External Interfaces]] , , defines routines designed to allow developers to layer on top of MPI.

- Chapter [[io#I/O|I/O]] , , defines MPI support for parallel I/O.

- Chapter [[tools#Tool Support|Tool Support]] , , covers interfaces that allow debuggers, performance analyzers, and other tools to obtain data about the operation of MPI processes.

- Chapter [[deprecated#Deprecated Interfaces|Deprecated Interfaces]] , , describes routines that are kept for reference. However usage of these functions is discouraged, as they may be deleted in future versions of the standard.

- Chapter [[chap-removed]] , , describes routines and constructs that have been removed from MPI.

- Chapter [[chap-semantic-changes]] , , describes semantic changes from previous versions of MPI.

- Chapter [[binding#Language Bindings|Language Bindings]] , , discusses Fortran issues, and describes language interoperability aspects between C and Fortran.

The Appendices are:

- Annex [[appLang-Const#Language Bindings Summary|Language Bindings Summary]] , , gives specific syntax in C and Fortran, for all MPI functions, constants, and types.

- Annex [[changes#Change-Log|Change-Log]] , , summarizes some changes since the previous version of the standard.

- Several Index pages show the locations of general terms and definitions, examples, constants and predefined handles, declarations of C and Fortran types, callback routine prototypes, and all MPI functions.

MPI provides various interfaces to facilitate interoperability of distinct MPI implementations. Among these are the canonical data representation for MPI I/O and for [[MPI_PACK_EXTERNAL]] and [[MPI_UNPACK_EXTERNAL]] . The definition of an actual binding of these interfaces that will enable interoperability is outside the scope of this document.

A separate document consists of ideas that were discussed in the MPI Forum during the MPI-2 development and deemed to have value, but were not included in the MPI standard. They are part of the “Journal of Development” (JOD), which was created to capture these ideas and discussions. The JOD is available at https://www.mpi-forum.org/docs.
