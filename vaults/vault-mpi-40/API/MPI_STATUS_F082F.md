---
title: MPI_STATUS_F082F
c_name: MPI_Status_f082f
lis_name: MPI_STATUS_F082F
chapter: binding
aliases: [MPI_STATUS_F082F, MPI_Status_f082f]
tags: [mpi/function, mpi/binding]
---

# MPI_STATUS_F082F

**C**
```c
int MPI_Status_f082f(const MPI_F08_status *f08_status, MPI_Fint *f_status)
```

| Parameter | Intent | Description |
|---|---|---|
| `f08_status` | IN | status object declared as named type (status) |
| `f_status` | OUT | status object declared as array (status) |

**Fortran 2008**
```fortran
MPI_Status_f082f(f08_status, f_status, ierror)
  TYPE(MPI_Status), INTENT(IN) :: f08_status
  INTEGER, INTENT(OUT) :: f_status(MPI_STATUS_SIZE)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.
