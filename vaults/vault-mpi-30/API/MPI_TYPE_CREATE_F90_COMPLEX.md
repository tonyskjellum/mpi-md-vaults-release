---
title: MPI_TYPE_CREATE_F90_COMPLEX
c_name: MPI_Type_create_f90_complex
lis_name: MPI_TYPE_CREATE_F90_COMPLEX
chapter: binding
aliases: [MPI_TYPE_CREATE_F90_COMPLEX, MPI_Type_create_f90_complex]
tags: [mpi/function, mpi/binding]
---

# MPI_TYPE_CREATE_F90_COMPLEX

**C**
```c
int MPI_Type_create_f90_complex(int p, int r, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `p` | IN | precision, in decimal digits (integer) |
| `r` | IN | decimal exponent range (integer) |
| `newtype` | OUT | the requested MPI datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_f90_complex(p, r, newtype, ierror) BIND(C)
  INTEGER, INTENT(IN) :: p, r
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_F90_COMPLEX(P, R, NEWTYPE, IERROR)
  INTEGER P, R, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.
