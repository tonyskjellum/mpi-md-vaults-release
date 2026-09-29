---
title: "Communicator Destructors"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Communicator Destructors

Chapter **context** · in [[versions/v13/sections/context#Communicator Destructors|MPI-1.3]], [[versions/v21/sections/context#Communicator Destructors|MPI-2.1]], [[versions/v22/sections/context#Communicator Destructors|MPI-2.2]], [[versions/v30/sections/context#Communicator Destructors|MPI-3.0]], [[versions/v31/sections/context#Communicator Destructors|MPI-3.1]], [[versions/v40/sections/context#Communicator Destructors|MPI-4.0]], [[versions/v41/sections/context#Communicator Destructors|MPI-4.1]], [[versions/v50/sections/context#Communicator Destructors|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

This collective operation marks the communication object for deallocation. The handle is set to MPI_COMM_NULL. Any pending operations that use this communicator will complete normally; the object is actually deallocated only if there are no other active references to it. This call applies to intra- and inter-communicators. The delete callback functions for all cached attributes (see ~~section~~ ==Section== [[versions/v21/sections/context#Caching|Caching]] ) are called in arbitrary order.

> A reference-count mechanism may be used: the reference count is incremented by each call to `MPI_COMM_DUP`, and decremented by each call to `MPI_COMM_FREE`. The object is ultimately deallocated when the count reaches zero. > > Though collective, it is anticipated that this operation will normally be implemented to be local, though ~~the~~ ==> > a > >== debugging version of an MPI library might choose to synchronize.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

This collective operation marks the communication object for deallocation. The handle is set to ~~MPI_COMM_NULL.~~ ==`MPI_COMM_NULL`.== Any pending operations that use this communicator will complete normally; the object is actually deallocated only if there are no other active references to it. This call applies to intra- and inter-communicators. The delete callback functions for all cached attributes (see Section [[versions/v22/sections/context#Caching|Caching]] ) are called in arbitrary order.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

> A reference-count mechanism may be used: the reference count is incremented by each call to ~~`MPI_COMM_DUP`,~~ ==`MPI_COMM_DUP` or `MPI_COMM_IDUP`,== and decremented by each call to `MPI_COMM_FREE`. The object is ultimately deallocated when the count reaches zero. > > Though collective, it is anticipated that this operation will normally be implemented to be local, though > > a ~~> >~~ debugging version of an MPI library might choose to synchronize.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> A reference-count mechanism may be used: the reference count is incremented by each call to ~~`MPI_COMM_DUP`~~ ==[[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]]== or ~~`MPI_COMM_IDUP`,~~ ==[[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] ,== and decremented by each call to ~~`MPI_COMM_FREE`.~~ ==[[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] .== The object is ultimately deallocated when the count reaches zero. > > Though collective, it is anticipated that this operation will normally be implemented to be local, though ~~> >~~ a debugging version of an MPI library might choose to synchronize.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~> A reference-count mechanism may be used: the reference count is incremented by each call to [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] or [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , and decremented by each call to [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] . The object is ultimately deallocated when the count reaches zero. >~~ > Though collective, it is anticipated that this operation will normally be implemented to be local, though a debugging version of an MPI library might choose to synchronize.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

This collective operation marks the communication object for deallocation. ~~The handle is set to `MPI_COMM_NULL`.~~ Any ~~pending~~ operations that use ==the communicator `comm` (whether active or inactive at the time of== this ~~communicator~~ ==procedure call)== will ~~complete normally;~~ ==continue to work;== the object is actually deallocated only if there are no other active references to it. ==The handle is set to `MPI_COMM_NULL` in the calling MPI process.== This call applies to intra- and inter-communicators. The delete callback functions for all cached attributes (see Section [[versions/v41/sections/context#Caching|Caching]] ) are called in arbitrary order.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Communicator Destructors]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Communicator Destructors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Communicator Destructors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Communicator Destructors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Communicator Destructors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Communicator Destructors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Communicator Destructors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Communicator Destructors]]
