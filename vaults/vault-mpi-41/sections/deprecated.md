# Deprecated Interfaces



## Deprecated since MPI-2.0



- The following function is deprecated and is superseded by [[MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as that of the new function, except for the function name and a different behavior in the C/Fortran language interoperability, see [[binding#Attributes|Attributes]] . The language bindings are modified.

  ![[API/MPI_KEYVAL_CREATE]]

  The `copy_fn` function is invoked when a communicator is duplicated by [[MPI_COMM_DUP]] . `copy_fn` should be of type `MPI_Copy_function`, which is defined as follows:

  A Fortran declaration for such a function is as follows:

  `copy_fn` may be specified as [[MPI_NULL_COPY_FN]] or [[MPI_DUP_FN]] from either C or Fortran; [[MPI_NULL_COPY_FN]] is a function that does nothing other than return `flag``= 0` and `MPI_SUCCESS`. [[MPI_DUP_FN]] is a simple-minded copy function that sets `flag``= 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[MPI_NULL_COPY_FN]] and [[MPI_DUP_FN]] are also deprecated.

  Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[MPI_COMM_FREE]] or when a call is made explicitly to [[MPI_ATTR_DELETE]] . `delete_fn` should be of type `MPI_Delete_function`, which is defined as follows:

  A Fortran declaration for such a function is as follows:

  `delete_fn` may be specified as [[MPI_NULL_DELETE_FN]] from either C or Fortran; [[MPI_NULL_DELETE_FN]] is a function that does nothing other than return `MPI_SUCCESS`. Note that [[MPI_NULL_DELETE_FN]] is also deprecated.

- The following function is deprecated and is superseded by [[MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

  ![[API/MPI_KEYVAL_FREE]]

- The following function is deprecated and is superseded by [[MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

  ![[API/MPI_ATTR_PUT]]

- The following function is deprecated and is superseded by [[MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

  ![[API/MPI_ATTR_GET]]

- The following function is deprecated and is superseded by [[MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

  ![[API/MPI_ATTR_DELETE]]

## Deprecated since MPI-2.2



- The entire set of C++ language bindings was deprecated as of MPI-2.2 and removed in MPI-3.0. See Chapter [[chap-removed]] , for more information.

- The following function typedefs have been deprecated and are superseded by new names. Other than the typedef names, the function signatures are exactly the same; the names were updated to match conventions of other function typedef names.

  

  

  ll **Deprecated Name** & **New Name**   `MPI_Comm_errhandler_fn` & `MPI_Comm_errhandler_function`  `MPI_File_errhandler_fn` & `MPI_File_errhandler_function`  `MPI_Win_errhandler_fn` & `MPI_Win_errhandler_function`  

  

  

## Deprecated since MPI-4.0



-

  Cancelling a send request by calling [[MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.

- The following function is deprecated and is superseded by the new [[MPI_INFO_GET_STRING]] call in MPI-4.0.

  ![[API/MPI_INFO_GET]]

  This function retrieves the value associated with key in a previous call to [[MPI_INFO_SET]] . If such a key exists, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `valuelen` is the number of characters available in value. If it is less than the actual size of the value, the value is truncated. In C, `valuelen` should be one less than the amount of allocated space to allow for the null terminator.

  If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.

  The function [[MPI_INFO_GET]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .

- The following function is deprecated and is superseded by the new [[MPI_INFO_GET_STRING]] call in MPI-4.0.

  ![[API/MPI_INFO_GET_VALUELEN]]

  Retrieves the length of the `value` associated with `key`. If `key` is defined, `valuelen` is set to the length of its associated value and `flag` is set to `true`. If `key` is not defined, `valuelen` is not touched and `flag` is set to `false`. The length returned in C does not include the end-of-string character.

  If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.

  The function [[MPI_INFO_GET_VALUELEN]] is allowed to be called at any time, following the description for MPI functionality that is always available in [[dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .

- The following return code has been deprecated and is superseded by a new name in MPI-4.0.

  

  | **Deprecated Name**      | **Replacement Name**      |
  |:-------------------------|:--------------------------|
  | `MPI_T_ERR_INVALID_ITEM` | `MPI_T_ERR_INVALID_INDEX` |

  

- The following Fortran subroutines are deprecated because the Fortran language `storage_size()` and `c_sizeof()` intrinsic functions provide similar functionality. Note that while [[MPI_SIZEOF]] and `c_sizeof()` return the size in bytes, `storage_size()` provides the size in bits.

  ![[API/MPI_SIZEOF]]

  This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.

  > [!note] Advice to users

  > This function is similar to the C `sizeof` operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.

  > [!tip] Rationale

  > This function is not available in other languages because it would not be useful.

## Deprecated since MPI-4.1



- The use of the `mpif.h` include file has been deprecated. Information supporting the transition to `USE mpi` or `USE mpi_f08` is provided in Section [[f90-basic]] .

- The predefined attribute key `MPI_HOST` for `MPI_COMM_WORLD` when using the World Model is deprecated.

  `MPI_HOST`:  
  Host process rank, if such exists, `MPI_PROC_NULL`, otherwise.

  #### Host Rank

  The value returned for `MPI_HOST` gets the rank of the *HOST* process in the group associated with communicator `MPI_COMM_WORLD`, if there is such. `MPI_PROC_NULL` is returned if there is no host. MPI does not specify what it means for a process to be a *HOST*, nor does it requires that a *HOST* exists.

  The attribute `MPI_HOST` has the same value on all processes of `MPI_COMM_WORLD`.

  

  | **Environmental inquiry keys**           |
  |:-----------------------------------------|
  |  C type: `const int` (or unnamed `enum`) |
  |  Fortran type: `INTEGER`                 |
  | `MPI_HOST`                               |

  

- All `MPI_XXX_X` procedures have been deprecated and may be removed in a future version of the MPI specification. In the case of their C binding and their Fortran binding through the `mpi_f08` module, they are superseded by the large count and large byte displacement bindings of their counterpart in the form of `MPI_XXX` .

  ![[API/MPI_TYPE_SIZE_X]]

  The description of [[MPI_TYPE_SIZE]] is applicable to this deprecated [[MPI_TYPE_SIZE_X]] accordingly, see [[datatypes#Address and Size Procedures|Address and Size Procedures]] .

  ![[API/MPI_TYPE_GET_EXTENT_X]]

  The description of [[MPI_TYPE_GET_EXTENT]] is applicable to this deprecated [[MPI_TYPE_GET_EXTENT_X]] accordingly, see [[datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] .

  ![[API/MPI_TYPE_GET_TRUE_EXTENT_X]]

  The description of [[MPI_TYPE_GET_TRUE_EXTENT]] is applicable to this deprecated [[MPI_TYPE_GET_TRUE_EXTENT_X]] accordingly, see [[datatypes#True Extent of Datatypes|True Extent of Datatypes]] .

 

  ![[API/MPI_GET_ELEMENTS_X]]

  The description of [[MPI_GET_ELEMENTS]] is applicable to this deprecated [[MPI_GET_ELEMENTS_X]] accordingly, see [[datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .

 

  ![[API/MPI_STATUS_SET_ELEMENTS_X]]

  The description of [[MPI_STATUS_SET_ELEMENTS]] is applicable to this deprecated [[MPI_STATUS_SET_ELEMENTS_X]] accordingly, see [[ei#Associating Information with Status|Associating Information with Status]] .
