---
title: "Introduction"
chapter: part
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/part]
---

# Introduction

Chapter **part** · in [[versions/v40/sections/part#Introduction|MPI-4.0]], [[versions/v41/sections/part#Introduction|MPI-4.1]], [[versions/v50/sections/part#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Partitioned communication operations use a persistent communication style that involves a sequence of start and test or wait operations. For this sequence, partitioned communications use [[versions/v41/API/MPI_START|MPI_START]] or [[versions/v41/API/MPI_STARTALL|MPI_STARTALL]] calls and completion mechanisms ~~(~~ ==(e.g.,== [[versions/v41/API/MPI_TEST|MPI_TEST]] or [[versions/v41/API/MPI_WAIT|MPI_WAIT]] ). Partitioned communication is different in three fundamental ways from persistent point-to-point operations in MPI. First, partitioned communication allows additional partitioned test function calls that can expose partial completion of the operation. Second, partitioned communication may perform all of the initialization required to enable data transfer as early as its initialization phase. Third, partitioned communication allows for MPI to be independently notified of multiple contributions from the send-side to a single data buffer of a single MPI message.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/part#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/part#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/part#Introduction]]
