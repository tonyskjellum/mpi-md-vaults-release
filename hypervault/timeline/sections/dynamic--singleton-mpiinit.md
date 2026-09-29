---
title: "Singleton MPI_INIT"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/dynamic]
---

# Singleton MPI_INIT

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Singleton MPI_INIT|MPI-2.0]], [[versions/v21/sections/dynamic#Singleton MPI_INIT|MPI-2.1]], [[versions/v22/sections/dynamic#Singleton MPI_INIT|MPI-2.2]], [[versions/v30/sections/dynamic#Singleton MPI_INIT|MPI-3.0]], [[versions/v31/sections/dynamic#Singleton MPI_INIT|MPI-3.1]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

> To start ~~an MPI-1 application with more than one process~~ ==MPI processes belonging to the same MPI_COMM_WORLD > >== requires some special coordination. The processes must be started at the “same” time, they must have a mechanism to establish communication, etc. Either the user or the operating system must take special steps beyond simply starting processes. > > When an application enters [[versions/v21/API/MPI_INIT|MPI_INIT]] , clearly it must be able to determine if these special steps ==> >== were taken. ~~MPI-1 does not say what happens if these special steps were not taken — presumably this is treated as an error in starting the MPI application. MPI-2 recommends the following behavior.~~ > > If a process enters [[versions/v21/API/MPI_INIT|MPI_INIT]] and determines that no special steps were taken (i.e., it has not been given the information to form an MPI_COMM_WORLD with other processes) it succeeds and forms a singleton MPI program, that is, one in which MPI_COMM_WORLD has size 1. > > In some implementations, MPI may not be able to function without an “MPI environment.” For example, MPI may require that daemons be running or MPI may not be able to work at all on the front-end of an MPP. In this case, an MPI implementation may either > > 1. Create the environment (e.g., start a daemon) or > > 2. Raise an error if it cannot create the environment and the environment has not been started independently. > > A ~~high quality~~ ==high-quality== implementation will try to create a singleton MPI process and not raise an error.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> To start MPI processes belonging to the same ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== > > requires some special coordination. The processes must be started at the “same” time, they must have a mechanism to establish communication, etc. Either the user or the operating system must take special steps beyond simply starting processes. > > When an application enters [[versions/v22/API/MPI_INIT|MPI_INIT]] , clearly it must be able to determine if these special steps > > were taken. > > If a process enters [[versions/v22/API/MPI_INIT|MPI_INIT]] and determines that no special steps were taken (i.e., it has not been given the information to form an ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== with other processes) it succeeds and forms a singleton MPI program, that is, one in which ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== has size 1. > > In some implementations, MPI may not be able to function without an “MPI environment.” For example, MPI may require that daemons be running or MPI may not be able to work at all on the front-end of an MPP. In this case, an MPI implementation may either > > 1. Create the environment (e.g., start a daemon) or > > 2. Raise an error if it cannot create the environment and the environment has not been started independently. > > A high-quality implementation will try to create a singleton MPI process and not raise an error.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

> To start MPI processes belonging to the same `MPI_COMM_WORLD` ~~> >~~ requires some special coordination. The processes must be started at the “same” time, they must have a mechanism to establish communication, etc. Either the user or the operating system must take special steps beyond simply starting processes. > > When an application enters [[versions/v30/API/MPI_INIT|MPI_INIT]] , clearly it must be able to determine if these special steps ~~> >~~ were taken. > > If a process enters [[versions/v30/API/MPI_INIT|MPI_INIT]] and determines that no special steps were taken (i.e., it has not been given the information to form an `MPI_COMM_WORLD` with other processes) it succeeds and forms a singleton MPI program, that is, one in which `MPI_COMM_WORLD` has size 1. > > In some implementations, MPI may not be able to function without an “MPI environment.” For example, MPI may require that daemons be running or MPI may not be able to work at all on the front-end of an MPP. In this case, an MPI implementation may either > > 1. Create the environment (e.g., start a daemon) or > > 2. Raise an error if it cannot create the environment and the environment has not been started independently. > > A high-quality implementation will try to create a singleton MPI process and not raise an error.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> To start MPI processes belonging to the same `MPI_COMM_WORLD` requires some special coordination. The processes must be started at the “same” time, they must have a mechanism to establish communication, etc. Either the user or the operating system must take special steps beyond simply starting processes. > > When an application enters [[versions/v31/API/MPI_INIT|MPI_INIT]] , clearly it must be able to determine if these special steps were taken. ~~> >~~ If a process enters [[versions/v31/API/MPI_INIT|MPI_INIT]] and determines that no special steps were taken (i.e., it has not been given the information to form an `MPI_COMM_WORLD` with other processes) it succeeds and forms a singleton MPI program, that is, one in which `MPI_COMM_WORLD` has size 1. > > In some implementations, MPI may not be able to function without an “MPI environment.” For example, MPI may require that daemons be running or MPI may not be able to work at all on the front-end of an MPP. In this case, an MPI implementation may either > > 1. Create the environment (e.g., start a daemon) or > > 2. Raise an error if it cannot create the environment and the environment has not been started independently. > > A high-quality implementation will try to create a singleton MPI process and not raise an error.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Singleton MPI_INIT]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Singleton MPI_INIT]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Singleton MPI_INIT]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Singleton MPI_INIT]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Singleton MPI_INIT]]
