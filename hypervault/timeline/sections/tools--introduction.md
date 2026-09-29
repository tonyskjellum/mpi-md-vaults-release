---
title: "Introduction"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Introduction

Chapter **tools** · in [[versions/v30/sections/tools#Introduction|MPI-3.0]], [[versions/v31/sections/tools#Introduction|MPI-3.1]], [[versions/v40/sections/tools#Introduction|MPI-4.0]], [[versions/v41/sections/tools#Introduction|MPI-4.1]], [[versions/v50/sections/tools#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

This chapter discusses interfaces that allow debuggers, performance analyzers, and other tools to extract information about the operation of MPI processes. Specifically, this chapter defines both the MPI profiling interface (Section [[versions/v40/sections/tools#Profiling Interface|Profiling Interface]] ), which supports the transparent interception and inspection of MPI calls, and the MPI tool information interface (Section [[versions/v40/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] ), which supports the inspection and manipulation of MPI control and performance ~~variables.~~ ==variables, as well as the registration of callbacks for MPI library events.== The interfaces described in this chapter are all defined in the context of an MPI process, i.e., are callable from the same code that invokes other MPI functions.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

This chapter discusses interfaces that allow debuggers, performance analyzers, and other tools to extract information about the ~~operation~~ ==behavior== of MPI processes. Specifically, this chapter defines both the MPI profiling interface (Section [[versions/v41/sections/tools#Profiling Interface|Profiling Interface]] ), which supports the transparent interception and inspection of MPI calls, and the MPI tool information interface (Section [[versions/v41/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] ), which supports the inspection and manipulation of MPI control and performance variables, as well as the registration of callbacks for MPI library events. The interfaces described in this chapter are all defined in the context of an MPI process, i.e., are callable from the same code that invokes other MPI functions.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Introduction]]
