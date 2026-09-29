---
title: MPI_COMM_CREATE
c_name: MPI_COMM_CREATE
lis_name: MPI_COMM_CREATE
chapter: collective
aliases: [MPI_COMM_CREATE]
tags: [mpi/function, mpi/collective]
---

# MPI_COMM_CREATE

**C++**
```cpp
MPI::Intercomm MPI::Intercomm::Create(const Group& group) const
MPI::Intracomm MPI::Intracomm::Create(const Group& group) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm_in` | IN | original communicator (handle) |
| `group` | IN | group of processes to be in new communicator (handle) |
| `comm_out` | OUT | new communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.
