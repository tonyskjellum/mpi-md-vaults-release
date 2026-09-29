---
title: MPI_TYPE_CREATE_RESIZED
c_name: MPI_Type_create_resized
lis_name: MPI_TYPE_CREATE_RESIZED
chapter: misc
aliases: [MPI_TYPE_CREATE_RESIZED, MPI_Type_create_resized]
tags: [mpi/function, mpi/misc]
---

# MPI_TYPE_CREATE_RESIZED

**C**
```c
int MPI_Type_create_resized(MPI_Datatype oldtype, MPI_Aint lb, MPI_Aint extent, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Resized(const MPI::Aint lb, const MPI::Aint extent) const
```

| Parameter | Intent | Description |
|---|---|---|
| `oldtype` | IN | input datatype (handle) |
| `lb` | IN | new lower bound of datatype (integer) |
| `extent` | IN | new extent of datatype (integer) |
| `newtype` | OUT | output datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_RESIZED(OLDTYPE, LB, EXTENT, NEWTYPE, IERROR)
  INTEGER OLDTYPE, NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) LB, EXTENT
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
