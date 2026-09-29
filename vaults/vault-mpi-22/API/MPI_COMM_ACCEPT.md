---
title: MPI_COMM_ACCEPT
c_name: MPI_Comm_accept
lis_name: MPI_COMM_ACCEPT
chapter: dynamic
aliases: [MPI_COMM_ACCEPT, MPI_Comm_accept]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_ACCEPT

**C**
```c
int MPI_Comm_accept(char *port_name, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *newcomm)
```

**C++**
```cpp
MPI::Intercomm MPI::Intracomm::Accept(const char* port_name, const MPI::Info& info, int root) const
```

| Parameter | Intent | Description |
|---|---|---|
| `port_name` | IN | port name (string, used only on `root`) |
| `info` | IN | implementation-dependent information (handle, used only on `root`) |
| `root` | IN | rank in `comm` of root node (integer) |
| `comm` | IN | intracommunicator over which call is collective (handle) |
| `newcomm` | OUT | intercommunicator with client as remote group (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_ACCEPT(PORT_NAME, INFO, ROOT, COMM, NEWCOMM, IERROR)
  CHARACTER*(*) PORT_NAME
  INTEGER INFO, ROOT, COMM, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
