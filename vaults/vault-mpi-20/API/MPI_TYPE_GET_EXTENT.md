---
title: MPI_TYPE_GET_EXTENT
c_name: MPI_Type_get_extent
lis_name: MPI_TYPE_GET_EXTENT
chapter: misc
aliases: [MPI_TYPE_GET_EXTENT, MPI_Type_get_extent]
tags: [mpi/function, mpi/misc]
---

# MPI_TYPE_GET_EXTENT

**C**
```c
int MPI_Type_get_extent(MPI_Datatype datatype, MPI_Aint *lb, MPI_Aint *extent)
```

**C++**
```cpp
void MPI::Datatype::Get_extent(MPI::Aint& lb, MPI::Aint& extent) const
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to get information on (handle) |
| `lb` | OUT | lower bound of datatype (integer) |
| `extent` | OUT | extent of datatype (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_EXTENT(DATATYPE, LB, EXTENT, IERROR)
  INTEGER DATATYPE, IERROR
  INTEGER(KIND = MPI_ADDRESS_KIND) LB, EXTENT
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
