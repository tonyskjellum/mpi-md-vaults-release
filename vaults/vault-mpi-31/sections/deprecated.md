# Deprecated Functions



## Deprecated since MPI-2.0



The following function is deprecated and is superseded by [[MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as that of the new function, except for the function name and a different behavior in the C/Fortran language interoperability, see [[binding#Attributes|Attributes]] . The language bindings are modified.

![[API/MPI_KEYVAL_CREATE]]

The [[copy_fn]] function is invoked when a communicator is duplicated by [[MPI_COMM_DUP]] . [[copy_fn]] should be of type `MPI_Copy_function`, which is defined as follows:

    typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,
                                  void *extra_state, void *attribute_val_in,
                                  void *attribute_val_out, int *flag)

A Fortran declaration for such a function is as follows:

`copy_fn` may be specified as

[[MPI_NULL_COPY_FN]] or

[[MPI_DUP_FN]] from either C or FORTRAN; [[MPI_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and `MPI_SUCCESS`. [[MPI_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[MPI_NULL_COPY_FN]] and [[MPI_DUP_FN]] are also deprecated.

Analogous to [[copy_fn]] is a callback deletion function, defined as follows. The [[delete_fn]] function is invoked when a communicator is deleted by [[MPI_COMM_FREE]] or when a call is made explicitly to [[MPI_ATTR_DELETE]] . [[delete_fn]] should be of type `MPI_Delete_function`, which is defined as follows:

    typedef int MPI_Delete_function(MPI_Comm comm, int keyval,
                    void *attribute_val, void *extra_state);

A Fortran declaration for such a function is as follows:

`delete_fn` may be specified as

[[MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`. Note that [[MPI_NULL_DELETE_FN]] is also deprecated.

The following function is deprecated and is superseded by [[MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_KEYVAL_FREE]]

The following function is deprecated and is superseded by [[MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ATTR_PUT]]

The following function is deprecated and is superseded by [[MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ATTR_GET]]

The following function is deprecated and is superseded by [[MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ATTR_DELETE]]

## Deprecated since MPI-2.2



The entire set of C++ language bindings have been removed. See Chapter [[chap-removed]] , for more information.

The following function typedefs have been deprecated and are superseded by new names. Other than the typedef names, the function signatures are exactly the same; the names were updated to match conventions of other function typedef names.

ll **Deprecated Name** & **New Name**   `MPI_Comm_errhandler_fn` & `MPI_Comm_errhandler_function`  `MPI_File_errhandler_fn` & `MPI_File_errhandler_function`  `MPI_Win_errhandler_fn` & `MPI_Win_errhandler_function`  

