---
title: MPI_TYPE_GET_ATTR
c_name: MPI_Type_get_attr
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_GET_ATTR, MPI_Type_get_attr]
tags: [mpi/routine, mpi/context]
---

# MPI_TYPE_GET_ATTR

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_GET_ATTR|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_GET_ATTR|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_GET_ATTR|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_GET_ATTR|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_GET_ATTR|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_GET_ATTR|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_GET_ATTR|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_GET_ATTR|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_get_attr(MPI_Datatype type, int type_keyval, void *attribute_val, int *flag)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Type_get_attr(MPI_Datatype datatype, int type_keyval, void *attribute_val, int *flag)
```

## C++

**MPI-2.0–MPI-2.2**
```c
bool MPI::Datatype::Get_attr(int type_keyval, void* attribute_val) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_get_attr(datatype, type_keyval, attribute_val, flag, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: type_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_get_attr(datatype, type_keyval, attribute_val, flag, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: type_keyval
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-2.2**
```fortran
MPI_TYPE_GET_ATTR(TYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
    INTEGER TYPE, TYPE_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
    LOGICAL FLAG
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_TYPE_GET_ATTR(DATATYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
    INTEGER DATATYPE, TYPE_KEYVAL, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `type` | IN | **MPI-2.0–MPI-2.2:** datatype to which the attribute is attached (handle)<br>_MPI-3.0–MPI-5.0: absent_ |
| `type_keyval` | IN | **MPI-2.0–MPI-5.0:** key value (integer) |
| `attribute_val` | OUT | **MPI-2.0–MPI-3.1:** attribute value, unless `flag = false`<br>**MPI-4.0–MPI-5.0:** attribute value, unless `flag" = false` |
| `flag` | OUT | **MPI-2.0–MPI-2.1:** false if no attribute is associated with the key (logical)<br>**MPI-2.2–MPI-5.0:** `false` if no attribute is associated with the key (logical) |
| `datatype` | IN | _MPI-2.0–MPI-2.2: absent_<br>**MPI-3.0–MPI-5.0:** datatype to which the attribute is attached (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_GET_ATTR|API note]] · chapter [[versions/v50/sections/context|context]]
