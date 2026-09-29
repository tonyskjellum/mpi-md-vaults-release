---
title: MPI_TYPE_GET_ENVELOPE
c_name: MPI_Type_get_envelope
lis_name: MPI_TYPE_GET_ENVELOPE
chapter: datatypes
aliases: [MPI_TYPE_GET_ENVELOPE, MPI_Type_get_envelope]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_GET_ENVELOPE

**C**
```c
int MPI_Type_get_envelope(MPI_Datatype datatype, int *num_integers, int *num_addresses, int *num_datatypes, int *combiner)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to access (handle) |
| `num_integers` | OUT | number of input integers used in the call constructing `combiner` (non-negative integer) |
| `num_addresses` | OUT | number of input addresses used in the call constructing `combiner` (non-negative integer) |
| `num_datatypes` | OUT | number of input datatypes used in the call constructing `combiner` (non-negative integer) |
| `combiner` | OUT | combiner (state) |

**Fortran 2008**
```fortran
MPI_Type_get_envelope(datatype, num_integers, num_addresses, num_datatypes, combiner, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(OUT) :: num_integers, num_addresses, num_datatypes, combiner
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_ENVELOPE(DATATYPE, NUM_INTEGERS, NUM_ADDRESSES, NUM_DATATYPES, COMBINER, IERROR)
  INTEGER DATATYPE, NUM_INTEGERS, NUM_ADDRESSES, NUM_DATATYPES, COMBINER, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
