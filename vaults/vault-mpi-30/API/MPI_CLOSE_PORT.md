---
title: MPI_CLOSE_PORT
c_name: MPI_Close_port
lis_name: MPI_CLOSE_PORT
chapter: dynamic
aliases: [MPI_CLOSE_PORT, MPI_Close_port]
tags: [mpi/function, mpi/dynamic]
---

# MPI_CLOSE_PORT

**C**
```c
int MPI_Close_port(const char *port_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `port_name` | IN | a port (string) |

**Fortran 2008**
```fortran
MPI_Close_port(port_name, ierror) BIND(C)
  CHARACTER(LEN=*), INTENT(IN) :: port_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_CLOSE_PORT(PORT_NAME, IERROR)
  CHARACTER*(*) PORT_NAME
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
