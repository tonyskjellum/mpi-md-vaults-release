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
int MPI_Comm_connect(const char *port_name, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `port_name` | IN | network address (string, significant only at root) |
| `info` | IN | implementation-dependent information (handle, significant only at root) |
| `root` | IN | rank in `comm` of root node (integer) |
| `comm` | IN | intra-communicator over which call is collective (handle) |
| `newcomm` | OUT | inter-communicator with server as remote group (handle) |

**Fortran 2008**
```fortran
MPI_Comm_connect(port_name, info, root, comm, newcomm, ierror)
  CHARACTER(LEN=*), INTENT(IN) :: port_name
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, INTENT(IN) :: root
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Comm), INTENT(OUT) :: newcomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_CONNECT(PORT_NAME, INFO, ROOT, COMM, NEWCOMM, IERROR)
  CHARACTER*(*) PORT_NAME
  INTEGER INFO, ROOT, COMM, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
