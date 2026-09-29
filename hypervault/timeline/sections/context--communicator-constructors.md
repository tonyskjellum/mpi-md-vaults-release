---
title: "Communicator Constructors"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Communicator Constructors

Chapter **context** · in [[versions/v13/sections/context#Communicator Constructors|MPI-1.3]], [[versions/v21/sections/context#Communicator Constructors|MPI-2.1]], [[versions/v22/sections/context#Communicator Constructors|MPI-2.2]], [[versions/v30/sections/context#Communicator Constructors|MPI-3.0]], [[versions/v31/sections/context#Communicator Constructors|MPI-3.1]], [[versions/v40/sections/context#Communicator Constructors|MPI-4.0]], [[versions/v41/sections/context#Communicator Constructors|MPI-4.1]], [[versions/v50/sections/context#Communicator Constructors|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (9 changed paragraphs)

~~The following are collective functions that are invoked by all processes in the group associated with `comm`.~~

==The following are collective functions that are invoked by all processes in the==

==group or groups associated with `comm`.==

==The MPI interface provides four communicator construction routines that apply to both intracommunicators and intercommunicators. The construction routine [[versions/v21/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] (discussed later) applies only to intercommunicators.==

==An intracommunicator involves a single group while an intercommunicator involves two groups. Where the following discussions address intercommunicator semantics, the two groups in an intercommunicator are==

==called the *left* and *right* groups. A process in an intercommunicator is a member of either the left or the right group. From the point of view of that process, the group that the process is a member of is called the *local* group; the other group (relative to that process) is the *remote* group. The left and right group labels give us a way to describe the two groups in an intercommunicator that is not relative to any particular process (as the local and remote groups are).==

~~`MPI_COMM_DUP` Duplicates the existing communicator `comm` with associated key values. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. Returns in `newcomm` a new communicator with the same group, any copied cached information, but a new context (see section [[versions/v21/sections/context#Functionality|Functionality]] ).~~

==`MPI_COMM_DUP` Duplicates the existing communicator `comm` with associated key values. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. Returns in `newcomm` a new==

==communicator with the same group or groups, any copied cached information,==

==but a new context (see Section [[versions/v21/sections/context#Functionality|Functionality]] ).==

==Please see Section [[c++comm-class]] on page [[c++comm-class]] for further discussion about the C++ bindings for `Dup()` and `Clone()`.==

> This operation is used to provide a parallel library call with a duplicate communication space that has the same properties as the original communicator. This includes any attributes (see below), and topologies (see ~~chapter~~ ==Chapter== [[versions/v21/sections/topol#Process Topologies|Process Topologies]] ). This call is valid even if there are pending point-to-point communications involving the communicator `comm`. A typical call might involve a `MPI_COMM_DUP` at the beginning of the parallel call, and an `MPI_COMM_FREE` of that duplicated communicator at the end of the call. Other models of communicator management are also possible. > > This call applies to both intra- and inter-communicators.

~~This~~ ==If `comm` is an intra-communicator, this== function creates a new communicator `newcomm` with communication group defined by `group` and a new context. No cached information propagates from `comm` to `newcomm`. The function returns MPI_COMM_NULL to processes that are not in `group`. The call is erroneous if not all `group` arguments have the same value, or if `group` is not a subset of the group associated with `comm`. Note that the call is to be executed by all processes in `comm`, even if they do not belong to the new group. ~~This call applies only to intra-communicators.~~

==If `comm` is an intercommunicator, then the output communicator is also an intercommunicator where the local group consists only of those processes contained in `group` (see Figure [[versions/v21/sections/context#Communicator Constructors|Communicator Constructors]] ). The `group` argument should only contain those processes in the local group of the input intercommunicator that are to be a part of `newcomm`. If either `group` does not specify at least one process in the local group of the intercommunicator, or if the calling process is not included in the `group`, MPI_COMM_NULL is returned.==

==> [!tip] Rationale==

==> In the case where either the left or right group is empty, a null communicator is returned instead of an intercommunicator with MPI_GROUP_EMPTY because the side with the empty group must return MPI_COMM_NULL.==

==*Figure: MPI_COMM_CREATE*==

==The following example illustrates how the first node in the left side of an intercommunicator could be joined with all members on the right side of an intercommunicator to form a new intercommunicator.==

==            MPI_Comm  inter_comm, new_inter_comm;             MPI_Group local_group, group;             int       rank = 0; /* rank on left side to include in                                     new inter-comm */==

==            /* Construct the original intercommunicator: "inter_comm" */             ...==

==            /* Construct the group of processes to be in new                 intercommunicator */             if (/* I'm on the left side of the intercommunicator */) {               MPI_Comm_group ( inter_comm, &local_group );               MPI_Group_incl ( local_group, 1, &rank, &group );               MPI_Group_free ( &local_group );             }             else                MPI_Comm_group ( inter_comm, &group );==

==            MPI_Comm_create ( inter_comm, group, &new_inter_comm );             MPI_Group_free( &group );==

a call to `MPI_COMM_SPLIT(comm, color, key, newcomm)`, where all members of `group` provide `color`$`= 0`$ and `key`$`=`$ rank in `group`, and all processes that are not members of `group` provide `color`$`=`$ `MPI_UNDEFINED`. The function `MPI_COMM_SPLIT` allows more general partitioning of a group into one or more subgroups with optional reordering. ~~This call applies only intra-communicators.~~

> This is an extremely powerful mechanism for dividing a single communicating group of processes into $`k`$ subgroups, with $`k`$ chosen implicitly by the user (by the number of colors asserted over all the processes). Each resulting communicator will be non-overlapping. Such a division could be useful for defining a hierarchy of computations, such as for multigrid, or linear algebra. > > Multiple calls to `MPI_COMM_SPLIT` can be used to overcome the requirement that any call have no overlap of the resulting communicators (each process is of only one color per call). In this way, multiple overlapping communication structures can be created. Creative use of the `color` and `key` in such splitting operations is encouraged. > > Note that, for a fixed color, the keys need not be unique. It is `MPI_COMM_SPLIT`’s responsibility to sort processes in ascending order according to this key, and to break ties in a consistent way. If all the keys are specified in the same way, then all the processes in a given color will have the relative rank order as they did in their ==> >== parent group. ~~(In general, they will have different ranks.)~~ > > Essentially, making the key value zero for all processes of a given color means that one doesn’t really care about the rank-order of the processes in the new communicator.

==The result of [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] on an intercommunicator is that those processes on the left with the same `color` as those processes on the right combine to create a new intercommunicator. The `key` argument describes the relative rank of processes on each side of the intercommunicator (see Figure [[versions/v21/sections/context#Communicator Constructors|Communicator Constructors]] ). For those colors that are specified only on one side of the intercommunicator, MPI_COMM_NULL is returned. MPI_COMM_NULL is also returned to those processes that specify MPI_UNDEFINED as the color.==

==*Figure: MPI_COMM_SPLIT*==

==(Parallel client-server model). The following client code illustrates how clients on the left side of an intercommunicator could be assigned to a single server from a pool of servers on the right side of an intercommunicator.==

==            /* Client code */             MPI_Comm  multiple_server_comm;             MPI_Comm  single_server_comm;             int       color, rank, num_servers;==

==            /* Create intercommunicator with clients and servers:                 multiple_server_comm */             ...==

==            /* Find out the number of servers available */             MPI_Comm_remote_size ( multiple_server_comm, &num_servers );==

==            /* Determine my color */             MPI_Comm_rank ( multiple_server_comm, &rank );             color = rank % num_servers;==

==            /* Split the intercommunicator */             MPI_Comm_split ( multiple_server_comm, color, rank,                               &single_server_comm );==

==The following is the corresponding server code:==

==            /* Server code */             MPI_Comm  multiple_client_comm;             MPI_Comm  single_server_comm;             int       rank;==

==            /* Create intercommunicator with clients and servers:                 multiple_client_comm */             ...==

==            /* Split the intercommunicator for a single server per group                of clients */             MPI_Comm_rank ( multiple_client_comm, &rank );             MPI_Comm_split ( multiple_client_comm, rank, 0,                               &single_server_comm );==

### MPI-2.1 → MPI-2.2  (7 changed paragraphs)

> Note that there is a chicken-and-egg aspect to MPI in that a communicator is needed to create a new communicator. The base communicator for all MPI communicators is predefined outside of MPI, and is ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== This model was arrived at after considerable debate, and was chosen to increase “safety” of programs written in MPI.

~~If `comm` is an intra-communicator, this function creates a new communicator `newcomm` with communication group defined by `group` and a new context. No cached information propagates from `comm` to `newcomm`. The function returns MPI_COMM_NULL to processes that are not in `group`. The call is erroneous if not all `group` arguments have the same value, or if `group` is not a subset of the group associated with `comm`. Note that the call is to be executed by all processes in `comm`, even if they do not belong to the new group.~~

==If `comm` is an intracommunicator, this function returns a new communicator `newcomm` with communication group defined by the `group` argument. No cached information propagates from `comm` to `newcomm`. Each process must call with a `group` argument that is a subgroup of the `group` associated with `comm`; this could be `MPI_GROUP_EMPTY`. The processes may specify different values for the `group` argument. If a process calls with a non-empty `group` then all processes in that `group` must call the function with the same `group` as argument, that is the same processes in the same order. Otherwise the call is erroneous. This implies that the set of groups specified across the processes must be disjoint. If the calling process is a member of the group given as `group` argument, then `newcomm` is a communicator with `group` as its associated group. In the case that a process calls with a `group` to which it does not belong, e.g., `MPI_GROUP_EMPTY`, then `MPI_COMM_NULL` is returned as `newcomm`. The function is collective and must be called by all processes in the group of `comm`.==

==> [!tip] Rationale==

==> The interface supports the original mechanism from MPI-1.1, which required the same `group` in all processes of `comm`. It was extended in MPI-2.2 to allow the use of disjoint subgroups in order to allow implementations to eliminate unnecessary communication that [[versions/v22/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] would incur when the user already knows the membership of the disjoint subgroups.==

~~> Since all processes calling [[versions/v22/API/MPI_COMM_DUP|MPI_COMM_DUP]] or > > [[versions/v22/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] provide the same `group` argument, it is theoretically possible to agree on a group-wide unique context with no communication. However, local execution of these functions requires use of a larger context name space and reduces error checking. Implementations may strike various compromises between these conflicting goals, such as bulk allocation of multiple contexts in one collective operation. > > Important: If new communicators are created without synchronizing the processes involved then the communication system should be able to cope with messages arriving in a context that has not yet been allocated at the receiving process.~~

~~If `comm` is an intercommunicator, then the output communicator is also an intercommunicator where the local group consists only of those processes contained in `group` (see Figure [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] ). The `group` argument should only contain those processes in the local group of the input intercommunicator that are to be a part of `newcomm`. If either `group` does not specify at least one process in the local group of the intercommunicator, or if the calling process is not included in the `group`, MPI_COMM_NULL is returned.~~

==> When calling [[versions/v22/API/MPI_COMM_DUP|MPI_COMM_DUP]] , all processes call with the same `group` (the `group` associated with the communicator). When calling [[versions/v22/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , the processes provide the same `group` or disjoint subgroups. For both calls, it is theoretically possible to agree on a group-wide unique context with no communication. > > However, local execution of these functions requires use of a larger context name space and reduces error checking. Implementations may strike various compromises between these conflicting goals, such as bulk allocation of multiple contexts in one collective operation. > > Important: If new communicators are created without synchronizing the processes involved then the communication system should be able to cope with messages arriving in a context that has not yet been allocated at the receiving process.==

==If `comm` is an intercommunicator, then the output communicator is also an intercommunicator where the local group consists only of those processes contained in `group` (see Figure [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] ). The `group` argument should only contain those processes in the local group of the input intercommunicator that are to be a part of `newcomm`.==

==All processes in the same local group of `comm` must specify the same value for `group`, i.e., the same members in the same order.==

==If either `group` does not specify at least one process in the local group of the intercommunicator, or if the calling process is not included in the `group`, `MPI_COMM_NULL` is returned.==

> In the case where either the left or right group is empty, a null communicator is returned instead of an intercommunicator with ~~MPI_GROUP_EMPTY~~ ==`MPI_GROUP_EMPTY`== because the side with the empty group must return ~~MPI_COMM_NULL.~~ ==`MPI_COMM_NULL`.==

~~This function partitions the group associated with `comm` into disjoint subgroups, one for each value of `color`. Each subgroup contains all processes of the same color. Within each subgroup, the processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. A process may supply the color value `MPI_UNDEFINED`, in which case `newcomm` returns MPI_COMM_NULL. This is a collective call, but each process is permitted to provide different values for `color` and `key`.~~

~~A call to `MPI_COMM_CREATE(comm, group, newcomm)` is equivalent to~~

~~a call to `MPI_COMM_SPLIT(comm, color, key, newcomm)`, where all members of `group` provide `color`$`= 0`$ and `key`$`=`$ rank in `group`, and all processes that are not members of `group` provide `color`$`=`$ `MPI_UNDEFINED`. The function `MPI_COMM_SPLIT` allows more general partitioning of a group into one or more subgroups with optional reordering.~~

~~The value of `color` must be nonnegative.~~

==This function partitions the group associated with `comm` into disjoint subgroups, one for each value of `color`. Each subgroup contains all processes of the same color. Within each subgroup, the processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. A process may supply the color value `MPI_UNDEFINED`, in which case `newcomm` returns `MPI_COMM_NULL`. This is a collective call, but each process is permitted to provide different values for `color` and `key`.==

==With an intracommunicator `comm`, a call to [[versions/v22/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is equivalent to a call to [[versions/v22/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , where processes that are members of their `group` argument provide `color`$`=`$number of the `group` (based on a unique numbering of all disjoint groups) and `key`$`=`$rank in `group`, and all processes that are not members of their `group` argument provide `color`$`=`$`MPI_UNDEFINED`.==

==The value of `color` must be non-negative.==

> This is an extremely powerful mechanism for dividing a single communicating group of processes into $`k`$ subgroups, with $`k`$ chosen implicitly by the user (by the number of colors asserted over all the processes). Each resulting communicator will be non-overlapping. Such a division could be useful for defining a hierarchy of computations, such as for multigrid, or linear algebra. ==> > For intracommunicators, `MPI_COMM_SPLIT` provides similar capability as `MPI_COMM_CREATE` to split a communicating group into disjoint subgroups. `MPI_COMM_SPLIT` is useful when some processes do not have complete information of the other members in their group, but all processes know (the color of) the group to which they belong. In this case, the MPI implementation discovers the other group members via communication. `MPI_COMM_CREATE` is useful when all processes have complete information of the members of their group. In this case, MPI can avoid the extra communication required to discover group membership.== > > Multiple calls to `MPI_COMM_SPLIT` can be used to overcome the requirement that any call have no overlap of the resulting communicators (each process is of only one color per call). In this way, multiple overlapping communication structures can be created. Creative use of the `color` and `key` in such splitting operations is encouraged. > > Note that, for a fixed color, the keys need not be unique. It is `MPI_COMM_SPLIT`’s responsibility to sort processes in ascending order according to this key, and to break ties in a consistent way. If all the keys are specified in the same way, then all the processes in a given color will have the relative rank order as they did in their > > parent group. > > Essentially, making the key value zero for all processes of a given color means that one doesn’t really care about the rank-order of the processes in the new communicator.

~~> `color` is restricted to be nonnegative, so as not to confict with the value assigned to MPI_UNDEFINED.~~

~~The result of [[versions/v22/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] on an intercommunicator is that those processes on the left with the same `color` as those processes on the right combine to create a new intercommunicator. The `key` argument describes the relative rank of processes on each side of the intercommunicator (see Figure [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] ). For those colors that are specified only on one side of the intercommunicator, MPI_COMM_NULL is returned. MPI_COMM_NULL is also returned to those processes that specify MPI_UNDEFINED as the color.~~

==> `color` is restricted to be non-negative, so as not to confict with the value assigned to `MPI_UNDEFINED`.==

==The result of `MPI_COMM_SPLIT` on an intercommunicator is that those processes on the left with the same `color` as those processes on the right combine to create a new intercommunicator. The `key` argument describes the relative rank of processes on each side of the intercommunicator (see Figure [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] ). For those colors that are specified only on one side of the intercommunicator, `MPI_COMM_NULL` is returned. `MPI_COMM_NULL` is also returned to those processes that specify `MPI_UNDEFINED` as the color.==

==> [!note] Advice to users==

==> For intercommunicators, [[versions/v22/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] is more general than `MPI_COMM_CREATE`. A single call to `MPI_COMM_SPLIT` can create a set of disjoint intercommunicators, while a call to `MPI_COMM_CREATE` creates only one.==

### MPI-2.2 → MPI-3.0  (13 changed paragraphs)

group or groups associated with ~~`comm`.~~ ==`comm`, with the exception of [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , which is invoked only by the processes in the group of the new communicator being constructed.==

~~The MPI interface provides four communicator construction routines that apply to both intracommunicators and intercommunicators. The construction routine [[versions/v30/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] (discussed later) applies only to intercommunicators.~~

~~An intracommunicator involves a single group while an intercommunicator involves two groups. Where the following discussions address intercommunicator semantics, the two groups in an intercommunicator are~~

~~called the *left* and *right* groups. A process in an intercommunicator is a member of either the left or the right group. From the point of view of that process, the group that the process is a member of is called the *local* group; the other group (relative to that process) is the *remote* group. The left and right group labels give us a way to describe the two groups in an intercommunicator that is not relative to any particular process (as the local and remote groups are).~~

==This chapter presents the following communicator construction routines: [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v30/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , and [[versions/v30/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] can be used to create both intracommunicators and intercommunicators; [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] and [[versions/v30/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] (see Section [[versions/v30/sections/context#Inter-communicator Operations|Inter-communicator Operations]] ) can be used to create intracommunicators; and [[versions/v30/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] (see Section [[versions/v30/sections/context#Inter-communicator Operations|Inter-communicator Operations]] ) can be used to create intercommunicators.==

==An intracommunicator involves a single group while an intercommunicator involves two groups. Where the following discussions address intercommunicator semantics, the two groups in an intercommunicator are called the *left* and *right* groups. A process in an intercommunicator is a member of either the left or the right group. From the point of view of that process, the group that the process is a member of is called the *local* group; the other group (relative to that process) is the *remote* group. The left and right group labels give us a way to describe the two groups in an intercommunicator that is not relative to any particular process (as the local and remote groups are).==

~~`MPI_COMM_DUP` Duplicates the existing communicator `comm` with associated key values. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. Returns in `newcomm` a new~~

~~communicator with the same group or groups, any copied cached information,~~

~~but a new context (see Section [[versions/v30/sections/context#Functionality|Functionality]] ).~~

~~Please see Section [[c++comm-class]] on page [[c++comm-class]] for further discussion about the C++ bindings for `Dup()` and `Clone()`.~~

==`MPI_COMM_DUP` duplicates the existing communicator `comm` with associated key values, topology information, and info hints. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. Returns in `newcomm` a new==

==communicator with the same group or groups, same topology, same info hints, any copied cached information, but a new context (see Section [[versions/v30/sections/context#Functionality|Functionality]] ).==

> This operation is used to provide a parallel library ~~call~~ with a duplicate communication space that has the same properties as the original communicator. This includes any attributes (see below), ~~and~~ topologies (see Chapter [[versions/v30/sections/topol#Process Topologies|Process Topologies]] ==), and associated info hints (see Section [[versions/v30/sections/context#Communicator Info|Communicator Info]]== ). This call is valid even if there are pending point-to-point communications involving the communicator `comm`. A typical call might involve a `MPI_COMM_DUP` at the beginning of the parallel call, and an `MPI_COMM_FREE` of that duplicated communicator at the end of the call. Other models of communicator management are also possible. > > This call applies to both intra- and inter-communicators.

==![[versions/v30/API/MPI_COMM_DUP_WITH_INFO]]==

==[[versions/v30/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] behaves exactly as [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] except that the info hints associated with the communicator `comm` are not duplicated in `newcomm`. The hints provided by the argument `info` are associated with the output communicator `newcomm` instead.==

==> [!tip] Rationale==

==> It is expected that some hints will only be valid at communicator creation time. However, for legacy reasons, most communicator creation calls do not provide an info argument. One may associate info hints with a duplicate of any communicator at creation time through a call to [[versions/v30/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] .==

==![[versions/v30/API/MPI_COMM_IDUP]]==

==`MPI_COMM_IDUP` is a nonblocking variant of `MPI_COMM_DUP`. The semantics of `MPI_COMM_IDUP` are as if `MPI_COMM_DUP` was executed at the time that `MPI_COMM_IDUP` is called. For example, attributes changed after `MPI_COMM_IDUP` will not be copied to the new communicator. All restrictions and assumptions for nonblocking collective operations (see Section [[versions/v30/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ) apply to `MPI_COMM_IDUP` and the returned request.==

==It is erroneous to use the communicator `newcomm` as an input argument to other MPI functions before the [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] operation completes.==

==> [!tip] Rationale==

==> This functionality is crucial for the development of purely nonblocking libraries (see ).==

If `comm` is an intracommunicator, this function returns a new communicator `newcomm` with communication group defined by the `group` argument. No cached information propagates from `comm` to `newcomm`. Each process must call ==[[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]]== with a `group` argument that is a subgroup of the `group` associated with `comm`; this could be `MPI_GROUP_EMPTY`. The processes may specify different values for the `group` argument. If a process calls with a non-empty `group` then all processes in that `group` must call the function with the same `group` as argument, that is the same processes in the same order. ~~Otherwise~~ ==Otherwise,== the call is erroneous. This implies that the set of groups specified across the processes must be disjoint. If the calling process is a member of the group given as `group` argument, then `newcomm` is a communicator with `group` as its associated group. In the case that a process calls with a `group` to which it does not belong, e.g., `MPI_GROUP_EMPTY`, then `MPI_COMM_NULL` is returned as `newcomm`. The function is collective and must be called by all processes in the group of `comm`.

> The requirement that the entire group of `comm` participate in the call stems from the following considerations: > > - It allows the implementation to layer [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] on top of regular collective communications. > > - It provides additional safety, in particular in the case where partially overlapping groups are used to create new communicators. > > - It permits implementations ==to== sometimes ~~to~~ avoid communication related to context creation.

> `MPI_COMM_CREATE` provides a means to subset a group of processes for the purpose of separate MIMD computation, with separate communication space. `newcomm`, which emerges from ~~`MPI_COMM_CREATE`~~ ==`MPI_COMM_CREATE`,== can be used in subsequent calls to `MPI_COMM_CREATE` (or other communicator constructors) ==to== further ~~to~~ subdivide a computation into parallel sub-computations. A more general service is provided by `MPI_COMM_SPLIT`, below.

~~> When calling [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] , all processes call with the same `group` (the `group` associated with the communicator). When calling [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , the processes provide the same `group` or disjoint subgroups. For both calls, it is theoretically possible to agree on a group-wide unique context with no communication. > > However, local execution of these functions requires use of a larger context name space and reduces error checking. Implementations may strike various compromises between these conflicting goals, such as bulk allocation of multiple contexts in one collective operation. > > Important: If new communicators are created without synchronizing the processes involved then the communication system should be able to cope with messages arriving in a context that has not yet been allocated at the receiving process.~~

~~If `comm` is an intercommunicator, then the output communicator is also an intercommunicator where the local group consists only of those processes contained in `group` (see Figure [[versions/v30/sections/context#Communicator Constructors|Communicator Constructors]] ). The `group` argument should only contain those processes in the local group of the input intercommunicator that are to be a part of `newcomm`.~~

~~All processes in the same local group of `comm` must specify the same value for `group`, i.e., the same members in the same order.~~

~~If either `group` does not specify at least one process in the local group of the intercommunicator, or if the calling process is not included in the `group`, `MPI_COMM_NULL` is returned.~~

==> When calling [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] , all processes call with the same `group` (the `group` associated with the communicator). When calling [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , the processes provide the same `group` or disjoint subgroups. For both calls, it is theoretically possible to agree on a group-wide unique context with no communication. However, local execution of these functions requires use of a larger context name space and reduces error checking. Implementations may strike various compromises between these conflicting goals, such as bulk allocation of multiple contexts in one collective operation. > > Important: If new communicators are created without synchronizing the processes involved then the communication system must be able to cope with messages arriving in a context that has not yet been allocated at the receiving process.==

==If `comm` is an intercommunicator, then the output communicator is also an intercommunicator where the local group consists only of those processes contained in `group` (see Figure [[versions/v30/sections/context#Communicator Constructors|Communicator Constructors]] ). The `group` argument should only contain those processes in the local group of the input intercommunicator that are to be a part of `newcomm`. All processes in the same local group of `comm` must specify the same value for `group`, i.e., the same members in the same order. If either `group` does not specify at least one process in the local group of the intercommunicator, or if the calling process is not included in the `group`, `MPI_COMM_NULL` is returned.==

==![[versions/v30/API/MPI_COMM_CREATE_GROUP]]==

==[[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is similar to [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] ; however, [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] must be called by all processes in the group of `comm`, whereas [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] must be called by all processes in `group`, which is a subgroup of the group of `comm`. In addition, [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] requires that `comm` is an intracommunicator. [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] returns a new intracommunicator, `newcomm`, for which the `group` argument defines the communication group. No cached information propagates from `comm` to `newcomm`. Each process must provide a group argument that is a subgroup of the group associated with `comm`; this could be `MPI_GROUP_EMPTY`. If a non-empty group is specified, then all processes in that group must call the function, and each of these processes must provide the same arguments, including a group that contains the same members with the same ordering. Otherwise the call is erroneous. If the calling process is a member of the group given as the `group` argument, then `newcomm` is a communicator with `group` as its associated group. If the calling process is not a member of `group`, e.g., `group` is `MPI_GROUP_EMPTY`, then the call is a local operation and `MPI_COMM_NULL` is returned as `newcomm`.==

==> [!tip] Rationale==

==> Functionality similar to [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] can be implemented through repeated [[versions/v30/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] and [[versions/v30/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] calls that start with the `MPI_COMM_SELF` communicators at each process in `group` and build up an intracommunicator with group `group` . Such an algorithm requires the creation of many intermediate communicators; [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] can provide a more efficient implementation that avoids this overhead.==

==> [!note] Advice to users==

==> An intercommunicator can be created collectively over processes in the union of the local and remote groups by creating the local communicator using [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] and using that communicator as the local communicator argument to [[versions/v30/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] .==

==The `tag` argument does not conflict with tags used in point-to-point communication and is not permitted to be a wildcard. If multiple threads at a given process perform concurrent [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] operations, the user must distinguish these operations by providing different `tag` or `comm` arguments.==

==> [!note] Advice to users==

==> [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] may provide lower overhead than [[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] because it can take advantage of collective communication on `comm` when constructing `newcomm`.==

The value of `color` must be ~~non-negative.~~ ==non-negative or `MPI_UNDEFINED`.==

> This is an extremely powerful mechanism for dividing a single communicating group of processes into $`k`$ subgroups, with $`k`$ chosen implicitly by the user (by the number of colors asserted over all the processes). Each resulting communicator will be non-overlapping. Such a division could be useful for defining a hierarchy of computations, such as for multigrid, or linear algebra. ~~> >~~ For intracommunicators, `MPI_COMM_SPLIT` provides similar capability as `MPI_COMM_CREATE` to split a communicating group into disjoint subgroups. `MPI_COMM_SPLIT` is useful when some processes do not have complete information of the other members in their group, but all processes know (the color of) the group to which they belong. In this case, the MPI implementation discovers the other group members via communication. `MPI_COMM_CREATE` is useful when all processes have complete information of the members of their group. In this case, MPI can avoid the extra communication required to discover group membership. ==[[versions/v30/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is useful when all processes in a given group have complete information of the members of their group and synchronization with processes outside the group can be avoided.== > > Multiple calls to `MPI_COMM_SPLIT` can be used to overcome the requirement that any call have no overlap of the resulting communicators (each process is of only one color per call). In this way, multiple overlapping communication structures can be created. Creative use of the `color` and `key` in such splitting operations is encouraged. > > Note that, for a fixed color, the keys need not be unique. It is `MPI_COMM_SPLIT`’s responsibility to sort processes in ascending order according to this key, and to break ties in a consistent way. If all the keys are specified in the same way, then all the processes in a given color will have the relative rank order as they did in their ~~> >~~ parent group. > > Essentially, making the key value zero for all processes of a given color means that one ~~doesn’t~~ ==does not== really care about the rank-order of the processes in the new communicator.

~~            /* Split the intercommunicator for a single server per group                of clients */             MPI_Comm_rank ( multiple_client_comm, &rank );             MPI_Comm_split ( multiple_client_comm, rank, 0,                               &single_server_comm );~~

==            /* Split the intercommunicator for a single server per group                of clients */             MPI_Comm_rank ( multiple_client_comm, &rank );             MPI_Comm_split ( multiple_client_comm, rank, 0,                               &single_server_comm );  ==

==![[versions/v30/API/MPI_COMM_SPLIT_TYPE]]==

==This function partitions the group associated with `comm` into disjoint subgroups, based on the type specified by `split_type`. Each subgroup contains all processes of the same type. Within each subgroup, the processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. This is a collective call; all processes must provide the same `split_type`, but each process is permitted to provide different values for `key`. An exception to this rule is that a process may supply the type value `MPI_UNDEFINED`, in which case `newcomm` returns `MPI_COMM_NULL`.==

==The following type is predefined by MPI:==

==`MPI_COMM_TYPE_SHARED` — this type splits the communicator into subcommunicators, each of which can create a shared memory region.==

==> [!warning] Advice to implementors==

==> Implementations can define their own types, or use the `info` argument, to assist in creating communicators that help expose platform-specific information to the application.==

### MPI-3.0 → MPI-3.1  (9 changed paragraphs)

~~The following are collective functions that are invoked by all processes in the~~

~~group or groups associated with `comm`, with the exception of [[versions/v31/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , which is invoked only by the processes in the group of the new communicator being constructed.~~

==The following are collective functions that are invoked by all processes in the group or groups associated with `comm`, with the exception of [[versions/v31/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , which is invoked only by the processes in the group of the new communicator being constructed.==

An intracommunicator involves a single group while an intercommunicator involves two groups. Where the following discussions address intercommunicator semantics, the two groups in an intercommunicator are called the *left* and *right* groups. A process in an intercommunicator is a member of either the left or the right group. From the point of view of that process, the group that the process is a member of is called the ~~*local* group;~~ ==*local group*;== the other group (relative to that process) is the ~~*remote* group.~~ ==*remote group*.== The left and right group labels give us a way to describe the two groups in an intercommunicator that is not relative to any particular process (as the local and remote groups are).

~~`MPI_COMM_DUP` duplicates the existing communicator `comm` with associated key values, topology information, and info hints. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. Returns in `newcomm` a new~~

~~communicator with the same group or groups, same topology, same info hints, any copied cached information, but a new context (see Section [[versions/v31/sections/context#Functionality|Functionality]] ).~~

==[[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]] duplicates the existing communicator `comm` with associated key values, topology information, and info hints. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. Returns in `newcomm` a new communicator with the same group or groups, same topology, same info hints, any copied cached information, but a new context (see Section [[versions/v31/sections/context#Functionality|Functionality]] ).==

> This operation is used to provide a parallel library with a duplicate communication space that has the same properties as the original communicator. This includes any attributes (see below), topologies (see Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] ), and associated info hints (see Section [[versions/v31/sections/context#Communicator Info|Communicator Info]] ). This call is valid even if there are pending point-to-point communications involving the communicator `comm`. A typical call might involve a ~~`MPI_COMM_DUP`~~ ==[[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]]== at the beginning of the parallel call, and an ~~`MPI_COMM_FREE`~~ ==[[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]]== of that duplicated communicator at the end of the call. Other models of communicator management are also possible. > > This call applies to both intra- and inter-communicators.

~~`MPI_COMM_IDUP`~~ ==[[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]== is a nonblocking variant of ~~`MPI_COMM_DUP`.~~ ==[[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]] .== The semantics of ~~`MPI_COMM_IDUP`~~ ==[[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]== are as if ~~`MPI_COMM_DUP`~~ ==[[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]]== was executed at the time that ~~`MPI_COMM_IDUP`~~ ==[[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]== is called. For example, attributes changed after ~~`MPI_COMM_IDUP`~~ ==[[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]== will not be copied to the new communicator. All restrictions and assumptions for nonblocking collective operations (see Section [[versions/v31/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ) apply to ~~`MPI_COMM_IDUP`~~ ==[[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]== and the returned request.

> ~~`MPI_COMM_CREATE`~~ ==[[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]]== provides a means to subset a group of processes for the purpose of separate MIMD computation, with separate communication space. `newcomm`, which emerges from ~~`MPI_COMM_CREATE`,~~ ==[[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] ,== can be used in subsequent calls to ~~`MPI_COMM_CREATE`~~ ==[[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]]== (or other communicator constructors) to further subdivide a computation into parallel sub-computations. A more general service is provided by ~~`MPI_COMM_SPLIT`,~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ,== below.

> This is an extremely powerful mechanism for dividing a single communicating group of processes into $`k`$ subgroups, with $`k`$ chosen implicitly by the user (by the number of colors asserted over all the processes). Each resulting communicator will be non-overlapping. Such a division could be useful for defining a hierarchy of computations, such as for multigrid, or linear algebra. For intracommunicators, ~~`MPI_COMM_SPLIT`~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]]== provides similar capability as ~~`MPI_COMM_CREATE`~~ ==[[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]]== to split a communicating group into disjoint subgroups. ~~`MPI_COMM_SPLIT`~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]]== is useful when some processes do not have complete information of the other members in their group, but all processes know (the color of) the group to which they belong. In this case, the MPI implementation discovers the other group members via communication. ~~`MPI_COMM_CREATE`~~ ==[[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]]== is useful when all processes have complete information of the members of their group. In this case, MPI can avoid the extra communication required to discover group membership. [[versions/v31/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is useful when all processes in a given group have complete information of the members of their group and synchronization with processes outside the group can be avoided. > > Multiple calls to ~~`MPI_COMM_SPLIT`~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]]== can be used to overcome the requirement that any call have no overlap of the resulting communicators (each process is of only one color per call). In this way, multiple overlapping communication structures can be created. Creative use of the `color` and `key` in such splitting operations is encouraged. > > Note that, for a fixed color, the keys need not be unique. It is ~~`MPI_COMM_SPLIT`’s~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ’s== responsibility to sort processes in ascending order according to this key, and to break ties in a consistent way. If all the keys are specified in the same way, then all the processes in a given color will have the relative rank order as they did in their parent group. > > Essentially, making the key value zero for all processes of a given color means that one does not really care about the rank-order of the processes in the new communicator.

The result of ~~`MPI_COMM_SPLIT`~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]]== on an intercommunicator is that those processes on the left with the same `color` as those processes on the right combine to create a new intercommunicator. The `key` argument describes the relative rank of processes on each side of the intercommunicator (see Figure [[versions/v31/sections/context#Communicator Constructors|Communicator Constructors]] ). For those colors that are specified only on one side of the intercommunicator, `MPI_COMM_NULL` is returned. `MPI_COMM_NULL` is also returned to those processes that specify `MPI_UNDEFINED` as the color.

> For intercommunicators, [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] is more general than ~~`MPI_COMM_CREATE`.~~ ==[[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] .== A single call to ~~`MPI_COMM_SPLIT`~~ ==[[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]]== can create a set of disjoint intercommunicators, while a call to ~~`MPI_COMM_CREATE`~~ ==[[versions/v31/API/MPI_COMM_CREATE|MPI_COMM_CREATE]]== creates only one.

### MPI-3.1 → MPI-4.0  (25 changed paragraphs)

The following are collective functions that are invoked by all processes in the group or groups associated with `comm`, with the exception of [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , ~~which is~~ ==[[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , and [[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] . [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] and [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] are== invoked only by the processes in the group of the new communicator being constructed. ==[[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] is invoked by all the processes in the local and remote groups of the new communicator being constructed. See the discussion below for the definition of local and remote groups.==

> Note ~~that~~ ==that, when using the World Model,== there is a chicken-and-egg aspect to MPI in that a communicator is needed to create a new communicator. ~~The~~ ==In the World Model, the== base communicator for all MPI communicators is predefined outside of MPI, and is `MPI_COMM_WORLD`. ~~This model~~ ==The World Model== was arrived at after considerable debate, and was chosen to increase “safety” of programs written in MPI.

This chapter presents the following communicator construction routines: [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , ==[[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] , [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]]== and ~~[[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]]~~ ==[[versions/v40/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]]== can be used to create both ~~intracommunicators~~ ==intra-communicators== and ~~intercommunicators;~~ ==inter-communicators;== [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] ==, [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]]== and [[versions/v40/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] (see Section ~~[[versions/v40/sections/context#Inter-communicator Operations|Inter-communicator~~ ==[[context#Inter-Communicator Operations|Inter-Communicator== Operations]] ) can be used to create ~~intracommunicators;~~ ==intra-communicators; [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]]== and ~~[[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]]~~ ==[[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]]== (see Section ~~[[versions/v40/sections/context#Inter-communicator Operations|Inter-communicator~~ ==[[context#Inter-Communicator Operations|Inter-Communicator== Operations]] ) can be used to create ~~intercommunicators.~~ ==inter-communicators.==

An ~~intracommunicator~~ ==intra-communicator== involves a single group while an ~~intercommunicator~~ ==inter-communicator== involves two groups. Where the following discussions address ~~intercommunicator~~ ==inter-communicator== semantics, the two groups in an ~~intercommunicator~~ ==inter-communicator== are called the *left* and *right* groups. A process in an ~~intercommunicator~~ ==inter-communicator== is a member of either the left or the right group. From the point of view of that process, the group that the process is a member of is called the *local group*; the other group (relative to that process) is the *remote group*. The left and right group labels give us a way to describe the two groups in an ~~intercommunicator~~ ==inter-communicator== that is not relative to any particular process (as the local and remote groups are).

[[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] duplicates the existing communicator `comm` with associated key ~~values,~~ ==values and== topology ~~information, and info hints.~~ ==information.== For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. ~~Returns~~ ==[[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] returns== in `newcomm` a new communicator with the same group or groups, same topology, ~~same info hints,~~ ==and== any copied cached information, but a new context (see Section [[versions/v40/sections/context#Functionality|Functionality]] ).

> This operation is used to provide a parallel library with a duplicate communication space that has the same properties as the original communicator. This includes any attributes (see ~~below),~~ ==below) and== topologies (see Chapter [[versions/v40/sections/topol#Process Topologies|Process Topologies]] ~~), and associated info hints (see Section [[versions/v40/sections/context#Communicator Info|Communicator Info]]~~ ). This call is valid even if there are pending point-to-point communications involving the communicator `comm`. A typical call might involve a [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] at the beginning of the parallel call, and an [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] of that duplicated communicator at the end of the call. Other models of communicator management are also possible. > > This call applies to both intra- and inter-communicators.

[[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] behaves exactly as [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] except that the ~~info hints associated with the communicator `comm` are not duplicated in `newcomm`. The~~ hints provided by the argument `info` are associated with the output communicator ~~`newcomm` instead.~~ ==`newcomm`.==

[[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] is a nonblocking variant of [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] . ~~The~~ ==With the exception of its nonblocking behavior, the== semantics of [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] are as if [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] was executed at the time that [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] is called. For example, attributes changed after [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] will not be copied to the new communicator. All restrictions and assumptions for nonblocking collective operations (see Section [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ) apply to [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] and the returned request.

==![[versions/v40/API/MPI_COMM_IDUP_WITH_INFO]]==

==[[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] is a nonblocking variant of [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] . With the exception of its nonblocking behavior, the semantics of [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] are as if [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] was executed at the time that [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] is called. For example, attributes or info hints changed after [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] will not be copied to the new communicator. All restrictions and assumptions for nonblocking collective operations (see Section [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ) apply to [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] and the returned request.==

==It is erroneous to use the communicator `newcomm` as an input argument to other MPI functions before the [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] operation completes.==

> ~~This functionality is~~ ==The [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] and [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] functions are== crucial for the development of purely nonblocking libraries (see ).

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== this function returns a new communicator `newcomm` with communication group defined by the `group` argument. No cached information propagates from `comm` to ~~`newcomm`.~~ ==`newcomm` and no virtual topology information is added to the created communicator.== Each process must call [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] with a `group` argument that is a subgroup of the `group` associated with `comm`; this could be `MPI_GROUP_EMPTY`. The processes may specify different values for the `group` argument. If a process calls with a non-empty `group` then all processes in that `group` must call the function with the same `group` as argument, that is the same processes in the same order. Otherwise, the call is erroneous. This implies that the set of groups specified across the processes must be disjoint. If the calling process is a member of the group given as `group` argument, then `newcomm` is a communicator with `group` as its associated group. In the case that a process calls with a `group` to which it does not belong, e.g., `MPI_GROUP_EMPTY`, then `MPI_COMM_NULL` is returned as `newcomm`. The function is collective and must be called by all processes in the group of `comm`.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the output communicator is also an ~~intercommunicator~~ ==inter-/communicator== where the local group consists only of those processes contained in `group` (see Figure [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] ). The `group` argument should only contain those processes in the local group of the input ~~intercommunicator~~ ==inter-communicator== that are to be a part of `newcomm`. All processes in the same local group of `comm` must specify the same value for `group`, i.e., the same members in the same order. If either `group` does not specify at least one process in the local group of the ~~intercommunicator,~~ ==inter-communicator,== or if the calling process is not included in the `group`, `MPI_COMM_NULL` is returned.

> In the case where either the left or right group is empty, a null communicator is returned instead of an ~~intercommunicator~~ ==inter-communicator== with `MPI_GROUP_EMPTY` because the side with the empty group must return `MPI_COMM_NULL`.

==Inter-communicator creation.== The following example illustrates how the first node in the left side of an ~~intercommunicator~~ ==inter-communicator== could be joined with all members on the right side of an ~~intercommunicator~~ ==inter-communicator== to form a new ~~intercommunicator.~~ ==inter-communicator.==

/* Construct the original ~~intercommunicator:~~ ==inter-communicator:== "inter_comm" */ ...

/* Construct the group of processes to be in new ~~intercommunicator~~ ==inter-communicator== */ if (/* I'm on the left side of the ~~intercommunicator~~ ==inter-communicator== */) { ~~MPI_Comm_group ( inter_comm, &local_group ); MPI_Group_incl ( local_group,~~ ==MPI_Comm_group(inter_comm, &local_group); MPI_Group_incl(local_group,== 1, &rank, ~~&group ); MPI_Group_free ( &local_group );~~ ==&group); MPI_Group_free(&local_group);== } else ~~MPI_Comm_group ( inter_comm, &group );~~ ==MPI_Comm_group(inter_comm, &group);==

~~MPI_Comm_create ( inter_comm,~~ ==MPI_Comm_create(inter_comm,== group, ~~&new_inter_comm ); MPI_Group_free( &group );~~ ==&new_inter_comm); MPI_Group_free(&group);==

[[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is similar to [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] ; however, [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] must be called by all processes in the group of `comm`, whereas [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] must be called by all processes in `group`, which is a subgroup of the group of `comm`. In addition, [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] requires that `comm` is an ~~intracommunicator.~~ ==intra-communicator.== [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] returns a new ~~intracommunicator,~~ ==intra-communicator,== `newcomm`, for which the `group` argument defines the communication group. No cached information propagates from `comm` to ~~`newcomm`.~~ ==`newcomm` and no virtual topology information is added to the created communicator.== Each process must provide a group argument that is a subgroup of the group associated with `comm`; this could be `MPI_GROUP_EMPTY`. If a non-empty group is specified, then all processes in that group must call the function, and each of these processes must provide the same arguments, including a group that contains the same members with the same ordering. Otherwise the call is erroneous. If the calling process is a member of the group given as the `group` argument, then `newcomm` is a communicator with `group` as its associated group. If the calling process is not a member of `group`, e.g., `group` is `MPI_GROUP_EMPTY`, then the call is a local operation and `MPI_COMM_NULL` is returned as `newcomm`.

> Functionality similar to [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] can be implemented through repeated [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] and [[versions/v40/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] calls that start with the `MPI_COMM_SELF` communicators at each process in `group` and build up an ~~intracommunicator~~ ==intra-communicator== with group `group` . Such an algorithm requires the creation of many intermediate communicators; [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] can provide a more efficient implementation that avoids this overhead.

> An ~~intercommunicator~~ ==inter-communicator== can be created collectively over processes in the union of the local and remote groups by creating the local communicator using [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] and using that communicator as the local communicator argument to [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] .

This function partitions the group associated with `comm` into disjoint subgroups, one for each value of `color`. Each subgroup contains all processes of the same color. Within each subgroup, the processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. A process may supply the color value `MPI_UNDEFINED`, in which case `newcomm` returns `MPI_COMM_NULL`. This is a collective call, but each process is permitted to provide different values for `color` and `key`. ==No cached information propagates from `comm` to `newcomm` and no virtual topology information is added to the created communicators.==

With an ~~intracommunicator~~ ==intra-communicator== `comm`, a call to [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is equivalent to a call to [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , where processes that are members of their `group` argument provide `color`$`=`$number of the `group` (based on a unique numbering of all disjoint groups) and `key`$`=`$rank in `group`, and all processes that are not members of their `group` argument provide `color`$`=`$`MPI_UNDEFINED`.

> This is an extremely powerful mechanism for dividing a single communicating group of processes into $`k`$ subgroups, with $`k`$ chosen implicitly by the user (by the number of colors asserted over all the processes). Each resulting communicator will be non-overlapping. Such a division could be useful for defining a hierarchy of computations, such as for multigrid, or linear algebra. For ~~intracommunicators,~~ ==intra-communicators,== [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] provides similar capability as [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] to split a communicating group into disjoint subgroups. [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] is useful when some processes do not have complete information of the other members in their group, but all processes know (the color of) the group to which they belong. In this case, the MPI implementation discovers the other group members via communication. [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is useful when all processes have complete information of the members of their group. In this case, MPI can avoid the extra communication required to discover group membership. [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is useful when all processes in a given group have complete information of the members of their group and synchronization with processes outside the group can be avoided. > > Multiple calls to [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] can be used to overcome the requirement that any call have no overlap of the resulting communicators (each process is of only one color per call). In this way, multiple overlapping communication structures can be created. Creative use of the `color` and `key` in such splitting operations is encouraged. > > Note that, for a fixed color, the keys need not be unique. It is [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ’s responsibility to sort processes in ascending order according to this key, and to break ties in a consistent way. If all the keys are specified in the same way, then all the processes in a given color will have the relative rank order as they did in their parent group. > > Essentially, making the key value ~~zero~~ ==the same (e.g., zero)== for all processes of a given color means that one does not really care about the rank-order of the processes in the new communicator.

> `color` is restricted to be non-negative, so as not to ~~confict~~ ==conflict== with the value assigned to `MPI_UNDEFINED`.

The result of [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] on an ~~intercommunicator~~ ==inter-communicator== is that those processes on the left with the same `color` as those processes on the right combine to create a new ~~intercommunicator.~~ ==inter-communicator.== The `key` argument describes the relative rank of processes on each side of the ~~intercommunicator~~ ==inter-communicator== (see Figure [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] ). For those colors that are specified only on one side of the ~~intercommunicator,~~ ==inter-communicator,== `MPI_COMM_NULL` is returned. `MPI_COMM_NULL` is also returned to those processes that specify `MPI_UNDEFINED` as the color.

> For ~~intercommunicators,~~ ==inter-communicators,== [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] is more general than [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] . A single call to [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] can create a set of disjoint ~~intercommunicators,~~ ==inter-communicators,== while a call to [[versions/v40/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] creates only one.

~~(Parallel~~ ==Parallel== client-server ~~model).~~ ==model.\== The following client code illustrates how clients on the left side of an ~~intercommunicator~~ ==inter-communicator== could be assigned to a single server from a pool of servers on the right side of an ~~intercommunicator.~~ ==inter-communicator.==

/* Create ~~intercommunicator~~ ==inter-communicator== with clients and servers: multiple_server_comm */ ...

/* Find out the number of servers available */ ~~MPI_Comm_remote_size ( multiple_server_comm, &num_servers );~~ ==MPI_Comm_remote_size(multiple_server_comm, &num_servers);==

/* Determine my color */ ~~MPI_Comm_rank ( multiple_server_comm, &rank );~~ ==MPI_Comm_rank(multiple_server_comm, &rank);== color = rank % num_servers;

/* Split the ~~intercommunicator~~ ==inter-communicator== */ ~~MPI_Comm_split ( multiple_server_comm,~~ ==MPI_Comm_split(multiple_server_comm,== color, rank, ~~&single_server_comm );~~ ==&single_server_comm);==

/* Create ~~intercommunicator~~ ==inter-communicator== with clients and servers: multiple_client_comm */ ...

/* Split the ~~intercommunicator~~ ==inter-communicator== for a single server per group of clients */ ~~MPI_Comm_rank ( multiple_client_comm, &rank ); MPI_Comm_split ( multiple_client_comm,~~ ==MPI_Comm_rank(multiple_client_comm, &rank); MPI_Comm_split(multiple_client_comm,== rank, 0, ~~&single_server_comm );~~ ==&single_server_comm);==

~~This function partitions the group associated with `comm` into disjoint subgroups, based on the type specified by `split_type`. Each subgroup contains all processes of the same type. Within each subgroup, the processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. This is a collective call; all processes must provide the same `split_type`, but each process is permitted to provide different values for `key`. An exception to this rule is that a process may supply the type value `MPI_UNDEFINED`, in which case `newcomm` returns `MPI_COMM_NULL`.~~

~~The following type is predefined by MPI:~~

~~`MPI_COMM_TYPE_SHARED` — this type splits the communicator into subcommunicators, each of which can create a shared memory region.~~

==This function partitions the group associated with `comm` into disjoint subgroups such that each subgroup contains all MPI processes in the same grouping referred to by `split_type`. Within each subgroup, the MPI processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. This is a collective call. All MPI processes in the group associated with `comm` must provide the same `split_type`, but each MPI process is permitted to provide different values for `key`. An exception to this rule is that an MPI process may supply the type value `MPI_UNDEFINED`, in which case `MPI_COMM_NULL` is returned in `newcomm` for such MPI process. No cached information propagates from `comm` to `newcomm` and no virtual topology information is added to the created communicators.==

==For `split_type`, the following values are defined by MPI:==

==`MPI_COMM_TYPE_SHARED`—all MPI processes in `newcomm` can create a shared memory segment (e.g., with a successful call to [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] ). This segment can subsequently be used for load/store accesses by all MPI processes in `newcomm`.==

==> [!note] Advice to users==

==> Since the location of some of the MPI processes may change during the application execution, the communicators created with the value `MPI_COMM_TYPE_SHARED` before this change may not reflect an actual ability to share memory between MPI processes after this change.==

==`MPI_COMM_TYPE_HW_GUIDED`—this value specifies that the communicator `comm` is split according to a **hardware resource type** (for example a computing core or an L3 cache) specified by the `mpi_hw_resource_type` info key. Each output communicator `newcomm` corresponds to a single instance of the specified hardware resource type. The MPI processes in the group associated with the output communicator `newcomm` utilize that specific hardware resource type instance, and no other instance of the same hardware resource type.==

==If an MPI process does not meet the above criteria, then `MPI_COMM_NULL` is returned in `newcomm` for such process.==

==`MPI_COMM_NULL` is also returned in `newcomm` in the following cases:==

==- `MPI_INFO_NULL` is provided.==

==- The `info` handle does not include the key `mpi_hw_resource_type`.==

==- The MPI implementation neither recognizes nor supports the info key `mpi_hw_resource_type`.==

==- The MPI implementation does not recognize the value associated with the info key `mpi_hw_resource_type`.==

==The MPI implementation will return in the group of the output communicator `newcomm` the largest subset of MPI processes that match the splitting criterion.==

==The processes in the group associated with `newcomm` are ranked in the order defined by the value of the argument `key` with ties broken according to their rank in the group associated with `comm`.==

==> [!note] Advice to users==

==> The set of hardware resources that an MPI process is able to utilize may change during the application execution (e.g., because of the relocation of an MPI process), in which case the communicators created with the value `MPI_COMM_TYPE_HW_GUIDED` before this change may not reflect the utilization of hardware resources of such process at any time after the communicator creation.==

==The user explicitly constrains with the `info` argument the splitting of the input communicator `comm`. To this end, the info key `mpi_hw_resource_type` is reserved and its associated value is an implementation-defined string designating the type of the requested hardware resource (e.g., “NUMANode”, “Package” or “L3Cache”).==

==The value `mpi_shared_memory` is reserved and its use is equivalent to using `MPI_COMM_TYPE_SHARED` for the `split_type` parameter.==

==> [!tip] Rationale==

==> The value `mpi_shared_memory` is defined in order to ensure consistency between the use of `MPI_COMM_TYPE_SHARED` and the use of `MPI_COMM_TYPE_HW_GUIDED`.==

==All MPI processes must provide the same value for the info key `mpi_hw_resource_type`.==

==`MPI_COMM_TYPE_HW_UNGUIDED`—the group of MPI processes associated with `newcomm` must be a *strict* subset of the group associated with `comm` and each `newcomm` corresponds to a single instance of a **hardware resource type** (for example a computing core or an L3 cache).==

==All MPI processes in the group associated with `comm` which utilize that specific hardware resource type instance—and no other instance of the same hardware resource type—are included in the group of `newcomm`.==

==If a given MPI process cannot be a member of a communicator that forms such a strict subset, or does not meet the above criteria, then `MPI_COMM_NULL` is returned in `newcomm` for this process.==

~~> Implementations can define their own types, or use the `info` argument, to assist in creating communicators that help expose platform-specific information to the application.~~

==> In a high-quality MPI implementation, the number of different new valid communicators `newcomm` produced by this splitting operation should be minimal unless the user provides a key/value pair that modifies this behavior. The sets of hardware resource types used for the splitting operation are implementation-dependent, but should reflect the hardware of the actual system on which the application is currently executing.==

==> [!tip] Rationale==

==> If the hardware resources are hierarchically organized, calling this routine several times using as its input communicator `comm` the output communicator `newcomm` of the previous call creates a sequence of `newcomm` communicators in each MPI process, which exposes a hierarchical view of the hardware platform, as shown in Example [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] . This sequence of returned `newcomm` communicators may differ from the sets of hardware resource types, as shown in the second splitting operation in Figure [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .==

==> [!note] Advice to users==

==> Each output communicator `newcomm` can represent a different hardware resource type (see Figure [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] for an example). The set of hardware resources an MPI process utilizes may change during the application execution (e.g., because of process relocation), in which case the communicators created with the value `MPI_COMM_TYPE_HW_UNGUIDED` before this change may not reflect the utilization of hardware resources for such process at any time after the communicator creation.==

==*Figure: MPI_COMM_SPLIT_TYPE*==

==If a valid info handle is provided as an argument, the MPI implementation sets the info key `mpi_hw_resource_type` for each MPI process in the group associated with a returned `newcomm` communicator and the info key value is an implementation-defined string that indicates the hardware resource type represented by `newcomm`. The same hardware resource type must be set in all MPI processes in the group associated with `newcomm`.==

==Recursive splitting of `MPI_COMM_WORLD`.==

==      #define MAX_NUM_LEVELS 32==

==      MPI_Comm hwcomm[MAX_NUM_LEVELS];       int      rank, level_num = 0;==

==      hwcomm[level_num] = MPI_COMM_WORLD;==

==      while((hwcomm[level_num] != MPI_COMM_NULL)              && (level_num < MAX_NUM_LEVELS-1)){         MPI_Comm_rank(hwcomm[level_num],&rank);         MPI_Comm_split_type(hwcomm[level_num],                             MPI_COMM_TYPE_HW_UNGUIDED,                             rank,                             MPI_INFO_NULL,                             &hwcomm[level_num+1]);         level_num++;       }==

==> [!warning] Advice to implementors==

==> Implementations can define their own `split_type` values, or use the `info` argument, to assist in creating communicators that help expose platform-specific information to the application. The concept of hardware-based communicators was first described by Träff for SMP systems. Guided and unguided modes description as well as an implementation path are introduced by Goglin *et al.* .==

==![[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP]]==

==[[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] is similar to [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , except that the set of MPI processes involved in the creation of the new intra-communicator is specified by a `group` argument, rather than the group associated with a pre-existing communicator. If a non-empty `group` is specified, then all MPI processes in that group must call the function and each of these MPI processes must provide the same arguments, including a group that contains the same members with the same ordering, and identical `stringtag` value. In the event that `MPI_GROUP_EMPTY` is supplied as the `group` argument, then the call is a local operation and `MPI_COMM_NULL` is returned as `newcomm`. The `stringtag` argument is analogous to the `tag` used for [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] . If multiple threads at a given MPI process perform concurrent [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] operations, the user must distinguish these operations by providing different `stringtag` arguments. The `stringtag` shall not exceed `MPI_MAX_STRINGTAG_LEN` characters in length. For C, this includes space for a null terminating character. `MPI_MAX_STRINGTAG_LEN` shall have a value of at least 63.==

==The `errhandler` argument specifies an error handler to be attached to the new intra-communicator. This error handler will also be invoked if the [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] function encounters an error. The `info` argument provides hints and assertions, possibly MPI implementation dependent, which indicate desired characteristics and guide communicator creation.==

==> [!note] Advice to users==

==> The `stringtag` argument is used to distinguish concurrent communicator construction operations issued by different entities. As such, it is important to ensure that this argument is unique for each concurrent call to [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] . Reverse domain name notation convention is one approach to constructing unique `stringtag` arguments. See also example [[versions/v40/sections/dynamic#Sessions Model Examples|Sessions Model Examples]] .==

### MPI-4.0 → MPI-4.1  (26 changed paragraphs)

The following are collective functions that are invoked by all ==MPI== processes in the group or groups associated with `comm`, with the exception of [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , and [[versions/v41/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] . [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] and [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] are invoked only by the ==MPI== processes in the group of the new communicator being constructed. [[versions/v41/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] is invoked by all the ==MPI== processes in the local and remote groups of the new communicator being constructed. See the discussion below for the definition of local and remote groups.

An intra-communicator involves a single group while an inter-communicator involves two groups. Where the following discussions address inter-communicator semantics, the two groups in an inter-communicator are called the *left* and *right* groups. ~~A~~ ==An MPI== process in an inter-communicator is a member of either the left or the right group. From the point of view of that ==MPI== process, the group that the ==MPI== process is a member of is called the *local group*; the other group (relative to that ==MPI== process) is the *remote group*. The left and right group labels give us a way to describe the two groups in an inter-communicator that is not relative to any particular ==MPI== process (as the local and remote groups are).

[[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] duplicates the existing communicator `comm` with associated key ~~values~~ ==values, topology information== and ~~topology information.~~ ==error handlers.== For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new communicator. [[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] returns in `newcomm` a new communicator with the same group or groups, same topology, ==same error handlers== and any copied cached information, but a new context (see Section [[versions/v41/sections/context#Functionality|Functionality]] ). ==The newly created communicator will have no buffer attached (see Section [[versions/v41/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] ).==

> This operation is used to provide a parallel library with a duplicate communication space that has the same properties as the original communicator. This includes any attributes (see below) and topologies (see Chapter ~~[[versions/v41/sections/topol#Process Topologies|Process Topologies]]~~ ==[[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]]== ). This call is valid even if there are ~~pending~~ ==*pending*== point-to-point ~~communications~~ ==communication operations > > or *decoupled MPI activities*== involving the communicator `comm`. A typical call might involve a [[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] at the beginning of the parallel call, and an [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] of that duplicated communicator at the end of the call. Other models of communicator management are also possible. > > This call applies to both intra- and inter-communicators.

~~If `comm` is an intra-communicator, this function returns a new communicator `newcomm` with communication group defined by the `group` argument. No cached information propagates from `comm` to `newcomm` and no virtual topology information is added to the created communicator. Each process must call [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] with a `group` argument that is a subgroup of the `group` associated with `comm`; this could be `MPI_GROUP_EMPTY`. The processes may specify different values for the `group` argument. If a process calls with a non-empty `group` then all processes in that `group` must call the function with the same `group` as argument, that is the same processes in the same order. Otherwise, the call is erroneous. This implies that the set of groups specified across the processes must be disjoint. If the calling process is a member of the group given as `group` argument, then `newcomm` is a communicator with `group` as its associated group. In the case that a process calls with a `group` to which it does not belong, e.g., `MPI_GROUP_EMPTY`, then `MPI_COMM_NULL` is returned as `newcomm`. The function is collective and must be called by all processes in the group of `comm`.~~

==If `comm` is an intra-communicator, this function returns a new communicator `newcomm` with communication group defined by the `group` argument. No cached information propagates from `comm` to `newcomm` and no virtual topology information is added to the created communicator. Each MPI process must call [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] with a `group` argument that is a subgroup of the group associated with `comm`; this could be `MPI_GROUP_EMPTY`. The MPI processes may specify different values for the `group` argument. If an MPI process calls with a nonempty `group` then all MPI processes in that `group` must call the function with the same `group` as argument, that is the same MPI processes in the same order. Otherwise, the call is erroneous. This implies that the set of groups specified across the MPI processes must be disjoint. If the calling MPI process is a member of the group given as `group` argument, then `newcomm` is a communicator with `group` as its associated group. In the case that an MPI process calls with a `group` to which it does not belong, e.g., `MPI_GROUP_EMPTY`, then `MPI_COMM_NULL` is returned as `newcomm`. The function is collective and must be called by all MPI processes in the group of `comm`.==

==*Figure: MPI_COMM_CREATE*==

> The interface supports the original mechanism from MPI-1.1, which required the same `group` in all ==MPI== processes of `comm`. It was extended in MPI-2.2 to allow the use of disjoint subgroups in order to allow implementations to eliminate unnecessary communication that [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] would incur when the user already knows the membership of the disjoint subgroups.

> [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] provides a means to subset a group of ==MPI== processes for the purpose of separate MIMD computation, with separate communication space. `newcomm`, which emerges from [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , can be used in subsequent calls to [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] (or other communicator constructors) to further subdivide a computation into parallel sub-computations. A more general service is provided by [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , below.

> When calling [[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] , all ==MPI== processes call with the same `group` (the `group` associated with the communicator). When calling [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , the ==MPI== processes provide the same `group` or disjoint subgroups. For both calls, it is theoretically possible to agree on a group-wide unique context with no communication. However, local execution of these functions requires use of a larger context name space and reduces error checking. Implementations may strike various compromises between these conflicting goals, such as bulk allocation of multiple contexts in one collective operation. > > Important: If new communicators are created without synchronizing the ==MPI== processes involved then the communication system must be able to cope with messages arriving in a context that has not yet been allocated at the receiving ==MPI== process.

If `comm` is an inter-communicator, then the output communicator is also an inter-/communicator where the local group consists only of those ==MPI== processes contained in `group` (see Figure [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] ). The `group` argument should only contain those ==MPI== processes in the local group of the input inter-communicator that are to be a part of `newcomm`. All ==MPI== processes in the same local group of `comm` must specify the same value for `group`, i.e., the same members in the same order. If either `group` does not specify at least one ==MPI== process in the local group of the inter-communicator, or if the calling ==MPI== process is not included in the `group`, `MPI_COMM_NULL` is returned.

~~*Figure: MPI_COMM_CREATE*~~

~~Inter-communicator creation. The following example illustrates how the first node in the left side of an inter-communicator could be joined with all members on the right side of an inter-communicator to form a new inter-communicator.~~

~~            MPI_Comm  inter_comm, new_inter_comm;             MPI_Group local_group, group;             int       rank = 0; /* rank on left side to include in                                     new inter-comm */~~

~~            /* Construct the original inter-communicator: "inter_comm" */             ...~~

~~            /* Construct the group of processes to be in new                 inter-communicator */             if (/* I'm on the left side of the inter-communicator */) {               MPI_Comm_group(inter_comm, &local_group);               MPI_Group_incl(local_group, 1, &rank, &group);               MPI_Group_free(&local_group);             }             else                MPI_Comm_group(inter_comm, &group);~~

~~            MPI_Comm_create(inter_comm, group, &new_inter_comm);             MPI_Group_free(&group);~~

==Inter-communicator creation.\ The following example illustrates how the first node in the left side of an inter-communicator could be joined with all members on the right side of an inter-communicator to form a new inter-communicator.==

==(code block added)==
``` [MPI]C
MPI_Comm  inter_comm, new_inter_comm;
MPI_Group local_group, group;
int       rank = 0; /* rank on left side to include in
                       new inter-comm */

/* Construct the original inter-communicator: "inter_comm" */
...

/* Construct the group of MPI processes to be in new
   inter-communicator */
if (/* I'm on the left side of the inter-communicator */) {
  MPI_Comm_group(inter_comm, &local_group);
  MPI_Group_incl(local_group, 1, &rank, &group);
  MPI_Group_free(&local_group);
}
else
  MPI_Comm_group(inter_comm, &group);

MPI_Comm_create(inter_comm, group, &new_inter_comm);
MPI_Group_free(&group);
```

[[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is similar to [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] ; however, [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] must be called by all ==MPI== processes in the group of `comm`, whereas [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] must be called by all ==MPI== processes in `group`, which is a subgroup of the group of `comm`. In addition, [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] requires that `comm` is an intra-communicator. [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] returns a new intra-communicator, `newcomm`, for which the `group` argument defines the communication group. No cached information propagates from `comm` to `newcomm` and no virtual topology information is added to the created communicator. Each ==MPI== process must provide a ~~group~~ ==`group`== argument that is a subgroup of the group associated with `comm`; this could be `MPI_GROUP_EMPTY`. If a ~~non-empty~~ ==nonempty== group is specified, then all ==MPI== processes in that group must call the function, and each of these ==MPI== processes must provide the same arguments, including a group that contains the same members with the same ordering. Otherwise the call is erroneous. If the calling ==MPI== process is a member of the group given as the `group` argument, then `newcomm` is a communicator with `group` as its associated group. If the calling ==MPI== process is not a member of `group`, e.g., `group` is `MPI_GROUP_EMPTY`, then the call is a local operation and `MPI_COMM_NULL` is returned as `newcomm`.

> Functionality similar to [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] can be implemented through repeated [[versions/v41/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] and [[versions/v41/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] calls that start with the `MPI_COMM_SELF` communicators at each ==MPI== process in `group` and build up an intra-communicator with group `group` . Such an algorithm requires the creation of many intermediate communicators; [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] can provide a more efficient implementation that avoids this overhead.

> An inter-communicator can be created collectively over ==MPI== processes in the union of the local and remote groups by creating the local communicator using [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] and using that communicator as the local communicator argument to [[versions/v41/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] .

The `tag` argument does not conflict with tags used in point-to-point communication and is not permitted to be a wildcard. If multiple threads at a given ==MPI== process perform concurrent [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] operations, the user must distinguish these operations by providing different `tag` or `comm` arguments.

~~This function partitions the group associated with `comm` into disjoint subgroups, one for each value of `color`. Each subgroup contains all processes of the same color. Within each subgroup, the processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. A process may supply the color value `MPI_UNDEFINED`, in which case `newcomm` returns `MPI_COMM_NULL`. This is a collective call, but each process is permitted to provide different values for `color` and `key`. No cached information propagates from `comm` to `newcomm` and no virtual topology information is added to the created communicators.~~

~~With an intra-communicator `comm`, a call to [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is equivalent to a call to [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , where processes that are members of their `group` argument provide `color`$`=`$number of the `group` (based on a unique numbering of all disjoint groups) and `key`$`=`$rank in `group`, and all processes that are not members of their `group` argument provide `color`$`=`$`MPI_UNDEFINED`.~~

~~The value of `color` must be non-negative or `MPI_UNDEFINED`.~~

==This function partitions the group associated with `comm` into disjoint subgroups, one for each value of `color`. Each subgroup contains all MPI processes of the same color. Within each subgroup, the MPI processes are ranked in the order defined by the value of the argument `key`, with ties broken according to their rank in the old group. A new communicator is created for each subgroup and returned in `newcomm`. An MPI process may supply the color value `MPI_UNDEFINED`, in which case `newcomm` returns `MPI_COMM_NULL`. This is a collective call, but each MPI process is permitted to provide different values for `color` and `key`. No cached information propagates from `comm` to `newcomm` and no virtual topology information is added to the created communicators.==

==With an intra-communicator `comm`, a call to [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is equivalent to a call to [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] , where MPI processes that are members of their `group` argument provide a `color` argument equal to the number of the `group` (based on a unique numbering of all disjoint groups) and a `key` argument equal to their rank in `group`, and all MPI processes that are not members of their `group` argument provide a `color` argument equal to `MPI_UNDEFINED`. The value of `color` must be nonnegative or `MPI_UNDEFINED`.==

> This is an extremely powerful mechanism for dividing a single communicating group of ==MPI== processes into $`k`$ subgroups, with $`k`$ chosen implicitly by the user (by the number of colors asserted over all the ==MPI== processes). Each resulting communicator will be ~~non-overlapping.~~ ==nonoverlapping.== Such a division could be useful for defining a hierarchy of computations, such as for multigrid, or linear algebra. For intra-communicators, [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] provides similar capability as [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] to split a communicating group into disjoint subgroups. [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] is useful when some ==MPI== processes do not have complete information of the other members in their group, but all ==MPI== processes know (the color of) the group to which they belong. In this case, the MPI implementation discovers the other group members via communication. [[versions/v41/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is useful when all ==MPI== processes have complete information of the members of their group. In this case, MPI can avoid the extra communication required to discover group membership. [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is useful when all ==MPI== processes in a given group have complete information of the members of their group and synchronization with ==MPI== processes outside the group can be avoided. > > Multiple calls to [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] can be used to overcome the requirement that any call have no overlap of the resulting communicators (each ==MPI== process is of only one color per call). In this way, multiple overlapping communication structures can be created. Creative use of the `color` and `key` in such splitting operations is encouraged. > > Note that, for a fixed color, the keys need not be unique. It is [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ’s responsibility to sort ==MPI== processes in ascending order according to this key, and to break ties in a consistent way. If all the keys are specified in the same way, then all the ==MPI== processes in a given color will have the relative rank order as they did in their parent group. ~~> > Essentially, making the key value the same (e.g., zero) for all processes of a given color means that one does not really care about the rank-order of the processes in the new communicator.~~

> `color` is restricted to be ~~non-negative,~~ ==nonnegative,== so as not to conflict with the value assigned to `MPI_UNDEFINED`.

The result of [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] on an inter-communicator is that those ==MPI== processes on the left with the same `color` as those ==MPI== processes on the right combine to create a new inter-communicator. The `key` argument describes the relative rank of ==MPI== processes on each side of the inter-communicator (see Figure [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] ). For those colors that are specified only on one side of the inter-communicator, `MPI_COMM_NULL` is returned. `MPI_COMM_NULL` is also returned to those ==MPI== processes that specify `MPI_UNDEFINED` as the color.

~~            /* Client code */             MPI_Comm  multiple_server_comm;             MPI_Comm  single_server_comm;             int       color, rank, num_servers;~~

~~            /* Create inter-communicator with clients and servers:                 multiple_server_comm */             ...~~

~~            /* Find out the number of servers available */             MPI_Comm_remote_size(multiple_server_comm, &num_servers);~~

~~            /* Determine my color */             MPI_Comm_rank(multiple_server_comm, &rank);             color = rank % num_servers;~~

~~            /* Split the inter-communicator */             MPI_Comm_split(multiple_server_comm, color, rank,                             &single_server_comm);~~

==(code block added)==
``` [MPI]C
/* Client code */
MPI_Comm  multiple_server_comm;
MPI_Comm  single_server_comm;
int       color, rank, num_servers;

/* Create inter-communicator with clients and servers:
   multiple_server_comm */
...

/* Find out the number of servers available */
MPI_Comm_remote_size(multiple_server_comm, &num_servers);

/* Determine my color */
MPI_Comm_rank(multiple_server_comm, &rank);
color = rank % num_servers;

/* Split the inter-communicator */
MPI_Comm_split(multiple_server_comm, color, rank,
               &single_server_comm);
```

~~            /* Server code */             MPI_Comm  multiple_client_comm;             MPI_Comm  single_server_comm;             int       rank;~~

~~            /* Create inter-communicator with clients and servers:                 multiple_client_comm */             ...~~

~~            /* Split the inter-communicator for a single server per group                of clients */             MPI_Comm_rank(multiple_client_comm, &rank);             MPI_Comm_split(multiple_client_comm, rank, 0,                             &single_server_comm);  ~~

==(code block added)==
``` [MPI]C
/* Server code */
MPI_Comm  multiple_client_comm;
MPI_Comm  single_server_comm;
int       rank;

/* Create inter-communicator with clients and servers:
   multiple_client_comm */
...

/* Split the inter-communicator for a single server per group
   of clients */
MPI_Comm_rank(multiple_client_comm, &rank);
MPI_Comm_split(multiple_client_comm, rank, 0,
               &single_server_comm);
```

~~`MPI_COMM_TYPE_SHARED`—all~~ ==`MPI_COMM_TYPE_SHARED`: all== MPI processes in ==the group of== `newcomm` ==are part of the same *shared memory domain* and== can create a ~~shared~~ ==*shared== memory ~~segment~~ ==segment*== (e.g., with a successful call to [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] ). This segment can subsequently be used for load/store accesses by all MPI processes in `newcomm`.

~~`MPI_COMM_TYPE_HW_GUIDED`—this~~ ==`MPI_COMM_TYPE_HW_GUIDED`: this== value specifies that the communicator `comm` is split according to a **hardware resource type** (for example a computing core or an L3 cache) specified by the `mpi_hw_resource_type` info key. Each output communicator `newcomm` corresponds to a single instance of the specified hardware resource type. The MPI processes in the group associated with the output communicator `newcomm` utilize that specific hardware resource type instance, and no other instance of the same hardware resource type.

If an MPI process does not meet the above criteria, then `MPI_COMM_NULL` is returned in `newcomm` for such ==MPI== process.

The ==MPI== processes in the group associated with `newcomm` are ranked in the order defined by the value of the argument `key` with ties broken according to their rank in the group associated with `comm`.

> The set of hardware resources that an MPI process is able to utilize may change during the application execution (e.g., because of the relocation of an MPI process), in which case the communicators created with the value `MPI_COMM_TYPE_HW_GUIDED` before this change may not reflect the utilization of hardware resources of such ==MPI== process at any time after the communicator creation.

~~`MPI_COMM_TYPE_HW_UNGUIDED`—the group of MPI processes associated with `newcomm` must be a *strict* subset of the group associated with `comm` and each `newcomm` corresponds to a single instance of a **hardware resource type** (for example a computing core or an L3 cache).~~

~~All MPI processes in the group associated with `comm` which utilize that specific hardware resource type instance—and no other instance of the same hardware resource type—are included in the group of `newcomm`.~~

==Splitting `MPI_COMM_WORLD` into NUMANode subcommunicators.==

==(code block added)==
``` [MPI]C
MPI_Info info;
MPI_Comm hwcomm;
int      rank;

MPI_Comm_rank(MPI_COMM_WORLD, &rank);
MPI_Info_create(&info);
MPI_Info_set(info, "mpi_hw_resource_type", "NUMANode");
MPI_Comm_split_type(MPI_COMM_WORLD,
                    MPI_COMM_TYPE_HW_GUIDED,
                    rank, info, &hwcomm);
```

==`MPI_COMM_TYPE_RESOURCE_GUIDED`:   this value specifies that the communicator `comm` is split according to a **hardware resource type** (for example a computing core or an L3 cache) specified by the `mpi_hw_resource_type` info key or to a **logical resource type** (for example a process set name, see Section [[versions/v41/sections/dynamic#Processes Sets|Processes Sets]] ) specified by the `mpi_pset_name` info key.==

==Each output communicator `newcomm` corresponds to a single instance of the specified resource type. The MPI processes in the group associated with the output communicator `newcomm` utilize that specific resource type instance, and no other instance of the same resource type.==

==If an MPI process does not meet the above criteria, then `MPI_COMM_NULL` is returned in `newcomm` for such process.==

==`MPI_COMM_NULL` is also returned in `newcomm` in the following cases:==

==- `MPI_INFO_NULL` is provided.==

==- The `info` handle includes neither the key `mpi_hw_resource_type` nor the key `mpi_pset_name`.==

==- The MPI implementation neither recognizes nor supports the info keys `mpi_hw_resource_type` and `mpi_pset_name`.==

==- The MPI implementation does not recognize the value associated with the info key `mpi_hw_resource_type` or `mpi_pset_name`.==

==The MPI implementation will return in the group of the output communicator `newcomm` the largest subset of MPI processes that match the splitting criterion.==

==> [!note] Advice to users==

==> The set of resources that an MPI process is able to utilize may change during the application execution (e.g., because of the relocation of an MPI process), in which case the communicators created with the value `MPI_COMM_TYPE_RESOURCE_GUIDED` before this change may not reflect the utilization of resources of such process at any time after the communicator creation.==

==The user explicitly constrains with the `info` argument the splitting of the input communicator `comm`. To this end, the following info keys are reserved and their associated values are implementation-defined strings designating the type of the requested resource. Only one of these info keys can be used in `info` at a time in a call to [[versions/v41/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] ; use of more than one info key is erroneous.==

==Splitting `MPI_COMM_WORLD` into NUMANode subcommunicators.==

==(code block added)==
``` [MPI]C
MPI_Info info;
    MPI_Comm hwcomm;
    int      rank;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Info_create(&info);
    MPI_Info_set(info, "mpi_hw_resource_type", "NUMANode");
    MPI_Comm_split_type(MPI_COMM_WORLD,
                        MPI_COMM_TYPE_RESOURCE_GUIDED,
                        rank, info, &hwcomm);
```

==`MPI_COMM_TYPE_HW_UNGUIDED`:   the group of MPI processes associated with `newcomm` must be a *strict* subset of the group associated with `comm` and each `newcomm` corresponds to a single instance of a **hardware resource type** (for example a computing core or an L3 cache).==

==All MPI processes in the group associated with `comm` that utilize that specific hardware resource type instance—and no other instance of the same hardware resource type—are included in the group of `newcomm`.==

> Each output communicator `newcomm` can represent a different hardware resource type (see Figure [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] for an example). The set of hardware resources an MPI process utilizes may change during the application execution (e.g., because of ==MPI== process relocation), in which case the communicators created with the value `MPI_COMM_TYPE_HW_UNGUIDED` before this change may not reflect the utilization of hardware resources for such ==MPI== process at any time after the communicator creation.

~~      #define MAX_NUM_LEVELS 32~~

~~      MPI_Comm hwcomm[MAX_NUM_LEVELS];       int      rank, level_num = 0;~~

~~      hwcomm[level_num] = MPI_COMM_WORLD;~~

~~      while((hwcomm[level_num] != MPI_COMM_NULL)              && (level_num < MAX_NUM_LEVELS-1)){         MPI_Comm_rank(hwcomm[level_num],&rank);         MPI_Comm_split_type(hwcomm[level_num],                             MPI_COMM_TYPE_HW_UNGUIDED,                             rank,                             MPI_INFO_NULL,                             &hwcomm[level_num+1]);         level_num++;       }~~

==(code block added)==
``` [MPI]C
#define MAX_NUM_LEVELS 32

MPI_Comm hwcomm[MAX_NUM_LEVELS];
int      rank, level_num = 0;

hwcomm[level_num] = MPI_COMM_WORLD;

while((hwcomm[level_num] != MPI_COMM_NULL) 
      && (level_num < MAX_NUM_LEVELS-1)){
  MPI_Comm_rank(hwcomm[level_num],&rank);
  MPI_Comm_split_type(hwcomm[level_num],
                      MPI_COMM_TYPE_HW_UNGUIDED,
                      rank,
                      MPI_INFO_NULL,
                      &hwcomm[level_num+1]);
  level_num++;
}
```

> Implementations can define their own `split_type` values, or use the `info` argument, to assist in creating communicators that help expose platform-specific information to the application. The concept of hardware-based communicators was first described by Träff for SMP systems. Guided and unguided modes description as well as an implementation path are introduced by Goglin ~~*et al.*~~ ==et al.== .

~~[[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] is similar to [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , except that the set of MPI processes involved in the creation of the new intra-communicator is specified by a `group` argument, rather than the group associated with a pre-existing communicator. If a non-empty `group` is specified, then all MPI processes in that group must call the function and each of these MPI processes must provide the same arguments, including a group that contains the same members with the same ordering, and identical `stringtag` value. In the event that `MPI_GROUP_EMPTY` is supplied as the `group` argument, then the call is a local operation and `MPI_COMM_NULL` is returned as `newcomm`. The `stringtag` argument is analogous to the `tag` used for [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] . If multiple threads at a given MPI process perform concurrent [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] operations, the user must distinguish these operations by providing different `stringtag` arguments. The `stringtag` shall not exceed `MPI_MAX_STRINGTAG_LEN` characters in length. For C, this includes space for a null terminating character. `MPI_MAX_STRINGTAG_LEN` shall have a value of at least 63.~~

~~The `errhandler` argument specifies an error handler to be attached to the new intra-communicator. This error handler will also be invoked if the [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] function encounters an error. The `info` argument provides hints and assertions, possibly MPI implementation dependent, which indicate desired characteristics and guide communicator creation.~~

==[[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] is similar to [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , except that the set of MPI processes involved in the creation of the new intra-communicator is specified by a `group` argument, rather than the group associated with a pre-existing communicator. If a nonempty `group` is specified, then all MPI processes in that group must call the function and each of these MPI processes must provide the same arguments, including a group that contains the same members with the same ordering, and identical `stringtag` value. In the event that `MPI_GROUP_EMPTY` is supplied as the `group` argument, then the call is a local operation and `MPI_COMM_NULL` is returned as `newcomm`. The `stringtag` argument is analogous to the `tag` used for [[versions/v41/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] . If multiple threads at a given MPI process perform concurrent [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] operations, the user must distinguish these operations by providing different `stringtag` arguments. The `stringtag` shall not exceed `MPI_MAX_STRINGTAG_LEN` characters in length. For C, this includes space for a null terminating character. `MPI_MAX_STRINGTAG_LEN` shall have a value of at least 63.==

==The `errhandler` argument specifies an error handler to be attached to the new intra-communicator. Section [[versions/v41/sections/inquiry#Error Handling|Error Handling]] specifies the error handler to be invoked if an error is encountered during the invocation of [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] .==

==The `info` argument provides hints and assertions, possibly MPI implementation dependent, which indicate desired characteristics and guide communicator creation.==

### MPI-4.1 → MPI-5.0  (9 changed paragraphs)

This chapter presents the following communicator construction routines: [[versions/v50/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] , [[versions/v50/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v50/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v50/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , [[versions/v50/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] , [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] and [[versions/v50/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] can be used to create both intra-communicators and inter-communicators; [[versions/v50/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , [[versions/v50/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] and [[versions/v50/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] ==can be used to create intra-/communicators; [[versions/v50/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] and [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] can be used to create inter-communicators== (see Section [[versions/v50/sections/context#Inter-Communicator Operations|Inter-Communicator Operations]] ~~) can be used to create intra-communicators; [[versions/v50/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] and [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] (see Section [[versions/v50/sections/context#Inter-Communicator Operations|Inter-Communicator Operations]] ) can be used to create inter-communicators.~~ ==).==

> This operation is used to provide a parallel library with a duplicate communication space that has the same properties as the original communicator. This includes any attributes (see below) and topologies (see Chapter [[versions/v50/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]] ). This call is valid even if there are *pending* point-to-point communication operations > > or ~~*decoupled~~ ==*decoupled*== MPI ~~activities*~~ ==*activities*== involving the communicator `comm`. A typical call might involve a [[versions/v50/API/MPI_COMM_DUP|MPI_COMM_DUP]] at the beginning of the parallel call, and an [[versions/v50/API/MPI_COMM_FREE|MPI_COMM_FREE]] of that duplicated communicator at the end of the call. Other models of communicator management are also possible. > > This call applies to both intra- and inter-communicators.

With an intra-communicator `comm`, a call to [[versions/v50/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] ==`(comm, group, newcomm)`== is equivalent to a call to [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ~~,~~ ==`(comm, color, key, newcomm)`,== where MPI processes that are members of their `group` argument provide a `color` argument equal to the number of the `group` (based on a unique numbering of all disjoint groups) and a `key` argument equal to their rank in `group`, and all MPI processes that are not members of their `group` argument provide a `color` argument equal to `MPI_UNDEFINED`. The value of `color` must be nonnegative or `MPI_UNDEFINED`.

> This is an extremely powerful mechanism for dividing a single communicating group of MPI processes into $`k`$ subgroups, with $`k`$ chosen implicitly by the user (by the number of colors asserted over all the MPI processes). Each resulting communicator will be nonoverlapping. Such a division could be useful for defining a hierarchy of computations, such as for multigrid, or linear algebra. For intra-communicators, [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] provides similar capability as [[versions/v50/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] to split a communicating group into disjoint subgroups. [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] is useful when some MPI processes do not have complete information of the other members in their group, but all MPI processes know (the color of) the group to which they belong. In this case, the MPI implementation discovers the other group members via communication. [[versions/v50/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is useful when all MPI processes have complete information of the members of their group. In this case, MPI can avoid the extra communication required to discover group membership. [[versions/v50/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] is useful when all MPI processes in a given group have complete information of the members of their group and synchronization with MPI processes outside the group can be avoided. > > Multiple calls to [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] can be used to overcome the requirement that any call have no overlap of the resulting communicators (each MPI process ~~is of~~ ==shall belong to== only one color per call). In this way, multiple overlapping communication structures can be created. Creative use of the `color` and `key` in such splitting operations is encouraged. > > Note that, for a fixed color, the keys need not be unique. It is [[versions/v50/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] ’s responsibility to sort MPI processes in ascending order according to this key, and to break ties in a consistent way. If all the keys are specified in the same way, then all the MPI processes in a given color will have the relative rank order as they did in their parent group.

==*Figure: MPI_COMM_SPLIT*==

~~*Figure: MPI_COMM_SPLIT*~~

The user explicitly constrains with the `info` argument the splitting of the input communicator `comm`. To this end, the info key `mpi_hw_resource_type` is reserved and its associated value is an implementation-defined string designating the type of the requested ~~hardware resource~~ ==hardware. It is strongly recommended that these strings follow the URI format described in Section [[versions/v50/sections/inquiry#Inquire Hardware Resource Information|Inquire Hardware Resource Information]]== (e.g., ~~“NUMANode”, “Package”~~ ==`hwloc://NUMANode`, `hwloc://Package`== or ~~“L3Cache”).~~ ==`hwloc://L3Cache`).==

~~(code block removed)~~
``` [MPI]C
MPI_Info info;
MPI_Comm hwcomm;
int      rank;

MPI_Comm_rank(MPI_COMM_WORLD, &rank);
MPI_Info_create(&info);
MPI_Info_set(info, "mpi_hw_resource_type", "NUMANode");
MPI_Comm_split_type(MPI_COMM_WORLD,
                    MPI_COMM_TYPE_HW_GUIDED,
                    rank, info, &hwcomm);
```

==(code block added)==
``` [MPI]C
MPI_Info info;
MPI_Comm hwcomm;
int      rank;

MPI_Comm_rank(MPI_COMM_WORLD, &rank);
MPI_Info_create(&info);
MPI_Info_set(info, "mpi_hw_resource_type", "hwloc://NUMANode");
MPI_Comm_split_type(MPI_COMM_WORLD,
                    MPI_COMM_TYPE_HW_GUIDED,
                    rank, info, &hwcomm);
```

~~(code block removed)~~
``` [MPI]C
MPI_Info info;
    MPI_Comm hwcomm;
    int      rank;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Info_create(&info);
    MPI_Info_set(info, "mpi_hw_resource_type", "NUMANode");
    MPI_Comm_split_type(MPI_COMM_WORLD,
                        MPI_COMM_TYPE_RESOURCE_GUIDED,
                        rank, info, &hwcomm);
```

==(code block added)==
``` [MPI]C
MPI_Info info;
    MPI_Comm hwcomm;
    int      rank;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Info_create(&info);
    MPI_Info_set(info, "mpi_hw_resource_type", "hwloc://NUMANode");
    MPI_Comm_split_type(MPI_COMM_WORLD,
                        MPI_COMM_TYPE_RESOURCE_GUIDED,
                        rank, info, &hwcomm);
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Communicator Constructors]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Communicator Constructors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Communicator Constructors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Communicator Constructors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Communicator Constructors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Communicator Constructors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Communicator Constructors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Communicator Constructors]]
