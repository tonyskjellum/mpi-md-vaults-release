---
title: "Deprecated since MPI-4.1"
chapter: deprecated
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/deprecated]
---

# Deprecated since MPI-4.1

Chapter **deprecated** · in [[versions/v41/sections/deprecated#Deprecated since MPI-4.1|MPI-4.1]], [[versions/v50/sections/deprecated#Deprecated since MPI-4.1|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] in MPI-2.0. The~~

~~language~~

~~independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_TYPE_HVECTOR]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_TYPE_HINDEXED]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_TYPE_STRUCT]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_ADDRESS]]~~

~~The following functions are deprecated and are superseded by [[versions/v22/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] in MPI-2.0.~~

~~![[versions/v22/API/MPI_TYPE_EXTENT]]~~

~~Returns the extent of a datatype, where extent is as defined on page [[versions/v22/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] .~~

~~The two functions below can be used for finding the lower bound and the upper bound of a datatype.~~

~~![[versions/v22/API/MPI_TYPE_LB]]~~

~~![[versions/v22/API/MPI_TYPE_UB]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_KEYVAL_CREATE]]~~

~~The `copy_fn` function is invoked when a communicator is duplicated by [[versions/v22/API/MPI_COMM_DUP|MPI_COMM_DUP]] . `copy_fn` should be of type `MPI_Copy_function`, which is defined as follows:~~

~~    typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,                                   void *extra_state, void *attribute_val_in,                                   void *attribute_val_out, int *flag)~~

~~A Fortran declaration for such a function is as follows:~~

~~`copy_fn` may be specified as [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or FORTRAN; [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than returning flag = 0 and MPI_SUCCESS. [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets flag = 1, returns the value of `attribute_val_in` in `attribute_val_out`, and returns MPI_SUCCESS.~~

~~Note that [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.~~

~~Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[versions/v22/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v22/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . `delete_fn` should be of type `MPI_Delete_function`, which is defined as follows:~~

~~    typedef int MPI_Delete_function(MPI_Comm comm, int keyval,                     void *attribute_val, void *extra_state);~~

~~A Fortran declaration for such a function is as follows:~~

~~`delete_fn` may be specified as [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning MPI_SUCCESS.~~

~~Note that [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is also deprecated.~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_KEYVAL_FREE]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ATTR_PUT]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ATTR_GET]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ATTR_DELETE]]~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ERRHANDLER_CREATE]]~~

~~Register the user routine `function` for use as an MPI exception handler. Returns in `errhandler` a handle to the registered exception handler.~~

~~In the C language,~~

~~the user routine should be a C function of type `MPI_Handler_function`, which is defined as:~~

~~    typedef void (MPI_Handler_function)(MPI_Comm *, int *, ...);~~

~~The first argument is the communicator in use, the second is the error code to be returned.~~

~~In the Fortran language, the user routine should be of the form:~~

~~    SUBROUTINE HANDLER_FUNCTION(COMM, ERROR_CODE, .....)        INTEGER COMM, ERROR_CODE~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_SET_ERRHANDLER|MPI_COMM_SET_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ERRHANDLER_SET]]~~

~~Associates the new error handler `errorhandler` with communicator `comm` at the calling process. Note that an error handler is always associated with the communicator.~~

~~The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_GET_ERRHANDLER|MPI_COMM_GET_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ERRHANDLER_GET]]~~

~~Returns in `errhandler` (a handle to) the error handler that is currently associated with communicator `comm`.~~

==The entire set of C++ language bindings have been deprecated.==

==> [!tip] Rationale==

==> The C++ bindings add minimal functionality over the C bindings while incurring a significant amount of maintenance to the MPI specification. Since the C++ bindings are effectively a one-to-one mapping of the C bindings, it should be relatively easy to convert existing C++ MPI applications to use the MPI C bindings. Additionally, there are third party packages available that provide C++ class library functionality (i.e., C++-specific functionality layered on top of the MPI C bindings) that are likely more expressive and/or natural to C++ programmers and are not suitable for standardization in this specification.==

==The following function typedefs have been deprecated and are superseded by new names. Other than the typedef names, the function signatures are exactly the same; the names were updated to match conventions of other function typedef names.==

==ll **Deprecated Name** & **New Name**   `MPI_Comm_errhandler_fn` & `MPI_Comm_errhandler_function`  `MPI::Comm::Errhandler_fn` & `MPI::Comm::Errhandler_function`  `MPI_File_errhandler_fn` & `MPI_File_errhandler_function`  `MPI::File::Errhandler_fn` & `MPI::File::Errhandler_function`  `MPI_Win_errhandler_fn` & `MPI_Win_errhandler_function`  `MPI::Win::Errhandler_fn` & `MPI::Win:::Errhandler_function`==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~The entire set of C++ language bindings have been deprecated.~~

~~> [!tip] Rationale~~

~~> The C++ bindings add minimal functionality over the C bindings while incurring a significant amount of maintenance to the MPI specification. Since the C++ bindings are effectively a one-to-one mapping of the C bindings, it should be relatively easy to convert existing C++ MPI applications to use the MPI C bindings. Additionally, there are third party packages available that provide C++ class library functionality (i.e., C++-specific functionality layered on top of the MPI C bindings) that are likely more expressive and/or natural to C++ programmers and are not suitable for standardization in this specification.~~

==The entire set of C++ language bindings have been removed. See Chapter [[chap-removed]] , <span class="sans-serif">Removed Interfaces</span> for more information.==

ll **Deprecated Name** & **New Name** `MPI_Comm_errhandler_fn` & `MPI_Comm_errhandler_function` ~~`MPI::Comm::Errhandler_fn` & `MPI::Comm::Errhandler_function`~~ `MPI_File_errhandler_fn` & `MPI_File_errhandler_function` ~~`MPI::File::Errhandler_fn` & `MPI::File::Errhandler_function`~~ `MPI_Win_errhandler_fn` & `MPI_Win_errhandler_function` ~~`MPI::Win::Errhandler_fn` & `MPI::Win:::Errhandler_function`~~

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The entire set of C++ language bindings have been removed. See Chapter [[chap-removed]] , ~~<span class="sans-serif">Removed Interfaces</span>~~ for more information.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~The entire set of C++ language bindings have been removed. See Chapter [[chap-removed]] , for more information.~~

~~The following function typedefs have been deprecated and are superseded by new names. Other than the typedef names, the function signatures are exactly the same; the names were updated to match conventions of other function typedef names.~~

~~ll **Deprecated Name** & **New Name**   `MPI_Comm_errhandler_fn` & `MPI_Comm_errhandler_function`  `MPI_File_errhandler_fn` & `MPI_File_errhandler_function`  `MPI_Win_errhandler_fn` & `MPI_Win_errhandler_function`~~

==Cancelling a send request by calling [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.==

==The following function is deprecated and is superseded by the new [[versions/v40/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.==

==![[versions/v40/API/MPI_INFO_GET]]==

==This function retrieves the value associated with key in a previous call to [[versions/v40/API/MPI_INFO_SET|MPI_INFO_SET]] . If such a key exists, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `valuelen` is the number of characters available in value. If it is less than the actual size of the value, the value is truncated. In C, `valuelen` should be one less than the amount of allocated space to allow for the null terminator.==

==If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.==

==The function [[versions/v40/API/MPI_INFO_GET|MPI_INFO_GET]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v40/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

==The following function is deprecated and is superseded by the new [[versions/v40/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.==

==![[versions/v40/API/MPI_INFO_GET_VALUELEN]]==

==Retrieves the length of the `value` associated with `key`. If `key` is defined, `valuelen` is set to the length of its associated value and `flag` is set to `true`. If `key` is not defined, `valuelen` is not touched and `flag` is set to `false`. The length returned in C does not include the end-of-string character.==

==If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.==

==The function [[versions/v40/API/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v40/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

==The following return code has been deprecated and is superseded by a new name in MPI-4.0.==

==| **Deprecated Name**      | **Replacement Name**      | |:-------------------------|:--------------------------| | `MPI_T_ERR_INVALID_ITEM` | `MPI_T_ERR_INVALID_INDEX` |==

==The following Fortran subroutines are deprecated because the Fortran language `storage_size()` and `c_sizeof()` intrinsic functions provide similar functionality. Note that while [[versions/v40/API/MPI_SIZEOF|MPI_SIZEOF]] and `c_sizeof()` return the size in bytes, `storage_size()` provides the size in bits.==

==![[versions/v40/API/MPI_SIZEOF]]==

==This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.==

==> [!note] Advice to users==

==> This function is similar to the C *sizeof* operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.==

==> [!tip] Rationale==

==> This function is not available in other languages because it would not be useful.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~Cancelling a send request by calling [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.~~

~~The following function is deprecated and is superseded by the new [[versions/v41/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.~~

~~![[versions/v41/API/MPI_INFO_GET]]~~

~~This function retrieves the value associated with key in a previous call to [[versions/v41/API/MPI_INFO_SET|MPI_INFO_SET]] . If such a key exists, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `valuelen` is the number of characters available in value. If it is less than the actual size of the value, the value is truncated. In C, `valuelen` should be one less than the amount of allocated space to allow for the null terminator.~~

~~If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.~~

~~The function [[versions/v41/API/MPI_INFO_GET|MPI_INFO_GET]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .~~

~~The following function is deprecated and is superseded by the new [[versions/v41/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.~~

~~![[versions/v41/API/MPI_INFO_GET_VALUELEN]]~~

~~Retrieves the length of the `value` associated with `key`. If `key` is defined, `valuelen` is set to the length of its associated value and `flag` is set to `true`. If `key` is not defined, `valuelen` is not touched and `flag` is set to `false`. The length returned in C does not include the end-of-string character.~~

~~If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.~~

~~The function [[versions/v41/API/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .~~

~~The following return code has been deprecated and is superseded by a new name in MPI-4.0.~~

~~| **Deprecated Name**      | **Replacement Name**      | |:-------------------------|:--------------------------| | `MPI_T_ERR_INVALID_ITEM` | `MPI_T_ERR_INVALID_INDEX` |~~

~~The following Fortran subroutines are deprecated because the Fortran language `storage_size()` and `c_sizeof()` intrinsic functions provide similar functionality. Note that while [[versions/v41/API/MPI_SIZEOF|MPI_SIZEOF]] and `c_sizeof()` return the size in bytes, `storage_size()` provides the size in bits.~~

~~![[versions/v41/API/MPI_SIZEOF]]~~

~~This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.~~

~~> [!note] Advice to users~~

~~> This function is similar to the C *sizeof* operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.~~

~~> [!tip] Rationale~~

~~> This function is not available in other languages because it would not be useful.~~

==- The use of the `mpif.h` include file has been deprecated. Information supporting the transition to `USE mpi` or `USE mpi_f08` is provided in Section [[f90-basic]] .==

==- The predefined attribute key `MPI_HOST` for `MPI_COMM_WORLD` when using the World Model is deprecated.==

==  `MPI_HOST`:     Host process rank, if such exists, `MPI_PROC_NULL`, otherwise.==

==  #### Host Rank==

==  The value returned for `MPI_HOST` gets the rank of the *HOST* process in the group associated with communicator `MPI_COMM_WORLD`, if there is such. `MPI_PROC_NULL` is returned if there is no host. MPI does not specify what it means for a process to be a *HOST*, nor does it requires that a *HOST* exists.==

==  The attribute `MPI_HOST` has the same value on all processes of `MPI_COMM_WORLD`.==

==  | **Environmental inquiry keys**           |   |:-----------------------------------------|   |  C type: `const int` (or unnamed `enum`) |   |  Fortran type: `INTEGER`                 |   | `MPI_HOST`                               |==

==- All `MPI_XXX_X` procedures have been deprecated and may be removed in a future version of the MPI specification. In the case of their C binding and their Fortran binding through the `mpi_f08` module, they are superseded by the large count and large byte displacement bindings of their counterpart in the form of `MPI_XXX` .==

==  ![[versions/v41/API/MPI_TYPE_SIZE_X]]==

==  The description of [[versions/v41/API/MPI_TYPE_SIZE|MPI_TYPE_SIZE]] is applicable to this deprecated [[versions/v41/API/MPI_TYPE_SIZE_X|MPI_TYPE_SIZE_X]] accordingly, see [[versions/v41/sections/datatypes#Address and Size Procedures|Address and Size Procedures]] .==

==  ![[versions/v41/API/MPI_TYPE_GET_EXTENT_X]]==

==  The description of [[versions/v41/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] is applicable to this deprecated [[versions/v41/API/MPI_TYPE_GET_EXTENT_X|MPI_TYPE_GET_EXTENT_X]] accordingly, see [[versions/v41/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] .==

==  ![[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT_X]]==

==  The description of [[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT|MPI_TYPE_GET_TRUE_EXTENT]] is applicable to this deprecated [[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] accordingly, see [[versions/v41/sections/datatypes#True Extent of Datatypes|True Extent of Datatypes]] .==

==  ![[versions/v41/API/MPI_GET_ELEMENTS_X]]==

==  The description of [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] is applicable to this deprecated [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] accordingly, see [[versions/v41/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .==

==  ![[versions/v41/API/MPI_STATUS_SET_ELEMENTS_X]]==

==  The description of [[versions/v41/API/MPI_STATUS_SET_ELEMENTS|MPI_STATUS_SET_ELEMENTS]] is applicable to this deprecated [[versions/v41/API/MPI_STATUS_SET_ELEMENTS_X|MPI_STATUS_SET_ELEMENTS_X]] accordingly, see [[versions/v41/sections/ei#Associating Information with Status|Associating Information with Status]] .==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~- The use of the `mpif.h` include file has been deprecated. Information supporting the transition to `USE mpi` or `USE mpi_f08` is provided in Section [[f90-basic]] .~~

~~- The predefined attribute key `MPI_HOST` for `MPI_COMM_WORLD` when using the World Model is deprecated.~~

~~  `MPI_HOST`:     Host process rank, if such exists, `MPI_PROC_NULL`, otherwise.~~

~~  #### Host Rank~~

~~  The value returned for `MPI_HOST` gets the rank of the *HOST* process in the group associated with communicator `MPI_COMM_WORLD`, if there is such. `MPI_PROC_NULL` is returned if there is no host. MPI does not specify what it means for a process to be a *HOST*, nor does it requires that a *HOST* exists.~~

~~  The attribute `MPI_HOST` has the same value on all processes of `MPI_COMM_WORLD`.~~

~~  | **Environmental inquiry keys**           |   |:-----------------------------------------|   |  C type: `const int` (or unnamed `enum`) |   |  Fortran type: `INTEGER`                 |   | `MPI_HOST`                               |~~

~~- All `MPI_XXX_X` procedures have been deprecated and may be removed in a future version of the MPI specification. In the case of their C binding and their Fortran binding through the `mpi_f08` module, they are superseded by the large count and large byte displacement bindings of their counterpart in the form of `MPI_XXX` .~~

~~  ![[versions/v50/API/MPI_TYPE_SIZE_X]]~~

~~  The description of [[versions/v50/API/MPI_TYPE_SIZE|MPI_TYPE_SIZE]] is applicable to this deprecated [[versions/v50/API/MPI_TYPE_SIZE_X|MPI_TYPE_SIZE_X]] accordingly, see [[versions/v50/sections/datatypes#Address and Size Procedures|Address and Size Procedures]] .~~

~~  ![[versions/v50/API/MPI_TYPE_GET_EXTENT_X]]~~

~~  The description of [[versions/v50/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] is applicable to this deprecated [[versions/v50/API/MPI_TYPE_GET_EXTENT_X|MPI_TYPE_GET_EXTENT_X]] accordingly, see [[versions/v50/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] .~~

~~  ![[versions/v50/API/MPI_TYPE_GET_TRUE_EXTENT_X]]~~

~~  The description of [[versions/v50/API/MPI_TYPE_GET_TRUE_EXTENT|MPI_TYPE_GET_TRUE_EXTENT]] is applicable to this deprecated [[versions/v50/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] accordingly, see [[versions/v50/sections/datatypes#True Extent of Datatypes|True Extent of Datatypes]] .~~

~~  ![[versions/v50/API/MPI_GET_ELEMENTS_X]]~~

~~  The description of [[versions/v50/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] is applicable to this deprecated [[versions/v50/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] accordingly, see [[versions/v50/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .~~

~~  ![[versions/v50/API/MPI_STATUS_SET_ELEMENTS_X]]~~

~~  The description of [[versions/v50/API/MPI_STATUS_SET_ELEMENTS|MPI_STATUS_SET_ELEMENTS]] is applicable to this deprecated [[versions/v50/API/MPI_STATUS_SET_ELEMENTS_X|MPI_STATUS_SET_ELEMENTS_X]] accordingly, see [[versions/v50/sections/ei#Associating Information with Status|Associating Information with Status]] .~~

==The use of the `mpif.h` include file has been deprecated. Information supporting the transition to `USE mpi` or `USE mpi_f08` is provided in Section [[f90-basic]] .==

== The predefined attribute key `MPI_HOST` for `MPI_COMM_WORLD` when using the World Model is deprecated.==

==`MPI_HOST`: Host process rank, if such exists, `MPI_PROC_NULL`, otherwise.==

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/deprecated#Deprecated since MPI-4.1]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/deprecated#Deprecated since MPI-4.1]]
