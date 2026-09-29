---
title: "Initialization and Finalization"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Initialization and Finalization

Chapter **tools** · in [[versions/v30/sections/tools#Initialization and Finalization|MPI-3.0]], [[versions/v31/sections/tools#Initialization and Finalization|MPI-3.1]], [[versions/v40/sections/tools#Initialization and Finalization|MPI-4.0]], [[versions/v41/sections/tools#Initialization and Finalization|MPI-4.1]], [[versions/v50/sections/tools#Initialization and Finalization|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

The MPI specification does not require all MPI processes to exist before the call to ~~`MPI_INIT`.~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]] .== If the MPI tool information interface is used before ~~`MPI_INIT`~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]]== has been called, the user is responsible for ensuring that the MPI tool information interface is initialized on all processes it is used in. Processes created by the MPI implementation during ~~`MPI_INIT`~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]]== inherit the status of the MPI tool information interface (whether it is initialized or not as well as all active sessions and handles) from the process from which they are created.

At the end of the program execution, unless [[versions/v31/API/MPI_ABORT|MPI_ABORT]] is called, an application must have called ~~`MPI_T_INIT_THREAD`~~ ==[[versions/v31/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]]== and ~~`MPI_T_FINALIZE`~~ ==[[versions/v31/API/MPI_T_FINALIZE|MPI_T_FINALIZE]]== an equal number of times.

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

All programs or tools that use the MPI tool information interface must initialize the MPI tool information interface in the processes that will use the interface before calling any other of its routines. A user can initialize the MPI tool information interface by calling [[versions/v40/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] , which can be called multiple times. In addition, this routine initializes the thread environment for all routines in the MPI tool information interface. Calling this routine when the MPI tool information interface is already initialized has no effect beyond increasing the reference count of how often the interface has been initialized. The argument `required` is used to specify the desired level of thread support. The possible values and their semantics are identical to the ones that can be used with [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] listed in Section ~~[[versions/v40/sections/ei#MPI~~ ==[[dynamic#MPI== and Threads|MPI and Threads]] . The call returns in `provided` information about the actual level of thread support that will be provided by the MPI implementation for calls to MPI tool information interface routines. It can be one of the four values listed in Section ~~[[versions/v40/sections/ei#MPI~~ ==[[dynamic#MPI== and Threads|MPI and Threads]] .

The MPI specification does not require all MPI processes to exist before ~~the call to [[versions/v40/API/MPI_INIT|MPI_INIT]] .~~ ==MPI is initialized.== If the MPI tool information interface is used before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]] has been called,~~ ==initialization of MPI,== the user is responsible for ensuring that the MPI tool information interface is initialized on all processes it is used in. Processes created by the MPI implementation during ~~[[versions/v40/API/MPI_INIT|MPI_INIT]]~~ ==initialization== inherit the status of the MPI tool information interface (whether it is initialized or not as well as all active sessions and handles) from the process from which they are created.

> If [[versions/v40/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] is called before [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , the requested and ~~granted~~ ==provided== thread level for [[versions/v40/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] may influence the behavior and return value of [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . The same is true for the reverse order. ==Likewise, when using the Sessions Model (Section [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] ), the requested and provided thread level for [[versions/v40/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] may influence the behavior and return values of [[versions/v40/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] (see Section [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] ), with the same being true for the reverse order.==

> MPI implementations should strive to make as many control or performance variables available before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]]~~ ==MPI initialization== (instead of adding them ~~within [[versions/v40/API/MPI_INIT|MPI_INIT]] )~~ ==during initialization)== to allow tools the most flexibility. In particular, control variables should be available before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]]~~ ==MPI initialization== if their value cannot be changed after ~~[[versions/v40/API/MPI_INIT|MPI_INIT]] .~~ ==MPI initialization.==

Once [[versions/v40/API/MPI_T_FINALIZE|MPI_T_FINALIZE]] is called the same number of times as the routine [[versions/v40/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] up to the current point of execution, the MPI tool information interface is no longer initialized. The ==user can reinitialize the== interface ~~can be reinitialized~~ by ==a== subsequent ~~calls~~ ==call== to [[versions/v40/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

This routine finalizes the use of the MPI tool information interface and may be called as often as the corresponding [[versions/v41/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] routine up to the current point of execution. Calling it more times returns a corresponding ~~error~~ ==return== code. As long as the number of calls to [[versions/v41/API/MPI_T_FINALIZE|MPI_T_FINALIZE]] is smaller than the number of calls to [[versions/v41/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] up to the current point of execution, the MPI tool information interface remains initialized and calls to its routines are permissible. Further, additional calls to [[versions/v41/API/MPI_T_INIT_THREAD|MPI_T_INIT_THREAD]] after one or more calls to [[versions/v41/API/MPI_T_FINALIZE|MPI_T_FINALIZE]] are permissible.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Initialization and Finalization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Initialization and Finalization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Initialization and Finalization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Initialization and Finalization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Initialization and Finalization]]
