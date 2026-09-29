---
title: MPI_INFO_GET
c_name: MPI_Info_get
lis_name: MPI_INFO_GET
chapter: misc
aliases: [MPI_INFO_GET, MPI_Info_get]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_GET

**C**
```c
int MPI_Info_get(MPI_Info info, char *key, int valuelen, char *value, int *flag)
```

**C++**
```cpp
bool MPI::Info::Get(const char* key, int valuelen, char* value) const
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object (handle) |
| `key` | IN | key (string) |
| `valuelen` | IN | length of value arg (integer) |
| `value` | OUT | value (string) |
| `flag` | OUT | `true` if key defined, `false` if not (boolean) |

**Fortran (mpif.h)**
```fortran
MPI_INFO_GET(INFO, KEY, VALUELEN, VALUE, FLAG, IERROR)
  INTEGER INFO, VALUELEN, IERROR
  CHARACTER*(*) KEY, VALUE
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
