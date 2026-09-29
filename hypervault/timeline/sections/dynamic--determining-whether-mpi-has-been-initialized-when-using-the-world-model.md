---
title: "Determining Whether MPI Has Been Initialized When Using the World Model"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Determining Whether MPI Has Been Initialized When Using the World Model

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Determining Whether MPI Has Been Initialized When Using the World Model|MPI-4.0]], [[versions/v41/sections/dynamic#Determining Whether MPI Has Been Initialized When Using the World Model|MPI-4.1]], [[versions/v50/sections/dynamic#Determining Whether MPI Has Been Initialized When Using the World Model|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

One of the goals of MPI is to allow for layered libraries. A library using the World Model needs to know if MPI has been initialized using either ~~of~~ [[versions/v50/API/MPI_INIT|MPI_INIT]] or [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . In MPI the function [[versions/v50/API/MPI_INITIALIZED|MPI_INITIALIZED]] is provided to tell if MPI had been initialized using the World Model. In the World Model, once MPI has been finalized it cannot be restarted. A library needs to be able to determine this to act accordingly. To achieve this, the function [[versions/v50/API/MPI_FINALIZED|MPI_FINALIZED]] is needed.

This routine may be used to determine whether [[versions/v50/API/MPI_INIT|MPI_INIT]] or [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] has been called. [[versions/v50/API/MPI_INITIALIZED|MPI_INITIALIZED]] returns `true` if the calling process has called either of these MPI procedures. ==It is valid to call [[versions/v50/API/MPI_INITIALIZED|MPI_INITIALIZED]] before [[versions/v50/API/MPI_INIT|MPI_INIT]] or [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] and after [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] .== Whether [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] has been called does not affect the behavior of [[versions/v50/API/MPI_INITIALIZED|MPI_INITIALIZED]] . This function must always be thread-safe, as defined in Section [[versions/v50/sections/dynamic#MPI and Threads|MPI and Threads]] . This function returns `false` for applications using the Sessions Model exclusively.

This routine returns `true` if [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] has completed. It is valid to call [[versions/v50/API/MPI_FINALIZED|MPI_FINALIZED]] before [[versions/v50/API/MPI_INIT|MPI_INIT]] ==or [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]]== and after [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] . This function must always be thread-safe, as defined in Section [[versions/v50/sections/dynamic#MPI and Threads|MPI and Threads]] .

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Determining Whether MPI Has Been Initialized When Using the World Model]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Determining Whether MPI Has Been Initialized When Using the World Model]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Determining Whether MPI Has Been Initialized When Using the World Model]]
