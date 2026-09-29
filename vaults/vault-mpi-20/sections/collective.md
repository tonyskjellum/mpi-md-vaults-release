6

# Extended Collective Operations



## Introduction

MPI-1 defined collective communication for intracommunicators and two routines, [[MPI_INTERCOMM_CREATE]] and [[MPI_COMM_DUP]] , for creating new intercommunicators. In addition, in order to avoid argument aliasing problems with Fortran, MPI-1 requires separate send and receive buffers for collective operations. MPI-2 introduces extensions of many of the MPI-1 collective routines to intercommunicators, additional routines for creating intercommunicators, and two new collective routines: a generalized all-to-all and an exclusive scan. In addition, a way to specify “in place” buffers is provided for many of the intracommunicator collective operations.

## Intercommunicator Constructors



The current MPI interface provides only two intercommunicator construction routines:

- [[MPI_INTERCOMM_CREATE]] , creates an intercommunicator from two intracommunicators,

- [[MPI_COMM_DUP]] , duplicates an existing intercommunicator (or intracommunicator).

The other communicator constructors, [[MPI_COMM_CREATE]] and [[MPI_COMM_SPLIT]] , currently apply only to intracommunicators. These operations in fact have well-defined semantics for intercommunicators .

In the following discussions, the two groups in an intercommunicator are called the *left* and *right* groups. A process in an intercommunicator is a member of either the left or the right group. From the point of view of that process, the group that the process is a member of is called the *local* group; the other group (relative to that process) is the *remote* group. The left and right group labels give us a way to describe the two groups in an intercommunicator that is not relative to any particular process (as the local and remote groups are).

In addition, the specification of collective operations (Section 4.1 of MPI-1)

requires that all collective routines are called with matching arguments. For the intercommunicator extensions, this is weakened to matching for all members of the same local group.



![[API/MPI_COMM_CREATE]]

The C and Fortran language bindings are identical to those in MPI-1, so are omitted here.

If `comm_in` is an intercommunicator, then the output communicator is also an intercommunicator where the local group consists only of those processes contained in `group` (see Figure [[collective#Intercommunicator Constructors|Intercommunicator Constructors]] ). The `group` argument should only contain those processes in the local group of the input intercommunicator that are to be a part of `comm_out`. If either `group` does not specify at least one process in the local group of the intercommunicator, or if the calling process is not included in the `group`, MPI_COMM_NULL is returned.

> [!tip] Rationale

> In the case where either the left or right group is empty, a null communicator is returned instead of an intercommunicator with MPI_GROUP_EMPTY because the side with the empty group must return MPI_COMM_NULL.

*Figure: Intercommunicator create using [[MPI_COMM_CREATE]] extended to intercommunicators. The input groups are those in the grey circle.*

The following example illustrates how the first node in the left side of an intercommunicator could be joined with all members on the right side of an intercommunicator to form a new intercommunicator.

            MPI_Comm  inter_comm, new_inter_comm;
            MPI_Group local_group, group;
            int       rank = 0; /* rank on left side to include in 
                                   new inter-comm */

            /* Construct the original intercommunicator: "inter_comm" */
            ...

            /* Construct the group of processes to be in new 
               intercommunicator */
            if (/* I'm on the left side of the intercommunicator */) {
              MPI_Comm_group ( inter_comm, &local_group );
              MPI_Group_incl ( local_group, 1, &rank, &group );
              MPI_Group_free ( &local_group );
            }
            else 
              MPI_Comm_group ( inter_comm, &group );

            MPI_Comm_create ( inter_comm, group, &new_inter_comm );
            MPI_Group_free( &group );

![[API/MPI_COMM_SPLIT]]

The C and Fortran language bindings are identical to those in MPI-1, so are omitted here.

The result of [[MPI_COMM_SPLIT]] on an intercommunicator is that those processes on the left with the same `color` as those processes on the right combine to create a new intercommunicator. The `key` argument describes the relative rank of processes on each side of the intercommunicator (see Figure [[collective#Intercommunicator Constructors|Intercommunicator Constructors]] ). For those colors that are specified only on one side of the intercommunicator, MPI_COMM_NULL is returned. MPI_COMM_NULL is also returned to those processes that specify MPI_UNDEFINED as the color.

*Figure: Intercommunicator construction achieved by splitting an existing intercommunicator with [[MPI_COMM_SPLIT]] extended to intercommunicators.*

(Parallel client-server model). The following client code illustrates how clients on the left side of an intercommunicator could be assigned to a single server from a pool of servers on the right side of an intercommunicator.

            /* Client code */
            MPI_Comm  multiple_server_comm;
            MPI_Comm  single_server_comm;
            int       color, rank, num_servers;
            
            /* Create intercommunicator with clients and servers: 
               multiple_server_comm */
            ...
            
            /* Find out the number of servers available */
            MPI_Comm_remote_size ( multiple_server_comm, &num_servers );
            
            /* Determine my color */
            MPI_Comm_rank ( multiple_server_comm, &rank );
            color = rank % num_servers;
            
            /* Split the intercommunicator */
            MPI_Comm_split ( multiple_server_comm, color, rank, 
                             &single_server_comm );

The following is the corresponding server code:

            /* Server code */
            MPI_Comm  multiple_client_comm;
            MPI_Comm  single_server_comm;
            int       rank;

            /* Create intercommunicator with clients and servers: 
               multiple_client_comm */
            ...
            
            /* Split the intercommunicator for a single server per group
               of clients */
            MPI_Comm_rank ( multiple_client_comm, &rank );
            MPI_Comm_split ( multiple_client_comm, rank, 0, 
                             &single_server_comm );  

## Extended Collective Operations

### Intercommunicator Collective Operations



In the MPI-1 standard (Section 4.2), collective operations only apply to

intracommunicators; however, most MPI collective operations can be generalized to intercommunicators. To understand how MPI can be extended, we can view most MPI intracommunicator collective operations as fitting one of the following categories (see, for instance, ):

All-To-All  
All processes contribute to the result. All processes receive the result.

- [[MPI_Allgather, MPI_Allgatherv]]

- [[MPI_Alltoall, MPI_Alltoallv]]

- [[MPI_Allreduce, MPI_Reduce_scatter]]

All-To-One  
All processes contribute to the result. One process receives the result.

- [[MPI_Gather, MPI_Gatherv]]

- [[MPI_Reduce]]

One-To-All  
One process contributes to the result. All processes receive the result.

- [[MPI_Bcast]]

- [[MPI_Scatter, MPI_Scatterv]]

Other  
Collective operations that do not fit into one of the above categories.

- [[MPI_Scan]]

- [[MPI_Barrier]]

The [[MPI_Barrier]] operation does not fit into this classification since no data is being moved (other than the implicit fact that a barrier has been called). The data movement pattern of [[MPI_Scan]] does not fit this taxonomy.

The extension of collective communication from intracommunicators to intercommunicators is best described in terms of the left and right groups.

For example, an all-to-all [[MPI_Allgather]] operation can be described as collecting data from all members of one group with the result appearing in all members of the other group (see Figure [[collective#Intercommunicator Collective Operations|Intercommunicator Collective Operations]] ). As another example, a one-to-all [[MPI_Bcast]] operation sends data from one member of one group to all members of the other group. Collective computation operations such as [[MPI_REDUCE_SCATTER]] have a similar interpretation (see Figure [[collective#Intercommunicator Collective Operations|Intercommunicator Collective Operations]] ).

For intracommunicators, these two groups are the same. For intercommunicators, these two groups are distinct. For the all-to-all operations, each such operation is described in two phases, so that it has a symmetric, full-duplex behavior.

For MPI-2, the following intracommunicator collective operations also apply to intercommunicators:

- [[MPI_BCAST,]]

- [[MPI_GATHER, MPI_GATHERV,]]

- [[MPI_SCATTER, MPI_SCATTERV,]]

- [[MPI_ALLGATHER, MPI_ALLGATHERV,]]

- [[MPI_ALLTOALL, MPI_ALLTOALLV, MPI_ALLTOALLW]]

- [[MPI_REDUCE, MPI_ALLREDUCE,]]

- [[MPI_REDUCE_SCATTER,]]

- [[MPI_BARRIER.]]

( [[MPI_ALLTOALLW]] is a new function described in Section [[collective#Generalized All-to-all Function|Generalized All-to-all Function]] .)

These functions use exactly the same argument list as their MPI-1 counterparts and also work on intracommunicators, as expected. No new language bindings are consequently needed for Fortran or C.

However, in C++, the bindings have been "relaxed"; these member functions have been moved from the `MPI::Intercomm` class to the `MPI::Comm` class. But since the collective operations do not make sense on a C++ `MPI::Comm` (since it is neither an intercommunicator nor an intracommunicator), the functions are all pure virtual. In an MPI-2 implementation, the bindings in this chapter supersede the corresponding bindings for MPI-1.2.

*Figure: Intercommunicator allgather. The focus of data to one process is represented, not mandated by the semantics. The two phases do allgathers in both directions.*

*Figure: Intercommunicator reduce-scatter. The focus of data to one process is represented, not mandated by the semantics. The two phases do reduce-scatters in both directions.*

### Operations that Move Data

Two additions are made to many collective communication calls:

- Collective communication can occur “in place” for intracommunicators, with the output buffer being identical to the input buffer. This is specified by providing a special argument value, MPI_IN_PLACE, instead of the send buffer or the receive buffer argument.

  > [!tip] Rationale

  > The “in place” operations are provided to reduce unnecessary memory motion by both the MPI implementation and by the user. Note that while the simple check of testing whether the send and receive buffers have the same address will work for some cases (e.g., [[MPI_ALLREDUCE]] ), they are inadequate in others (e.g., [[MPI_GATHER]] , with root not equal to zero). Further, Fortran explicitly prohibits aliasing of arguments; the approach of using a special value to denote “in place” operation eliminates that difficulty.

  > [!note] Advice to users

  > By allowing the “in place” option, the receive buffer in many of the collective calls becomes a send-and-receive buffer. For this reason, a Fortran binding that includes `INTENT` must mark these as `INOUT`, not `OUT`.
  >
  > Note that `MPI_IN_PLACE` is a special kind of value; it has the same restrictions on its use that MPI_BOTTOM has.
  >
  > Some intracommunicator collective operations do not support the “in place” option (e.g., [[MPI_ALLTOALLV]] ).

- Collective communication applies to intercommunicators. If the operation is rooted (e.g., broadcast, gather, scatter), then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument.

  In this case, for the group containing the root process, all processes in the group must call the routine using a special argument for the root. The root process uses the special root value MPI_ROOT; all other processes in the same group as the root use MPI_PROC_NULL. All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root.

  If the operation is unrooted (e.g., alltoall), then the transfer is bidirectional.

  Note that the “in place” option for intracommunicators does not apply to intercommunicators since in the intercommunicator case there is no communication from a process to itself.

> [!tip] Rationale

> Rooted operations are unidirectional by nature, and there is a clear way of specifying direction. Non-rooted operations, such as all-to-all, will often occur as part of an exchange, where it makes sense to communicate in both directions at once.

In the following, the definitions of the collective routines are provided to enhance the readability and understanding of the associated text. They do not change the definitions of the argument lists from MPI-1. The C and Fortran language bindings for these routines are unchanged from MPI-1, and are not repeated here. Since new C++ bindings for the intercommunicator versions are required, they are included. The text provided for each routine is appended to the definition of the routine in MPI-1.

#### Broadcast



![[API/MPI_BCAST]]

The “in place” option is not meaningful here.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is broadcast from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

#### Gather

![[API/MPI_GATHER]]

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

![[API/MPI_GATHERV]]

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

#### Scatter

![[API/MPI_SCATTER]]

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

![[API/MPI_SCATTERV]]

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

#### “All” Forms and All-to-all

![[API/MPI_ALLGATHER]]

The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer. Specifically, the outcome of a call to [[MPI_ALLGATHER]] in the “in place” case is as if all processes executed $`n`$ calls to

        MPI_GATHER( MPI_IN_PLACE, 0, MPI_DATATYPE_NULL, recvbuf, recvcount, 
                                     recvtype, root, comm )

for `root = 0, ..., n - 1`.

If `comm` is an intercommunicator, then each process in group A contributes a data item; these items are concatenated and the result is stored at each process in group B. Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

> [!note] Advice to users

> The communication pattern of [[MPI_ALLGATHER]] executed on an intercommunication domain need not be symmetric. The number of items sent by processes in group A (as specified by the arguments `sendcount, sendtype` in group A and the arguments `recvcount, recvtype` in group B), need not equal the number of items sent by processes in group B (as specified by the arguments `sendcount, sendtype` in group B and the arguments `recvcount, recvtype` in group A). In particular, one can move data in only one direction by specifying `sendcount = 0` for the communication in the reverse direction.

![[API/MPI_ALLGATHERV]]

The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer. Specifically, the outcome of a call to [[MPI_ALLGATHER]] in the “in place” case is as if all processes executed $`n`$ calls to

        MPI_GATHERV( MPI_IN_PLACE, 0, MPI_DATATYPE_NULL, recvbuf, recvcounts, 
                                     displs, recvtype, root, comm )

for `root = 0, ..., n - 1`.

If `comm` is an intercommunicator, then each process in group A contributes a data item; these items are concatenated and the result is stored at each process in group B. Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

![[API/MPI_ALLTOALL]]

No “in place” option is supported.

If `comm` is an intercommunicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The $`j`$-th send buffer of process $`i`$ in group A should be consistent with the $`i`$-th receive buffer of process $`j`$ in group B, and vice versa.

> [!note] Advice to users

> When all-to-all is executed on an intercommunication domain, then the number of data items sent from processes in group A to processes in group B need not equal the number of items sent in the reverse direction. In particular, one can have unidirectional communication by specifying `sendcount = 0` in the reverse direction.

![[API/MPI_ALLTOALLV]]

No “in place” option is supported.

If `comm` is an intercommunicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The $`j`$-th send buffer of process $`i`$ in group A should be consistent with the $`i`$-th receive buffer of process $`j`$ in group B, and vice versa.

### Reductions

![[API/MPI_REDUCE]]

The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at the root. In such case, the input data is taken at the root from the receive buffer, where it will be replaced by the output data.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Only send buffer arguments are significant in group B and only receive buffer arguments are significant at the root.

![[API/MPI_ALLREDUCE]]

The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at the root. In such case, the input data is taken at each process from the receive buffer, where it will be replaced by the output data.

If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in group A is stored at each process in group B, and vice versa. Both groups should provide the same `count` value.

![[API/MPI_REDUCE_SCATTER]]

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the top of the receive buffer. Note that the area occupied by the input data may be either longer or shorter than the data filled by the output data.

If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in group A is scattered among processes in group B, and vice versa. Within each group, all processes provide the same `recvcounts` argument, and the sum of the `recvcounts` entries should be the same for the two groups.

> [!tip] Rationale

> The last restriction is needed so that the length of the send buffer can be determined by the sum of the local `recvcounts` entries. Otherwise, a communication is needed to figure out how many elements are reduced.

### Other Operations

![[API/MPI_BARRIER]]

For MPI-2, `comm` may be an intercommunicator or an intracommunicator. If `comm` is an intercommunicator, the barrier is performed across all processes in the intercommunicator. In this case, all processes in the local group of the intercommunicator may exit the barrier when all of the processes in the remote group have entered the barrier.

![[API/MPI_SCAN]]

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer, and replaced by the output data.

This operation is illegal for intercommunicators.

### Generalized All-to-all Function



One

of the basic data movement operations needed in parallel signal processing is the 2-D matrix transpose. This operation has motivated a generalization of the [[MPI_ALLTOALLV]] function. This new collective operation is [[MPI_ALLTOALLW]] ; the “W” indicates that it is an extension to [[MPI_ALLTOALLV]] .

The following function is the most general form of `All-to-all`. Like [[MPI_TYPE_CREATE_STRUCT]] , the most general type constructor, [[MPI_ALLTOALLW]] allows separate specification of count, displacement and datatype. In addition, to allow maximum flexibility, the displacement of blocks within the send and receive buffers is specified in bytes.

> [!tip] Rationale

> The [[MPI_ALLTOALLW]] function generalizes several MPI functions by carefully selecting the input arguments. For example, by making all but one process have `sendcounts[i] = 0`, this achieves an `MPI_SCATTERW` function.

![[API/MPI_ALLTOALLW]]

No “in place” option is supported.

The $`j`$-th block sent from process $`i`$ is received by process $`j`$ and is placed in the $`i`$-th block of `recvbuf`. These blocks need not all have the same size.

The type signature associated with `sendcounts[j], sendtypes[j]` at process $`i`$ must be equal to the type signature associated with `recvcounts[i], recvtypes[i]` at process $`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of processes. Distinct type maps between sender and receiver are still allowed.

The outcome is as if each process sent a message to every other process with
``` math
MPI_Send(sendbuf+sdispls[i],sendcounts[i],sendtypes[i] ,i,...),
```
and received a message from every other process with a call to
``` math
MPI_Recv(recvbuf+rdispls[i],recvcounts[i],recvtypes[i] ,i,...).
```

All arguments on all processes are significant. The argument `comm` must describe the same communicator on all processes.

If `comm` is an intercommunicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The $`j`$-th send buffer of process $`i`$ in group A should be consistent with the $`i`$-th receive buffer of process $`j`$ in group B, and vice versa.

### Exclusive Scan

MPI-1 provides an inclusive scan operation. The exclusive scan is described here.

![[API/MPI_EXSCAN]]

[[MPI_EXSCAN]] is used to perform a prefix reduction on data distributed across the group. The value in `recvbuf` on the process with rank 0 is undefined, and `recvbuf` is not signficant on process 0. The value in `recvbuf` on the process with rank 1 is defined as the value in `sendbuf` on the process with rank 0. For processes with rank $`i > 1`$, the operation returns, in the receive buffer of the process with rank $`i`$, the reduction of the values in the send buffers of processes with ranks $`0,...,i-1`$ (inclusive). The type of operations supported, their semantics, and the constraints on send and receive buffers, are as for [[MPI_REDUCE]] .

No “in place” option is supported.

> [!note] Advice to users

> As for [[MPI_SCAN]] , MPI does not specify which processes may call the operation, only that the result be correctly computed. In particular, note that the process with rank 1 need not call the `MPI_Op`, since all it needs to do is to receive the value from the process with rank 0. However, all processes, even the processes with ranks zero and one, must provide the same `op`.

> [!tip] Rationale

> The exclusive scan is more general than the inclusive scan provided in MPI-1 as [[MPI_SCAN]] . Any inclusive scan operation can be achieved by using the exclusive scan and then locally combining the local contribution. Note that for non-invertable operations such as [[MPI_MAX]] , the exclusive scan cannot be computed with the inclusive scan.
>
> The reason that MPI-1 chose the inclusive scan is that the definition of behavior on processes zero and one was thought to offer too many complexities in definition, particularly for user-defined operations.
