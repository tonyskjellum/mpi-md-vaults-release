---
title: MPI_COMM_CONNECT
c_name: MPI_Comm_connect
lis_name: MPI_COMM_CONNECT
chapter: dynamic
aliases: [MPI_COMM_CONNECT, MPI_Comm_connect]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_CONNECT

**C**
```c
int MPI_Comm_connect(char *port_name, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *newcomm)
```

**C++**
```cpp
MPI::Intercomm MPI::Intracomm::Connect(const char* port_name, const MPI::Info& info, int root) const
```

| Parameter | Intent | Description |
|---|---|---|
| `port_name` | IN | network address (string, used only on `root`) |
| `info` | IN | implementation-dependent information (handle, used only on `root`) |
| `root` | IN | rank in `comm` of root node (integer) |
| `comm` | IN | intracommunicator over which call is collective (handle) |
| `newcomm` | OUT | intercommunicator with server as remote group (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_CONNECT(PORT_NAME, INFO, ROOT, COMM, NEWCOMM, IERROR)
  CHARACTER*(*) PORT_NAME
  INTEGER INFO, ROOT, COMM, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
