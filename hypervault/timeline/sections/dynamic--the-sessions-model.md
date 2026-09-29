---
title: "The Sessions Model"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# The Sessions Model

Chapter **dynamic** · in [[versions/v40/sections/dynamic#The Sessions Model|MPI-4.0]], [[versions/v41/sections/dynamic#The Sessions Model|MPI-4.1]], [[versions/v50/sections/dynamic#The Sessions Model|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

As shown in Figure [[sessions-fig]] , when using the Sessions Model, an MPI process instantiates an ~~*MPI~~ ==**MPI== Session ~~handle*,~~ ==handle**,== which can be used to query the runtime system about characteristics of the job within which the process is running, as well as other system resources. Using this information, the MPI process can then create an MPI Group based on application requirements and available resources, which in turn can be used to create an MPI Communicator, Window, or File. By judicious creation of communicators, an application only needs to allocate MPI resources based on its communication requirements. Although there are existing MPI interfaces for creating communicators ~~which~~ ==that== can, in principle, allow for resource optimizations within an MPI implementation, this can only be done following initialization of MPI.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The Sessions Model]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#The Sessions Model]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#The Sessions Model]]
