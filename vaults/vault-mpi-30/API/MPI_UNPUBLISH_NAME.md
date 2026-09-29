---
title: MPI_UNPUBLISH_NAME
c_name: MPI_Unpublish_name
lis_name: MPI_UNPUBLISH_NAME
chapter: dynamic
aliases: [MPI_UNPUBLISH_NAME, MPI_Unpublish_name]
tags: [mpi/function, mpi/dynamic]
---

# MPI_UNPUBLISH_NAME

**C**
```c
int MPI_Unpublish_name(const char *service_name, MPI_Info info, const char *port_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `service_name` | IN | a service name (string) |
| `info` | IN | implementation-specific information (handle) |
| `port_name` | IN | a port name (string) |

**Fortran 2008**
```fortran
MPI_Unpublish_name(service_name, info, port_name, ierror) BIND(C)
  CHARACTER(LEN=*), INTENT(IN) :: service_name, port_name
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_UNPUBLISH_NAME(SERVICE_NAME, INFO, PORT_NAME, IERROR)
  INTEGER INFO, IERROR
  CHARACTER*(*) SERVICE_NAME, PORT_NAME
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
