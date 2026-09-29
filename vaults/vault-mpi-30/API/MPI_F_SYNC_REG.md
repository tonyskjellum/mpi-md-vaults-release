---
title: MPI_F_SYNC_REG
c_name: MPI_F_sync_reg
lis_name: MPI_F_SYNC_REG
chapter: binding
aliases: [MPI_F_SYNC_REG, MPI_F_sync_reg]
tags: [mpi/function, mpi/binding]
---

# MPI_F_SYNC_REG

| Parameter | Intent | Description |
|---|---|---|
| `buf` | INOUT | initial address of buffer (choice) |

**Fortran 2008**
```fortran
MPI_F_sync_reg(buf) BIND(C)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
```

**Fortran (mpif.h)**
```fortran
MPI_F_SYNC_REG(buf)
  <type> buf(*)
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.
