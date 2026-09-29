---
title: MPI_INFO_SET
c_name: MPI_Info_set
lis_name: MPI_INFO_SET
chapter: misc
aliases: [MPI_INFO_SET, MPI_Info_set]
tags: [mpi/function, mpi/misc]
---

# MPI_INFO_SET

**C**
```c
int MPI_Info_set(MPI_Info info, char *key, char *value)
```

**C++**
```cpp
void MPI::Info::Set(const char* key, const char* value)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | INOUT | info object (handle) |
| `key` | IN | key (string) |
| `value` | IN | value (string) |

**Fortran (mpif.h)**
```fortran
MPI_INFO_SET(INFO, KEY, VALUE, IERROR)
  INTEGER INFO, IERROR
  CHARACTER*(*) KEY, VALUE
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.
