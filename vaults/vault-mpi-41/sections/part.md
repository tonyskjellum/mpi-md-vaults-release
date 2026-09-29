# Partitioned Point-to-Point Communication



## Introduction

 Partitioned communication extends persistent point-to-point communication as defined in Chapter [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] . Partitioned communication operations are matched based on the order in which the local initialization calls are performed. Partitioned communication is “partitioned” because it allows for multiple contributions of data to be made, potentially, from multiple actors (e.g., threads or tasks) in an MPI process to a single communication operation.

> [!note] Advice to users

> The techniques of partitioned communication were known as “finepoints” before their adoption into the MPI standard. We refer the interested reader to the original literature describing the design goals, functioning, initial implementation and performance improvements .

Partitioned communication operations use a persistent communication style that involves a sequence of start and test or wait operations. For this sequence, partitioned communications use [[MPI_START]] or [[MPI_STARTALL]] calls and completion mechanisms (e.g., [[MPI_TEST]] or [[MPI_WAIT]] ). Partitioned communication is different in three fundamental ways from persistent point-to-point operations in MPI. First, partitioned communication allows additional partitioned test function calls that can expose partial completion of the operation. Second, partitioned communication may perform all of the initialization required to enable data transfer as early as its initialization phase. Third, partitioned communication allows for MPI to be independently notified of multiple contributions from the send-side to a single data buffer of a single MPI message.

> [!tip] Rationale

> The rationale behind having different initialization behavior allowed for partitioned communication as opposed to persistent point-to-point communication is to enable flexibility and optimization possibilities in implementations. Buffer setup can occur in the partitioned communication initialization functions (see Section [[part#Communication Initialization and Starting with Partitioning|Communication Initialization and Starting with Partitioning]] ). However, such negotiation can be deferred until data is to be moved between two processes. This means that partitioned communication can lazily negotiate as late as testing for completion of the operation on the first iteration of a sequence of partitioned communication start and test or wait operations. Matching still occurs as if matching happened at the partitioned communication initialization functions as noted in the function descriptions.

## Semantics of Partitioned Point-to-Point Communication

 MPI guarantees certain general properties of partitioned point-to-point communication progress, which are described in this section.

Persistent communications use opaque `MPI_REQUEST` objects as described in Section [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] . Partitioned communication uses these same semantics for `MPI_REQUEST` objects.

Partitioned communication provides fine-grained transfers on either or both sides of a send-receive operation described by requests. Persistent communication semantics are ideal for partitioned communication: they provide [[MPI_PSEND_INIT]] and [[MPI_PRECV_INIT]] functions that allow partitioned communication setup to occur prior to message transfers. Partitioned communication initialization functions are local. The partitioned communication initialization includes inputs on the number of user-visible partitions on the send-side and receive-side, which may differ. Valid partitioned communication operations must have one or more partitions specified.

Once an [[MPI_PSEND_INIT]] call has been made, the user may start the operation with a call to a starting procedure and complete the operation with a number of [[MPI_PREADY]] calls equal to the requested number of send partitions followed by a call to a completing procedure. A call to [[MPI_PREADY]] notifies the MPI library that a specified portion of the data buffer (a specific partition) is ready to be sent. Notification of partial completion can be done via fine-grained [[MPI_PARRIVED]] calls at the receiver before a final [[MPI_TEST]] / [[MPI_WAIT]] on the request itself; the latter represents overall operation completion upon success. A full set of methods for starting and completing partitioned communication is given in the following sections.

> [!note] Advice to users

> Having a large number of receiver-side partitions can increase overheads as the completion mechanism may need to work with finer-grained notifications. Using a small number of receiver-side partitions *may* provide higher performance.
>
> A large number of sender-side partitions may be aggregated by an MPI implementation, making performance concerns of a large number of sender-side partitions potentially less impactful than receiver-side granularity.

> [!warning] Advice to implementors

> It is expected that an MPI implementation will attempt to balance latency and aggregation for data transfers for the requested partition counts on the sender-side and receiver-side to allow optimization for different hardware. A high quality implementation may perform significant optimizations to enhance performance in this way; they may, for example, resize the data transfers of the partitions to combine partitions in fractional partition sizes (e.g., 2.5 partitions in a single data transfer).

Example [[part-example1]] shows a simple partitioned transfer in which the sender-side and receiver-side partitioning is identical in partition count.

Simple partitioned communication example.

``` [MPI]C
#include <stdlib.h>
#include "mpi.h"
#define PARTITIONS 8
#define COUNT 5
int main(int argc, char *argv[])
{
  double message[PARTITIONS*COUNT];
  MPI_Count partitions = PARTITIONS;
  int source = 0, dest = 1, tag = 1, flag = 0;
  int myrank, i;
  int provided;
  MPI_Request request;
  MPI_Init_thread(&argc, &argv, MPI_THREAD_SERIALIZED, &provided);
  if (provided < MPI_THREAD_SERIALIZED)
     MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
  MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
  if (myrank == 0)
  {
     MPI_Psend_init(message, partitions, COUNT, MPI_DOUBLE, dest, tag,
                    MPI_COMM_WORLD, MPI_INFO_NULL, &request);
     MPI_Start(&request);
     for(i = 0; i < partitions; ++i)
     {
        /* compute and fill partition #i, then mark ready: */
        MPI_Pready(i, request);
     }
     while(!flag)
     {
        /* do useful work #1 */
        MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
        /* do useful work #2 */
     }
     MPI_Request_free(&request);
  }
  else if (myrank == 1)
  {
     MPI_Precv_init(message, partitions, COUNT, MPI_DOUBLE, source, tag,
                    MPI_COMM_WORLD, MPI_INFO_NULL, &request);
     MPI_Start(&request);
     while(!flag)
     {
        /* do useful work #1 */
        MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
        /* do useful work #2 */
     }
     MPI_Request_free(&request);
  }
  MPI_Finalize();
  return 0;
}
```

> [!tip] Rationale

> Partitioned communication is designed to provide opportunities for MPI implementations to optimize data transfers. MPI is free to choose how many transfers to do within a partitioned communication send independent of how many partitions are reported as ready to MPI through [[MPI_PREADY]] calls. Aggregation of partitions is permitted but not required. Ordering of partitions is permitted but not required. A naive implementation can simply wait for the entire message buffer to be marked ready before any transfer(s) occur and could wait until the completion function is called on a request before transferring data. However, this modality of communication gives MPI implementations far more flexibility in data movement than nonpartitioned communications.

### Communication Initialization and Starting with Partitioning



Initialization of partitioned communication operations use the initialization calls described below. Subsequent to initialization, [[MPI_START]] / [[MPI_STARTALL]] are used as the first indication to MPI that a message transfer will occur. For send-side operations, neither initializing nor starting the operation enables transfer of any part of the user buffer. Freeing or canceling a partitioned communication request that is active (i.e., initialized and started) and not completed is erroneous. After the partitioned communication operation is started, individual partitions of a message are indicated as ready to be sent by MPI via the [[MPI_PREADY]] function, described below.

![[API/MPI_PSEND_INIT]]

[[MPI_PSEND_INIT]] creates a partitioned communication request and binds to it all the arguments of a partitioned send operation. Matching follows the same MPI matching rules as for point-to-point communication (see Chapter [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] ) with communicator, tag, and source dictating message matching. In the event that the communicator, tag, and source do not uniquely identify a message, the order in which partitioned communication *initialization* calls are made is the order in which they will eventually match. This operation can only match with partitioned communication initialization operations, therefore it is required to be matched with a corresponding [[MPI_PRECV_INIT]] call. Partitioned communication initialization calls are local. It is erroneous to provide a `partitions` value $`\le 0`$. Send-side and receive-side buffers must be identical in size.

> [!warning] Advice to implementors

> Unlike [[MPI_SEND_INIT]] , [[MPI_PSEND_INIT]] can be matched as early as the initialization call. Also, unlike [[MPI_SEND_INIT]] , [[MPI_PSEND_INIT]] takes an info argument.

![[API/MPI_PRECV_INIT]]

> [!tip] Rationale

> The info argument is provided in order to support per-operation implementation-/defined info keys.

[[MPI_PRECV_INIT]] creates a partitioned communication receive request and binds to it all the arguments of a partitioned receive operation. This operation can only match with partitioned communication initialization operations, therefore the MPI library is required to match [[MPI_PRECV_INIT]] calls only with a corresponding [[MPI_PSEND_INIT]] call. Matching follows the same MPI matching rules as for point-to-point communication (see Chapter [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] ) with communicator, tag, and source dictating message matching. In the event that the communicator, tag, and source do not uniquely identify a message, the order in which partitioned communication initialization calls are made is the order in which they will eventually match. Partitioned communication initialization calls are local. That is, [[MPI_PRECV_INIT]] may return before the operation completes. It is erroneous to provide a `partitions` value $`\le 0`$. Wildcards for source and tag are not allowed.

> [!warning] Advice to implementors

> Unlike [[MPI_RECV_INIT]] , [[MPI_PRECV_INIT]] may communicate. Also unlike [[MPI_RECV_INIT]] , [[MPI_PRECV_INIT]] takes an info argument.

![[API/MPI_PREADY]]

[[MPI_PREADY]] is a send-side call that indicates that a given `partition` is ready to be transferred. It is erroneous to use [[MPI_PREADY]] on any request object that does not correspond to a partitioned send operation. The partitioning is defined by the [[MPI_PSEND_INIT]] call. Partition numbering starts at zero and ranges to one less than the number of partitions declared in the [[MPI_PSEND_INIT]] call. Specifying a partition number that is equal to or larger than the number of partitions is erroneous. After a call to [[MPI_START]] / [[MPI_STARTALL]] , all partitions associated with that operation are inactive. A call to [[MPI_PREADY]] marks the indicated partition as active. Calling [[MPI_PREADY]] on an active partition is erroneous.

![[API/MPI_PREADY_RANGE]]

A call to [[MPI_PREADY_RANGE]] has the same effect as calls to [[MPI_PREADY]] , executed for `i=partition_low, `$`...`$`, partition_high`, in some arbitrary order. Calls to [[MPI_PREADY_RANGE]] follow the same rules as those for [[MPI_PREADY]] calls.

![[API/MPI_PREADY_LIST]]

A call to [[MPI_PREADY_LIST]] has the same effect as calls to [[MPI_PREADY]] , executed for the partitions specified in the range $`array_of_partitions[0]`$` ,`$`...`$`, `$`array_of_partitions[count-1]`$ of the `array_of_partitions`, executed in some arbitrary order. Calls to [[MPI_PREADY_LIST]] follow the same rules as those for [[MPI_PREADY]] calls.

### Communication Completion under Partitioning



The functions [[MPI_WAIT]] and [[MPI_TEST]] (and variants) are used to complete a partitioned communication operation. The completion of a partitioned send operation indicates that the sender is now free to call [[MPI_START]] / [[MPI_STARTALL]] to restart the operation and subsequently [[MPI_PREADY]] , [[MPI_PREADY_RANGE]] or [[MPI_PREADY_LIST]] . Alternatively, the user can safely free the partitioned communication request after the completion of the partitioned operation. For the sending process, completion of the partitioned send operation does not indicate that the partitions of the message have all been received.

The completion of a partitioned receive operation through [[MPI_WAIT]] or [[MPI_TEST]] indicates that the receive buffer contains all of the partitions. A function for probing the partial reception of the receive buffer is provided by [[MPI_PARRIVED]] . The [[MPI_PARRIVED]] function can be used to determine if the message data for the indicated partition has been received into the receive buffer. Upon success, the receiver becomes free to access the indicated partition (as well as any others that previously completed for that operation).

![[API/MPI_PARRIVED]]

The function [[MPI_PARRIVED]] can be used to test partial completion of partitioned receive operations. A call to [[MPI_PARRIVED]] on an active partitioned communication request returns `flag``= true` if the operation identified by `request` for the specified `partition` is complete. The request is not marked as complete/inactive by this procedure. A subsequent call to an MPI completing procedure (e.g., [[MPI_TEST]] / [[MPI_WAIT]] ) is required to complete the operation, as described in Chapter [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] . [[MPI_PARRIVED]] may be called multiple times for a partition. [[MPI_PARRIVED]] may be called with a null or inactive `request` argument. In either case, the operation returns with `flag = true`. Calling [[MPI_PARRIVED]] on a request that does not correspond to a partitioned receive operation is erroneous.

Repeated calls to [[MPI_PARRIVED]] with the same `request` and `partition` arguments will eventually return `flag``= true` if the corresponding partitioned send operation has been started and all send partitions have been marked as ready. For additional information on MPI *progress* see [[Sections]] subsec:terms:progress [[and]] subsec:pt2pt-semantics.

> [!warning] Advice to implementors

> A high quality implementation will eventually return `flag``= true` from [[MPI_PARRIVED]] after all of the corresponding [[MPI_PREADY]] calls have been made for a receive-side partition, even if other send partitions are not yet marked as ready.

### Semantics of Communications in Partitioned Mode



The semantics of nonblocking partitioned communication are defined by suitably extending the definitions in Section [[pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] .

**Interpretation of count and datatype for partitioned communication.** Partitioned communication uses the `count` and `datatype` arguments in the partitioned communication initialization functions to describe a single partition. The argument `partitions` specifies how many equal partitions of a number (`count`) of objects of `datatype`s make up the entire buffer to be transferred in the partitioned communication. As partitioned communication describes many partitions, using absolute displacements in datatypes (e.g., `MPI_BOTTOM`) is not supported. Partitions are contiguous in memory, there is no padding in between them. Once a partitioned send operation is started, each partition must be marked as ready using [[MPI_PREADY]] and the operation must be completed using a completion function, such as [[MPI_TEST]] or [[MPI_WAIT]] .

**Order.** Matching follows the same MPI matching rules as for point-to-point communication (see Chapter [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] ) with communicator, tag, and source dictating message matching. In the event that the communicator, tag, and source do not uniquely identify the message, the order in which partitioned communication initialization calls are made is the order in which they will eventually match.

## Partitioned Communication Examples

 This section provides concrete examples of the utility of partitioned communication in realistic settings.

### Partition Communication with Threads/Tasks Using OpenMP 4.0 or later

 The equal partitioning on send-side and receive-side in Example [[part-example1]] is shown using threads. In this case, the receive-side uses the same number of partitions as the send-side as in the previous example, but this example uses multiple threads on the send-side. Note that the [[MPI_PSEND_INIT]] and [[MPI_PRECV_INIT]] functions match each other like in the previous example.

Equal partitioning on send-side and receive-side using threads.

``` [MPI]C
#include <stdlib.h>
#include "mpi.h"
#define NUM_THREADS 8
#define PARTITIONS 8
#define PARTLENGTH 16
int main(int argc, char *argv[]) /* same send/recv partitioning */
{
  double message[PARTITIONS*PARTLENGTH];
  int partitions = PARTITIONS;
  int partlength = PARTLENGTH;
  int count = 1, source = 0, dest = 1, tag = 1, flag = 0;
  int myrank;
  int provided;
  MPI_Request request;
  MPI_Info info = MPI_INFO_NULL;
  MPI_Datatype xfer_type;
  MPI_Init_thread(&argc, &argv, MPI_THREAD_MULTIPLE, &provided);
  if (provided < MPI_THREAD_MULTIPLE)
     MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
  MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
  MPI_Type_contiguous(partlength, MPI_DOUBLE, &xfer_type);
  MPI_Type_commit(&xfer_type);
  if (myrank == 0)
  {
     MPI_Psend_init(message, partitions, count, xfer_type, dest, tag,
                    MPI_COMM_WORLD, info, &request);
     MPI_Start(&request);

     #pragma omp parallel for shared(request) num_threads(NUM_THREADS)
     for (int i=0; i<partitions; i++)
     {
        /* compute and fill partition #i, then mark ready: */
        MPI_Pready(i, request);
     }
     while(!flag)
     {
        /* Do useful work */
        MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
        /* Do useful work */
     }
     MPI_Request_free(&request);
  }
  else if (myrank == 1)
  {
     MPI_Precv_init(message, partitions, count, xfer_type, source, tag,
                    MPI_COMM_WORLD, info, &request);
     MPI_Start(&request);
     while(!flag)
     {
        /* Do useful work */
        MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
        /* Do useful work */
     }
     MPI_Request_free(&request);
  }
  MPI_Finalize();
  return 0;
}
```

### Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later

The previous example is tailored specifically for send-side partitioning using threads. This is an example where parallel task producers produce input to part of an overall buffer; they complete in any order and contribute to the overall buffer.

Parallel task producers for partitioned communication using threads.

    [language={[MPI]C},basicstyle=]
    #include <stdlib.h>
    #include "mpi.h"
    #define NUM_THREADS 8
    #define NUM_TASKS 64
    #define PARTITIONS NUM_TASKS
    #define PARTLENGTH 16
    #define MESSAGE_LENGTH PARTITIONS*PARTLENGTH
    int main(int argc, char *argv[]) /* send-side partitioning */
    {
      double message[MESSAGE_LENGTH];
      int send_partitions = PARTITIONS,
          send_partlength = PARTLENGTH,
          recv_partitions = 1,
          recv_partlength = PARTITIONS*PARTLENGTH;
      int count = 1, source = 0, dest = 1, tag = 1, flag = 0;
      int myrank;
      int provided;
      MPI_Request request;
      MPI_Info info = MPI_INFO_NULL;
      MPI_Datatype send_type;
      MPI_Init_thread(&argc, &argv, MPI_THREAD_MULTIPLE, &provided);
      if (provided < MPI_THREAD_MULTIPLE)
         MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
      MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
      MPI_Type_contiguous(send_partlength, MPI_DOUBLE, &send_type);
      MPI_Type_commit(&send_type);

      if (myrank == 0)
      {
         MPI_Psend_init(message, send_partitions, count, send_type, dest, tag,
                        MPI_COMM_WORLD, info, &request);
         MPI_Start(&request);

         #pragma omp parallel shared(request) num_threads(NUM_THREADS)
         {
            #pragma omp single
            {
               /* single thread creates 64 tasks to be executed by 8 threads */
               for (int partition_num=0;partition_num<NUM_TASKS;partition_num++)
               {
                  #pragma omp task firstprivate(partition_num)
                  {
                     /* compute and fill partition #partition_num, then mark
                     ready: */
                     /* buffer is filled in arbitrary order from each task */
                     MPI_Pready(partition_num, request);
                  } /*end task*/
               } /* end for */
            } /* end single */
         } /* end parallel */
         while(!flag)
         {
            /* Do useful work */
            MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
            /* Do useful work */
         }
         MPI_Request_free(&request);
      }
      else if (myrank == 1)
      {
         MPI_Precv_init(message, recv_partitions, recv_partlength, MPI_DOUBLE,
                        source, tag, MPI_COMM_WORLD, info, &request);

         MPI_Start(&request);
         while(!flag)
         {
            /* Do useful work */
            MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
            /* Do useful work */
         }
         MPI_Request_free(&request);
      }
      MPI_Finalize();
      return 0;
    }

### Send and Receive Partitioning Example with OpenMP version 4.0 or later

This example demonstrates receive-side partial completion notification using more than one partition per receive-side thread. It uses a naive flag based method to test for multiple completed partitions per thread. Note that this means that some threads may be busy polling for completion of assigned partitions when partitions are available to work on that were not assigned to the polling threads in this example. More advanced work stealing methods could be employed for greater efficiency. Like previous examples, it also demonstrates send-side production of input to part of an overall buffer. This example also uses different send-side and receive-side partitioning.



Partitioned communication receive-side partial completion.\

``` [MPI]C
#include <stdlib.h>
#include "mpi.h"
#define NUM_THREADS 64
#define PARTITIONS NUM_THREADS
#define PARTLENGTH 16
#define MESSAGE_LENGTH PARTITIONS*PARTLENGTH
int main(int argc, char *argv[]) /* send-side partitioning */
{
  double message[MESSAGE_LENGTH];
  int send_partitions = PARTITIONS,
      send_partlength = PARTLENGTH,
      recv_partitions = PARTITIONS*2,
      recv_partlength = PARTLENGTH/2;
  int source = 0, dest = 1, tag = 1, flag = 0;
  int myrank;
  int provided;
  MPI_Request request;
  MPI_Info info = MPI_INFO_NULL;
  MPI_Datatype send_type;
  MPI_Init_thread(&argc, &argv, MPI_THREAD_MULTIPLE, &provided);
  if (provided < MPI_THREAD_MULTIPLE)
     MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);
  MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
  MPI_Type_contiguous(send_partlength, MPI_DOUBLE, &send_type);
  MPI_Type_commit(&send_type);

  if (myrank == 0)
  {
     MPI_Psend_init(message, send_partitions, 1, send_type, dest, tag,
                    MPI_COMM_WORLD, info, &request);
     MPI_Start(&request);
     #pragma omp parallel for shared(request) \
                              firstprivate(send_partitions) \
                              num_threads(NUM_THREADS)
     for (int i=0; i<send_partitions; i++)
     {
        /* compute and fill partition #i, then mark ready: */
        MPI_Pready(i, request);
     }
     while(!flag)
     {
        /* Do useful work */
        MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
        /* Do useful work */
     }
     MPI_Request_free(&request);
  }
  else if (myrank == 1)
  {
     MPI_Precv_init(message, recv_partitions, recv_partlength,
                    MPI_DOUBLE, source, tag, MPI_COMM_WORLD, info,
                    &request);
     MPI_Start(&request);
     #pragma omp parallel for shared(request) \
                              firstprivate(recv_partitions) \
                              num_threads(NUM_THREADS)
     for (int j=0; j<recv_partitions; j+=2)
     {
        int part_flag = 0;
        int part1_complete = 0;
        int part2_complete = 0;
        while(part1_complete == 0 || part2_complete == 0)
        {
           /* test partition #j and #j+1 */
           MPI_Parrived(request, j, &part_flag);
           if(part_flag && part1_complete == 0)
           {
              part1_complete++;
              /* Do work using partition j data */
           }
           MPI_Parrived(request, j+1, &part_flag);
           if(part_flag && part2_complete == 0)
           {
              part2_complete++;
              /* Do work using partition j+1 */
           }
        }
     }
     while(!flag)
     {
        /* Do useful work */
        MPI_Test(&request, &flag, MPI_STATUS_IGNORE);
        /* Do useful work */
     }
     MPI_Request_free(&request);
  }
  MPI_Finalize();
  return 0;
}
```

