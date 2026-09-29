---
title: MPI_TYPE_COMMIT
c_name: MPI_Type_commit
lis_name: MPI_TYPE_COMMIT
chapter: datatypes
aliases: [MPI_TYPE_COMMIT, MPI_Type_commit]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_COMMIT

**C**
```c
int MPI_Type_commit(MPI_Datatype *datatype)
```

**C++**
```cpp
void MPI::Datatype::Commit()
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype that is committed (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_COMMIT(DATATYPE, IERROR)
  INTEGER DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
