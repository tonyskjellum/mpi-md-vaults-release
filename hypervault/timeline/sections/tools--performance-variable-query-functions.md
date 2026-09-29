---
title: "Performance Variable Query Functions"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Performance Variable Query Functions

Chapter **tools** · in [[versions/v30/sections/tools#Performance Variable Query Functions|MPI-3.0]], [[versions/v31/sections/tools#Performance Variable Query Functions|MPI-3.1]], [[versions/v40/sections/tools#Performance Variable Query Functions|MPI-4.0]], [[versions/v41/sections/tools#Performance Variable Query Functions|MPI-4.1]], [[versions/v50/sections/tools#Performance Variable Query Functions|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

==If any `OUT` parameter to [[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.==

If the variable is of type `MPI_INT`, MPI can optionally specify an enumeration for the values represented by this variable and return it in `enumtype`. In this case, MPI returns an enumeration identifier, which can then be used to gather more information as described in Section [[versions/v31/sections/tools#Datatype System|Datatype System]] . Otherwise, `enumtype` is set to `MPI_T_ENUM_NULL`. If the datatype is not `MPI_INT` or the argument `enumtype` is the null pointer, no ~~emumeration~~ ==enumeration== type is returned.

Returning a description is optional. If an MPI implementation does not ~~to~~ return a description, the first character for `desc` must be set to the null character and `desc_len` must be set to one at the return from this function.

==If a performance variable has an equivalent name and has the same class across connected processes, the following `OUT` parameters must be identical: `verbosity`, `varclass`, `datatype`, `enumtype`, `bind`, `readonly`, `continuous`, and `atomic`. The returned description must be equivalent.==

==![[versions/v31/API/MPI_T_PVAR_GET_INDEX]]==

==[[versions/v31/API/MPI_T_PVAR_GET_INDEX|MPI_T_PVAR_GET_INDEX]] is a function for retrieving the index of a performance variable given a known variable name and class. The `name` and `var_class` parameters are provided by the caller, and `pvar_index` is returned by the MPI implementation. The `name` parameter is a string terminated with a null character.==

==This routine returns `MPI_SUCCESS` on success and returns `MPI_T_ERR_INVALID_NAME` if `name` does not match the name of any performance variable of the specified `var_class` provided by the implementation at the time of the call.==

==> [!tip] Rationale==

==> This routine is provided to enable fast retrieval of performance variables by a tool, assuming it knows the name of the variable for which it is looking. The number of variables exposed by the implementation can change over time, so it is not possible for the tool to simply iterate over the list of variables once at initialization. Although using MPI implementation specific variable names is not portable across MPI implementations, tool developers may choose to take this route for lower overhead at runtime because the tool will not have to iterate over the entire set of variables to find a specific one.==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

The following function can be used to query the number of performance variables, ~~$`N`$:~~ ==$`\texttt{num_pvar}`$:==

~~If any `OUT` parameter to [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.~~

~~The arguments `name` and `name``_len` are used to return the name of the performance variable as described in Section [[versions/v40/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] .~~

~~If completed successfully, the routine is required to return a name of at least length one.~~

==If any OUT parameter to [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.==

==The arguments `name` and `name``_len` are used to return the name of the performance variable as described in Section [[versions/v40/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] . If completed successfully, the routine is required to return a name of at least length one.==

If a performance variable has an equivalent name and has the same class across connected ==MPI== processes, the following ~~`OUT`~~ ==OUT== parameters must be identical: `verbosity`, `varclass`, `datatype`, `enumtype`, `bind`, `readonly`, `continuous`, and `atomic`. The returned description must be equivalent.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

An MPI implementation is allowed to increase the number of performance variables during the execution of an MPI application when new variables become available through dynamic loading. However, MPI implementations are not allowed to change the index of a performance variable or to delete a variable once it has been added to the set. When a variable becomes inactive, e.g., through dynamic unloading, accessing its value should return a corresponding ~~error~~ ==return== code.

> Groups of variables that belong closely together, but have different classes, can have the same name. This choice is useful, e.g., to refer to multiple variables that describe a single resource (like the level, the total size, as well as ~~high~~ ==high-== and ~~low watermarks).~~ ==low-water marks).==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Performance Variable Query Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Performance Variable Query Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Performance Variable Query Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Performance Variable Query Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Performance Variable Query Functions]]
