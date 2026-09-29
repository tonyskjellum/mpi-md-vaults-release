---
title: MPI_PUBLISH_NAME
c_name: MPI_Publish_name
lis_name: MPI_PUBLISH_NAME
chapter: dynamic
aliases: [MPI_PUBLISH_NAME, MPI_Publish_name]
tags: [mpi/function, mpi/dynamic]
---

# MPI_PUBLISH_NAME

**C**
```c
int MPI_Publish_name(const char *service_name, MPI_Info info, const char *port_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `service_name` | IN | a service name to associate with the port (string) |
| `info` | IN | implementation-specific information (handle) |
| `port_name` | IN | a port name (string) |

**Fortran 2008**
```fortran
MPI_Publish_name(service_name, info, port_name, ierror) BIND(C)
  TYPE(MPI_Info), INTENT(IN) :: info
  CHARACTER(LEN=*), INTENT(IN) :: service_name, port_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PUBLISH_NAME(SERVICE_NAME, INFO, PORT_NAME, IERROR)
  INTEGER INFO, IERROR
  CHARACTER*(*) SERVICE_NAME, PORT_NAME
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
