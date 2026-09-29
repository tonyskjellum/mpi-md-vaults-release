---
title: "Specifics for Intracommunicator Collective Operations"
chapter: coll
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/coll]
---

# Specifics for Intracommunicator Collective Operations

Chapter **coll** · in [[versions/v21/sections/coll#Specifics for Intracommunicator Collective Operations|MPI-2.1]], [[versions/v22/sections/coll#Specifics for Intracommunicator Collective Operations|MPI-2.2]], [[versions/v30/sections/coll#Specifics for Intracommunicator Collective Operations|MPI-3.0]], [[versions/v31/sections/coll#Specifics for Intracommunicator Collective Operations|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

All processes in the group identified by the intracommunicator must call the collective ~~routine with matching arguments.~~ ==routine.==

collective communication can occur “in place” for intracommunicators, with the output buffer being identical to the input buffer. This is specified by providing a special argument value, ~~MPI_IN_PLACE,~~ ==`MPI_IN_PLACE`,== instead of the send buffer or the receive buffer argument,

> By allowing the “in place” option, the receive buffer in many of the collective calls becomes a send-and-receive buffer. For this reason, a Fortran binding that includes `INTENT` must mark these as `INOUT`, not `OUT`. > > Note that `MPI_IN_PLACE` is a special kind of value; it has the same restrictions on its use that ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== has. > > Some intracommunicator collective operations do not support the “in place” option (e.g., [[versions/v22/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] ).

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~In many cases,~~

~~collective communication can occur “in place” for intracommunicators, with the output buffer being identical to the input buffer. This is specified by providing a special argument value, `MPI_IN_PLACE`, instead of the send buffer or the receive buffer argument,~~

~~depending on the operation performed.~~

==In many cases, collective communication can occur “in place” for intracommunicators, with the output buffer being identical to the input buffer. This is specified by providing a special argument value, `MPI_IN_PLACE`, instead of the send buffer or the receive buffer argument, depending on the operation performed.==

> By allowing the “in place” option, the receive buffer in many of the collective calls becomes a send-and-receive buffer. For this reason, a Fortran binding that includes `INTENT` must mark these as `INOUT`, not `OUT`. > > Note that `MPI_IN_PLACE` is a special kind of value; it has the same restrictions on its use that `MPI_BOTTOM` has. ~~> > Some intracommunicator collective operations do not support the “in place” option (e.g., [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] ).~~

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

All processes in the group identified by the ~~intracommunicator~~ ==intra-communicator== must call the collective routine.

In many cases, collective communication can occur “in place” for ~~intracommunicators,~~ ==intra-communicators,== with the output buffer being identical to the input buffer. This is specified by providing a special argument value, `MPI_IN_PLACE`, instead of the send buffer or the receive buffer argument, depending on the operation performed.

> By allowing the “in place” option, the receive buffer in many of the collective calls becomes a send-and-receive buffer. For this reason, a Fortran binding that includes `INTENT` must mark these as `INOUT`, not `OUT`. > > Note that `MPI_IN_PLACE` is a special kind of value; it has the same restrictions on its use that `MPI_BOTTOM` ~~has.~~ ==has (not usable in Fortran for initialization or assignment). See Section [[versions/v40/sections/terms#Named Constants|Named Constants]] .==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

All ==MPI== processes in the group identified by the intra-communicator must call the collective routine.

> The “in place” operations are provided to reduce unnecessary memory motion by both the MPI implementation and by the user. Note that while the simple check of testing whether the send and receive buffers have the same address will work for some cases (e.g., [[versions/v41/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] ), they are inadequate in others (e.g., [[versions/v41/API/MPI_GATHER|MPI_GATHER]] , with ~~root~~ ==`root`== not equal to zero). Further, Fortran explicitly prohibits aliasing of arguments; the approach of using a special value to denote “in place” operation eliminates that difficulty.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Specifics for Intracommunicator Collective Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Specifics for Intracommunicator Collective Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Specifics for Intracommunicator Collective Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Specifics for Intracommunicator Collective Operations]]
