---
title: MPI_COMM_SPLIT
c_name: MPI_COMM_SPLIT
lis_name: MPI_COMM_SPLIT
chapter: collective
aliases: [MPI_COMM_SPLIT]
tags: [mpi/function, mpi/collective]
---

# MPI_COMM_SPLIT

**C++**
```cpp
MPI::Intercomm MPI::Intercomm::Split(int color, int key) const
MPI::Intracomm MPI::Intracomm::Split(int color, int key) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_in` | IN | original communicator (handle) |
| `color` | IN | control of subset assignment (integer) |
| `key` | IN | control of rank assignment (integer) |
| `comm_out` | OUT | new communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.
