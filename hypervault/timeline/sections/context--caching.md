---
title: "Caching."
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/context]
---

# Caching.

Chapter **context** · in [[versions/v13/sections/context#Caching.|MPI-1.3]], [[versions/v21/sections/context#Caching.|MPI-2.1]], [[versions/v22/sections/context#Caching.|MPI-2.2]], [[versions/v30/sections/context#Caching.|MPI-3.0]], [[versions/v31/sections/context#Caching.|MPI-3.1]], [[versions/v40/sections/context#Caching.|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

Communicators (see below) provide a “caching” mechanism that allows one to associate new attributes with communicators, on ~~a~~ par with MPI built-in features. This can be used by advanced users to adorn communicators further, and by MPI to implement some communicator functions. For example, the virtual-topology functions described in Chapter [[versions/v30/sections/topol#Process Topologies|Process Topologies]] are likely to be supported this way.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~Communicators (see below) provide a “caching” mechanism that allows one to associate new attributes with communicators, on par with MPI built-in features. This can be used by advanced users to adorn communicators further, and by MPI to implement some communicator functions. For example, the virtual-topology functions described in Chapter [[versions/v41/sections/topol#Process Topologies|Process Topologies]] are likely to be supported this way.~~

==MPI provides a “caching” facility that allows an application to attach arbitrary pieces of information, called **attributes**, to three kinds of MPI objects: communicators, windows, and datatypes. More precisely, the caching facility allows a portable library to do the following:==

==- pass information between calls by associating it with an MPI intra- or inter-/communicator, window, or datatype,==

==- quickly retrieve that information, and==

==- be guaranteed that out-of-date information is never retrieved, even if the object is freed and its handle subsequently reused by MPI.==

==The caching capabilities, in some form, are required by built-in MPI routines such as collective communication and application topology. Defining an interface to these capabilities as part of the MPI standard is valuable because it permits routines like collective communication and application topologies to be implemented as portable code, and also because it makes MPI more extensible by allowing user-written routines to use standard MPI calling sequences.==

==> [!note] Advice to users==

==> The communicator `MPI_COMM_SELF` is a suitable choice for posting MPI process-local attributes, via this attribute-caching mechanism.==

==> [!tip] Rationale==

==> In one extreme one can allow caching on all opaque handles. The other extreme is to only allow it on communicators. Caching has a cost associated with it and should only be allowed when it is clearly needed and the increased cost is modest. This is the reason that windows and datatypes were added but not other handles.==

==One difficulty is the potential for size differences between Fortran integers and C pointers. For this reason, the Fortran versions of these routines use integers of kind `MPI_ADDRESS_KIND`.==

==> [!warning] Advice to implementors==

==> High-quality implementations should raise an error when a keyval > > that was created by a call to `MPI_XXX_CREATE_KEYVAL` is used with an object of the wrong type with a call to > > `MPI_YYY_GET_ATTR` , `MPI_YYY_SET_ATTR` , `MPI_YYY_DELETE_ATTR` , or `MPI_YYY_FREE_KEYVAL` . To do so, it is necessary to maintain, with each keyval, information on the type of the associated user function.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Caching.]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Caching.]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Caching.]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Caching.]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Caching.]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Caching.]]
