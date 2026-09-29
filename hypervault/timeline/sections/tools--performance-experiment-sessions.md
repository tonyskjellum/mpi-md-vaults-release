---
title: "Performance Experiment Sessions"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Performance Experiment Sessions

Chapter **tools** · in [[versions/v30/sections/tools#Performance Experiment Sessions|MPI-3.0]], [[versions/v31/sections/tools#Performance Experiment Sessions|MPI-3.1]], [[versions/v40/sections/tools#Performance Experiment Sessions|MPI-4.0]], [[versions/v41/sections/tools#Performance Experiment Sessions|MPI-4.1]], [[versions/v50/sections/tools#Performance Experiment Sessions|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

Within a single program, multiple components can use the MPI tool information interface. To avoid collisions with respect to accesses to performance variables, users of the MPI tool information interface must first create a ==performance experiment== session. Subsequent calls that access performance variables can then be made within the context of this ==performance experiment== session. ~~Any call executed~~ ==Starting, stopping, reading, writing, or resetting a variable== in ~~a~~ ==one performance experiment== session ~~must~~ ==shall== not influence ~~the results~~ ==whether a variable is started, stopped, read, written, or reset== in ~~any other~~ ==another performance experiment== session.

This call creates a new ==performance experiment== session for accessing performance variables and returns a handle for this ==performance experiment== session in the argument ~~`session`~~ ==`pe_session`== of type `MPI_T_pvar_session`.

This call frees an existing ==performance experiment== session. Calls to the MPI tool information interface can no longer be made within the context of a ==performance experiment== session after it is freed. On a successful return, MPI sets the ==performance experiment== session identifier to `MPI_T_PVAR_SESSION_NULL`.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Performance Experiment Sessions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Performance Experiment Sessions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Performance Experiment Sessions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Performance Experiment Sessions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Performance Experiment Sessions]]
