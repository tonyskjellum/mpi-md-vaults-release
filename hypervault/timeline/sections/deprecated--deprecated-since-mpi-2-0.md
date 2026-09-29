---
title: "Deprecated since MPI-2.0"
chapter: deprecated
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/deprecated]
---

# Deprecated since MPI-2.0

Chapter **deprecated** · in [[versions/v21/sections/deprecated#Deprecated since MPI-2.0|MPI-2.1]], [[versions/v22/sections/deprecated#Deprecated since MPI-2.0|MPI-2.2]], [[versions/v30/sections/deprecated#Deprecated since MPI-2.0|MPI-3.0]], [[versions/v31/sections/deprecated#Deprecated since MPI-2.0|MPI-3.1]], [[versions/v40/sections/deprecated#Deprecated since MPI-2.0|MPI-4.0]], [[versions/v41/sections/deprecated#Deprecated since MPI-2.0|MPI-4.1]], [[versions/v50/sections/deprecated#Deprecated since MPI-2.0|MPI-5.0]]

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

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

~~The [[copy_fn]] function is invoked when a communicator is duplicated by [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] . [[copy_fn]] should be of type `MPI_Copy_function`, which is defined as follows:~~

~~    typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,                                   void *extra_state, void *attribute_val_in,                                   void *attribute_val_out, int *flag)~~

==The `copy_fn` function is invoked when a communicator is duplicated by [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] . `copy_fn` should be of type `MPI_Copy_function`, which is defined as follows:==

~~[[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or FORTRAN; [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and `MPI_SUCCESS`. [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.~~

~~Analogous to [[copy_fn]] is a callback deletion function, defined as follows. The [[delete_fn]] function is invoked when a communicator is deleted by [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v40/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . [[delete_fn]] should be of type `MPI_Delete_function`, which is defined as follows:~~

~~    typedef int MPI_Delete_function(MPI_Comm comm, int keyval,                     void *attribute_val, void *extra_state);~~

==[[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or Fortran; [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than return `flag``= 0` and `MPI_SUCCESS`. [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag``= 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.==

==Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v40/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . `delete_fn` should be of type `MPI_Delete_function`, which is defined as follows:==

[[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or ~~FORTRAN;~~ ==Fortran;== [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does ~~nothing,~~ ==nothing== other than ~~returning~~ ==return== `MPI_SUCCESS`. Note that [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is also deprecated.

The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as ~~of~~ the new function, except ~~of~~ ==for== the function name. The language bindings are modified.

The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as ~~of~~ the new function, except ~~of~~ ==for== the function name. The language bindings are modified.

The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as ~~of~~ the new function, except ~~of~~ ==for== the function name. The language bindings are modified.

The following function is deprecated and is superseded by [[versions/v40/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as ~~of~~ the new function, except ~~of~~ ==for== the function name. The language bindings are modified.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as that of the new function, except for the function name and a different behavior in the C/Fortran language interoperability, see [[versions/v41/sections/binding#Attributes|Attributes]] . The language bindings are modified.~~

~~![[versions/v41/API/MPI_KEYVAL_CREATE]]~~

~~The `copy_fn` function is invoked when a communicator is duplicated by [[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] . `copy_fn` should be of type `MPI_Copy_function`, which is defined as follows:~~

~~A Fortran declaration for such a function is as follows:~~

~~`copy_fn` may be specified as~~

~~[[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or~~

~~[[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or Fortran; [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than return `flag``= 0` and `MPI_SUCCESS`. [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag``= 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.~~

~~Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v41/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . `delete_fn` should be of type `MPI_Delete_function`, which is defined as follows:~~

~~A Fortran declaration for such a function is as follows:~~

~~`delete_fn` may be specified as~~

~~[[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or Fortran; [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing other than return `MPI_SUCCESS`. Note that [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is also deprecated.~~

~~The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.~~

~~![[versions/v41/API/MPI_KEYVAL_FREE]]~~

~~The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.~~

~~![[versions/v41/API/MPI_ATTR_PUT]]~~

~~The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.~~

~~![[versions/v41/API/MPI_ATTR_GET]]~~

~~The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.~~

~~![[versions/v41/API/MPI_ATTR_DELETE]]~~

==- The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as that of the new function, except for the function name and a different behavior in the C/Fortran language interoperability, see [[versions/v41/sections/binding#Attributes|Attributes]] . The language bindings are modified.==

==  ![[versions/v41/API/MPI_KEYVAL_CREATE]]==

==  The `copy_fn` function is invoked when a communicator is duplicated by [[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] . `copy_fn` should be of type `MPI_Copy_function`, which is defined as follows:==

==  A Fortran declaration for such a function is as follows:==

==  `copy_fn` may be specified as [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or Fortran; [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than return `flag``= 0` and `MPI_SUCCESS`. [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag``= 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.==

==  Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v41/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . `delete_fn` should be of type `MPI_Delete_function`, which is defined as follows:==

==  A Fortran declaration for such a function is as follows:==

==  `delete_fn` may be specified as [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or Fortran; [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing other than return `MPI_SUCCESS`. Note that [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is also deprecated.==

==- The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.==

==  ![[versions/v41/API/MPI_KEYVAL_FREE]]==

==- The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.==

==  ![[versions/v41/API/MPI_ATTR_PUT]]==

==- The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.==

==  ![[versions/v41/API/MPI_ATTR_GET]]==

==- The following function is deprecated and is superseded by [[versions/v41/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.==

==  ![[versions/v41/API/MPI_ATTR_DELETE]]==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~-~~ The following function is deprecated and is superseded by [[versions/v50/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as that of the new function, except for the function name and a different behavior in the C/Fortran language interoperability, see [[versions/v50/sections/binding#Attributes|Attributes]] . The language bindings are modified.

![[versions/v50/API/MPI_KEYVAL_CREATE]]

The `copy_fn` function is invoked when a communicator is duplicated by [[versions/v50/API/MPI_COMM_DUP|MPI_COMM_DUP]] . `copy_fn` should be of type `MPI_Copy_function`, which is defined as follows:

A Fortran declaration for such a function is as follows:

`copy_fn` may be specified as [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or Fortran; [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than return `flag``= 0` and `MPI_SUCCESS`. [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets `flag``= 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. Note that [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] are also deprecated.

Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[versions/v50/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v50/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . `delete_fn` should be of type `MPI_Delete_function`, which is defined as follows:

A Fortran declaration for such a function is as follows:

`delete_fn` may be specified as [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or Fortran; [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing other than return `MPI_SUCCESS`. Note that [[versions/v50/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is also deprecated.

~~-~~ The following function is deprecated and is superseded by [[versions/v50/API/MPI_COMM_FREE_KEYVAL|MPI_COMM_FREE_KEYVAL]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

![[versions/v50/API/MPI_KEYVAL_FREE]]

~~-~~ The following function is deprecated and is superseded by [[versions/v50/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

![[versions/v50/API/MPI_ATTR_PUT]]

~~-~~ The following function is deprecated and is superseded by [[versions/v50/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

![[versions/v50/API/MPI_ATTR_GET]]

~~-~~ The following function is deprecated and is superseded by [[versions/v50/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] in MPI-2.0. The language independent definition of the deprecated function is the same as the new function, except for the function name. The language bindings are modified.

![[versions/v50/API/MPI_ATTR_DELETE]]

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/deprecated#Deprecated since MPI-2.0]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/deprecated#Deprecated since MPI-2.0]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/deprecated#Deprecated since MPI-2.0]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/deprecated#Deprecated since MPI-2.0]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/deprecated#Deprecated since MPI-2.0]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/deprecated#Deprecated since MPI-2.0]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/deprecated#Deprecated since MPI-2.0]]
