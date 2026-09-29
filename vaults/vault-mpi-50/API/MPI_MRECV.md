---
title: MPI_MRECV
c_name: MPI_Mrecv
lis_name: MPI_MRECV
chapter: pt2pt
aliases: [MPI_MRECV, MPI_Mrecv, MPI_Mrecv_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_MRECV

**C**
```c
int MPI_Mrecv(void *buf, int count, MPI_Datatype datatype, MPI_Message *message, MPI_Status *status)
int MPI_Mrecv_c(void *buf, MPI_Count count, MPI_Datatype datatype, MPI_Message *message, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | OUT | initial address of receive buffer (choice) |
| `count` | IN | number of elements in receive buffer (nonnegative integer) |
| `datatype` | IN | datatype of each receive buffer element (handle) |
| `message` | INOUT | message (handle) |
| `status` | OUT | status object (status) |

**Fortran 2008**
```fortran
MPI_Mrecv(buf, count, datatype, message, status, ierror)
  TYPE(*), DIMENSION(..) :: buf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Message), INTENT(INOUT) :: message
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Mrecv(buf, count, datatype, message, status, ierror) !(_c)
  TYPE(*), DIMENSION(..) :: buf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Message), INTENT(INOUT) :: message
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_MRECV(BUF, COUNT, DATATYPE, MESSAGE, STATUS, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, MESSAGE, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.
