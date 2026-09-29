---
title: MPI_LOOKUP_NAME
c_name: MPI_Lookup_name
lis_name: MPI_LOOKUP_NAME
chapter: dynamic
aliases: [MPI_LOOKUP_NAME, MPI_Lookup_name]
tags: [mpi/function, mpi/dynamic]
---

# MPI_LOOKUP_NAME

**C**
```c
int MPI_Lookup_name(const char *service_name, MPI_Info info, char *port_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `service_name` | IN | a service name (string) |
| `info` | IN | implementation-specific information (handle) |
| `port_name` | OUT | a port name (string) |

**Fortran 2008**
```fortran
MPI_Lookup_name(service_name, info, port_name, ierror) BIND(C)
  CHARACTER(LEN=*), INTENT(IN) :: service_name
  TYPE(MPI_Info), INTENT(IN) :: info
  CHARACTER(LEN=MPI_MAX_PORT_NAME), INTENT(OUT) :: port_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_LOOKUP_NAME(SERVICE_NAME, INFO, PORT_NAME, IERROR)
  CHARACTER*(*) SERVICE_NAME, PORT_NAME
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
