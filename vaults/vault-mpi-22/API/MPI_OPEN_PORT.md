---
title: MPI_OPEN_PORT
c_name: MPI_Open_port
lis_name: MPI_OPEN_PORT
chapter: dynamic
aliases: [MPI_OPEN_PORT, MPI_Open_port]
tags: [mpi/function, mpi/dynamic]
---

# MPI_OPEN_PORT

**C**
```c
int MPI_Open_port(MPI_Info info, char *port_name)
```

**C++**
```cpp
void MPI::Open_port(const MPI::Info& info, char* port_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | implementation-specific information on how to establish an address (handle) |
| `port_name` | OUT | newly established port (string) |

**Fortran (mpif.h)**
```fortran
MPI_OPEN_PORT(INFO, PORT_NAME, IERROR)
  CHARACTER*(*) PORT_NAME
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
