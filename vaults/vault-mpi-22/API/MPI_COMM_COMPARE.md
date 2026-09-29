---
title: MPI_COMM_COMPARE
c_name: MPI_Comm_compare
lis_name: MPI_COMM_COMPARE
chapter: context
aliases: [MPI_COMM_COMPARE, MPI_Comm_compare]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_COMPARE

**C**
```c
int MPI_Comm_compare(MPI_Comm comm1,MPI_Comm comm2, int *result)
```

**C++**
```cpp
static int MPI::Comm::Compare(const MPI::Comm& comm1, const MPI::Comm& comm2)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm1` | IN | first communicator (handle) |
| `comm2` | IN | second communicator (handle) |
| `result` | OUT | result (integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_COMPARE(COMM1, COMM2, RESULT, IERROR)
  INTEGER COMM1, COMM2, RESULT, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.
