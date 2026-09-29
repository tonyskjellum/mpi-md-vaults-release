---
title: MPI_BUFFER_ATTACH
c_name: MPI_Buffer_attach
lis_name: MPI_BUFFER_ATTACH
chapter: pt2pt
aliases: [MPI_BUFFER_ATTACH, MPI_Buffer_attach]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_BUFFER_ATTACH

**C**
```c
int MPI_Buffer_attach(void* buffer, int size)
```

**C++**
```cpp
void MPI::Attach_buffer(void* buffer, int size)
```

| Parameter | Intent | Description |
|---|---|---|
| `buffer` | IN | initial buffer address (choice) |
| `size` | IN | buffer size, in bytes (non-negative integer) |

**Fortran (mpif.h)**
```fortran
MPI_BUFFER_ATTACH(BUFFER, SIZE, IERROR)
  <type> BUFFER(*)
  INTEGER SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
