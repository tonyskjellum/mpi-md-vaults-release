---
title: MPI_INFO_GET_VALUELEN
c_name: MPI_Info_get_valuelen
lis_name: MPI_INFO_GET_VALUELEN
chapter: misc
aliases: [MPI_INFO_GET_VALUELEN, MPI_Info_get_valuelen]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_GET_VALUELEN

**C**
```c
int MPI_Info_get_valuelen(MPI_Info info, char *key, int *valuelen, int *flag)
```

**C++**
```cpp
bool MPI::Info::Get_valuelen(const char* key, int& valuelen) const
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object (handle) |
| `key` | IN | key (string) |
| `valuelen` | OUT | length of value arg (integer) |
| `flag` | OUT | `true` if key defined, `false` if not (boolean) |

**Fortran (mpif.h)**
```fortran
MPI_INFO_GET_VALUELEN(INFO, KEY, VALUELEN, FLAG, IERROR)
  INTEGER INFO, VALUELEN, IERROR
  LOGICAL FLAG
  CHARACTER*(*) KEY
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
