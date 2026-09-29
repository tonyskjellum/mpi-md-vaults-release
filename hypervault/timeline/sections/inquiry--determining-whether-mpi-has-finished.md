---
title: "Determining Whether MPI Has Finished"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/inquiry]
---

# Determining Whether MPI Has Finished

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Determining Whether MPI Has Finished|MPI-2.1]], [[versions/v22/sections/inquiry#Determining Whether MPI Has Finished|MPI-2.2]], [[versions/v30/sections/inquiry#Determining Whether MPI Has Finished|MPI-3.0]], [[versions/v31/sections/inquiry#Determining Whether MPI Has Finished|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

This routine returns `true` if [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] has completed. It is ~~legal~~ ==valid== to call [[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] before [[versions/v30/API/MPI_INIT|MPI_INIT]] and after [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] .

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

This routine returns `true` if [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] has completed. It is valid to call [[versions/v31/API/MPI_FINALIZED|MPI_FINALIZED]] before [[versions/v31/API/MPI_INIT|MPI_INIT]] and after [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] . ==This function must always be thread-safe, as defined in Section [[versions/v31/sections/ei#MPI and Threads|MPI and Threads]] .==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Determining Whether MPI Has Finished]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Determining Whether MPI Has Finished]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Determining Whether MPI Has Finished]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Determining Whether MPI Has Finished]]
