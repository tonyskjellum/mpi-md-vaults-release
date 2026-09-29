---
title: MPI_WIN_CREATE
c_name: MPI_Win_create
lis_name: MPI_WIN_CREATE
chapter: one-side
aliases: [MPI_WIN_CREATE, MPI_Win_create]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_CREATE

**C**
```c
int MPI_Win_create(void *base, MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm, MPI_Win *win)
```

**C++**
```cpp
static MPI::Win MPI::Win::Create(const void* base, MPI::Aint size, int disp_unit, const MPI::Info& info, const MPI::Intracomm& comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `base` | IN | initial address of window (choice) |
| `size` | IN | size of window in bytes (non-negative integer) |
| `disp_unit` | IN | local unit size for displacements, in bytes (positive integer) |
| `info` | IN | info argument (handle) |
| `comm` | IN | communicator (handle) |
| `win` | OUT | window object returned by the call (handle) |

**Fortran (mpif.h)**
```fortran
MPI_WIN_CREATE(BASE, SIZE, DISP_UNIT, INFO, COMM, WIN, IERROR)
  <type> BASE(*)
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
  INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.
