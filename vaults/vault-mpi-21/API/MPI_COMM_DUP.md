---
title: MPI_COMM_DUP
c_name: MPI_Comm_dup
lis_name: MPI_COMM_DUP
chapter: context
aliases: [MPI_COMM_DUP, MPI_Comm_dup]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_DUP

**C**
```c
int MPI_Comm_dup(MPI_Comm comm, MPI_Comm *newcomm)
```

**C++**
```cpp
MPI::Intracomm MPI::Intracomm::Dup() const
MPI::Intercomm MPI::Intercomm::Dup() const
MPI::Cartcomm MPI::Cartcomm::Dup() const
MPI::Graphcomm MPI::Graphcomm::Dup() const
MPI::Comm& MPI::Comm::Clone() const = 0
MPI::Intracomm& MPI::Intracomm::Clone() const
MPI::Intercomm& MPI::Intercomm::Clone() const
MPI::Cartcomm& MPI::Cartcomm::Clone() const
MPI::Graphcomm& MPI::Graphcomm::Clone() const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `newcomm` | OUT | copy of `comm` (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_DUP(COMM, NEWCOMM, IERROR)
  INTEGER COMM, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
