---
title: MPI_UNPACK_EXTERNAL
c_name: MPI_Unpack_external
lis_name: MPI_UNPACK_EXTERNAL
chapter: datatypes
aliases: [MPI_UNPACK_EXTERNAL, MPI_Unpack_external]
tags: [mpi/function, mpi/datatypes]
---

# MPI_UNPACK_EXTERNAL

**C**
```c
int MPI_Unpack_external(char *datarep, void *inbuf, MPI_Aint insize, MPI_Aint *position, void *outbuf, int outcount, MPI_Datatype datatype)
```

**C++**
```cpp
void MPI::Datatype::Unpack_external(const char* datarep, const void* inbuf, MPI::Aint insize, MPI::Aint& position, void* outbuf, int outcount) const
```

| Parameter | Intent | Description |
|---|---|---|
| `datarep` | IN | data representation (string) |
| `inbuf` | IN | input buffer start (choice) |
| `insize` | IN | input buffer size, in bytes (integer) |
| `position` | INOUT | current position in buffer, in bytes (integer) |
| `outbuf` | OUT | output buffer start (choice) |
| `outcount` | IN | number of output data items (integer) |
| `datatype` | IN | datatype of output data item (handle) |

**Fortran (mpif.h)**
```fortran
MPI_UNPACK_EXTERNAL(DATAREP, INBUF, INSIZE, POSITION, OUTBUF, OUTCOUNT, DATATYPE, IERROR)
  INTEGER OUTCOUNT, DATATYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) INSIZE, POSITION
  CHARACTER*(*) DATAREP
  <type> INBUF(*), OUTBUF(*)
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
