---
title: "Organization of This Document"
chapter: intro
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/intro]
---

# Organization of This Document

Chapter **intro** · in [[versions/v13/sections/intro#Organization of this Document|MPI-1.3]], [[versions/v20/sections/intro#Organization of this Document|MPI-2.0]], [[versions/v21/sections/intro#Organization of this Document|MPI-2.1]], [[versions/v22/sections/intro#Organization of this Document|MPI-2.2]], [[versions/v30/sections/intro#Organization of this Document|MPI-3.0]], [[versions/v31/sections/intro#Organization of this Document|MPI-3.1]], [[versions/v40/sections/intro#Organization of This Document|MPI-4.0]], [[versions/v41/sections/intro#Organization of This Document|MPI-4.1]], [[versions/v50/sections/intro#Organization of This Document|MPI-5.0]]

Heading by release: MPI-1.3: “Organization of this Document”; MPI-2.0: “Organization of this Document”; MPI-2.1: “Organization of this Document”; MPI-2.2: “Organization of this Document”; MPI-3.0: “Organization of this Document”; MPI-3.1: “Organization of this Document”; MPI-4.0: “Organization of This Document”; MPI-4.1: “Organization of This Document”; MPI-5.0: “Organization of This Document”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

~~- Chapter [[versions/v21/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] , <span class="sans-serif">Point to Point Communication</span>, defines the basic, pairwise communication subset of MPI. *send* and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.~~

==- Chapter [[versions/v21/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] , <span class="sans-serif">Point to Point Communication</span>, defines the basic, pairwise communication subset of MPI.==

==  *Send*==

==  and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.==

==- Chapter [[versions/v21/sections/datatypes#Datatypes|Datatypes]] , <span class="sans-serif">Datatypes</span>, defines a method to describe any data layout, e.g., an array of structures in the memory, which can be used as message send or receive buffer.==

~~- Chapter [[versions/v21/sections/context#Groups, Contexts, and Communicators|Groups, Contexts, and Communicators]] , <span class="sans-serif">Groups, Contexts, and Communicators</span>, shows how groups of processes are formed and manipulated, how unique communication contexts are obtained, and how the two are bound together into a *communicator*.~~

==  With MPI-2, the semantics of collective==

==  communication==

==  was extended to include intercommunicators. It also adds==

==  two new collective operations.==

==- Chapter [[versions/v21/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , <span class="sans-serif">Groups, Contexts, Communicators, and Caching</span> , shows how groups of processes are formed and manipulated, how unique communication contexts are obtained, and how the two are bound together into a *communicator*.==

==<!-- -->==

==- Chapter [[versions/v21/sections/misc#The Info Object|The Info Object]] , <span class="sans-serif">The Info Object</span>, defines an opaque object, that is used as input of several MPI routines.==

==- Chapter [[versions/v21/sections/dynamic#Process Creation and Management|Process Creation and Management]] , <span class="sans-serif">Process Creation and Management</span>,==

==  defines==

==  routines that allow for creation of processes.==

==- Chapter [[versions/v21/sections/one-side#One-Sided Communications|One-Sided Communications]] , <span class="sans-serif">One-Sided Communications</span>, defines communication routines that can be completed by a single process. These include shared-memory operations (put/get) and remote accumulate operations.==

==- Chapter [[versions/v21/sections/ei#External Interfaces|External Interfaces]] , <span class="sans-serif">External Interfaces</span>, defines routines designed to allow developers to layer on top of MPI. This includes generalized requests, routines that decode MPI opaque objects, and threads.==

==- Chapter [[versions/v21/sections/io#I/O|I/O]] , <span class="sans-serif">I/O</span>, defines==

==  MPI==

==  support for parallel I/O.==

~~- Annex [[versions/v13/sections/appLang#Language Binding|Language Binding]] , <span class="sans-serif">Language Bindings</span>, gives specific syntax in Fortran 77 and C, for all MPI functions, constants, and types.~~

~~- The <span class="sans-serif">MPI Function Index</span> is a simple index showing the location of the precise definition of each MPI function, together with both C and Fortran bindings.~~

==- Chapter [[versions/v21/sections/deprecated#Deprecated Functions|Deprecated Functions]] , <span class="sans-serif">Deprecated Functions</span>, describes routines that==

==  are kept for reference. However usage of these functions is discouraged, as they may be deleted in future versions of the standard.==

==- Chapter [[versions/v21/sections/binding#Language Bindings|Language Bindings]] ,==

==  <span class="sans-serif">Language Bindings</span>, describes==

==  the C++ binding, discusses Fortran issues,==

==  and describes language interoperability aspects between==

==  C, C++, and Fortran.==

==The Appendices are:==

==- Annex [[versions/v21/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] ,==

==  <span class="sans-serif">Language Bindings Summary</span>,==

==  gives specific syntax in==

==  C, C++, and Fortran,==

==  for all MPI functions, constants, and types.==

==- Annex [[versions/v21/sections/changes#Change-Log|Change-Log]] ,==

==  <span class="sans-serif">Change-Log</span>, summarizes major changes since the previous version of the standard.==

==- Several <span class="sans-serif">Index</span> pages are showing the locations of examples, constants and predefined handles, callback routines’ prototypes, and all MPI functions.==

==MPI==

==provides various interfaces to facilitate interoperability of distinct MPI implementations. Among these are the canonical==

==data representation for MPI I/O and for [[versions/v21/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] and [[versions/v21/API/MPI_UNPACK_EXTERNAL|MPI_UNPACK_EXTERNAL]] .==

==The definition of an actual binding of these interfaces that will enable interoperability is outside the scope of this document.==

==A separate document consists of ideas that were discussed in the MPI Forum and deemed to have value, but are not included in the MPI Standard. They are part of the “Journal of Development” (JOD), lest good ideas be lost and in order to provide a starting point for further work.==

==The chapters in the JOD are==

==- Chapter 2, <span class="sans-serif">Spawning Independent Processes</span>, includes some elements of dynamic process management, in particular management of processes with which the spawning processes do not intend to communicate, that the Forum discussed at length but ultimately decided not to include in the MPI Standard.==

==- Chapter 3, <span class="sans-serif">Threads and MPI</span>, describes some of the expected interaction between an MPI implementation and a thread library in a multi-threaded environment.==

==- Chapter 4, <span class="sans-serif">Communicator ID</span>, describes an approach to providing identifiers for communicators.==

==- Chapter 5, <span class="sans-serif">Miscellany</span>, discusses Miscellaneous topics in the MPI JOD, in particular single-copy routines for use in shared-memory environments and new datatype constructors.==

==- Chapter 6, <span class="sans-serif">Toward a Full Fortran 90 Interface</span>, describes an approach to providing a more elaborate Fortran 90 interface.==

==- Chapter 7, <span class="sans-serif">Split Collective Communication</span>, describes a specification for certain non-blocking collective operations.==

==- Chapter 8, <span class="sans-serif">Real-Time MPI</span>, discusses MPI support for real time processing.==

### MPI-2.0 → MPI-2.1  (5 changed paragraphs)

~~This document is organized as follows:~~

~~- Chapter [[versions/v21/sections/terms#MPI-2 Terms and Conventions|MPI-2 Terms and Conventions]] , <span class="sans-serif">MPI-2 Terms and Conventions</span>, explains notational terms and conventions used throughout the MPI-2 document.~~

~~- Chapter [[versions/v20/sections/misc-1.2#Version 1.2 of MPI|Version 1.2 of MPI]] , <span class="sans-serif">Version 1.2 of MPI</span>, contains the specification of MPI-1.2, which has one new function and consists primarily of clarifications to MPI-1.1. It is expected that some implementations will need modification in order to become MPI-1 compliant, as the result of these clarifications.~~

~~The rest of this document contains the MPI-2 Standard Specification. It adds substantial new types of functionality to MPI, in most cases specifying functions for an extended computational model (e.g., dynamic process creation and one-sided communication) or for a significant new capability (e.g., parallel I/O).~~

~~The following is a list of the chapters in MPI-2, along with a brief description of each.~~

~~- Chapter [[versions/v21/sections/misc#Miscellany|Miscellany]] , <span class="sans-serif">Miscellany</span>, discusses items that don’t fit elsewhere, in particular language interoperability.~~

~~- Chapter [[versions/v21/sections/dynamic#Process Creation and Management|Process Creation and Management]] , <span class="sans-serif">Process Creation and Management</span>, discusses the extension of MPI to remove the static process model in MPI. It defines routines that allow for creation of processes.~~

==The following is a list of the remaining chapters in this document, along with a brief description of each.==

==- Chapter [[versions/v21/sections/terms#MPI Terms and Conventions|MPI Terms and Conventions]] , <span class="sans-serif">MPI Terms and Conventions</span>, explains notational terms and conventions used throughout the MPI document.==

==- Chapter [[versions/v21/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] , <span class="sans-serif">Point to Point Communication</span>, defines the basic, pairwise communication subset of MPI.==

==  *Send*==

==  and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.==

==- Chapter [[versions/v21/sections/datatypes#Datatypes|Datatypes]] , <span class="sans-serif">Datatypes</span>, defines a method to describe any data layout, e.g., an array of structures in the memory, which can be used as message send or receive buffer.==

==- Chapter [[versions/v21/sections/coll#Collective Communication|Collective Communication]] , <span class="sans-serif">Collective Communications</span>, defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes).==

==  With MPI-2, the semantics of collective==

==  communication==

==  was extended to include intercommunicators. It also adds==

==  two new collective operations.==

==- Chapter [[versions/v21/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , <span class="sans-serif">Groups, Contexts, Communicators, and Caching</span> , shows how groups of processes are formed and manipulated, how unique communication contexts are obtained, and how the two are bound together into a *communicator*.==

==- Chapter [[versions/v21/sections/topol#Process Topologies|Process Topologies]] , <span class="sans-serif">Process Topologies</span>, explains a set of utility functions meant to assist in the mapping of process groups (a linearly ordered set) to richer topological structures such as multi-dimensional grids.==

==- Chapter [[versions/v21/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] , <span class="sans-serif">MPI Environmental Management</span>, explains how the programmer can manage and make inquiries of the current MPI environment. These functions are needed for the writing of correct, robust programs, and are especially important for the construction of highly-portable message-passing programs.==

==<!-- -->==

==- Chapter [[versions/v21/sections/misc#The Info Object|The Info Object]] , <span class="sans-serif">The Info Object</span>, defines an opaque object, that is used as input of several MPI routines.==

==- Chapter [[versions/v21/sections/dynamic#Process Creation and Management|Process Creation and Management]] , <span class="sans-serif">Process Creation and Management</span>,==

==  defines==

==  routines that allow for creation of processes.==

~~- Chapter [[versions/v20/sections/collective#Extended Collective Operations|Extended Collective Operations]] , <span class="sans-serif">Extended Collective Operations</span>,~~

~~  extends the semantics of MPI-1 collective operations to include intercommunicators. It also adds more convenient methods of constructing intercommunicators and two new collective operations.~~

~~- Chapter [[versions/v21/sections/io#I/O|I/O]] , <span class="sans-serif">I/O</span>, defines MPI-2 support for parallel I/O.~~

~~- Chapter [[versions/v21/sections/binding#Language Bindings|Language Bindings]] , <span class="sans-serif">Language Bindings</span>, describes the C++ binding and discusses Fortran-90 issues.~~

==- Chapter [[versions/v21/sections/io#I/O|I/O]] , <span class="sans-serif">I/O</span>, defines==

==  MPI==

==  support for parallel I/O.==

==- Chapter [[versions/v21/sections/prof#Profiling Interface|Profiling Interface]] , <span class="sans-serif">Profiling Interface</span>, explains a simple name-shifting convention that any MPI implementation must support. One motivation for this is the ability to put performance profiling calls into MPI without the need for access to the MPI source code. The name shift is merely an interface, it says nothing about how the actual profiling should be done and in fact, the name shift can be useful for other purposes.==

==- Chapter [[versions/v21/sections/deprecated#Deprecated Functions|Deprecated Functions]] , <span class="sans-serif">Deprecated Functions</span>, describes routines that==

==  are kept for reference. However usage of these functions is discouraged, as they may be deleted in future versions of the standard.==

==- Chapter [[versions/v21/sections/binding#Language Bindings|Language Bindings]] ,==

==  <span class="sans-serif">Language Bindings</span>, describes==

==  the C++ binding, discusses Fortran issues,==

==  and describes language interoperability aspects between==

==  C, C++, and Fortran.==

~~- Annex [[versions/v20/sections/appLang#Language Binding|Language Binding]] , <span class="sans-serif">Language Bindings</span>, gives bindings for MPI-2 functions, and lists constants, error codes, etc.~~

~~- Annex [[versions/v20/sections/appendix-c++#MPI-1 C++ Language Binding|MPI-1 C++ Language Binding]] , <span class="sans-serif">MPI-1 C++ Language Binding</span>, gives C++ bindings for MPI-1.~~

~~The <span class="sans-serif">MPI Function Index</span> is a simple index showing the location of the precise definition of each MPI-2 function, together with C, C++, and Fortran bindings.~~

~~MPI-2 provides various interfaces to facilitate interoperability of distinct MPI implementations. Among these are the canonical~~

==- Annex [[versions/v21/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] ,==

==  <span class="sans-serif">Language Bindings Summary</span>,==

==  gives specific syntax in==

==  C, C++, and Fortran,==

==  for all MPI functions, constants, and types.==

==- Annex [[versions/v21/sections/changes#Change-Log|Change-Log]] ,==

==  <span class="sans-serif">Change-Log</span>, summarizes major changes since the previous version of the standard.==

==- Several <span class="sans-serif">Index</span> pages are showing the locations of examples, constants and predefined handles, callback routines’ prototypes, and all MPI functions.==

==MPI==

==provides various interfaces to facilitate interoperability of distinct MPI implementations. Among these are the canonical==

- Chapter ~~[[chap-dynamic-jod]] ,~~ ==2,== <span class="sans-serif">Spawning Independent Processes</span>, includes some elements of dynamic process management, in particular management of processes with which the spawning processes do not intend to communicate, that the Forum discussed at length but ultimately decided not to include in the MPI Standard.

- Chapter ~~[[chap-threads-jod]] ,~~ ==3,== <span class="sans-serif">Threads and MPI</span>, describes some of the expected interaction between an MPI implementation and a thread library in a multi-threaded environment.

- Chapter ~~[[chap-commid-jod]] ,~~ ==4,== <span class="sans-serif">Communicator ID</span>, describes an approach to providing identifiers for communicators.

- Chapter ~~[[chap-misc-jod]] ,~~ ==5,== <span class="sans-serif">Miscellany</span>, discusses Miscellaneous topics in the MPI JOD, in particular single-copy routines for use in shared-memory environments and new datatype constructors.

- Chapter ~~[[chap-f90-jod]] ,~~ ==6,== <span class="sans-serif">Toward a Full Fortran 90 Interface</span>, describes an approach to providing a more elaborate Fortran 90 interface.

- Chapter ~~[[chap-two-phase-jod]] ,~~ ==7,== <span class="sans-serif">Split Collective Communication</span>, describes a specification for certain non-blocking collective operations.

- Chapter ~~[[sec-rt-2]] ,~~ ==8,== <span class="sans-serif">Real-Time MPI</span>, discusses MPI support for real time processing.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

- Chapter 7, <span class="sans-serif">Split Collective Communication</span>, describes a specification for certain ~~non-blocking~~ ==nonblocking== collective operations.

### MPI-2.2 → MPI-3.0  (7 changed paragraphs)

~~  *Send*~~

~~  and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.~~

==  *Send* and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.==

~~- Chapter [[versions/v30/sections/coll#Collective Communication|Collective Communication]] , <span class="sans-serif">Collective Communications</span>, defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes).~~

~~  With MPI-2, the semantics of collective~~

~~  communication~~

~~  was extended to include intercommunicators. It also adds~~

~~  two new collective operations.~~

==- Chapter [[versions/v30/sections/coll#Collective Communication|Collective Communication]] , <span class="sans-serif">Collective Communications</span>, defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes). With MPI-2, the semantics of collective==

==  communication was extended to include intercommunicators. It also adds==

==  two new collective operations. MPI-3 adds nonblocking collective operations.==

- Chapter [[versions/v30/sections/misc#The Info Object|The Info Object]] , <span class="sans-serif">The Info Object</span>, defines an opaque object, that is used as input ~~of~~ ==in== several MPI routines.

~~  defines~~

~~  routines that allow for creation of processes.~~

==  defines routines that allow for creation of processes.==

~~  MPI~~

~~  support for parallel I/O.~~

~~- Chapter [[versions/v22/sections/prof#Profiling Interface|Profiling Interface]] , <span class="sans-serif">Profiling Interface</span>, explains a simple name-shifting convention that any MPI implementation must support. One motivation for this is the ability to put performance profiling calls into MPI without the need for access to the MPI source code. The name shift is merely an interface, it says nothing about how the actual profiling should be done and in fact, the name shift can be useful for other purposes.~~

==  MPI support for parallel I/O.==

==- Chapter [[versions/v30/sections/tools#Tool Support|Tool Support]] , <span class="sans-serif">Tool Support</span>, covers interfaces that allow debuggers, performance analyzers, and other tools to obtain data about the operation of MPI processes. This chapter includes Section [[versions/v30/sections/tools#Profiling Interface|Profiling Interface]] (<span class="sans-serif">Profiling Interface</span>), which was a chapter in previous versions of MPI.==

~~- Chapter [[versions/v30/sections/binding#Language Bindings|Language Bindings]] ,~~

~~  <span class="sans-serif">Language Bindings</span>, describes~~

~~  the C++ binding, discusses Fortran issues,~~

~~  and describes language interoperability aspects between~~

~~  C, C++, and Fortran.~~

==- Chapter [[chap-removed]] , <span class="sans-serif">Removed Interfaces</span>, describes routines and constructs that have been removed from MPI. These were deprecated in MPI-2, and the MPI Forum decided to remove these from the MPI-3 standard.==

==- Chapter [[versions/v30/sections/binding#Language Bindings|Language Bindings]] , <span class="sans-serif">Language Bindings</span>, discusses Fortran issues, and describes language interoperability aspects between==

==  C and Fortran.==

~~  <span class="sans-serif">Language Bindings Summary</span>,~~

~~  gives specific syntax in~~

~~  C, C++, and Fortran,~~

~~  for all MPI functions, constants, and types.~~

~~- Annex [[versions/v30/sections/changes#Change-Log|Change-Log]] ,~~

~~  <span class="sans-serif">Change-Log</span>, summarizes major changes since the previous version of the standard.~~

~~- Several <span class="sans-serif">Index</span> pages are showing the locations of examples, constants and predefined handles, callback routines’ prototypes, and all MPI functions.~~

~~MPI~~

~~provides various interfaces to facilitate interoperability of distinct MPI implementations. Among these are the canonical~~

~~data representation for MPI I/O and for [[versions/v30/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] and [[versions/v30/API/MPI_UNPACK_EXTERNAL|MPI_UNPACK_EXTERNAL]] .~~

~~The definition of an actual binding of these interfaces that will enable interoperability is outside the scope of this document.~~

~~A separate document consists of ideas that were discussed in the MPI Forum and deemed to have value, but are not included in the MPI Standard. They are part of the “Journal of Development” (JOD), lest good ideas be lost and in order to provide a starting point for further work.~~

~~The chapters in the JOD are~~

==  <span class="sans-serif">Language Bindings Summary</span>, gives specific syntax in==

==  C and Fortran, for all MPI functions, constants, and types.==

==- Annex [[versions/v30/sections/changes#Change-Log|Change-Log]] , <span class="sans-serif">Change-Log</span>, summarizes some changes since the previous version of the standard.==

==- Several <span class="sans-serif">Index</span> pages show the locations of examples, constants and predefined handles, callback routine prototypes, and all MPI functions.==

==MPI provides various interfaces to facilitate interoperability of distinct MPI implementations. Among these are the canonical data representation for MPI I/O and for [[versions/v30/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] and [[versions/v30/API/MPI_UNPACK_EXTERNAL|MPI_UNPACK_EXTERNAL]] . The definition of an actual binding of these interfaces that will enable interoperability is outside the scope of this document.==

==A separate document consists of ideas that were discussed in the MPI Forum during the MPI-2 development and deemed to have value, but are not included in the MPI Standard. They are part of the “Journal of Development” (JOD), lest good ideas be lost and in order to provide a starting point for further work. The chapters in the JOD are==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~- Chapter [[versions/v31/sections/terms#MPI Terms and Conventions|MPI Terms and Conventions]] , <span class="sans-serif">MPI Terms and Conventions</span>, explains notational terms and conventions used throughout the MPI document.~~

~~- Chapter [[versions/v31/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] , <span class="sans-serif">Point to Point Communication</span>, defines the basic, pairwise communication subset of MPI.~~

~~  *Send* and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.~~

~~- Chapter [[versions/v31/sections/datatypes#Datatypes|Datatypes]] , <span class="sans-serif">Datatypes</span>, defines a method to describe any data layout, e.g., an array of structures in the memory, which can be used as message send or receive buffer.~~

~~- Chapter [[versions/v31/sections/coll#Collective Communication|Collective Communication]] , <span class="sans-serif">Collective Communications</span>, defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes). With MPI-2, the semantics of collective~~

~~  communication was extended to include intercommunicators. It also adds~~

~~  two new collective operations. MPI-3 adds nonblocking collective operations.~~

~~- Chapter [[versions/v31/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , <span class="sans-serif">Groups, Contexts, Communicators, and Caching</span> , shows how groups of processes are formed and manipulated, how unique communication contexts are obtained, and how the two are bound together into a *communicator*.~~

~~- Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] , <span class="sans-serif">Process Topologies</span>, explains a set of utility functions meant to assist in the mapping of process groups (a linearly ordered set) to richer topological structures such as multi-dimensional grids.~~

~~- Chapter [[versions/v31/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] , <span class="sans-serif">MPI Environmental Management</span>, explains how the programmer can manage and make inquiries of the current MPI environment. These functions are needed for the writing of correct, robust programs, and are especially important for the construction of highly-portable message-passing programs.~~

==- Chapter [[versions/v31/sections/terms#MPI Terms and Conventions|MPI Terms and Conventions]] , , explains notational terms and conventions used throughout the MPI document.==

==- Chapter [[versions/v31/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] , , defines the basic, pairwise communication subset of MPI. *Send* and *receive* are found here, along with many associated functions designed to make basic communication powerful and efficient.==

==- Chapter [[versions/v31/sections/datatypes#Datatypes|Datatypes]] , , defines a method to describe any data layout, e.g., an array of structures in the memory, which can be used as message send or receive buffer.==

==- Chapter [[versions/v31/sections/coll#Collective Communication|Collective Communication]] , , defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes). With MPI-2, the semantics of collective communication was extended to include intercommunicators. It also adds two new collective operations. MPI-3 adds nonblocking collective operations.==

==- Chapter [[versions/v31/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , , shows how groups of processes are formed and manipulated, how unique communication contexts are obtained, and how the two are bound together into a *communicator*.==

==- Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] , , explains a set of utility functions meant to assist in the mapping of process groups (a linearly ordered set) to richer topological structures such as multi-dimensional grids.==

==- Chapter [[versions/v31/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] , , explains how the programmer can manage and make inquiries of the current MPI environment. These functions are needed for the writing of correct, robust programs, and are especially important for the construction of highly-portable message-passing programs.==

~~- Chapter [[versions/v31/sections/misc#The Info Object|The Info Object]] , <span class="sans-serif">The Info Object</span>, defines an opaque object, that is used as input in several MPI routines.~~

~~- Chapter [[versions/v31/sections/dynamic#Process Creation and Management|Process Creation and Management]] , <span class="sans-serif">Process Creation and Management</span>,~~

~~  defines routines that allow for creation of processes.~~

~~- Chapter [[versions/v31/sections/one-side#One-Sided Communications|One-Sided Communications]] , <span class="sans-serif">One-Sided Communications</span>, defines communication routines that can be completed by a single process. These include shared-memory operations (put/get) and remote accumulate operations.~~

~~- Chapter [[versions/v31/sections/ei#External Interfaces|External Interfaces]] , <span class="sans-serif">External Interfaces</span>, defines routines designed to allow developers to layer on top of MPI. This includes generalized requests, routines that decode MPI opaque objects, and threads.~~

~~- Chapter [[versions/v31/sections/io#I/O|I/O]] , <span class="sans-serif">I/O</span>, defines~~

~~  MPI support for parallel I/O.~~

~~- Chapter [[versions/v31/sections/tools#Tool Support|Tool Support]] , <span class="sans-serif">Tool Support</span>, covers interfaces that allow debuggers, performance analyzers, and other tools to obtain data about the operation of MPI processes. This chapter includes Section [[versions/v31/sections/tools#Profiling Interface|Profiling Interface]] (<span class="sans-serif">Profiling Interface</span>), which was a chapter in previous versions of MPI.~~

~~- Chapter [[versions/v31/sections/deprecated#Deprecated Functions|Deprecated Functions]] , <span class="sans-serif">Deprecated Functions</span>, describes routines that~~

~~  are kept for reference. However usage of these functions is discouraged, as they may be deleted in future versions of the standard.~~

~~- Chapter [[chap-removed]] , <span class="sans-serif">Removed Interfaces</span>, describes routines and constructs that have been removed from MPI. These were deprecated in MPI-2, and the MPI Forum decided to remove these from the MPI-3 standard.~~

~~- Chapter [[versions/v31/sections/binding#Language Bindings|Language Bindings]] , <span class="sans-serif">Language Bindings</span>, discusses Fortran issues, and describes language interoperability aspects between~~

~~  C and Fortran.~~

==- Chapter [[versions/v31/sections/misc#The Info Object|The Info Object]] , , defines an opaque object, that is used as input in several MPI routines.==

==- Chapter [[versions/v31/sections/dynamic#Process Creation and Management|Process Creation and Management]] , , defines routines that allow for creation of processes.==

==- Chapter [[versions/v31/sections/one-side#One-Sided Communications|One-Sided Communications]] , , defines communication routines that can be completed by a single process. These include shared-memory operations (put/get) and remote accumulate operations.==

==- Chapter [[versions/v31/sections/ei#External Interfaces|External Interfaces]] , , defines routines designed to allow developers to layer on top of MPI. This includes generalized requests, routines that decode MPI opaque objects, and threads.==

==- Chapter [[versions/v31/sections/io#I/O|I/O]] , , defines MPI support for parallel I/O.==

==- Chapter [[versions/v31/sections/tools#Tool Support|Tool Support]] , , covers interfaces that allow debuggers, performance analyzers, and other tools to obtain data about the operation of MPI processes. This chapter includes Section [[versions/v31/sections/tools#Profiling Interface|Profiling Interface]] (), which was a chapter in previous versions of MPI.==

==- Chapter [[versions/v31/sections/deprecated#Deprecated Functions|Deprecated Functions]] , , describes routines that are kept for reference. However usage of these functions is discouraged, as they may be deleted in future versions of the standard.==

==- Chapter [[chap-removed]] , , describes routines and constructs that have been removed from MPI. These were deprecated in MPI-2, and the MPI Forum decided to remove these from the MPI-3 standard.==

==- Chapter [[versions/v31/sections/binding#Language Bindings|Language Bindings]] , , discusses Fortran issues, and describes language interoperability aspects between C and Fortran.==

~~- Annex [[versions/v31/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] ,~~

~~  <span class="sans-serif">Language Bindings Summary</span>, gives specific syntax in~~

~~  C and Fortran, for all MPI functions, constants, and types.~~

~~- Annex [[versions/v31/sections/changes#Change-Log|Change-Log]] , <span class="sans-serif">Change-Log</span>, summarizes some changes since the previous version of the standard.~~

~~- Several <span class="sans-serif">Index</span> pages show the locations of examples, constants and predefined handles, callback routine prototypes, and all MPI functions.~~

==- Annex [[versions/v31/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] , , gives specific syntax in C and Fortran, for all MPI functions, constants, and types.==

==- Annex [[versions/v31/sections/changes#Change-Log|Change-Log]] , , summarizes some changes since the previous version of the standard.==

==- Several Index pages show the locations of examples, constants and predefined handles, callback routine prototypes, and all MPI functions.==

- Chapter 2, ~~<span class="sans-serif">Spawning~~ ==Spawning== Independent ~~Processes</span>,~~ ==Processes,== includes some elements of dynamic process management, in particular management of processes with which the spawning processes do not intend to communicate, that the Forum discussed at length but ultimately decided not to include in the MPI Standard.

- Chapter 3, ~~<span class="sans-serif">Threads~~ ==Threads== and ~~MPI</span>,~~ ==MPI,== describes some of the expected interaction between an MPI implementation and a thread library in a multi-threaded environment.

- Chapter 4, ~~<span class="sans-serif">Communicator ID</span>,~~ ==Communicator ID,== describes an approach to providing identifiers for communicators.

- Chapter 5, ~~<span class="sans-serif">Miscellany</span>,~~ ==Miscellany,== discusses Miscellaneous topics in the MPI JOD, in particular single-copy routines for use in shared-memory environments and new datatype constructors.

- Chapter 6, ~~<span class="sans-serif">Toward~~ ==Toward== a Full Fortran 90 ~~Interface</span>,~~ ==Interface,== describes an approach to providing a more elaborate Fortran 90 interface.

- Chapter 7, ~~<span class="sans-serif">Split~~ ==Split== Collective ~~Communication</span>,~~ ==Communication,== describes a specification for certain nonblocking collective operations.

- Chapter 8, ~~<span class="sans-serif">Real-Time MPI</span>,~~ ==Real-Time MPI,== discusses MPI support for real time processing.

### MPI-3.1 → MPI-4.0  (7 changed paragraphs)

==- Chapter [[versions/v40/sections/part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] , , defines a method of performing partitioned communication in MPI. Partitioned communication allows multiple contributions of data to be made, potentially, from multiple actors (e.g., threads or tasks) in an MPI process to a single message.==

- Chapter [[versions/v40/sections/coll#Collective Communication|Collective Communication]] , , defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes). With MPI-2, the semantics of collective communication was extended to include ~~intercommunicators.~~ ==inter-communicators.== It also adds two new collective operations. MPI-3 adds nonblocking collective operations. ==MPI-4 adds persistent nonblocking collective operations.==

- Chapter [[versions/v40/sections/dynamic#Process ~~Creation~~ ==Initialization, Creation,== and Management|Process ~~Creation~~ ==Initialization, Creation,== and Management]] , , defines ~~routines that allow for creation of processes.~~ ==several approaches to MPI initialization, process creation, and process management while placing minimal restrictions on the execution environment. MPI-4 adds a new Sessions Model.==

- Chapter [[versions/v40/sections/deprecated#Deprecated ~~Functions|Deprecated Functions]]~~ ==Interfaces|Deprecated Interfaces]]== , , describes routines that are kept for reference. However usage of these functions is discouraged, as they may be deleted in future versions of the standard.

==- Chapter [[chap-semantic-changes]] , , describes semantic changes from previous versions of MPI.==

- Several Index pages show the locations of ==general terms and definitions,== examples, constants and predefined handles, ==declarations of C and Fortran types,== callback routine prototypes, and all MPI functions.

- Chapter 3, Threads and MPI, describes some of the expected interaction between an MPI implementation and a thread library in a ~~multi-threaded~~ ==multithreaded== environment.

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

- Chapter [[versions/v41/sections/datatypes#Datatypes|Datatypes]] , , defines a method to describe any data layout, e.g., an array of ~~structures in the memory, which can be used as message send or receive buffer.~~ ==structures.==

- Chapter [[versions/v41/sections/coll#Collective Communication|Collective Communication]] , , defines process-group collective communication operations. Well known examples of this are barrier and broadcast over a group of processes (not necessarily all the processes). ~~With MPI-2, the semantics of collective communication was extended to include inter-communicators. It also adds two new collective operations. MPI-3 adds nonblocking collective operations. MPI-4 adds persistent nonblocking collective operations.~~

- Chapter ~~[[versions/v41/sections/topol#Process Topologies|Process Topologies]]~~ ==[[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]]== , , explains a set of utility functions meant to assist in the mapping of ==MPI== process groups (a linearly ordered set) to richer topological structures such as multi-dimensional grids.

- Chapter [[versions/v41/sections/misc#The Info Object|The Info Object]] , , defines an opaque ~~object,~~ ==object== that is used as input in several MPI routines.

- Chapter [[versions/v41/sections/dynamic#Process Initialization, Creation, and Management|Process Initialization, Creation, and Management]] , , defines several approaches to MPI initialization, process creation, and process management while placing minimal restrictions on the execution environment. ~~MPI-4 adds a new Sessions Model.~~

- Chapter [[versions/v41/sections/ei#External Interfaces|External Interfaces]] , , defines routines designed to allow developers to layer on top of MPI. ~~This includes generalized requests, routines that decode MPI opaque objects, and threads.~~

- Chapter [[versions/v41/sections/tools#Tool Support|Tool Support]] , , covers interfaces that allow debuggers, performance analyzers, and other tools to obtain data about the operation of MPI processes. ~~This chapter includes Section [[versions/v41/sections/tools#Profiling Interface|Profiling Interface]] (), which was a chapter in previous versions of MPI.~~

- Chapter [[chap-removed]] , , describes routines and constructs that have been removed from MPI. ~~These were deprecated in MPI-2, and the MPI Forum decided to remove these from the MPI-3 standard.~~

~~A separate document consists of ideas that were discussed in the MPI Forum during the MPI-2 development and deemed to have value, but are not included in the MPI Standard. They are part of the “Journal of Development” (JOD), lest good ideas be lost and in order to provide a starting point for further work. The chapters in the JOD are~~

~~- Chapter 2, Spawning Independent Processes, includes some elements of dynamic process management, in particular management of processes with which the spawning processes do not intend to communicate, that the Forum discussed at length but ultimately decided not to include in the MPI Standard.~~

~~- Chapter 3, Threads and MPI, describes some of the expected interaction between an MPI implementation and a thread library in a multithreaded environment.~~

~~- Chapter 4, Communicator ID, describes an approach to providing identifiers for communicators.~~

~~- Chapter 5, Miscellany, discusses Miscellaneous topics in the MPI JOD, in particular single-copy routines for use in shared-memory environments and new datatype constructors.~~

~~- Chapter 6, Toward a Full Fortran 90 Interface, describes an approach to providing a more elaborate Fortran 90 interface.~~

~~- Chapter 7, Split Collective Communication, describes a specification for certain nonblocking collective operations.~~

~~- Chapter 8, Real-Time MPI, discusses MPI support for real time processing.~~

==A separate document consists of ideas that were discussed in the MPI Forum during the MPI-2 development and deemed to have value, but were not included in the MPI standard. They are part of the “Journal of Development” (JOD), which was created to capture these ideas and discussions. The JOD is available at https://www.mpi-forum.org/docs.==

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~- Chapter [[versions/v50/sections/binding#Language Bindings|Language Bindings]] , , discusses Fortran issues, and describes language interoperability aspects between C and Fortran.~~

==- Chapter [[versions/v50/sections/binding#Language Bindings|Language Bindings]] , , discusses Fortran issues and describes language interoperability aspects between C and Fortran.==

==- Chapter [[versions/v50/sections/abi#Application Binary Interface (ABI)|Application Binary Interface (ABI)]] , , discusses Application Binary Interface issues and describes interoperability of compiled code.==

- Annex [[versions/v50/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] , , gives specific syntax in C and ~~Fortran,~~ ==Fortran== for all MPI functions, constants, and types.

- Several ~~Index~~ ==index== pages show the locations of general terms and definitions, examples, constants and predefined handles, declarations of C and Fortran types, callback routine prototypes, and all MPI functions.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/intro#Organization of this Document]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/intro#Organization of this Document]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/intro#Organization of this Document]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/intro#Organization of this Document]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/intro#Organization of this Document]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/intro#Organization of this Document]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/intro#Organization of This Document]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/intro#Organization of This Document]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/intro#Organization of This Document]]
