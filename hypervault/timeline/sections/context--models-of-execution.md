---
title: "Models of Execution"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Models of Execution

Chapter **context** · in [[versions/v13/sections/context#Models of Execution|MPI-1.3]], [[versions/v21/sections/context#Models of Execution|MPI-2.1]], [[versions/v22/sections/context#Models of Execution|MPI-2.2]], [[versions/v30/sections/context#Models of Execution|MPI-3.0]], [[versions/v31/sections/context#Models of Execution|MPI-3.1]], [[versions/v40/sections/context#Models of Execution|MPI-4.0]], [[versions/v41/sections/context#Models of Execution|MPI-4.1]], [[versions/v50/sections/context#Models of Execution|MPI-5.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

In the loosely synchronous model, transfer of control to a **parallel procedure** is effected by having each executing ==MPI== process invoke the procedure. The invocation is a collective operation: it is executed by all ==MPI== processes in the execution group, and invocations are similarly ordered at all ==MPI== processes. However, the invocation need not be synchronized.

We say that a parallel procedure is *active* in ~~a~~ ==an MPI== process if the ==MPI== process belongs to a group that may collectively execute the procedure, and some member of that group is currently executing the procedure code. If a parallel procedure is active in ~~a~~ ==an MPI== process, then this ==MPI== process may be receiving messages pertaining to this procedure, even if it does not currently execute the code of this procedure.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Models of Execution]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Models of Execution]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Models of Execution]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Models of Execution]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Models of Execution]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Models of Execution]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Models of Execution]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Models of Execution]]
