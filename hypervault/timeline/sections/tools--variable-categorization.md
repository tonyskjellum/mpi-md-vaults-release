---
title: "Variable Categorization"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Variable Categorization

Chapter **tools** · in [[versions/v30/sections/tools#Variable Categorization|MPI-3.0]], [[versions/v31/sections/tools#Variable Categorization|MPI-3.1]], [[versions/v40/sections/tools#Variable Categorization|MPI-4.0]], [[versions/v41/sections/tools#Variable Categorization|MPI-4.1]], [[versions/v50/sections/tools#Variable Categorization|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

The following function can be used to query the number of ~~control variables,~~ ==categories,== $`N`$.

==If any `OUT` parameter to [[versions/v31/API/MPI_T_CATEGORY_GET_INFO|MPI_T_CATEGORY_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.==

==If the name of a category is equivalent across connected processes, then the returned description must be equivalent.==

==![[versions/v31/API/MPI_T_CATEGORY_GET_INDEX]]==

==[[versions/v31/API/MPI_T_CATEGORY_GET_INDEX|MPI_T_CATEGORY_GET_INDEX]] is a function for retrieving the index of a category given a known category name. The `name` parameter is provided by the caller, and `cat_index` is returned by the MPI implementation. The `name` parameter is a string terminated with a null character.==

==This routine returns `MPI_SUCCESS` on success and returns `MPI_T_ERR_INVALID_NAME` if `name` does not match the name of any category provided by the implementation at the time of the call.==

==> [!tip] Rationale==

==> This routine is provided to enable fast retrieval of a category index by a tool, assuming it knows the name of the category for which it is looking. The number of categories exposed by the implementation can change over time, so it is not possible for the tool to simply iterate over the list of categories once at initialization. Although using MPI implementation specific category names is not portable across MPI implementations, tool developers may choose to take this route for lower overhead at runtime because the tool will not have to iterate over the entire set of categories to find a specific one.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~The following function can be used to query the number of categories, $`N`$.~~

~~![[versions/v40/API/MPI_T_CATEGORY_GET_NUM]]~~

~~Individual category information can then be queried by calling the following function:~~

~~![[versions/v40/API/MPI_T_CATEGORY_GET_INFO]]~~

~~The arguments `name` and `name``_len` are used to return the name of the category as described in Section [[versions/v40/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] .~~

~~The routine is required to return a name of at least length one. This name must be unique with respect to all other names for categories used by the MPI implementation.~~

~~If any `OUT` parameter to [[versions/v40/API/MPI_T_CATEGORY_GET_INFO|MPI_T_CATEGORY_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.~~

~~The arguments `desc` and `desc``_len` are used to return the description of the category as described in Section [[versions/v40/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] .~~

~~Returning a description is optional. If an MPI implementation decides not to return a description, the first character for `desc` must be set to the null character and `desc_len` must be set to one at the return of this call.~~

~~The function returns the number of control variables, performance variables and other categories contained in the queried category in the arguments `num_cvars`, `num_pvars`, and `num_categories`, respectively.~~

~~If the name of a category is equivalent across connected processes, then the returned description must be equivalent.~~

~~![[versions/v40/API/MPI_T_CATEGORY_GET_INDEX]]~~

~~[[versions/v40/API/MPI_T_CATEGORY_GET_INDEX|MPI_T_CATEGORY_GET_INDEX]] is a function for retrieving the index of a category given a known category name. The `name` parameter is provided by the caller, and `cat_index` is returned by the MPI implementation. The `name` parameter is a string terminated with a null character.~~

~~This routine returns `MPI_SUCCESS` on success and returns `MPI_T_ERR_INVALID_NAME` if `name` does not match the name of any category provided by the implementation at the time of the call.~~

~~> [!tip] Rationale~~

~~> This routine is provided to enable fast retrieval of a category index by a tool, assuming it knows the name of the category for which it is looking. The number of categories exposed by the implementation can change over time, so it is not possible for the tool to simply iterate over the list of categories once at initialization. Although using MPI implementation specific category names is not portable across MPI implementations, tool developers may choose to take this route for lower overhead at runtime because the tool will not have to iterate over the entire set of categories to find a specific one.~~

~~![[versions/v40/API/MPI_T_CATEGORY_GET_CVARS]]~~

~~[[versions/v40/API/MPI_T_CATEGORY_GET_CVARS|MPI_T_CATEGORY_GET_CVARS]] can be used to query which control variables are contained in a particular category. A category contains zero or more control variables.~~

~~![[versions/v40/API/MPI_T_CATEGORY_GET_PVARS]]~~

~~[[versions/v40/API/MPI_T_CATEGORY_GET_PVARS|MPI_T_CATEGORY_GET_PVARS]] can be used to query which performance variables are contained in a particular category. A category contains zero or more performance variables.~~

~~![[versions/v40/API/MPI_T_CATEGORY_GET_CATEGORIES]]~~

~~[[versions/v40/API/MPI_T_CATEGORY_GET_CATEGORIES|MPI_T_CATEGORY_GET_CATEGORIES]] can be used to query which other categories are contained in a particular category. A category contains zero or more other categories.~~

~~As mentioned above, MPI implementations can grow the number of categories as well as the number of variables or other categories within a category. In order to allow users of the MPI tool information interface to check quickly whether new categories have been added or new variables or categories have been added to a category, MPI maintains a virtual timestamp. This timestamp is monotonically increasing during the execution and is returned by the following function:~~

~~![[versions/v40/API/MPI_T_CATEGORY_CHANGED]]~~

~~If two subsequent calls to this routine return the same timestamp, it is guaranteed that the category information has not changed between the two calls. If the timestamp retrieved from the second call is higher, then some categories have been added or expanded.~~

~~> [!note] Advice to users~~

~~> The timestamp value is purely virtual and only intended to check for changes in the category information. It should not be used for any other purpose.~~

~~The index values returned in `indices` by [[versions/v40/API/MPI_T_CATEGORY_GET_CVARS|MPI_T_CATEGORY_GET_CVARS]] , [[versions/v40/API/MPI_T_CATEGORY_GET_PVARS|MPI_T_CATEGORY_GET_PVARS]] and [[versions/v40/API/MPI_T_CATEGORY_GET_CATEGORIES|MPI_T_CATEGORY_GET_CATEGORIES]] can be used as input to [[versions/v40/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] , [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] and [[versions/v40/API/MPI_T_CATEGORY_GET_INFO|MPI_T_CATEGORY_GET_INFO]] , respectively.~~

~~The user is responsible for allocating the arrays passed into the functions [[versions/v40/API/MPI_T_CATEGORY_GET_CVARS|MPI_T_CATEGORY_GET_CVARS]] , [[versions/v40/API/MPI_T_CATEGORY_GET_PVARS|MPI_T_CATEGORY_GET_PVARS]] and [[versions/v40/API/MPI_T_CATEGORY_GET_CATEGORIES|MPI_T_CATEGORY_GET_CATEGORIES]] . Starting from array index $`0`$, each function writes up to `len` elements into the array. If the category contains more than `len` elements, the function returns an arbitrary subset of size len. Otherwise, the entire set of elements is returned in the beginning entries of the array, and any remaining array entries are not modified.~~

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Variable Categorization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Variable Categorization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Variable Categorization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Variable Categorization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Variable Categorization]]
