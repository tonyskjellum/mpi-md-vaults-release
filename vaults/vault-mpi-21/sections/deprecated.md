# Deprecated Functions



## Deprecated since MPI-2.0

The following function is deprecated and is superseded by [[MPI_TYPE_CREATE_HVECTOR]] in MPI-2.0. The

language

independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.

![[API/MPI_TYPE_HVECTOR]]

The following function is deprecated and is superseded by [[MPI_TYPE_CREATE_HINDEXED]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.

![[API/MPI_TYPE_HINDEXED]]

The following function is deprecated and is superseded by [[MPI_TYPE_CREATE_STRUCT]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.

![[API/MPI_TYPE_STRUCT]]

The following function is deprecated and is superseded by [[MPI_GET_ADDRESS]] in MPI-2.0. The language independent definition and the C binding of the deprecated function is the same as of the new function, except of the function name. Only the Fortran language binding is different.

![[API/MPI_ADDRESS]]

The following functions are deprecated and are superseded by [[MPI_TYPE_GET_EXTENT]] in MPI-2.0.

![[API/MPI_TYPE_EXTENT]]

Returns the extent of a datatype, where extent is as defined on page [[datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] .

The two functions below can be used for finding the lower bound and the upper bound of a datatype.

![[API/MPI_TYPE_LB]]

![[API/MPI_TYPE_UB]]

The following function is deprecated and is superseded by [[MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_KEYVAL_CREATE]]

The `copy_fn` function is invoked when a communicator is duplicated by [[MPI_COMM_DUP]] . `copy_fn` should be of type `MPI_Copy_function`, which is defined as follows:

    typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,
                                  void *extra_state, void *attribute_val_in,
                                  void *attribute_val_out, int *flag)

A Fortran declaration for such a function is as follows:

`copy_fn` may be specified as [[MPI_NULL_COPY_FN]] or [[MPI_DUP_FN]] from either C or FORTRAN; [[MPI_NULL_COPY_FN]] is a function that does nothing other than returning flag = 0 and MPI_SUCCESS. [[MPI_DUP_FN]] is a simple-minded copy function that sets flag = 1, returns the value of `attribute_val_in` in `attribute_val_out`, and returns MPI_SUCCESS.

Note that [[MPI_NULL_COPY_FN]] and [[MPI_DUP_FN]] are also deprecated.

Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[MPI_COMM_FREE]] or when a call is made explicitly to [[MPI_ATTR_DELETE]] . `delete_fn` should be of type `MPI_Delete_function`, which is defined as follows:

    typedef int MPI_Delete_function(MPI_Comm comm, int keyval,
                    void *attribute_val, void *extra_state);

A Fortran declaration for such a function is as follows:

`delete_fn` may be specified as [[MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning MPI_SUCCESS.

Note that [[MPI_NULL_DELETE_FN]] is also deprecated.

The following function is deprecated and is superseded by [[MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_KEYVAL_FREE]]

The following function is deprecated and is superseded by [[MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ATTR_PUT]]

The following function is deprecated and is superseded by [[MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ATTR_GET]]

The following function is deprecated and is superseded by [[MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ATTR_DELETE]]

The following function is deprecated and is superseded by [[MPI_COMM_CREATE_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ERRHANDLER_CREATE]]

Register the user routine `function` for use as an MPI exception handler. Returns in `errhandler` a handle to the registered exception handler.

In the C language,

the user routine should be a C function of type `MPI_Handler_function`, which is defined as:

    typedef void (MPI_Handler_function)(MPI_Comm *, int *, ...);

The first argument is the communicator in use, the second is the error code to be returned.

In the Fortran language, the user routine should be of the form:

    SUBROUTINE HANDLER_FUNCTION(COMM, ERROR_CODE, .....)
       INTEGER COMM, ERROR_CODE

The following function is deprecated and is superseded by [[MPI_COMM_SET_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ERRHANDLER_SET]]

Associates the new error handler `errorhandler` with communicator `comm` at the calling process. Note that an error handler is always associated with the communicator.

The following function is deprecated and is superseded by [[MPI_COMM_GET_ERRHANDLER]] in MPI-2.0. The language independent definition of the deprecated function is the same as of the new function, except of the function name. The language bindings are modified.

![[API/MPI_ERRHANDLER_GET]]

Returns in `errhandler` (a handle to) the error handler that is currently associated with communicator `comm`.
