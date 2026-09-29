---
title: "Caching"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Caching

Chapter **context** · in [[versions/v13/sections/context#Caching|MPI-1.3]], [[versions/v21/sections/context#Caching|MPI-2.1]], [[versions/v22/sections/context#Caching|MPI-2.2]], [[versions/v30/sections/context#Caching|MPI-3.0]], [[versions/v31/sections/context#Caching|MPI-3.1]], [[versions/v40/sections/context#Caching|MPI-4.0]], [[versions/v41/sections/context#Caching|MPI-4.1]], [[versions/v50/sections/context#Caching|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

~~MPI provides a “caching” facility that allows an application to attach arbitrary pieces of information, called **attributes**, to communicators. More precisely, the caching facility allows a portable library to do the following:~~

==MPI provides a “caching” facility that allows an application to attach arbitrary pieces of information, called **attributes**, to==

==three kinds of MPI objects, communicators, windows and datatypes. More precisely, the caching==

==facility allows a portable library to do the following:==

==  window or datatype,==

~~- be guaranteed that out-of-date information is never retrieved, even if the communicator is freed and its handle subsequently reused by MPI.~~

==- be guaranteed that out-of-date information is never retrieved, even if==

==  the object is freed and its handle subsequently reused by MPI.==

==> [!tip] Rationale==

==> In one extreme > > one > > can allow caching on all opaque handles. The other extreme is to only allow it on communicators. Caching has a cost associated with it and should only be allowed when it is clearly needed and the increased cost is modest. This is the reason that windows and datatypes were added but not other handles.==

==One difficulty==

==is the potential for size differences between Fortran integers and C pointers. To overcome this problem with attribute caching on communicators,==

==functions==

==are also given for this case. The==

==functions==

==to cache on datatypes and windows also address this issue. For a general discussion of the address size problem, see Section [[versions/v21/sections/binding#Addresses|Addresses]] .==

==> [!warning] Advice to implementors==

==> High-quality implementations should raise an error when a keyval > > that was created by a call to `MPI_XXX_CREATE_KEYVAL` is used with an object of the wrong type with a call to > > `MPI_YYY_GET_ATTR` , `MPI_YYY_SET_ATTR` , `MPI_YYY_DELETE_ATTR` , or `MPI_YYY_FREE_KEYVAL` . To do so, it is necessary to maintain, with each keyval, information on the type of the associated user function.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> The communicator ~~MPI_COMM_SELF~~ ==`MPI_COMM_SELF`== is a suitable choice for posting process-local attributes, via this attributing-caching mechanism.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~three kinds of MPI objects, communicators, windows and datatypes. More precisely, the caching~~

~~facility allows a portable library to do the following:~~

~~- pass information between calls by associating it with an MPI intra- or in­ter-­com­mun­i­ca­tor,~~

~~  window or datatype,~~

==three kinds of MPI objects, communicators, windows, and datatypes. More precisely, the caching facility allows a portable library to do the following:==

==- pass information between calls by associating it with an MPI intra- or in­ter-­com­mun­i­ca­tor, window, or datatype,==

> The communicator `MPI_COMM_SELF` is a suitable choice for posting process-local attributes, via this ~~attributing-caching~~ ==attribute-caching== mechanism.

~~> In one extreme > > one > > can allow caching on all opaque handles. The other extreme is to only allow it on communicators. Caching has a cost associated with it and should only be allowed when it is clearly needed and the increased cost is modest. This is the reason that windows and datatypes were added but not other handles.~~

~~One difficulty~~

~~is the potential for size differences between Fortran integers and C pointers. To overcome this problem with attribute caching on communicators,~~

~~functions~~

~~are also given for this case. The~~

~~functions~~

~~to cache on datatypes and windows also address this issue. For a general discussion of the address size problem, see Section [[versions/v30/sections/binding#Addresses|Addresses]] .~~

==> In one extreme > > one can allow caching on all opaque handles. The other extreme is to only allow it on communicators. Caching has a cost associated with it and should only be allowed when it is clearly needed and the increased cost is modest. This is the reason that windows and datatypes were added but not other handles.==

==One difficulty is the potential for size differences between Fortran integers and C pointers. For this reason, the Fortran versions of these routines use integers of kind `MPI_ADDRESS_KIND`.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~MPI provides a “caching” facility that allows an application to attach arbitrary pieces of information, called **attributes**, to~~

~~three kinds of MPI objects, communicators, windows, and datatypes. More precisely, the caching facility allows a portable library to do the following:~~

==MPI provides a “caching” facility that allows an application to attach arbitrary pieces of information, called **attributes**, to three kinds of MPI objects, communicators, windows, and datatypes. More precisely, the caching facility allows a portable library to do the following:==

~~- be guaranteed that out-of-date information is never retrieved, even if~~

~~  the object is freed and its handle subsequently reused by MPI.~~

==- be guaranteed that out-of-date information is never retrieved, even if the object is freed and its handle subsequently reused by MPI.==

> In one extreme ~~> >~~ one can allow caching on all opaque handles. The other extreme is to only allow it on communicators. Caching has a cost associated with it and should only be allowed when it is clearly needed and the increased cost is modest. This is the reason that windows and datatypes were added but not other handles.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

MPI provides a “caching” facility that allows an application to attach arbitrary pieces of information, called **attributes**, to three kinds of MPI ~~objects,~~ ==objects:== communicators, windows, and datatypes. More precisely, the caching facility allows a portable library to do the following:

- pass information between calls by associating it with an MPI intra- or ~~in­ter-­com­mun­i­ca­tor,~~ ==inter-/communicator,== window, or datatype,

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

> The communicator `MPI_COMM_SELF` is a suitable choice for posting ==MPI== process-local attributes, via this attribute-caching mechanism.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Caching]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Caching]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Caching]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Caching]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Caching]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Caching]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Caching]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Caching]]
