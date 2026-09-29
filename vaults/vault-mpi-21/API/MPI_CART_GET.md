---
title: MPI_CART_GET
c_name: MPI_Cart_get
lis_name: MPI_CART_GET
chapter: topol
aliases: [MPI_CART_GET, MPI_Cart_get]
tags: [mpi/function, mpi/topol]
---

# MPI_CART_GET

**C**
```c
int MPI_Cart_get(MPI_Comm comm, int maxdims, int *dims, int *periods, int *coords)
```

**C++**
```cpp
void MPI::Cartcomm::Get_topo(int maxdims, int dims[], bool periods[], int coords[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator with Cartesian structure (handle) |
| `maxdims` | IN | length of vectors `dims, periods`, and `coords` in the calling program (integer) |
| `dims` | OUT | number of processes for each Cartesian dimension (array of integer) |
| `periods` | OUT | periodicity (true/false) for each Cartesian dimension (array of logical) |
| `coords` | OUT | coordinates of calling process in Cartesian structure (array of integer) |

**Fortran (mpif.h)**
```fortran
MPI_CART_GET(COMM, MAXDIMS, DIMS, PERIODS, COORDS, IERROR)
  INTEGER COMM, MAXDIMS, DIMS(*), COORDS(*), IERROR
  LOGICAL PERIODS(*)
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.
