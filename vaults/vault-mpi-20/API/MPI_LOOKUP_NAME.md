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
int MPI_Lookup_name(char *service_name, MPI_Info info, char *port_name)
```

**C++**
```cpp
void MPI::Lookup_name(const char* service_name, const MPI::Info& info, char* port_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `service_name` | IN | a service name (string) |
| `info` | IN | implementation-specific information (handle) |
| `port_name` | OUT | a port name (string) |

**Fortran (mpif.h)**
```fortran
MPI_LOOKUP_NAME(SERVICE_NAME, INFO, PORT_NAME, IERROR)
  CHARACTER*(*) SERVICE_NAME, PORT_NAME
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.
