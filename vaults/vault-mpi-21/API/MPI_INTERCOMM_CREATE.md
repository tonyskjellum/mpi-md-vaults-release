---
title: MPI_INTERCOMM_CREATE
c_name: MPI_Intercomm_create
lis_name: MPI_INTERCOMM_CREATE
chapter: context
aliases: [MPI_INTERCOMM_CREATE, MPI_Intercomm_create]
tags: [mpi/function, mpi/context]
---

# MPI_INTERCOMM_CREATE

**C**
```c
int MPI_Intercomm_create(MPI_Comm local_comm, int local_leader, MPI_Comm peer_comm, int remote_leader, int tag, MPI_Comm *newintercomm)
```

**C++**
```cpp
MPI::Intercomm MPI::Intracomm::Create_intercomm(int local_leader, const MPI::Comm& peer_comm, int remote_leader, int tag) const
```

| Parameter | Intent | Description |
|---|---|---|
| `local_comm` | IN | local intra-communicator (handle) |
| `local_leader` | IN | rank of local group leader in `local_comm` (integer) |
| `peer_comm` | IN | "peer" communicator; significant only at the `local_leader` (handle) |
| `remote_leader` | IN | rank of remote group leader in ` peer_comm`; significant only at the `local_leader` (integer) |
| `tag` | IN | "safe" tag (integer) |
| `newintercomm` | OUT | new inter-communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_INTERCOMM_CREATE(LOCAL_COMM, LOCAL_LEADER, PEER_COMM, REMOTE_LEADER, TAG, NEWINTERCOMM, IERROR)
  INTEGER LOCAL_COMM, LOCAL_LEADER, PEER_COMM, REMOTE_LEADER, TAG, NEWINTERCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
