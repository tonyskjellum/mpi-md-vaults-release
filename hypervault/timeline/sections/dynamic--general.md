---
title: "General"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# General

Chapter **dynamic** · in [[versions/v40/sections/dynamic#General|MPI-4.0]], [[versions/v41/sections/dynamic#General|MPI-4.1]], [[versions/v50/sections/dynamic#General|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

In a thread-compliant implementation, an MPI process is a process that may be multithreaded. Each thread can issue MPI calls; however, threads are not separately addressable: ~~a rank~~ ==the `rank` argument== in a send or receive call identifies ~~a~~ ==an MPI== process, not a thread. A message sent to ~~a~~ ==an MPI== process can be received by any thread in this ==MPI== process.

1. All MPI calls are ~~*thread-safe*,~~ ==**thread-safe**,== i.e., two concurrently running threads may make MPI calls and the outcome will be as if the calls executed in some order, even if their execution is interleaved.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#General]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#General]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#General]]
