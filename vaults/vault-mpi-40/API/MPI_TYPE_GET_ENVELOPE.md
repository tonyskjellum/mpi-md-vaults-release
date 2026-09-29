---
title: MPI_TYPE_GET_ENVELOPE
c_name: MPI_Type_get_envelope
lis_name: MPI_TYPE_GET_ENVELOPE
chapter: datatypes
aliases: [MPI_TYPE_GET_ENVELOPE, MPI_Type_get_envelope, MPI_Type_get_envelope_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_GET_ENVELOPE

**C**
```c
int MPI_Type_get_envelope(MPI_Datatype datatype, int *num_integers, int *num_addresses, int *num_datatypes, int *combiner)
int MPI_Type_get_envelope_c(MPI_Datatype datatype, MPI_Count *num_integers, MPI_Count *num_addresses, MPI_Count *num_large_counts, MPI_Count *num_datatypes, int *combiner)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to decode (handle) |
| `num_integers` | OUT | number of input integers used in call constructing `combiner` (non-negative integer) |
| `num_addresses` | OUT | number of input addresses used in call constructing `combiner` (non-negative integer) |
| `num_large_counts` | OUT | number of input large counts used in call constructing `combiner` (non-negative integer, only present for large count variants) |
| `num_datatypes` | OUT | number of input datatypes used in call constructing `combiner` (non-negative integer) |
| `combiner` | OUT | combiner (state) |

**Fortran 2008**
```fortran
MPI_Type_get_envelope(datatype, num_integers, num_addresses, num_datatypes, combiner, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(OUT) :: num_integers, num_addresses, num_datatypes, combiner
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_get_envelope(datatype, num_integers, num_addresses, num_large_counts, num_datatypes, combiner, ierror) !(_c)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: num_integers, num_addresses, num_large_counts, num_datatypes
  INTEGER, INTENT(OUT) :: combiner
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_ENVELOPE(DATATYPE, NUM_INTEGERS, NUM_ADDRESSES, NUM_DATATYPES, COMBINER, IERROR)
  INTEGER DATATYPE, NUM_INTEGERS, NUM_ADDRESSES, NUM_DATATYPES, COMBINER, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
