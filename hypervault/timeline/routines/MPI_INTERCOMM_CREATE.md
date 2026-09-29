---
title: MPI_INTERCOMM_CREATE
c_name: MPI_Intercomm_create
chapter: context
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_INTERCOMM_CREATE, MPI_Intercomm_create]
tags: [mpi/routine, mpi/context]
---

# MPI_INTERCOMM_CREATE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_INTERCOMM_CREATE|MPI-1.3]] · [[versions/v21/API/MPI_INTERCOMM_CREATE|MPI-2.1]] Δ · [[versions/v22/API/MPI_INTERCOMM_CREATE|MPI-2.2]] · [[versions/v30/API/MPI_INTERCOMM_CREATE|MPI-3.0]] Δ · [[versions/v31/API/MPI_INTERCOMM_CREATE|MPI-3.1]] Δ · [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI-4.0]] · [[versions/v41/API/MPI_INTERCOMM_CREATE|MPI-4.1]] · [[versions/v50/API/MPI_INTERCOMM_CREATE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Intercomm_create(MPI_Comm local_comm, int local_leader, MPI_Comm peer_comm, int remote_leader, int tag, MPI_Comm *newintercomm)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
MPI::Intercomm MPI::Intracomm::Create_intercomm(int local_leader, const MPI::Comm& peer_comm, int remote_leader, int tag) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Intercomm_create(local_comm, local_leader, peer_comm, remote_leader, tag, newintercomm, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: local_comm, peer_comm
    INTEGER, INTENT(IN) :: local_leader, remote_leader, tag
    TYPE(MPI_Comm), INTENT(OUT) :: newintercomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Intercomm_create(local_comm, local_leader, peer_comm, remote_leader, tag, newintercomm, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: local_comm, peer_comm
    INTEGER, INTENT(IN) :: local_leader, remote_leader, tag
    TYPE(MPI_Comm), INTENT(OUT) :: newintercomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_INTERCOMM_CREATE(LOCAL_COMM, LOCAL_LEADER, PEER_COMM, REMOTE_LEADER, TAG, NEWINTERCOMM, IERROR)
    INTEGER LOCAL_COMM, LOCAL_LEADER, PEER_COMM, REMOTE_LEADER, TAG, NEWINTERCOMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `local_comm` | IN | **MPI-1.3–MPI-5.0:** local intra-communicator (handle) |
| `local_leader` | IN | **MPI-1.3–MPI-5.0:** rank of local group leader in `local_comm` (integer) |
| `peer_comm` | IN | **MPI-1.3–MPI-5.0:** "peer" communicator; significant only at the `local_leader` (handle) |
| `remote_leader` | IN | **MPI-1.3–MPI-2.2:** rank of remote group leader in ` peer_comm`; significant only at the `local_leader` (integer)<br>**MPI-3.0–MPI-5.0:** rank of remote group leader in `peer_comm`; significant only at the `local_leader` (integer) |
| `tag` | IN | **MPI-1.3–MPI-2.2:** "safe" tag (integer)<br>**MPI-3.0–MPI-5.0:** tag (integer) |
| `newintercomm` | OUT | **MPI-1.3–MPI-5.0:** new inter-communicator (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v13/sections/context|context]]
- MPI-2.1: [[versions/v21/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_INTERCOMM_CREATE|API note]] · chapter [[versions/v50/sections/context|context]]
