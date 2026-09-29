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

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | implementation-specific information on how to establish an address (handle) |
| `port_name` | OUT | newly established port (string) |

**Fortran 2008**
```fortran
MPI_Open_port(info, port_name, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  CHARACTER(LEN=MPI_MAX_PORT_NAME), INTENT(OUT) :: port_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_OPEN_PORT(INFO, PORT_NAME, IERROR)
  INTEGER INFO, IERROR
  CHARACTER*(*) PORT_NAME
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
