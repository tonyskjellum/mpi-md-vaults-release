---
title: MPI_TYPE_GET_CONTENTS
c_name: MPI_Type_get_contents
lis_name: MPI_TYPE_GET_CONTENTS
chapter: ei
aliases: [MPI_TYPE_GET_CONTENTS, MPI_Type_get_contents]
tags: [mpi/function, mpi/ei]
---

# MPI_TYPE_GET_CONTENTS

**C**
```c
int MPI_Type_get_contents(MPI_Datatype datatype, int max_integers, int max_addresses, int max_datatypes, int array_of_integers[], MPI_Aint array_of_addresses[], MPI_Datatype array_of_datatypes[])
```

**C++**
```cpp
void MPI::Datatype::Get_contents(int max_integers, int max_addresses, int max_datatypes, int array_of_integers[], MPI::Aint array_of_addresses[], MPI::Datatype array_of_datatypes[]) const
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to access (handle) |
| `max_integers` | IN | number of elements in `array_of_integers` (non-negative integer) |
| `max_addresses` | IN | number of elements in `array_of_addresses` (non-negative integer) |
| `max_datatypes` | IN | number of elements in `array_of_datatypes` (non-negative integer) |
| `array_of_integers` | OUT | contains integer arguments used in constructing `datatype` (array of integers) |
| `array_of_addresses` | OUT | contains address arguments used in constructing `datatype` (array of integers) |
| `array_of_datatypes` | OUT | contains datatype arguments used in constructing `datatype` (array of handles) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_CONTENTS(DATATYPE, MAX_INTEGERS, MAX_ADDRESSES, MAX_DATATYPES, ARRAY_OF_INTEGERS, ARRAY_OF_ADDRESSES, ARRAY_OF_DATATYPES, IERROR)
  INTEGER DATATYPE, MAX_INTEGERS, MAX_ADDRESSES, MAX_DATATYPES, ARRAY_OF_INTEGERS(*), ARRAY_OF_DATATYPES(*), IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_ADDRESSES(*)
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.
