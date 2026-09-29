---
title: "Inter-Communicator Operations"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Inter-Communicator Operations

Chapter **context** · in [[versions/v13/sections/context#Inter-communicator Operations|MPI-1.3]], [[versions/v21/sections/context#Inter-communicator Operations|MPI-2.1]], [[versions/v22/sections/context#Inter-communicator Operations|MPI-2.2]], [[versions/v30/sections/context#Inter-communicator Operations|MPI-3.0]], [[versions/v31/sections/context#Inter-communicator Operations|MPI-3.1]], [[versions/v40/sections/context#Inter-Communicator Operations|MPI-4.0]], [[versions/v41/sections/context#Inter-Communicator Operations|MPI-4.1]], [[versions/v50/sections/context#Inter-Communicator Operations|MPI-5.0]]

Heading by release: MPI-1.3: “Inter-communicator Operations”; MPI-2.1: “Inter-communicator Operations”; MPI-2.2: “Inter-communicator Operations”; MPI-3.0: “Inter-communicator Operations”; MPI-3.1: “Inter-communicator Operations”; MPI-4.0: “Inter-Communicator Operations”; MPI-4.1: “Inter-Communicator Operations”; MPI-5.0: “Inter-Communicator Operations”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~This section introduces four blocking inter-communicator operations.~~

~~[[versions/v21/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] is used to bind two intra-communicators into an in­ter-com­mun­i­ca­tor; the function [[versions/v21/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] creates an intra-communicator by merging the local and remote groups of an inter-communicator. The functions \[3\] [[versions/v21/API/MPI_COMM_DUP|MPI_COMM_DUP]] and \[3\] [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] , introduced previously, duplicate and free an inter-communicator, respectively.~~

==This section introduces four blocking inter-communicator operations. [[versions/v21/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] is used to bind two intra-communicators into an in­ter-com­mun­i­ca­tor; the function [[versions/v21/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] creates an intra-communicator by merging the local and remote groups of an inter-communicator. The functions \[3\] [[versions/v21/API/MPI_COMM_DUP|MPI_COMM_DUP]] and \[3\] [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] , introduced previously, duplicate and free an inter-communicator, respectively.==

~~In standard MPI implementations (with static process allocation at initialization), the [[MPI_COMM_WORLD]] communicator (or preferably a dedicated duplicate thereof) can be this peer communicator. In dynamic MPI implementations, where, for example, a process may spawn new child processes during an MPI execution, the parent process may be the “bridge” between the old communication universe and the new communication world that includes the parent and its children.~~

~~The application topology functions described in chapter [[versions/v21/sections/topol#Process Topologies|Process Topologies]] do not apply to inter-communicators. Users that require this capability should utilize `MPI_INTERCOMM_MERGE` to build an intra-communicator, then apply the graph or cartesian topology capabilities to that intra-communicator, creating an appropriate topology-oriented intra-communicator. Alternatively, it may be reasonable to devise one’s own application topology mechanisms for this case, without loss of generality.~~

==In standard MPI implementations (with static process allocation at initialization), the MPI_COMM_WORLD communicator (or preferably a dedicated duplicate thereof) can be this peer communicator.==

==For applications that have used spawn or join, it may be necessary to first create an intracommunicator to be used as peer.==

==The application topology functions described in Chapter [[versions/v21/sections/topol#Process Topologies|Process Topologies]] do not apply to inter-communicators. Users that require this capability should utilize `MPI_INTERCOMM_MERGE` to build an intra-communicator, then apply the graph or cartesian topology capabilities to that intra-communicator, creating an appropriate topology-oriented intra-communicator. Alternatively, it may be reasonable to devise one’s own application topology mechanisms for this case, without loss of generality.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

In standard MPI implementations (with static process allocation at initialization), the ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== communicator (or preferably a dedicated duplicate thereof) can be this peer communicator.

> We recommend using a dedicated peer communicator, such as a duplicate of ~~MPI_COMM_WORLD,~~ ==`MPI_COMM_WORLD`,== to avoid trouble with peer communicators.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~The function [[versions/v30/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] can be used to create an inter-communicator from two existing intra-communicators, in the following situation: At least one selected member from each group (the “group leader”) has the ability to communicate with the selected member from the other group; that is, a “peer” communicator exists to which both leaders belong, and each leader knows the rank of the other leader in~~

~~this peer communicator. Furthermore, members of each group know the rank of their leader.~~

==The function [[versions/v30/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] can be used to create an inter-communicator from two existing intra-communicators, in the following situation: At least one selected member from each group (the “group leader”) has the ability to communicate with the selected member from the other group; that is, a “peer” communicator exists to which both leaders belong, and each leader knows the rank of the other leader in this peer communicator. Furthermore, members of each group know the rank of their leader.==

~~This call uses point-to-point communication with communicator `peer_comm`, and with tag `tag` between the leaders. Thus, care must be taken that there be no pending communication on `peer_comm` that could interfere with this communication.~~

~~> [!note] Advice to users~~

~~> We recommend using a dedicated peer communicator, such as a duplicate of `MPI_COMM_WORLD`, to avoid trouble with peer communicators.~~

> The implementation of `MPI_INTERCOMM_MERGE`, > > ~~`MPI_COMM_FREE`~~ ==`MPI_COMM_FREE`,== and `MPI_COMM_DUP` are similar to the implementation of `MPI_INTERCOMM_CREATE`, except that contexts private to the input in­ter-­com­mun­i­ca­tor are used for communication between group leaders rather than contexts inside a bridge communicator.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~In standard MPI implementations (with static process allocation at initialization), the `MPI_COMM_WORLD` communicator (or preferably a dedicated duplicate thereof) can be this peer communicator.~~

~~For applications that have used spawn or join, it may be necessary to first create an intracommunicator to be used as peer.~~

~~The application topology functions described in Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] do not apply to inter-communicators. Users that require this capability should utilize `MPI_INTERCOMM_MERGE` to build an intra-communicator, then apply the graph or cartesian topology capabilities to that intra-communicator, creating an appropriate topology-oriented intra-communicator. Alternatively, it may be reasonable to devise one’s own application topology mechanisms for this case, without loss of generality.~~

==In standard MPI implementations (with static process allocation at initialization), the `MPI_COMM_WORLD` communicator (or preferably a dedicated duplicate thereof) can be this peer communicator. For applications that have used spawn or join, it may be necessary to first create an intracommunicator to be used as peer.==

==The application topology functions described in Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] do not apply to inter-communicators. Users that require this capability should utilize [[versions/v31/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] to build an intra-communicator, then apply the graph or cartesian topology capabilities to that intra-communicator, creating an appropriate topology-oriented intra-communicator. Alternatively, it may be reasonable to devise one’s own application topology mechanisms for this case, without loss of generality.==

> The implementation of ~~`MPI_INTERCOMM_MERGE`, > > `MPI_COMM_FREE`,~~ ==[[versions/v31/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] , [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] ,== and ~~`MPI_COMM_DUP`~~ ==[[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]]== are similar to the implementation of ~~`MPI_INTERCOMM_CREATE`,~~ ==[[versions/v31/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] ,== except that contexts private to the input in­ter-­com­mun­i­ca­tor are used for communication between group leaders rather than contexts inside a bridge communicator.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

This section introduces ~~four~~ ==five== blocking inter-communicator operations. [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] is used to bind two intra-communicators into an ~~in­ter-com­mun­i­ca­tor;~~ ==inter-/communicator; the function [[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] constructs an inter-communicator from two previously defined disjoint groups;== the function [[versions/v40/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] creates an intra-communicator by merging the local and remote groups of an inter-communicator. The functions \[3\] [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] and \[3\] [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] , introduced previously, duplicate and free an inter-communicator, respectively.

Overlap of local and remote groups that are bound into an inter-communicator is prohibited. If there is overlap, then the program is erroneous and is likely to deadlock. ~~(If a process is multithreaded, and MPI calls block only a thread, rather than a process, then “dual membership” can be supported. It is then the user’s responsibility to make sure that calls on behalf of the two “roles” of a process are executed by two independent threads.)~~

~~In standard MPI implementations (with static process allocation at initialization),~~ ==When using the World Model (Section [[versions/v40/sections/dynamic#The World Model|The World Model]] ),== the `MPI_COMM_WORLD` communicator (or preferably a dedicated duplicate thereof) can be this peer communicator. For applications that ~~have used~~ ==use the Sessions Model, or the== spawn or ~~join,~~ ==join operations,== it may be necessary to first create an ~~intracommunicator~~ ==intra-communicator== to be used as ~~peer.~~ ==the peer communicator.==

~~This call creates an inter-communicator. It is collective over the union of the local and remote groups. Processes should provide identical `local_comm` and `local_leader` arguments within each group. Wildcards are not permitted for `remote_leader, local_leader`, and `tag`.~~

==This call creates an inter-communicator. It is collective over the union of the local and remote groups. MPI processes should provide identical `local_comm` and `local_leader` arguments within each group. Wildcards are not permitted for `remote_leader`, `local_leader`, and `tag`.==

==![[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS]]==

==This call creates an inter-communicator. Unlike [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] , this function uses as input previously defined, disjoint local and remote groups. The calling MPI process must be a member of the local group. The call is collective over the union of the local and remote groups. All involved MPI processes shall provide an identical value for the `stringtag` argument. Within each group, all MPI processes shall provide identical `local_group`, `local_leader` arguments. Wildcards are not permitted for the `remote_leader` or `local_leader` arguments. The `stringtag` argument serves the same purpose as the `stringtag` used in the [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] function; it differentiates concurrent calls in a multithreaded environment. The `stringtag` shall not exceed `MPI_MAX_STRINGTAG_LEN` characters in length. For C, this includes space for a null terminating character. `MPI_MAX_STRINGTAG_LEN` shall have a value of at least 63. In the event that `MPI_GROUP_EMPTY` is supplied as the `local_group` or `remote_group` or both, then the call is a local operation and `MPI_COMM_NULL` is returned as the `newintercomm`.==

This function creates an intra-communicator from the union of the two groups that are associated with `intercomm`. All processes should provide the same `high` value within each of the two groups. If processes in one group provided the value ~~`high =~~ ==`high``=== false` and processes in the other group provided the value ~~`high =~~ ==`high``=== true` then the union orders the “low” group before the “high” group. If all processes provided the same `high` argument then the order of the union is arbitrary. This call is blocking and collective within the union of the two groups.

The error handler on the new ~~intercommunicator~~ ==inter-communicator== in each process is inherited from the communicator that contributes the local group. Note that this can result in different processes in the same communicator having different error handlers.

> The implementation of [[versions/v40/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] , [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] , and [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] are similar to the implementation of [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] , except that contexts private to the input ~~in­ter-­com­mun­i­ca­tor~~ ==inter-/communicator== are used for communication between group leaders rather than contexts inside a bridge communicator.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

Construction of an inter-communicator from two intra-communicators requires separate collective operations in the local group and in the remote group, as well as a point-to-point communication between ~~a~~ ==an MPI== process in the local group and ~~a~~ ==an MPI== process in the remote group.

The application topology functions described in Chapter ~~[[versions/v41/sections/topol#Process Topologies|Process Topologies]]~~ ==[[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]]== do not apply to inter-communicators. Users that require this capability should utilize [[versions/v41/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] to build an intra-communicator, then apply the graph or cartesian topology capabilities to that intra-communicator, creating an appropriate topology-oriented intra-communicator. Alternatively, it may be reasonable to devise one’s own application topology mechanisms for this case, without loss of generality.

==The `errhandler` argument specifies an error handler to be attached to the new inter-communicator. Section [[versions/v41/sections/inquiry#Error Handling|Error Handling]] specifies the error handler to be invoked if an error is encountered during the invocation of [[versions/v41/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] .==

==The `info` argument provides hints and assertions, possibly MPI implementation dependent, which indicate desired characteristics and guide communicator creation.==

This function creates an intra-communicator from the union of the two groups that are associated with `intercomm`. All ==MPI== processes should provide the same `high` value within each of the two groups. If ==MPI== processes in one group provided the value `high``= false` and ==MPI== processes in the other group provided the value `high``= true` then the union orders the “low” group before the “high” group. If all ==MPI== processes provided the same `high` argument then the order of the union is arbitrary. This call is blocking and collective within the union of the two groups.

The error handler on the new inter-communicator in each ==MPI== process is inherited from the communicator that contributes the local group. Note that this can result in different ==MPI== processes in the same communicator having different error handlers.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Inter-communicator Operations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Inter-communicator Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Inter-communicator Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Inter-communicator Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Inter-communicator Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Inter-Communicator Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Inter-Communicator Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Inter-Communicator Operations]]
