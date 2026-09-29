---
title: MPI_PACK_EXTERNAL
c_name: MPI_Pack_external
lis_name: MPI_PACK_EXTERNAL
chapter: datatypes
aliases: [MPI_PACK_EXTERNAL, MPI_Pack_external]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK_EXTERNAL

**C**
```c
int MPI_Pack_external(char *datarep, void *inbuf, int incount, MPI_Datatype datatype, void *outbuf, MPI_Aint outsize, MPI_Aint *position)
```

**C++**
```cpp
void MPI::Datatype::Pack_external(const char* datarep, const void* inbuf, int incount, void* outbuf, MPI::Aint outsize, MPI::Aint& position) const
```

| Parameter | Intent | Description |
|---|---|---|
| `datarep` | IN | data representation (string) |
| `inbuf` | IN | input buffer start (choice) |
| `incount` | IN | number of input data items (integer) |
| `datatype` | IN | datatype of each input data item (handle) |
| `outbuf` | OUT | output buffer start (choice) |
| `outsize` | IN | output buffer size, in bytes (integer) |
| `position` | INOUT | current position in buffer, in bytes (integer) |

**Fortran (mpif.h)**
```fortran
MPI_PACK_EXTERNAL(DATAREP, INBUF, INCOUNT, DATATYPE, OUTBUF, OUTSIZE, POSITION, IERROR)
  INTEGER INCOUNT, DATATYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) OUTSIZE, POSITION
  CHARACTER*(*) DATAREP
  <type> INBUF(*), OUTBUF(*)
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.
