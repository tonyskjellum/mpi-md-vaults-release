---
title: "Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later"
chapter: part
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/part]
---

# Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later

Chapter **part** · in [[versions/v40/sections/part#Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later|MPI-4.0]], [[versions/v41/sections/part#Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later|MPI-4.1]], [[versions/v50/sections/part#Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==[language={[MPI]C},basicstyle=] #include <stdlib.h>== #include "mpi.h" #define NUM_THREADS 8 #define NUM_TASKS 64 #define PARTITIONS NUM_TASKS #define PARTLENGTH 16 #define MESSAGE_LENGTH PARTITIONS*PARTLENGTH int main(int argc, char *argv[]) /* send-side partitioning */ { double message[MESSAGE_LENGTH]; int send_partitions = PARTITIONS, send_partlength = PARTLENGTH, recv_partitions = 1, recv_partlength = PARTITIONS*PARTLENGTH; int count = 1, source = 0, dest = 1, tag = 1, flag = 0; int myrank; int provided; MPI_Request request; MPI_Info info = MPI_INFO_NULL; MPI_Datatype send_type; MPI_Init_thread(&argc, &argv, MPI_THREAD_MULTIPLE, &provided); if (provided < MPI_THREAD_MULTIPLE) MPI_Abort(MPI_COMM_WORLD, EXIT_FAILURE); MPI_Comm_rank(MPI_COMM_WORLD, &myrank); MPI_Type_contiguous(send_partlength, MPI_DOUBLE, &send_type); MPI_Type_commit(&send_type);

if (myrank == 0) { MPI_Psend_init(message, send_partitions, count, send_type, dest, tag, ==MPI_COMM_WORLD,== info, ~~MPI_COMM_WORLD,~~ &request); MPI_Start(&request);

#pragma omp parallel shared(request) num_threads(NUM_THREADS) { #pragma omp single { /* single thread creates 64 tasks to be executed by 8 threads */ for (int partition_num=0;partition_num<NUM_TASKS;partition_num++) { #pragma omp task firstprivate(partition_num) { /* compute and fill partition #partition_num, then mark ready: */ /* buffer is filled in arbitrary order from each task */ MPI_Pready(partition_num, request); } /*end task*/ } /* end for */ } /* end single */ } /* end parallel */ while(!flag) { /* Do useful work */ MPI_Test(&request, &flag, MPI_STATUS_IGNORE); /* Do useful work */ } MPI_Request_free(&request); } else if (myrank == 1) { MPI_Precv_init(message, recv_partitions, recv_partlength, MPI_DOUBLE, source, tag, ==MPI_COMM_WORLD,== info, ~~MPI_COMM_WORLD,~~ &request);

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/part#Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/part#Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/part#Send-only Partitioning Example with Tasks and OpenMP version 4.0 or later]]
