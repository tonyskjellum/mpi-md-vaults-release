---
title: "Datatype System"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Datatype System

Chapter **tools** · in [[versions/v30/sections/tools#Datatype System|MPI-3.0]], [[versions/v31/sections/tools#Datatype System|MPI-3.1]], [[versions/v40/sections/tools#Datatype System|MPI-4.0]], [[versions/v41/sections/tools#Datatype System|MPI-4.1]], [[versions/v50/sections/tools#Datatype System|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

All variables managed through the MPI tool information interface represent their values through typed buffers of a given length and type using an MPI datatype (similar to regular send/receive buffers). Since the initialization of the MPI tool information interface is separate from the initialization of MPI, MPI tool information interface routines can be called before ~~`MPI_INIT`.~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]] .== Consequently, these routines can also use MPI datatypes before ~~`MPI_INIT`.~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]] .== Therefore, within the context of the MPI tool information interface, it is permissible to use a subset of MPI datatypes as specified below before a call to ~~`MPI_INIT`~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]]== (or equivalent).

==The use of the datatype `MPI_CHAR` in the MPI tool information interface implies a null-terminated character array, i.e., a string in the C language. If a variable has type `MPI_CHAR`, the value of the `count` parameter returned by [[versions/v31/API/MPI_T_CVAR_HANDLE_ALLOC|MPI_T_CVAR_HANDLE_ALLOC]] and [[versions/v31/API/MPI_T_PVAR_HANDLE_ALLOC|MPI_T_PVAR_HANDLE_ALLOC]] must be large enough to include any valid value, including its terminating null character. The contents of returned `MPI_CHAR` arrays are only defined from index 0 through the location of the first null character.==

> The MPI tool information interface requires a significantly simpler type system than MPI itself. Therefore, only its required subset must be present before ~~`MPI_INIT`~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]]== (or equivalent) and MPI implementations do not need to initialize the complete MPI datatype system.

For variables of type `MPI_INT`, an MPI implementation can provide additional information by associating names with a fixed number of values. We refer to this information in the following as an enumeration. In this case, the respective calls that provide additional metadata for each control or performance variable, i.e., ~~`MPI_T_CVAR_GET_INFO`~~ ==[[versions/v31/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]]== (Section [[versions/v31/sections/tools#Control ~~Variable Query Functions|Control Variable Query Functions]]~~ ==Variables|Control Variables]]== ) and ~~`MPI_T_PVAR_GET_INFO`~~ ==[[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]]== (Section [[versions/v31/sections/tools#Performance Variables|Performance Variables]] ), return a handle of type `MPI_T_enum` that can be passed to the following functions to extract additional information. Thus, the MPI implementation can describe variables with a fixed set of values that each represents a particular state. Each enumeration type can have $`N`$ different values, with a fixed $`N`$ that can be queried using [[versions/v31/API/MPI_T_ENUM_GET_INFO|MPI_T_ENUM_GET_INFO]] .

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

All variables managed through the MPI tool information interface represent their values through typed buffers of a given length and type using an MPI datatype (similar to regular send/receive buffers). Since the initialization of the MPI tool information interface is separate from the initialization of MPI, MPI tool information interface routines can be called before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]] .~~ ==MPI initialization.== Consequently, these routines can also use MPI datatypes before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]] .~~ ==MPI initialization.== Therefore, within the context of the MPI tool information interface, it is permissible to use a subset of MPI datatypes as specified below before ~~a call to [[versions/v40/API/MPI_INIT|MPI_INIT]] (or equivalent).~~ ==MPI initialization.==

| | |:-------------------------| | `MPI_INT` ==| | `MPI_INT32_T` | | `MPI_INT64_T`== | | `MPI_UNSIGNED` | | `MPI_UNSIGNED_LONG` | | `MPI_UNSIGNED_LONG_LONG` | | ==`MPI_UINT32_T` | | `MPI_UINT64_T` | |== `MPI_COUNT` | | `MPI_CHAR` | | `MPI_DOUBLE` |

> The MPI tool information interface requires a significantly simpler type system than MPI itself. Therefore, only its required subset must be present before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]] (or equivalent)~~ ==MPI initialization== and MPI implementations do not need to initialize the complete MPI datatype system.

For variables of type `MPI_INT`, an MPI implementation can provide additional information by associating names with a fixed number of values. We refer to this information in the following as an enumeration. In this case, the respective calls that provide additional metadata for each control or performance variable, i.e., [[versions/v40/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] (Section [[versions/v40/sections/tools#Control Variables|Control Variables]] ~~) and~~ ==),== [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] (Section [[versions/v40/sections/tools#Performance Variables|Performance Variables]] ==), and [[versions/v40/API/MPI_T_EVENT_GET_INFO|MPI_T_EVENT_GET_INFO]] (Section [[versions/v40/sections/tools#Events|Events]]== ), return a handle of type `MPI_T_enum` that can be passed to the following functions to extract additional information. Thus, the MPI implementation can describe variables with a fixed set of values that each represents a particular state. Each enumeration type can have $`N`$ different values, with a fixed $`N`$ that can be queried using [[versions/v40/API/MPI_T_ENUM_GET_INFO|MPI_T_ENUM_GET_INFO]] .

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Datatype System]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Datatype System]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Datatype System]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Datatype System]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Datatype System]]
