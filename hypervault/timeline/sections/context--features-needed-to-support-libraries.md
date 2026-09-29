---
title: "Features Needed to Support Libraries"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Features Needed to Support Libraries

Chapter **context** · in [[versions/v13/sections/context#Features Needed to Support Libraries|MPI-1.3]], [[versions/v21/sections/context#Features Needed to Support Libraries|MPI-2.1]], [[versions/v22/sections/context#Features Needed to Support Libraries|MPI-2.2]], [[versions/v30/sections/context#Features Needed to Support Libraries|MPI-3.0]], [[versions/v31/sections/context#Features Needed to Support Libraries|MPI-3.1]], [[versions/v40/sections/context#Features Needed to Support Libraries|MPI-4.0]], [[versions/v41/sections/context#Features Needed to Support Libraries|MPI-4.1]], [[versions/v50/sections/context#Features Needed to Support Libraries|MPI-5.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

- Group scope for collective operations, that allow libraries to avoid unnecessarily synchronizing uninvolved ==MPI== processes (potentially running unrelated code),

- Abstract ~~process~~ naming ==of MPI processes== to allow libraries to describe their communication in terms suitable to their own data structures and algorithms,

- The ability to “adorn” a set of communicating ==MPI== processes with additional user-defined attributes, such as extra collective operations. This mechanism should provide a means for the user or library writer effectively to extend a message-passing notation.

In addition, a unified mechanism or object is needed for conveniently denoting communication context, the group of communicating ==MPI== processes, to house abstract ~~process naming,~~ ==naming of MPI processes,== and to store adornments.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Features Needed to Support Libraries]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Features Needed to Support Libraries]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Features Needed to Support Libraries]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Features Needed to Support Libraries]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Features Needed to Support Libraries]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Features Needed to Support Libraries]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Features Needed to Support Libraries]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Features Needed to Support Libraries]]
