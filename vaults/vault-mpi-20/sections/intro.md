0

# Introduction to MPI-2



## Background



Beginning in March 1995, the MPI Forum began meeting to consider corrections and extensions to the original MPI Standard document . The first product of these deliberations was Version 1.1 of the MPI specification, released in June of 1995 (see\
`http://www.mpi-forum.org` for official MPI document releases).

Since that time, effort has been focused in five types of areas.

1.  Further corrections and clarifications for the MPI-1.1 document.

2.  Additions to MPI-1.1 that do not significantly change its types of functionality (new datatype constructors, language interoperability, etc.).

3.  Completely new types of functionality (dynamic processes, one-sided communication, parallel I/O, etc.) that are what everyone thinks of as “MPI-2 functionality.”

4.  Bindings for Fortran 90 and C++. This document specifies C++ bindings for both MPI-1 and MPI-2 functions, and extensions to the Fortran 77 binding of MPI-1 and MPI-2 to handle Fortran 90 issues.

5.  Discussions of areas in which the MPI process and framework seem likely to be useful, but where more discussion and experience are needed before standardization (e.g. 0-copy semantics on shared-memory machines, real-time specifications).

Corrections and clarifications (items of type 1 in the above list) have been collected in Chapter [[misc-1.2#Version 1.2 of MPI|Version 1.2 of MPI]] of this document, “Version 1.2 of MPI.” This chapter also contains the function for identifying the version number. Additions to MPI-1.1 (items of types 2, 3, and 4 in the above list) are in the remaining chapters, and constitute the specification for MPI-2.

This document specifies Version 2.0 of MPI.

Items of type 5 in the above list have been moved to a separate document, the “MPI Journal of Development” (JOD), and are not part of the MPI-2 Standard.

This structure makes it easy for users and implementors to understand what level of MPI compliance a given implementation has:

- MPI-1 compliance will mean compliance with MPI-1.2. This is a useful level of compliance. It means that the implementation conforms to the clarifications of MPI-1.1 function behavior given in Chapter [[misc-1.2#Version 1.2 of MPI|Version 1.2 of MPI]] . Some implementations may require changes to be MPI-1 compliant.

- MPI-2 compliance will mean compliance with all of MPI-2.

- The MPI Journal of Development is not part of the MPI Standard.

It is to be emphasized that forward compatibility is preserved. That is, a valid MPI-1.1 program is both a valid MPI-1.2 program and a valid MPI-2 program, and a valid MPI-1.2 program is a valid MPI-2 program.

## Organization of this Document

This document is organized as follows:

- Chapter [[terms#MPI-2 Terms and Conventions|MPI-2 Terms and Conventions]] , <span class="sans-serif">MPI-2 Terms and Conventions</span>, explains notational terms and conventions used throughout the MPI-2 document.

- Chapter [[misc-1.2#Version 1.2 of MPI|Version 1.2 of MPI]] , <span class="sans-serif">Version 1.2 of MPI</span>, contains the specification of MPI-1.2, which has one new function and consists primarily of clarifications to MPI-1.1. It is expected that some implementations will need modification in order to become MPI-1 compliant, as the result of these clarifications.

The rest of this document contains the MPI-2 Standard Specification. It adds substantial new types of functionality to MPI, in most cases specifying functions for an extended computational model (e.g., dynamic process creation and one-sided communication) or for a significant new capability (e.g., parallel I/O).

The following is a list of the chapters in MPI-2, along with a brief description of each.

- Chapter [[misc#Miscellany|Miscellany]] , <span class="sans-serif">Miscellany</span>, discusses items that don’t fit elsewhere, in particular language interoperability.

- Chapter [[dynamic#Process Creation and Management|Process Creation and Management]] , <span class="sans-serif">Process Creation and Management</span>, discusses the extension of MPI to remove the static process model in MPI. It defines routines that allow for creation of processes.

- Chapter [[one-side#One-Sided Communications|One-Sided Communications]] , <span class="sans-serif">One-Sided Communications</span>, defines communication routines that can be completed by a single process. These include shared-memory operations (put/get) and remote accumulate operations.

- Chapter [[collective#Extended Collective Operations|Extended Collective Operations]] , <span class="sans-serif">Extended Collective Operations</span>,

  extends the semantics of MPI-1 collective operations to include intercommunicators. It also adds more convenient methods of constructing intercommunicators and two new collective operations.

- Chapter [[ei#External Interfaces|External Interfaces]] , <span class="sans-serif">External Interfaces</span>, defines routines designed to allow developers to layer on top of MPI. This includes generalized requests, routines that decode MPI opaque objects, and threads.

- Chapter [[io#I/O|I/O]] , <span class="sans-serif">I/O</span>, defines MPI-2 support for parallel I/O.

- Chapter [[binding#Language Bindings|Language Bindings]] , <span class="sans-serif">Language Bindings</span>, describes the C++ binding and discusses Fortran-90 issues.

The Appendices are:

- Annex [[appLang#Language Binding|Language Binding]] , <span class="sans-serif">Language Bindings</span>, gives bindings for MPI-2 functions, and lists constants, error codes, etc.

- Annex [[appendix-c++#MPI-1 C++ Language Binding|MPI-1 C++ Language Binding]] , <span class="sans-serif">MPI-1 C++ Language Binding</span>, gives C++ bindings for MPI-1.

The <span class="sans-serif">MPI Function Index</span> is a simple index showing the location of the precise definition of each MPI-2 function, together with C, C++, and Fortran bindings.

MPI-2 provides various interfaces to facilitate interoperability of distinct MPI implementations. Among these are the canonical

data representation for MPI I/O and for [[MPI_PACK_EXTERNAL]] and [[MPI_UNPACK_EXTERNAL]] .

The definition of an actual binding of these interfaces that will enable interoperability is outside the scope of this document.

A separate document consists of ideas that were discussed in the MPI Forum and deemed to have value, but are not included in the MPI Standard. They are part of the “Journal of Development” (JOD), lest good ideas be lost and in order to provide a starting point for further work.

The chapters in the JOD are

- Chapter [[chap-dynamic-jod]] , <span class="sans-serif">Spawning Independent Processes</span>, includes some elements of dynamic process management, in particular management of processes with which the spawning processes do not intend to communicate, that the Forum discussed at length but ultimately decided not to include in the MPI Standard.

- Chapter [[chap-threads-jod]] , <span class="sans-serif">Threads and MPI</span>, describes some of the expected interaction between an MPI implementation and a thread library in a multi-threaded environment.

- Chapter [[chap-commid-jod]] , <span class="sans-serif">Communicator ID</span>, describes an approach to providing identifiers for communicators.

- Chapter [[chap-misc-jod]] , <span class="sans-serif">Miscellany</span>, discusses Miscellaneous topics in the MPI JOD, in particular single-copy routines for use in shared-memory environments and new datatype constructors.

- Chapter [[chap-f90-jod]] , <span class="sans-serif">Toward a Full Fortran 90 Interface</span>, describes an approach to providing a more elaborate Fortran 90 interface.

- Chapter [[chap-two-phase-jod]] , <span class="sans-serif">Split Collective Communication</span>, describes a specification for certain non-blocking collective operations.

- Chapter [[sec-rt-2]] , <span class="sans-serif">Real-Time MPI</span>, discusses MPI support for real time processing.
