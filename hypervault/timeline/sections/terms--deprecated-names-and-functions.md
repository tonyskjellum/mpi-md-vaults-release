---
title: "Deprecated Names and Functions"
chapter: terms
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/terms]
---

# Deprecated Names and Functions

Chapter **terms** · in [[versions/v20/sections/terms#Deprecated Names and Functions|MPI-2.0]], [[versions/v21/sections/terms#Deprecated Names and Functions|MPI-2.1]], [[versions/v22/sections/terms#Deprecated Names and Functions|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~A number of chapters refer to deprecated or replaced MPI-1 constructs. These are constructs that continue to be part of the MPI standard, but that users are recommended not to continue using, since MPI-2 provides better solutions. For example, the Fortran binding for MPI-1 functions that have address arguments uses `INTEGER`. This is not consistent with the C binding, and causes problems on machines with 32 bit `INTEGER`s and 64 bit addresses. In MPI-2, these functions have new names, and new bindings for the address arguments. The use of the old functions is deprecated. For consistency, here and a few other cases, new C functions are also provided, even though the new functions are equivalent to the old functions. The old names are deprecated. Another example is provided by the MPI-1 predefined datatypes MPI_UB and MPI_LB. They are deprecated, since their use is awkward and error-prone, while the MPI-2 function [[versions/v21/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] provides a more convenient mechanism to achieve the same effect.~~

~~The following is a list of all of the deprecated constructs. Note that the constants MPI_LB and MPI_UB are replaced by the function [[versions/v21/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] ; this is because their principle use was as input datatypes to [[versions/v21/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] to create resized datatypes. Also note that some C typedefs and Fortran subroutine names are included in this list; they are the types of callback functions.~~

==A number of chapters refer to deprecated or replaced MPI-1 constructs. These are constructs that continue to be part of the MPI standard,==

==as documented in Chapter [[versions/v21/sections/deprecated#Deprecated Functions|Deprecated Functions]] ,==

==but that users are recommended not to continue using, since==

==better solutions were provided with MPI-2.==

==For example, the Fortran binding for MPI-1 functions that have address arguments uses `INTEGER`. This is not consistent with the C binding, and causes problems on machines with 32 bit `INTEGER`s and 64 bit addresses. In MPI-2, these functions==

==were given new names with==

==new bindings for the address arguments. The use of the old functions is deprecated. For consistency, here and==

==in==

==a few other cases, new C functions are also provided, even though the new functions are equivalent to the old functions. The old names are deprecated. Another example is provided by the MPI-1 predefined datatypes MPI_UB and MPI_LB. They are deprecated, since their use is awkward and error-prone.==

==The==

==MPI-2 function [[versions/v21/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] provides a more convenient mechanism to achieve the same effect.==

==Table [[versions/v21/sections/terms#Deprecated Names and Functions|Deprecated Names and Functions]] shows==

==a list of all of the deprecated constructs. Note that the constants MPI_LB and MPI_UB are replaced by the function [[versions/v21/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] ; this is because their==

==principal==

==use was as input datatypes to [[versions/v21/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] to create resized datatypes. Also note that some C typedefs and Fortran subroutine names are included in this list; they are the types of callback functions.==

==Deprecated constructs==

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

a few other cases, new C functions are also provided, even though the new functions are equivalent to the old functions. The old names are deprecated. Another example is provided by the MPI-1 predefined datatypes ~~MPI_UB~~ ==`MPI_UB`== and ~~MPI_LB.~~ ==`MPI_LB`.== They are deprecated, since their use is awkward and error-prone.

a list of all of the deprecated constructs. Note that the constants ~~MPI_LB~~ ==`MPI_LB`== and ~~MPI_UB~~ ==`MPI_UB`== are replaced by the function [[versions/v22/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] ; this is because their

| Deprecated | MPI-2 Replacement | |:------------------------------|:--------------------------------------| | [[versions/v22/API/MPI_ADDRESS|MPI_ADDRESS]] | [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] | | [[versions/v22/API/MPI_TYPE_HINDEXED|MPI_TYPE_HINDEXED]] | [[versions/v22/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] | | [[versions/v22/API/MPI_TYPE_HVECTOR|MPI_TYPE_HVECTOR]] | [[versions/v22/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] | | [[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] | [[versions/v22/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] | | [[versions/v22/API/MPI_TYPE_EXTENT|MPI_TYPE_EXTENT]] | [[versions/v22/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] | | [[versions/v22/API/MPI_TYPE_UB|MPI_TYPE_UB]] | [[versions/v22/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] | | [[versions/v22/API/MPI_TYPE_LB|MPI_TYPE_LB]] | [[versions/v22/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] | | ~~[[MPI_LB]]~~ ==`MPI_LB`== | [[versions/v22/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] | | ~~[[MPI_UB]]~~ ==`MPI_UB`== | [[versions/v22/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] | | [[versions/v22/API/MPI_ERRHANDLER_CREATE|MPI_ERRHANDLER_CREATE]] | [[versions/v22/API/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]] | | [[versions/v22/API/MPI_ERRHANDLER_GET|MPI_ERRHANDLER_GET]] | [[versions/v22/API/MPI_COMM_GET_ERRHANDLER|MPI_COMM_GET_ERRHANDLER]] | | [[versions/v22/API/MPI_ERRHANDLER_SET|MPI_ERRHANDLER_SET]] | [[versions/v22/API/MPI_COMM_SET_ERRHANDLER|MPI_COMM_SET_ERRHANDLER]] | | [[MPI_Handler_function]] | ~~[[versions/v21/API/MPI_COMM_CREATE_ERRHANDLER|MPI_Comm_errhandler_fn]]~~ ==[[versions/v22/API/MPI_COMM_CREATE_ERRHANDLER|MPI_Comm_errhandler_function]]== | | [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_KEYVAL_CREATE]] | [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] | | [[versions/v22/API/MPI_KEYVAL_FREE|MPI_KEYVAL_FREE]] | [[versions/v22/API/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] | | [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] | [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] | | [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] | [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] | | [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] | [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] | | [[MPI_Copy_function]] | [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_Comm_copy_attr_function]] | | [[COPY_FUNCTION]] | [[COMM_COPY_ATTR_FN]] | | [[MPI_Delete_function]] | [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_Comm_delete_attr_function]] | | [[DELETE_FUNCTION]] | [[COMM_DELETE_ATTR_FN]] | | [[versions/v22/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] | [[versions/v22/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] | | [[versions/v22/API/MPI_ATTR_GET|MPI_ATTR_GET]] | [[versions/v22/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] | | [[versions/v22/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] | [[versions/v22/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] |

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Deprecated Names and Functions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Deprecated Names and Functions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Deprecated Names and Functions]]
