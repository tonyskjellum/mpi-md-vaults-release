---
title: "Deprecated since MPI-4.0"
chapter: deprecated
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/deprecated]
---

# Deprecated since MPI-4.0

Chapter **deprecated** · in [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|MPI-4.0]], [[versions/v41/sections/deprecated#Deprecated since MPI-4.0|MPI-4.1]], [[versions/v50/sections/deprecated#Deprecated since MPI-4.0|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

The following function is deprecated and is superseded by [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as ==that== of the new function, except ~~of~~ ==for== the function ~~name.~~ ==name and a different behavior in the C/Fortran language interoperability, see Section [[versions/v22/sections/binding#Attributes|Attributes]] on page [[versions/v22/sections/binding#Attributes|Attributes]] .== The language bindings are modified.

`copy_fn` may be specified as [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or FORTRAN; [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than returning ~~flag~~ ==`flag== = ~~0~~ ==0`== and ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.== [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets ~~flag~~ ==`flag== = ~~1,~~ ==1`,== returns the value of `attribute_val_in` in `attribute_val_out`, and returns ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.==

`delete_fn` may be specified as [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.==

SUBROUTINE HANDLER_FUNCTION(COMM, ~~ERROR_CODE, .....)~~ ==ERROR_CODE)== INTEGER COMM, ERROR_CODE

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~The following function is deprecated and is superseded by [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] in MPI-2.0. The~~

~~language~~

~~independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_TYPE_HVECTOR]]~~

~~The following function is deprecated and is superseded by [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_TYPE_HINDEXED]]~~

~~The following function is deprecated and is superseded by [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_TYPE_STRUCT]]~~

~~The following function is deprecated and is superseded by [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.~~

~~![[versions/v22/API/MPI_ADDRESS]]~~

~~The following functions are deprecated and are superseded by [[versions/v30/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] in MPI-2.0.~~

~~![[versions/v22/API/MPI_TYPE_EXTENT]]~~

~~Returns the extent of a datatype, where extent is as defined on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] .~~

~~The two functions below can be used for finding the lower bound and the upper bound of a datatype.~~

~~![[versions/v22/API/MPI_TYPE_LB]]~~

~~![[versions/v22/API/MPI_TYPE_UB]]~~

~~`copy_fn` may be specified as [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or FORTRAN; [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and `MPI_SUCCESS`. [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`.~~

~~Note that [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.~~

==`copy_fn` may be specified as==

==[[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or==

==[[versions/v30/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or FORTRAN; [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and `MPI_SUCCESS`. [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.==

`delete_fn` may be specified as ~~[[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`.~~

==[[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`.== Note that [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is also deprecated.

~~The following function is deprecated and is superseded by [[versions/v30/API/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ERRHANDLER_CREATE]]~~

~~Register the user routine `function` for use as an MPI exception handler. Returns in `errhandler` a handle to the registered exception handler.~~

~~In the C language,~~

~~the user routine should be a C function of type `MPI_Handler_function`, which is defined as:~~

~~    typedef void (MPI_Handler_function)(MPI_Comm *, int *, ...);~~

~~The first argument is the communicator in use, the second is the error code to be returned.~~

~~In the Fortran language, the user routine should be of the form:~~

~~    SUBROUTINE HANDLER_FUNCTION(COMM, ERROR_CODE)        INTEGER COMM, ERROR_CODE~~

~~The following function is deprecated and is superseded by [[versions/v30/API/MPI_COMM_SET_ERRHANDLER|MPI_COMM_SET_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ERRHANDLER_SET]]~~

~~Associates the new error handler `errorhandler` with communicator `comm` at the calling process. Note that an error handler is always associated with the communicator.~~

~~The following function is deprecated and is superseded by [[versions/v30/API/MPI_COMM_GET_ERRHANDLER|MPI_COMM_GET_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v22/API/MPI_ERRHANDLER_GET]]~~

~~Returns in `errhandler` (a handle to) the error handler that is currently associated with communicator `comm`.~~

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

The following function is deprecated and is superseded by [[versions/v31/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as that of the new function, except for the function name and a different behavior in the C/Fortran language interoperability, see ~~Section [[versions/v31/sections/binding#Attributes|Attributes]] on page~~ [[versions/v31/sections/binding#Attributes|Attributes]] . The language bindings are modified.

The ~~`copy_fn`~~ ==[[copy_fn]]== function is invoked when a communicator is duplicated by [[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]] . ~~`copy_fn`~~ ==[[copy_fn]]== should be of type `MPI_Copy_function`, which is defined as follows:

Analogous to ~~`copy_fn`~~ ==[[copy_fn]]== is a callback deletion function, defined as follows. The ~~`delete_fn`~~ ==[[delete_fn]]== function is invoked when a communicator is deleted by [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v31/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . ~~`delete_fn`~~ ==[[delete_fn]]== should be of type `MPI_Delete_function`, which is defined as follows:

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as that of the new function, except for the function name and a different behavior in the C/Fortran language interoperability, see [[versions/v40/sections/binding#Attributes|Attributes]] . The language bindings are modified.~~

~~![[versions/v40/API/MPI_KEYVAL_CREATE]]~~

~~The [[copy_fn]] function is invoked when a communicator is duplicated by [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] . [[copy_fn]] should be of type `MPI_Copy_function`, which is defined as follows:~~

~~    typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,                                   void *extra_state, void *attribute_val_in,                                   void *attribute_val_out, int *flag)~~

~~A Fortran declaration for such a function is as follows:~~

~~`copy_fn` may be specified as~~

~~[[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or~~

~~[[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or FORTRAN; [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and `MPI_SUCCESS`. [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.~~

~~Analogous to [[copy_fn]] is a callback deletion function, defined as follows. The [[delete_fn]] function is invoked when a communicator is deleted by [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v40/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . [[delete_fn]] should be of type `MPI_Delete_function`, which is defined as follows:~~

~~    typedef int MPI_Delete_function(MPI_Comm comm, int keyval,                     void *attribute_val, void *extra_state);~~

~~A Fortran declaration for such a function is as follows:~~

~~`delete_fn` may be specified as~~

~~[[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`. Note that [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is also deprecated.~~

~~The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v40/API/MPI_KEYVAL_FREE]]~~

~~The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v40/API/MPI_ATTR_PUT]]~~

~~The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v40/API/MPI_ATTR_GET]]~~

~~The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.~~

~~![[versions/v40/API/MPI_ATTR_DELETE]]~~

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

==-==

==  Cancelling a send request by calling [[versions/v41/API/MPI_CANCEL|MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.==

==- The following function is deprecated and is superseded by the new [[versions/v41/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.==

==  ![[versions/v41/API/MPI_INFO_GET]]==

==  This function retrieves the value associated with key in a previous call to [[versions/v41/API/MPI_INFO_SET|MPI_INFO_SET]] . If such a key exists, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `valuelen` is the number of characters available in value. If it is less than the actual size of the value, the value is truncated. In C, `valuelen` should be one less than the amount of allocated space to allow for the null terminator.==

==  If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.==

==  The function [[versions/v41/API/MPI_INFO_GET|MPI_INFO_GET]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

==- The following function is deprecated and is superseded by the new [[versions/v41/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.==

==  ![[versions/v41/API/MPI_INFO_GET_VALUELEN]]==

==  Retrieves the length of the `value` associated with `key`. If `key` is defined, `valuelen` is set to the length of its associated value and `flag` is set to `true`. If `key` is not defined, `valuelen` is not touched and `flag` is set to `false`. The length returned in C does not include the end-of-string character.==

==  If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.==

==  The function [[versions/v41/API/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

==- The following return code has been deprecated and is superseded by a new name in MPI-4.0.==

==  | **Deprecated Name**      | **Replacement Name**      |   |:-------------------------|:--------------------------|   | `MPI_T_ERR_INVALID_ITEM` | `MPI_T_ERR_INVALID_INDEX` |==

==- The following Fortran subroutines are deprecated because the Fortran language `storage_size()` and `c_sizeof()` intrinsic functions provide similar functionality. Note that while [[versions/v41/API/MPI_SIZEOF|MPI_SIZEOF]] and `c_sizeof()` return the size in bytes, `storage_size()` provides the size in bits.==

==  ![[versions/v41/API/MPI_SIZEOF]]==

==  This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.==

==  > [!note] Advice to users==

==  > This function is similar to the C `sizeof` operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.==

==  > [!tip] Rationale==

==  > This function is not available in other languages because it would not be useful.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~-~~

~~  Cancelling a send request by calling [[versions/v50/API/MPI_CANCEL|MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.~~

~~- The following function is deprecated and is superseded by the new [[versions/v50/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.~~

~~  ![[versions/v50/API/MPI_INFO_GET]]~~

~~  This function retrieves the value associated with key in a previous call to [[versions/v50/API/MPI_INFO_SET|MPI_INFO_SET]] . If such a key exists, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `valuelen` is the number of characters available in value. If it is less than the actual size of the value, the value is truncated. In C, `valuelen` should be one less than the amount of allocated space to allow for the null terminator.~~

~~  If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.~~

~~  The function [[versions/v50/API/MPI_INFO_GET|MPI_INFO_GET]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v50/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .~~

~~- The following function is deprecated and is superseded by the new [[versions/v50/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.~~

~~  ![[versions/v50/API/MPI_INFO_GET_VALUELEN]]~~

~~  Retrieves the length of the `value` associated with `key`. If `key` is defined, `valuelen` is set to the length of its associated value and `flag` is set to `true`. If `key` is not defined, `valuelen` is not touched and `flag` is set to `false`. The length returned in C does not include the end-of-string character.~~

~~  If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.~~

~~  The function [[versions/v50/API/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v50/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .~~

~~- The following return code has been deprecated and is superseded by a new name in MPI-4.0.~~

~~  | **Deprecated Name**      | **Replacement Name**      |   |:-------------------------|:--------------------------|   | `MPI_T_ERR_INVALID_ITEM` | `MPI_T_ERR_INVALID_INDEX` |~~

~~- The following Fortran subroutines are deprecated because the Fortran language `storage_size()` and `c_sizeof()` intrinsic functions provide similar functionality. Note that while [[versions/v50/API/MPI_SIZEOF|MPI_SIZEOF]] and `c_sizeof()` return the size in bytes, `storage_size()` provides the size in bits.~~

~~  ![[versions/v50/API/MPI_SIZEOF]]~~

~~  This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.~~

~~  > [!note] Advice to users~~

~~  > This function is similar to the C `sizeof` operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.~~

~~  > [!tip] Rationale~~

~~  > This function is not available in other languages because it would not be useful.~~

==Cancelling a send request by calling [[versions/v50/API/MPI_CANCEL|MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.==

==The following function is deprecated and is superseded by the new [[versions/v50/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.==

==![[versions/v50/API/MPI_INFO_GET]]==

==This function retrieves the value associated with key in a previous call to [[versions/v50/API/MPI_INFO_SET|MPI_INFO_SET]] . If such a key exists, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `valuelen` is the number of characters available in value. If it is less than the actual size of the value, the value is truncated. In C, `valuelen` should be one less than the amount of allocated space to allow for the null terminator.==

==If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.==

==The function [[versions/v50/API/MPI_INFO_GET|MPI_INFO_GET]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v50/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

==The following function is deprecated and is superseded by the new [[versions/v50/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] call in MPI-4.0.==

==![[versions/v50/API/MPI_INFO_GET_VALUELEN]]==

==Retrieves the length of the `value` associated with `key`. If `key` is defined, `valuelen` is set to the length of its associated value and `flag` is set to `true`. If `key` is not defined, `valuelen` is not touched and `flag` is set to `false`. The length returned in C does not include the end-of-string character.==

==If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.==

==The function [[versions/v50/API/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[versions/v50/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

==The following return code has been deprecated and is superseded by a new name in MPI-4.0.==

==| **Deprecated Name**      | **Replacement Name**      | |:-------------------------|:--------------------------| | `MPI_T_ERR_INVALID_ITEM` | `MPI_T_ERR_INVALID_INDEX` |==

== The following Fortran subroutines are deprecated because the Fortran language `storage_size()` and `c_sizeof()` intrinsic functions provide similar functionality. Note that while [[versions/v50/API/MPI_SIZEOF|MPI_SIZEOF]] and `c_sizeof()` return the size in bytes, `storage_size()` provides the size in bits.==

==![[versions/v50/API/MPI_SIZEOF]]==

==This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.==

==> [!note] Advice to users==

==> This function is similar to the C `sizeof` operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.==

==> [!tip] Rationale==

==> This function is not available in other languages because it would not be useful.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/deprecated#Deprecated since MPI-4.0]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/deprecated#Deprecated since MPI-4.0]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/deprecated#Deprecated since MPI-4.0]]
