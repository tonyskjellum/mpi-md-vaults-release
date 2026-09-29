---
title: "Semantics of Partitioned Point-to-Point Communication"
chapter: part
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/part]
---

# Semantics of Partitioned Point-to-Point Communication

Chapter **part** · in [[versions/v40/sections/part#Semantics of Partitioned Point-to-Point Communication|MPI-4.0]], [[versions/v41/sections/part#Semantics of Partitioned Point-to-Point Communication|MPI-4.1]], [[versions/v50/sections/part#Semantics of Partitioned Point-to-Point Communication|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~    #include "mpi.h"     #define PARTITIONS 8     #define COUNT 5     int main(int argc, char *argv[])     {       double message[PARTITIONS*COUNT];       MPI_Count partitions = PARTITIONS;       int source = 0, dest = 1, tag = 1, flag = 0;       int myrank, i;       int provided;       MPI_Request request;       MPI_Init_thread(&argc, &argv, MPI_THREAD_SERIALIZED, &provided);       if (provided < MPI_THREAD_SERIALIZED)          MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);       MPI_Comm_rank(MPI_COMM_WORLD, &myrank);       if (myrank == 0)       {          MPI_Psend_init(message, partitions, COUNT, MPI_DOUBLE, dest, tag,                    MPI_COMM_WORLD, MPI_INFO_NULL, &request);          MPI_Start(&request);          for(i = 0; i < partitions; ++i)          {             /* compute and fill partition #i, then mark ready: */             MPI_Pready(i, request);          }          while(!flag)          {             /* do useful work #1 */             MPI_Test(&request, &flag, MPI_STATUS_IGNORE);             /* do useful work #2 */          }          MPI_Request_free(&request);       }       else if (myrank == 1)       {          MPI_Precv_init(message, partitions, COUNT, MPI_DOUBLE, source, tag,                    MPI_COMM_WORLD, MPI_INFO_NULL, &request);          MPI_Start(&request);          while(!flag)          {             /* do useful work #1 */             MPI_Test(&request, &flag, MPI_STATUS_IGNORE);             /* do useful work #2 */          }          MPI_Request_free(&request);       }       MPI_Finalize();       return 0;     }~~

==(code block added)==
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

> Partitioned communication is designed to provide opportunities for MPI implementations to optimize data transfers. MPI is free to choose how many transfers to do within a partitioned communication send independent of how many partitions are reported as ready to MPI through [[versions/v41/API/MPI_PREADY|MPI_PREADY]] calls. Aggregation of partitions is permitted but not required. Ordering of partitions is permitted but not required. A naive implementation can simply wait for the entire message buffer to be marked ready before any transfer(s) occur and could wait until the completion function is called on a request before transferring data. However, this modality of communication gives MPI implementations far more flexibility in data movement than ~~non-partitioned~~ ==nonpartitioned== communications.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

Once an [[versions/v50/API/MPI_PSEND_INIT|MPI_PSEND_INIT]] call has been made, the user may start the operation with a call to a starting procedure and complete the operation with ~~a number of~~ ==one== [[versions/v50/API/MPI_PREADY|MPI_PREADY]] ~~calls equal to the requested number of~~ ==call for every== send ~~partitions~~ ==partition== followed by a call to a completing procedure. A call to [[versions/v50/API/MPI_PREADY|MPI_PREADY]] notifies the MPI library that a specified portion of the data buffer (a specific partition) is ready to be sent. Notification of partial completion can be done via fine-grained [[versions/v50/API/MPI_PARRIVED|MPI_PARRIVED]] calls at the receiver before a final [[versions/v50/API/MPI_TEST|MPI_TEST]] / [[versions/v50/API/MPI_WAIT|MPI_WAIT]] on the request itself; the latter represents overall operation completion upon success. A full set of methods for starting and completing partitioned communication is given in the following sections.

~~(code block removed)~~
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

==(code block added)==
``` [MPI]C
#include <stdlib.h>
#include "mpi.h"
#define PARTITIONS 8
#define COUNT 5
int main(int argc, char *argv[])
{
  double message[PARTITIONS*COUNT];
  int partitions = PARTITIONS;
  int source = 0, dest = 1, tag = 1, flag = 0;
  int myrank, i;
  MPI_Request request;
  MPI_Init(&argc, &argv);
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

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/part#Semantics of Partitioned Point-to-Point Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/part#Semantics of Partitioned Point-to-Point Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/part#Semantics of Partitioned Point-to-Point Communication]]
