---
title: MPI_STATUS_F2F08
c_name: MPI_Status_f2f08
lis_name: MPI_STATUS_F2F08
chapter: binding
aliases: [MPI_STATUS_F2F08, MPI_Status_f2f08]
tags: [mpi/function, mpi/binding]
---

# MPI_STATUS_F2F08

**C**
```c
int MPI_Status_f2f08(const MPI_Fint *f_status, MPI_F08_status *f08_status)
```

| Parameter | Intent | Description |
|---|---|---|
| `f_status` | IN | status object declared as array (status) |
| `f08_status` | OUT | status object declared as named type (status) |

**Fortran 2008**
```fortran
MPI_Status_f2f08(f_status, f08_status, ierror)
  INTEGER, INTENT(IN) :: f_status(MPI_STATUS_SIZE)
  TYPE(MPI_Status), INTENT(OUT) :: f08_status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.
