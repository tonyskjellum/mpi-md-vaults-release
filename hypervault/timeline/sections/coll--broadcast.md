---
title: "Broadcast"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Broadcast

Chapter **coll** · in [[versions/v13/sections/coll#Broadcast|MPI-1.3]], [[versions/v20/sections/collective#Broadcast|MPI-2.0]], [[versions/v21/sections/coll#Broadcast|MPI-2.1]], [[versions/v22/sections/coll#Broadcast|MPI-2.2]], [[versions/v30/sections/coll#Broadcast|MPI-3.0]], [[versions/v31/sections/coll#Broadcast|MPI-3.1]], [[versions/v40/sections/coll#Broadcast|MPI-4.0]], [[versions/v41/sections/coll#Broadcast|MPI-4.1]], [[versions/v50/sections/coll#Broadcast|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~`MPI_BCAST` broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of group using the same arguments for `comm, root`. On return, the contents of `root`’s communication buffer has been copied to all processes.~~

==If `comm` is an intracommunicator,==

==`MPI_BCAST` broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of==

==the==

==group using the same arguments for `comm`==

==and==

==`root`. On return, the==

==content of `root`’s buffer is copied to all other processes.==

==The “in place” option is not meaningful here.==

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is broadcast from the root to all processes in group B.==

==The buffer arguments of the processes in group B must be consistent with the buffer argument of the root.==

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

==If `comm` is an intracommunicator,==

==`MPI_BCAST` broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of==

==the==

==group using the same arguments for `comm`==

==and==

==`root`. On return, the==

==content of `root`’s buffer is copied to all other processes.==

==General, derived datatypes are allowed for `datatype`. The type signature of `count, datatype` on any process must be equal to the type signature of `count, datatype` at the root. This implies that the amount of data sent must be equal to the amount received, pairwise between each process and the root. `MPI_BCAST` and all other data-movement collective routines make this restriction. Distinct type maps between sender and receiver are still allowed.==

~~If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is broadcast from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.~~

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is broadcast from the root to all processes in group B.==

==The buffer arguments of the processes in group B must be consistent with the buffer argument of the root.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in `root`. Data is broadcast from the root to all processes in group B.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~If `comm` is an intracommunicator,~~

~~`MPI_BCAST` broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of~~

~~the~~

~~group using the same arguments for `comm`~~

~~and~~

~~`root`. On return, the~~

==If `comm` is an intracommunicator, `MPI_BCAST` broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of the group using the same arguments for `comm` and `root`. On return, the==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~If `comm` is an intracommunicator, `MPI_BCAST` broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of the group using the same arguments for `comm` and `root`. On return, the~~

~~content of `root`’s buffer is copied to all other processes.~~

~~General, derived datatypes are allowed for `datatype`. The type signature of `count, datatype` on any process must be equal to the type signature of `count, datatype` at the root. This implies that the amount of data sent must be equal to the amount received, pairwise between each process and the root. `MPI_BCAST` and all other data-movement collective routines make this restriction. Distinct type maps between sender and receiver are still allowed.~~

==If `comm` is an intracommunicator, [[versions/v31/API/MPI_BCAST|MPI_BCAST]] broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of the group using the same arguments for `comm` and `root`. On return, the content of `root`’s buffer is copied to all other processes.==

==General, derived datatypes are allowed for `datatype`. The type signature of `count, datatype` on any process must be equal to the type signature of `count, datatype` at the root. This implies that the amount of data sent must be equal to the amount received, pairwise between each process and the root. [[versions/v31/API/MPI_BCAST|MPI_BCAST]] and all other data-movement collective routines make this restriction. Distinct type maps between sender and receiver are still allowed.==

~~If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is broadcast from the root to all processes in group B.~~

~~The buffer arguments of the processes in group B must be consistent with the buffer argument of the root.~~

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is broadcast from the root to all processes in group B. The buffer arguments of the processes in group B must be consistent with the buffer argument of the root.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== [[versions/v40/API/MPI_BCAST|MPI_BCAST]] broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of the group using the same arguments for `comm` and `root`. On return, the content of `root`’s buffer is copied to all other processes.

General, derived datatypes are allowed for `datatype`. The type signature of ~~`count, datatype`~~ ==`count`, `datatype`== on any process must be equal to the type signature of ~~`count, datatype`~~ ==`count`, `datatype`== at the root. This implies that the amount of data sent must be equal to the amount received, pairwise between each process and the root. [[versions/v40/API/MPI_BCAST|MPI_BCAST]] and all other data-movement collective routines make this restriction. Distinct type maps between sender and receiver are still allowed.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the call involves all processes in the ~~intercommunicator,~~ ==inter-communicator,== but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is broadcast from the root to all processes in group B. The buffer arguments of the processes in group B must be consistent with the buffer argument of the root.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

If `comm` is an intra-communicator, [[versions/v41/API/MPI_BCAST|MPI_BCAST]] broadcasts a message from the ==MPI== process with rank `root` to all ==MPI== processes of the group, itself included. It is called by all members of the group using the same arguments for `comm` and `root`. On return, the content of ~~`root`’s~~ ==the root’s== buffer is copied to all other ==MPI== processes.

General, derived datatypes are allowed for `datatype`. The type signature of `count`, `datatype` on any ==MPI== process must be equal to the type signature of `count`, `datatype` at the root. This implies that the amount of data sent must be equal to the amount received, pairwise between each ==MPI== process and the root. [[versions/v41/API/MPI_BCAST|MPI_BCAST]] and all other data-movement collective routines make this restriction. Distinct type maps between sender and receiver are still allowed.

If `comm` is an inter-communicator, then the call involves all ==MPI== processes in the inter-communicator, but with one group (group A) defining the ~~root process.~~ ==root.== All ==MPI== processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other ==MPI== processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is broadcast from the root to all ==MPI== processes in group B. The buffer arguments of the ==MPI== processes in group B must be consistent with the buffer argument of the root.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Broadcast]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/collective#Broadcast]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Broadcast]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Broadcast]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Broadcast]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Broadcast]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Broadcast]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Broadcast]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Broadcast]]
