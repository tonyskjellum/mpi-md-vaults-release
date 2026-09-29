---
title: "Partition Communication with Threads/Tasks Using OpenMP 4.0 or later"
chapter: part
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/part]
---

# Partition Communication with Threads/Tasks Using OpenMP 4.0 or later

Chapter **part** · in [[versions/v40/sections/part#Partition Communication with Threads/Tasks Using OpenMP 4.0 or later|MPI-4.0]], [[versions/v41/sections/part#Partition Communication with Threads/Tasks Using OpenMP 4.0 or later|MPI-4.1]], [[versions/v50/sections/part#Partition Communication with Threads/Tasks Using OpenMP 4.0 or later|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

The equal partitioning on send-side and receive-side in Example [[part-example1]] is shown using threads. In this case, the receive-side uses the same number of partitions as the send-side ~~like~~ ==as== in the previous example, but this example uses multiple threads on the send-side. Note that the [[versions/v41/API/MPI_PSEND_INIT|MPI_PSEND_INIT]] and [[versions/v41/API/MPI_PRECV_INIT|MPI_PRECV_INIT]] functions match each other like in the previous example.

~~    #include "mpi.h"     #define NUM_THREADS 8     #define PARTITIONS 8     #define PARTLENGTH 16     int main(int argc, char *argv[]) /* same send/recv partitioning */     {       double message[PARTITIONS*PARTLENGTH];       int partitions = PARTITIONS;       int partlength = PARTLENGTH;       int count = 1, source = 0, dest = 1, tag = 1, flag = 0;       int myrank;       int provided;       MPI_Request request;       MPI_Info info = MPI_INFO_NULL;       MPI_Datatype xfer_type;       MPI_Init_thread(&argc, &argv, MPI_THREAD_MULTIPLE, &provided);       if (provided < MPI_THREAD_MULTIPLE)          MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE);       MPI_Comm_rank(MPI_COMM_WORLD, &myrank);       MPI_Type_contiguous(partlength, MPI_DOUBLE, &xfer_type);       MPI_Type_commit(&xfer_type);       if (myrank == 0)       {          MPI_Psend_init(message, partitions, count, xfer_type, dest, tag,               info, MPI_COMM_WORLD, &request);          MPI_Start(&request);~~

~~         #pragma omp parallel for shared(request) num_threads(NUM_THREADS)          for (int i=0; i<partitions; i++)          {             /* compute and fill partition #i, then mark ready: */             MPI_Pready(i, request);          }          while(!flag)          {             /* Do useful work */             MPI_Test(&request, &flag, MPI_STATUS_IGNORE);             /* Do useful work */          }          MPI_Request_free(&request);       }       else if (myrank == 1)       {          MPI_Precv_init(message, partitions, count, xfer_type, source, tag,                info, MPI_COMM_WORLD, &request);          MPI_Start(&request);          while(!flag)          {             /* Do useful work */             MPI_Test(&request, &flag, MPI_STATUS_IGNORE);             /* Do useful work */          }          MPI_Request_free(&request);       }       MPI_Finalize();       return 0;     }~~

==(code block added)==
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

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~The~~ ==In the following the== equal partitioning on send-side and receive-side ~~in~~ Example [[part-example1]] is ~~shown using~~ ==extended to utilize== threads. In this case, the receive-side uses the same number of partitions as the send-side as in the previous example, but this example uses multiple threads on the send-side. Note that the [[versions/v50/API/MPI_PSEND_INIT|MPI_PSEND_INIT]] and [[versions/v50/API/MPI_PRECV_INIT|MPI_PRECV_INIT]] functions match each other like in the previous example.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/part#Partition Communication with Threads/Tasks Using OpenMP 4.0 or later]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/part#Partition Communication with Threads/Tasks Using OpenMP 4.0 or later]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/part#Partition Communication with Threads/Tasks Using OpenMP 4.0 or later]]
