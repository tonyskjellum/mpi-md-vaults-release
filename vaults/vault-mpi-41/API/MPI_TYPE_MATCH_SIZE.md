---
title: MPI_TYPE_MATCH_SIZE
c_name: MPI_Type_match_size
lis_name: MPI_TYPE_MATCH_SIZE
chapter: binding
aliases: [MPI_TYPE_MATCH_SIZE, MPI_Type_match_size]
tags: [mpi/function, mpi/binding]
---

# MPI_TYPE_MATCH_SIZE

**C**
```c
int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *datatype)
```

| Parameter | Intent | Description |
|---|---|---|
| `typeclass` | IN | generic type specifier (integer) |
| `size` | IN | size, in bytes, of representation (integer) |
| `datatype` | OUT | datatype with correct type, size (handle) |

**Fortran 2008**
```fortran
MPI_Type_match_size(typeclass, size, datatype, ierror)
  INTEGER, INTENT(IN) :: typeclass, size
  TYPE(MPI_Datatype), INTENT(OUT) :: datatype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_MATCH_SIZE(TYPECLASS, SIZE, DATATYPE, IERROR)
  INTEGER TYPECLASS, SIZE, DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.
