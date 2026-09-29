---
title: MPI_STATUS_SET_ELEMENTS
c_name: MPI_Status_set_elements
lis_name: MPI_STATUS_SET_ELEMENTS
chapter: ei
aliases: [MPI_STATUS_SET_ELEMENTS, MPI_Status_set_elements]
tags: [mpi/function, mpi/ei]
---

# MPI_STATUS_SET_ELEMENTS

**C**
```c
int MPI_Status_set_elements(MPI_Status *status, MPI_Datatype datatype, int count)
```

**C++**
```cpp
void MPI::Status::Set_elements(const MPI::Datatype& datatype, int count)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | INOUT | status with which to associate count (Status) |
| `datatype` | IN | datatype associated with count (handle) |
| `count` | IN | number of elements to associate with status (integer) |

**Fortran (mpif.h)**
```fortran
MPI_STATUS_SET_ELEMENTS(STATUS, DATATYPE, COUNT, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), DATATYPE, COUNT, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
