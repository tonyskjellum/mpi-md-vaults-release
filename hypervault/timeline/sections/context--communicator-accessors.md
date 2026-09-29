---
title: "Communicator Accessors"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Communicator Accessors

Chapter **context** · in [[versions/v13/sections/context#Communicator Accessors|MPI-1.3]], [[versions/v21/sections/context#Communicator Accessors|MPI-2.1]], [[versions/v22/sections/context#Communicator Accessors|MPI-2.2]], [[versions/v30/sections/context#Communicator Accessors|MPI-3.0]], [[versions/v31/sections/context#Communicator Accessors|MPI-3.1]], [[versions/v40/sections/context#Communicator Accessors|MPI-4.0]], [[versions/v41/sections/context#Communicator Accessors|MPI-4.1]], [[versions/v50/sections/context#Communicator Accessors|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

> This function indicates the number of processes involved in a communicator. For ~~MPI_COMM_WORLD,~~ ==`MPI_COMM_WORLD`,== it indicates the total number of processes available (for this version of MPI, there is no standard way to change the number of processes once initialization has taken place). > > This call is often used with the next call to determine the amount of concurrency available for a specific library or program. The following call, [[versions/v22/API/MPI_COMM_RANK|MPI_COMM_RANK]] indicates the rank of the process that calls it in the range from $`0...`$`size`$`-1`$, where `size` is the return value of [[versions/v22/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] .

~~MPI_IDENT~~ ==`MPI_IDENT`== results if and only if `comm1` and `comm2` are handles for the same object (identical groups and same contexts). ~~MPI_CONGRUENT~~ ==`MPI_CONGRUENT`== results if the underlying groups are identical in constituents and rank order; these communicators differ only by context. ~~MPI_SIMILAR~~ ==`MPI_SIMILAR`== results if the group members of both communicators are the same but the rank order differs. ~~MPI_UNEQUAL~~ ==`MPI_UNEQUAL`== results otherwise.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

> This function is equivalent to accessing the communicator’s group with [[versions/v30/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] (see above), computing the size using [[versions/v30/API/MPI_GROUP_SIZE|MPI_GROUP_SIZE]] , and then freeing the temporary group via [[versions/v30/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] . However, this function is so commonly ~~used,~~ ==used== that this shortcut was introduced.

> This function indicates the number of processes involved in a communicator. For `MPI_COMM_WORLD`, it indicates the total number of processes available ~~(for this version of MPI, there is no standard way to change~~ ==unless== the number of processes ~~once initialization~~ has ~~taken place).~~ ==been changed by using the functions described in Chapter [[versions/v30/sections/dynamic#Process Creation and Management|Process Creation and Management]] ; note that the number of processes in `MPI_COMM_WORLD` does not change during the life of an MPI program.== > > This call is often used with the next call to determine the amount of concurrency available for a specific library or program. The following call, [[versions/v30/API/MPI_COMM_RANK|MPI_COMM_RANK]] indicates the rank of the process that calls it in the range from $`0...`$`size`$`-1`$, where `size` is the return value of [[versions/v30/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] .

> This function is equivalent to accessing the communicator’s group with [[versions/v30/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] (see above), computing the rank using [[versions/v30/API/MPI_GROUP_RANK|MPI_GROUP_RANK]] , and then freeing the temporary group via [[versions/v30/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] . However, this function is so commonly ~~used,~~ ==used== that this shortcut was introduced.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

> This function indicates the number of processes involved in a communicator. For `MPI_COMM_WORLD`, it indicates the total number of processes available unless the number of processes has been changed by using the functions described in Chapter [[versions/v40/sections/dynamic#Process ~~Creation~~ ==Initialization, Creation,== and Management|Process ~~Creation~~ ==Initialization, Creation,== and Management]] ; note that the number of processes in `MPI_COMM_WORLD` does not change during the life of an MPI program. > > This call is often used with the next call to determine the amount of concurrency available for a specific library or program. The following call, [[versions/v40/API/MPI_COMM_RANK|MPI_COMM_RANK]] indicates the rank of the process that calls it in the range from ~~$`0...`$`size`$`-1`$,~~ ==$`0,...`$, `size`$`-1`$,== where `size` is the return value of [[versions/v40/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] .

> This function gives the rank of the process in the particular communicator’s group. It is useful, as noted above, in conjunction with [[versions/v40/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] . > > Many programs will be written with the ~~master-slave~~ ==supervisor/executor or manager/worker== model, where one process (such as the rank-zero process) will play a supervisory role, and the other processes will serve as compute nodes. In this framework, the two preceding calls are useful for determining the roles of the various processes of a communicator.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

> This function is equivalent to accessing the communicator’s group with [[versions/v41/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] (see above), computing the size using [[versions/v41/API/MPI_GROUP_SIZE|MPI_GROUP_SIZE]] , and then freeing the temporary group via [[versions/v41/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] . However, this ~~function~~ ==functionality== is so commonly used that this shortcut was introduced.

> This function indicates the number of ==MPI== processes involved in a communicator. For `MPI_COMM_WORLD`, it indicates the total number of ==MPI== processes available unless the number of ==MPI== processes has been changed by using the functions described in Chapter [[versions/v41/sections/dynamic#Process Initialization, Creation, and Management|Process Initialization, Creation, and Management]] ; note that the number of ==MPI== processes in `MPI_COMM_WORLD` does not change during the life of an MPI program. > > This call is often used with the next call to determine the amount of concurrency available for a specific library or program. The following call, [[versions/v41/API/MPI_COMM_RANK|MPI_COMM_RANK]] indicates the rank of the ==MPI== process that calls it in the range from $`0,...`$, `size`$`-1`$, where `size` is the return value of [[versions/v41/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] .

> This function is equivalent to accessing the communicator’s group with [[versions/v41/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] (see above), computing the rank using [[versions/v41/API/MPI_GROUP_RANK|MPI_GROUP_RANK]] , and then freeing the temporary group via [[versions/v41/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] . However, this ~~function~~ ==functionality== is so commonly used that this shortcut was introduced.

> This function gives the rank of the ==MPI== process in the particular communicator’s group. It is useful, as noted above, in conjunction with [[versions/v41/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] . > > Many programs will ~~be written with~~ ==follow== the supervisor/executor or manager/worker model, where one ==MPI== process ~~(such as the rank-zero process)~~ will play a supervisory ~~role, and~~ ==role while== the other ==MPI== processes will ~~serve as compute nodes.~~ ==play an executory role.== In this framework, the two preceding calls are useful for determining the roles of the various ==MPI== processes of a communicator.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Communicator Accessors]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Communicator Accessors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Communicator Accessors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Communicator Accessors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Communicator Accessors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Communicator Accessors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Communicator Accessors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Communicator Accessors]]
