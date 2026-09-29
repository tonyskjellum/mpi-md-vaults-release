---
title: "Group Destructors"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Group Destructors

Chapter **context** · in [[versions/v13/sections/context#Group Destructors|MPI-1.3]], [[versions/v21/sections/context#Group Destructors|MPI-2.1]], [[versions/v22/sections/context#Group Destructors|MPI-2.2]], [[versions/v30/sections/context#Group Destructors|MPI-3.0]], [[versions/v31/sections/context#Group Destructors|MPI-3.1]], [[versions/v40/sections/context#Group Destructors|MPI-4.0]], [[versions/v41/sections/context#Group Destructors|MPI-4.1]], [[versions/v50/sections/context#Group Destructors|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

> One can keep a reference count that is incremented for each call to ==> > `MPI_COMM_GROUP`, > >== `MPI_COMM_CREATE` and `MPI_COMM_DUP`, and decremented for each call to `MPI_GROUP_FREE` or `MPI_COMM_FREE`; the group object is ultimately deallocated when the reference count drops to zero.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

This operation marks a group object for deallocation. The handle `group` is set to ~~MPI_GROUP_NULL~~ ==`MPI_GROUP_NULL`== by the call. Any on-going operation using this group will complete normally.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

> One can keep a reference count that is incremented for each call to ~~> >~~ `MPI_COMM_GROUP`, ~~> > `MPI_COMM_CREATE`~~ ==`MPI_COMM_CREATE`, `MPI_COMM_DUP`,== and ~~`MPI_COMM_DUP`,~~ ==[[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] ,== and decremented for each call to `MPI_GROUP_FREE` or `MPI_COMM_FREE`; the group object is ultimately deallocated when the reference count drops to zero.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> One can keep a reference count that is incremented for each call to ~~`MPI_COMM_GROUP`, `MPI_COMM_CREATE`, `MPI_COMM_DUP`,~~ ==[[versions/v31/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] , [[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , [[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]] ,== and [[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , and decremented for each call to ~~`MPI_GROUP_FREE`~~ ==[[versions/v31/API/MPI_GROUP_FREE|MPI_GROUP_FREE]]== or ~~`MPI_COMM_FREE`;~~ ==[[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] ;== the group object is ultimately deallocated when the reference count drops to zero.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> One can keep a reference count that is incremented for each call to [[versions/v40/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] , [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] , ==[[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] , [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , [[versions/v40/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] , [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] ,== and ~~[[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]~~ ==[[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]]== , and decremented for each call to [[versions/v40/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] or [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] ; the group object is ultimately deallocated when the reference count drops to zero.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

==> >== > One can keep a reference count that is incremented for each call to [[versions/v50/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] , [[versions/v50/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , [[versions/v50/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v50/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v50/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , [[versions/v50/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] , [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , [[versions/v50/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] , [[versions/v50/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , [[versions/v50/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , [[versions/v50/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] , and [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] , and decremented for each call to [[versions/v50/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] or [[versions/v50/API/MPI_COMM_FREE|MPI_COMM_FREE]] ; the group object is ultimately deallocated when the reference count drops to zero. ==> >==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Group Destructors]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Group Destructors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Group Destructors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Group Destructors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Group Destructors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Group Destructors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Group Destructors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Group Destructors]]
