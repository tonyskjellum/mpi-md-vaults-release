---
title: MPI_TYPE_EXTENT
c_name: MPI_Type_extent
lis_name: MPI_TYPE_EXTENT
chapter: deprecated
aliases: [MPI_TYPE_EXTENT, MPI_Type_extent]
tags: [mpi/function, mpi/deprecated]
---

# MPI_TYPE_EXTENT

**C**
```c
int MPI_Type_extent(MPI_Datatype datatype, MPI_Aint *extent)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype (handle) |
| `extent` | OUT | datatype extent (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_EXTENT(DATATYPE, EXTENT, IERROR)
  INTEGER DATATYPE, EXTENT, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.
