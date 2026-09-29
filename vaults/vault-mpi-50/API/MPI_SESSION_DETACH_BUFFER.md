---
title: MPI_SESSION_DETACH_BUFFER
c_name: MPI_Session_detach_buffer
lis_name: MPI_SESSION_DETACH_BUFFER
chapter: pt2pt
aliases: [MPI_SESSION_DETACH_BUFFER, MPI_Session_detach_buffer, MPI_Session_detach_buffer_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_SESSION_DETACH_BUFFER

**C**
```c
int MPI_Session_detach_buffer(MPI_Session session, void *buffer_addr, int *size)
int MPI_Session_detach_buffer_c(MPI_Session session, void *buffer_addr, MPI_Count *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `buffer_addr` | OUT | initial buffer address (choice) |
| `size` | OUT | buffer size, in bytes (integer) |

**Fortran 2008**
```fortran
MPI_Session_detach_buffer(session, buffer_addr, size, ierror)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(C_PTR), INTENT(OUT) :: buffer_addr
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Session_detach_buffer(session, buffer_addr, size, ierror) !(_c)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(C_PTR), INTENT(OUT) :: buffer_addr
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_DETACH_BUFFER(SESSION, BUFFER_ADDR, SIZE, IERROR)
  INTEGER SESSION, SIZE, IERROR
  <type> BUFFER_ADDR(*)
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
