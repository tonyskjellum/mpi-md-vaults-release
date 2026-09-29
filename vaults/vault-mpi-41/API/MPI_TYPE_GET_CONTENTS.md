---
title: MPI_TYPE_GET_CONTENTS
c_name: MPI_Type_get_contents
lis_name: MPI_TYPE_GET_CONTENTS
chapter: datatypes
aliases: [MPI_TYPE_GET_CONTENTS, MPI_Type_get_contents, MPI_Type_get_contents_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_GET_CONTENTS

**C**
```c
int MPI_Type_get_contents(MPI_Datatype datatype, int max_integers, int max_addresses, int max_datatypes, int array_of_integers[], MPI_Aint array_of_addresses[], MPI_Datatype array_of_datatypes[])
int MPI_Type_get_contents_c(MPI_Datatype datatype, MPI_Count max_integers, MPI_Count max_addresses, MPI_Count max_large_counts, MPI_Count max_datatypes, int array_of_integers[], MPI_Aint array_of_addresses[], MPI_Count array_of_large_counts[], MPI_Datatype array_of_datatypes[])
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to decode (handle) |
| `max_integers` | IN | number of elements in `array_of_integers` (non-negative integer) |
| `max_addresses` | IN | number of elements in `array_of_addresses` (non-negative integer) |
| `max_large_counts` | IN | number of elements in `array_of_large_counts` (non-negative integer, only present for large count variants) |
| `max_datatypes` | IN | number of elements in `array_of_datatypes` (non-negative integer) |
| `array_of_integers` | OUT | contains integer arguments used in constructing `datatype` (array of integers) |
| `array_of_addresses` | OUT | contains address arguments used in constructing `datatype` (array of integers) |
| `array_of_large_counts` | OUT | contains large count arguments used in constructing `datatype` (array of integers, only present for large count variants) |
| `array_of_datatypes` | OUT | contains datatype arguments used in constructing `datatype` (array of handles) |

**Fortran 2008**
```fortran
MPI_Type_get_contents(datatype, max_integers, max_addresses, max_datatypes, array_of_integers, array_of_addresses, array_of_datatypes, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: max_integers, max_addresses, max_datatypes
  INTEGER, INTENT(OUT) :: array_of_integers(max_integers)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: array_of_addresses(max_addresses)
  TYPE(MPI_Datatype), INTENT(OUT) :: array_of_datatypes(max_datatypes)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_get_contents(datatype, max_integers, max_addresses, max_large_counts, max_datatypes, array_of_integers, array_of_addresses, array_of_large_counts, array_of_datatypes, ierror) !(_c)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: max_integers, max_addresses, max_large_counts, max_datatypes
  INTEGER, INTENT(OUT) :: array_of_integers(max_integers)
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: array_of_addresses(max_addresses)
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: array_of_large_counts(max_large_counts)
  TYPE(MPI_Datatype), INTENT(OUT) :: array_of_datatypes(max_datatypes)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_CONTENTS(DATATYPE, MAX_INTEGERS, MAX_ADDRESSES, MAX_DATATYPES, ARRAY_OF_INTEGERS, ARRAY_OF_ADDRESSES, ARRAY_OF_DATATYPES, IERROR)
  INTEGER DATATYPE, MAX_INTEGERS, MAX_ADDRESSES, MAX_DATATYPES, ARRAY_OF_INTEGERS(*), ARRAY_OF_DATATYPES(*), IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_ADDRESSES(*)
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
