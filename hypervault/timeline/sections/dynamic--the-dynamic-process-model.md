---
title: "The Dynamic Process Model"
chapter: dynamic
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# The Dynamic Process Model

Chapter **dynamic** · in [[versions/v21/sections/dynamic#The Dynamic Process Model|MPI-2.1]], [[versions/v22/sections/dynamic#The Dynamic Process Model|MPI-2.2]], [[versions/v30/sections/dynamic#The Dynamic Process Model|MPI-3.0]], [[versions/v31/sections/dynamic#The Dynamic Process Model|MPI-3.1]], [[versions/v40/sections/dynamic#The Dynamic Process Model|MPI-4.0]], [[versions/v41/sections/dynamic#The Dynamic Process Model|MPI-4.1]], [[versions/v50/sections/dynamic#The Dynamic Process Model|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~dynamic~~

~~process model allows for the creation and cooperative termination of processes after an MPI application has started. It provides a mechanism to establish communication between the newly created processes and the existing MPI application. It also provides a mechanism to establish communication between two existing MPI applications, even when one did not “start” the other.~~

==dynamic process model allows for the creation and cooperative termination of processes after an MPI application has started. It provides a mechanism to establish communication between the newly created processes and the existing MPI application. It also provides a mechanism to establish communication between two existing MPI applications, even when one did not “start” the other.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The~~

~~dynamic process model allows for the creation and cooperative termination of processes after an MPI application has started. It provides a mechanism to establish communication between the newly created processes and the existing MPI application. It also provides a mechanism to establish communication between two existing MPI applications, even when one did not “start” the other.~~

==The dynamic process model allows for the creation and cooperative termination of processes after an MPI application has started. It provides a mechanism to establish communication between the newly created processes and the existing MPI application. It also provides a mechanism to establish communication between two existing MPI applications, even when one did not “start” the other.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==The MPI procedures described in this section require the World Model, meaning that [[versions/v41/API/MPI_INIT|MPI_INIT]] or [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] has been used to initialize MPI.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#The Dynamic Process Model]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#The Dynamic Process Model]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#The Dynamic Process Model]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#The Dynamic Process Model]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The Dynamic Process Model]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#The Dynamic Process Model]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#The Dynamic Process Model]]
