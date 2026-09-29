---
title: MPI_PREADY_LIST
c_name: MPI_Pready_list
lis_name: MPI_PREADY_LIST
chapter: part
aliases: [MPI_PREADY_LIST, MPI_Pready_list]
tags: [mpi/function, mpi/part]
---

# MPI_PREADY_LIST

**C**
```c
int MPI_Pready_list(int length, const int array_of_partitions[], MPI_Request request)
```

| Parameter | Intent | Description |
|---|---|---|
| `length` | IN | list length (integer) |
| `array_of_partitions` | IN | array of partitions (array of non-negative integers) |
| `request` | INOUT | partitioned communication request (handle) |

**Fortran 2008**
```fortran
MPI_Pready_list(length, array_of_partitions, request, ierror)
  INTEGER, INTENT(IN) :: length, array_of_partitions(length)
  TYPE(MPI_Request), INTENT(IN) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PREADY_LIST(LENGTH, ARRAY_OF_PARTITIONS, REQUEST, IERROR)
  INTEGER LENGTH, ARRAY_OF_PARTITIONS(*), REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[part]] for the normative text.
