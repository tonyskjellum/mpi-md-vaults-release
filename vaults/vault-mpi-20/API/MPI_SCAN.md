---
title: MPI_SCAN
c_name: MPI_SCAN
lis_name: MPI_SCAN
chapter: collective
aliases: [MPI_SCAN]
tags: [mpi/function, mpi/collective]
---

# MPI_SCAN

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `count` | IN | number of elements in input buffer (integer) |
| `datatype` | IN | data type of elements of input buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.
