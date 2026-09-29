---
title: "MPI and Threads"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# MPI and Threads

Chapter **ei** · in [[versions/v20/sections/ei#MPI and Threads|MPI-2.0]], [[versions/v21/sections/ei#MPI and Threads|MPI-2.1]], [[versions/v22/sections/ei#MPI and Threads|MPI-2.2]], [[versions/v30/sections/ei#MPI and Threads|MPI-3.0]], [[versions/v31/sections/ei#MPI and Threads|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

This section specifies the interaction between MPI calls and threads. The section lists minimal requirements for **thread compliant** MPI implementations and defines functions that can be used for initializing the thread environment. MPI may be implemented in environments where threads are not supported or perform poorly. Therefore, ~~it is~~ ==MPI implementations are== not required ~~that all MPI implementations fulfill all the requirements specified~~ ==to be thread compliant as defined== in this section.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

This section specifies the interaction between MPI calls and threads. The section lists minimal requirements for **thread compliant** MPI implementations and defines functions that can be used for initializing the thread environment. MPI may be implemented in environments where threads are not supported or perform poorly. Therefore, MPI implementations are not required to be thread compliant as defined in this section. ==Regardless of whether or not the MPI implementation is thread compliant, [[versions/v31/API/MPI_INITIALIZED|MPI_INITIALIZED]] , [[versions/v31/API/MPI_FINALIZED|MPI_FINALIZED]] , [[versions/v31/API/MPI_QUERY_THREAD|MPI_QUERY_THREAD]] , [[versions/v31/API/MPI_IS_THREAD_MAIN|MPI_IS_THREAD_MAIN]] , [[versions/v31/API/MPI_GET_VERSION|MPI_GET_VERSION]] and [[versions/v31/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] must always be thread-safe. When a thread is executing one of these routines, if another concurrently running thread also makes an MPI call, the outcome will be as if the calls executed in some order.==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#MPI and Threads]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#MPI and Threads]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#MPI and Threads]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#MPI and Threads]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#MPI and Threads]]
