---
title: "Communicators"
chapter: context
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Communicators

Chapter **context** · in [[versions/v21/sections/context#Communicators|MPI-2.1]], [[versions/v22/sections/context#Communicators|MPI-2.2]], [[versions/v30/sections/context#Communicators|MPI-3.0]], [[versions/v31/sections/context#Communicators|MPI-3.1]], [[versions/v40/sections/context#Communicators|MPI-4.0]], [[versions/v41/sections/context#Communicators|MPI-4.1]], [[versions/v50/sections/context#Communicators|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (12 changed paragraphs)

The copy callback function is invoked for each key value in `oldcomm` in arbitrary order. Each call to the copy callback is made with a key value and its corresponding attribute. If it returns ~~flag~~ ==`flag== = ~~0,~~ ==0`,== then the attribute is deleted in the duplicated communicator. Otherwise ~~(flag~~ ==(`flag== = ~~1),~~ ==1`),==

The function returns ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== on success and an error code on failure (in which case `MPI_COMM_DUP` will fail).

[[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] from either C, C++, or Fortran. [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.== [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.== These replace the MPI-1 predefined callbacks [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] , whose use is deprecated.

> Even though both formal arguments `attribute_val_in` and `attribute_val_out` are of type ~~void \*,~~ ==`void *`,== their usage differs. The C copy function is passed by MPI in `attribute_val_in` the *value* of the attribute, and in `attribute_val_out` the *address* of the attribute, so as to allow the function to return the (new) attribute value. The use of type ~~void \*~~ ==`void *`== for both is to avoid messy type casts. > > A valid copy function is one that completely duplicates the information by making a full duplicate copy of the data structures implied by an attribute; another might just make another reference to that data structure, while using a reference-count mechanism. Other types of attributes might not copy at all (they might be specific to `oldcomm` only).

The function returns ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== on success and an error code on failure (in which case `MPI_COMM_FREE` will fail).

~~[[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] from either C, C++, or Fortran. [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] is a function that does nothing, other than returning MPI_SUCCESS. [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] replaces [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] , whose use is deprecated.~~

~~If an attribute copy function or attribute delete function returns other than MPI_SUCCESS, then the call that caused it to be invoked (for example, [[versions/v22/API/MPI_COMM_FREE|MPI_COMM_FREE]] ), is erroneous.~~

~~The special key value MPI_KEYVAL_INVALID is never returned by [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_KEYVAL_CREATE]] . Therefore, it can be used for static initialization of key values.~~

==[[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] from either C, C++, or Fortran. [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`. [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] replaces [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] , whose use is deprecated.==

==If an attribute copy function or attribute delete function returns other than `MPI_SUCCESS`, then the call that caused it to be invoked (for example, [[versions/v22/API/MPI_COMM_FREE|MPI_COMM_FREE]] ), is erroneous.==

==The special key value `MPI_KEYVAL_INVALID` is never returned by [[versions/v22/API/MPI_KEYVAL_CREATE|MPI_KEYVAL_CREATE]] . Therefore, it can be used for static initialization of key values.==

==> [!warning] Advice to implementors==

==> To be able to use the predefined C functions [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] or [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] as `comm_copy_attr_fn` argument and/or [[versions/v22/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] as the `comm_delete_attr_fn` argument in a call to the C++ routine `MPI::Comm::Create_keyval`, this routine may be overloaded with 3 additional routines that accept the C functions as the first, the second, or both input arguments (instead of an argument that matches the C++ prototype).==

==> [!note] Advice to users==

==> If a user wants to write a “wrapper” routine that internally calls `MPI::Comm::Create_keyval` and `comm_copy_attr_fn` and/or `comm_delete_attr_fn` are arguments of this wrapper routine, and if this wrapper routine should be callable with both user-defined C++ copy and delete functions and with the predefined C functions, then the same overloading as described above in the advice to implementors may be necessary.==

~~MPI_KEYVAL_INVALID.~~ ==`MPI_KEYVAL_INVALID`.== Note that it is not erroneous to free an attribute key that is in use, because the actual free does not transpire until after all references (in other communicators on the process) to the key have been freed. These references need to be explictly freed by the program, either via calls to [[versions/v22/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] that free one attribute instance, or by calls to [[versions/v22/API/MPI_COMM_FREE|MPI_COMM_FREE]] that free all attribute instances associated with the freed communicator.

This function stores the stipulated attribute value `attribute_val` for subsequent retrieval by `MPI_COMM_GET_ATTR`. If the value is already present, then the outcome is as if [[versions/v22/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] was first called to delete the previous value (and the callback function [[comm_delete_attr_fn]] was executed), and a new value was next stored. The call is erroneous if there is no key with value `keyval`; in particular ~~MPI_KEYVAL_INVALID~~ ==`MPI_KEYVAL_INVALID`== is an erroneous key value.

The call will fail if the [[comm_delete_attr_fn]] function returned an error code other than ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.==

Retrieves attribute value by key. The call is erroneous if there is no key with value `keyval`. On the other hand, the call is correct if the key value exists, but no attribute is attached on `comm` for that key; in such case, the call returns `flag = false`. In particular ~~MPI_KEYVAL_INVALID~~ ==`MPI_KEYVAL_INVALID`== is an erroneous key value.

> The call to `MPI_Comm_set_attr` passes in `attribute_val` the *value* of the attribute; the call to `MPI_Comm_get_attr` passes in `attribute_val` the *address* of > > the > > location where the attribute value is to be returned. Thus, if the attribute value itself is a pointer of type ~~void\*,~~ ==`void*`,== > > then the > > actual `attribute_val` parameter to `MPI_Comm_set_attr` will be of type ~~void\*~~ ==`void*`== and the actual `attribute_val` parameter to > > `MPI_Comm_get_attr` > > will be of type ~~void\*\*.~~ ==`void**`.==

> The use of a formal parameter `attribute_val` or type ~~void\*~~ ==`void*`== (rather than ~~void\*\*)~~ ==`void**`)== avoids the messy type casting that would be needed if the attribute value is declared with a type other than ~~void\*.~~ ==`void*`.==

The call will fail if the `comm_delete_attr_fn` function returns an error code other than ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.==

### MPI-2.2 → MPI-3.0  (16 changed paragraphs)

~~Functions~~

~~for caching on communicators are:~~

==Functions for caching on communicators are:==

~~This function replaces [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_KEYVAL_CREATE]] ,~~

~~whose use is deprecated.~~

~~The C binding is identical. The Fortran binding differs in that `extra_state` is an address-sized integer. Also, the copy and delete callback functions have Fortran bindings that are consistent with address-sized attributes.~~

~~which are the same as the MPI-1.1 calls but with a new name.~~

~~The old names are deprecated.~~

~~The Fortran callback functions are:~~

==which are the same as the MPI-1.1 calls but with a new name. The old names are deprecated.==

==With the `mpi_f08` module, the Fortran callback functions are:==

~~The C++ callbacks~~ ==With the `mpi` module and `mpif.h`, the Fortran callback functions== are:

~~The `comm_copy_attr_fn` function is invoked when a communicator is duplicated by [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] . `comm_copy_attr_fn` should be of type `MPI_Comm_copy_attr_function`.~~

~~The copy callback function is invoked for each key value in `oldcomm` in arbitrary order. Each call to the copy callback is made with a key value and its corresponding attribute. If it returns `flag = 0`, then the attribute is deleted in the duplicated communicator. Otherwise (`flag = 1`),~~

~~the new attribute value is set to the value returned in `attribute_val_out`.~~

~~The function returns `MPI_SUCCESS` on success and an error code on failure (in which case `MPI_COMM_DUP` will fail).~~

==The `comm_copy_attr_fn` function is invoked when a communicator is duplicated by [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] or [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] . `comm_copy_attr_fn` should be of type `MPI_Comm_copy_attr_function`. The copy callback function is invoked for each key value in `oldcomm` in arbitrary order. Each call to the copy callback is made with a key value and its corresponding attribute. If it returns `flag = 0` or `.FALSE.`, then the attribute is deleted in the duplicated communicator. Otherwise (`flag = 1` or `.TRUE.`), the new attribute value is set to the value returned in `attribute_val_out`. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case `MPI_COMM_DUP` or [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] will fail).==

[[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] from either ~~C, C++,~~ ==C== or Fortran. [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` ==or `.FALSE.` (depending on whether the keyval was created with a C or Fortran binding to [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] )== and `MPI_SUCCESS`. [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] is a simple-minded copy function that sets `flag = ~~1`,~~ ==1` or `.TRUE.`,== returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. These replace the MPI-1 predefined callbacks [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] , whose use is deprecated.

~~[[versions/v30/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] .~~

~~`comm_delete_attr_fn` should be of type `MPI_Comm_delete_attr_function`.~~

~~This function is called by [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v30/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] ,~~

~~and [[versions/v30/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]]~~

~~to do whatever is needed to remove an attribute.~~

~~The function returns `MPI_SUCCESS` on success and an error code on failure (in which case `MPI_COMM_FREE` will fail).~~

==[[versions/v30/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] . `comm_delete_attr_fn` should be of type `MPI_Comm_delete_attr_function`.==

==This function is called by [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v30/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] , and [[versions/v30/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] to do whatever is needed to remove an attribute. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case `MPI_COMM_FREE` will fail).==

[[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] from either ~~C, C++,~~ ==C== or Fortran. [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`. [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] replaces [[versions/v30/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] , whose use is deprecated.

The special key value `MPI_KEYVAL_INVALID` is never returned by ~~[[versions/v30/API/MPI_KEYVAL_CREATE|MPI_KEYVAL_CREATE]]~~ ==[[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]]== . Therefore, it can be used for static initialization of key values.

> ~~To be able to use the~~ ==The== predefined ~~C~~ ==Fortran== functions [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ~~or~~ ==,== [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] ==, and [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] are defined in the `mpi` module (and `mpif.h`) and the `mpi_f08` module with the same name, but with different interfaces. Each function can coexist twice with the same name in the same MPI library, one routine== as ~~`comm_copy_attr_fn` argument and/or [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]]~~ ==an implicit interface outside of the `mpi` module, i.e., declared== as ==`EXTERNAL`, and== the ~~`comm_delete_attr_fn` argument in a call~~ ==other routine within `mpi_f08` declared with `CONTAINS`. These routines have different link names, which are also different== to the ~~C++ routine `MPI::Comm::Create_keyval`, this routine may be overloaded with 3 additional~~ ==link names used for the== routines ~~that accept the C functions as the first, the second, or both input arguments (instead of an argument that matches the C++ prototype).~~ ==used in C.==

> ~~If a user wants to write a “wrapper”~~ ==Callbacks, including the predefined Fortran functions [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] , [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] , and [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] should not be passed from one application== routine that ~~internally calls `MPI::Comm::Create_keyval`~~ ==uses the `mpi_f08` module to another application routine that uses the `mpi` module or `mpif.h`,== and ~~`comm_copy_attr_fn` and/or `comm_delete_attr_fn` are arguments of this wrapper routine, and if this wrapper routine should be callable with both user-defined C++ copy and delete functions and with the predefined C functions, then the same overloading as described above in~~ ==vice versa; see also== the advice to ~~implementors may be necessary.~~ ==users on page [[advice-bindings-predefined-Fortran-users]] .==

~~This call is identical to the MPI-1 call [[versions/v30/API/MPI_KEYVAL_FREE|MPI_KEYVAL_FREE]] but is needed to match the new communicator-specific creation function.~~

~~The use of [[versions/v30/API/MPI_KEYVAL_FREE|MPI_KEYVAL_FREE]] is deprecated.~~

~~This function stores the stipulated attribute value `attribute_val` for subsequent retrieval by `MPI_COMM_GET_ATTR`. If the value is already present, then the outcome is as if [[versions/v30/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] was first called to delete the previous value (and the callback function [[comm_delete_attr_fn]] was executed), and a new value was next stored. The call is erroneous if there is no key with value `keyval`; in particular `MPI_KEYVAL_INVALID` is an erroneous key value.~~

~~The call will fail if the [[comm_delete_attr_fn]] function returned an error code other than `MPI_SUCCESS`.~~

~~This function replaces [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] ,~~

~~whose use is deprecated.~~

~~The C binding is identical. The Fortran binding differs in that `attribute_val` is an address-sized integer.~~

==This function stores the stipulated attribute value `attribute_val` for subsequent retrieval by `MPI_COMM_GET_ATTR`. If the value is already present, then the outcome is as if [[versions/v30/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] was first called to delete the previous value (and the callback function [[comm_delete_attr_fn]] was executed), and a new value was next stored. The call is erroneous if there is no key with value `keyval`; in particular `MPI_KEYVAL_INVALID` is an erroneous key value. The call will fail if the [[comm_delete_attr_fn]] function returned an error code other than `MPI_SUCCESS`.==

> The call to `MPI_Comm_set_attr` passes in `attribute_val` the *value* of the attribute; the call to `MPI_Comm_get_attr` passes in `attribute_val` the *address* of > > the ~~> >~~ location where the attribute value is to be returned. Thus, if the attribute value itself is a pointer of type `void*`, > > then the ~~> >~~ actual `attribute_val` parameter to `MPI_Comm_set_attr` will be of type `void*` and the actual `attribute_val` parameter to > > `MPI_Comm_get_attr` ~~> >~~ will be of type `void**`.

~~> The use of a formal parameter `attribute_val` or type `void*` (rather than `void**`) avoids the messy type casting that would be needed if the attribute value is declared with a type other than `void*`.~~

~~This function replaces [[versions/v30/API/MPI_ATTR_GET|MPI_ATTR_GET]] ,~~

~~whose use is deprecated.~~

~~The C binding is identical. The Fortran binding differs in that `attribute_val` is an address-sized integer.~~

==> The use of a formal parameter `attribute_val` of type `void*` (rather than `void**`) avoids the messy type casting that would be needed if the attribute value is declared with a type other than `void*`.==

~~Delete attribute from cache by key. This function invokes the attribute delete function `comm_delete_attr_fn` specified when the `keyval` was created.~~

~~The call will fail if the `comm_delete_attr_fn` function returns an error code other than `MPI_SUCCESS`.~~

~~Whenever a communicator is replicated using the function [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] , all call-back copy functions for attributes that are currently set are invoked (in arbitrary order). Whenever a communicator is deleted using the function [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] all callback delete functions for attributes that are currently set are invoked.~~

~~This function is the same as [[versions/v30/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] but is needed to match the new communicator specific functions.~~

~~The use of [[versions/v30/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] is deprecated.~~

==Delete attribute from cache by key. This function invokes the attribute delete function `comm_delete_attr_fn` specified when the `keyval` was created. The call will fail if the `comm_delete_attr_fn` function returns an error code other than `MPI_SUCCESS`.==

==Whenever a communicator is replicated using the function [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] or [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , all call-back copy functions for attributes that are currently set are invoked (in arbitrary order). Whenever a communicator is deleted using the function [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] all callback delete functions for attributes that are currently set are invoked.==

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

The ~~`comm_copy_attr_fn`~~ ==[[comm_copy_attr_fn]]== function is invoked when a communicator is duplicated by [[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]] or [[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] . ~~`comm_copy_attr_fn`~~ ==[[comm_copy_attr_fn]]== should be of type `MPI_Comm_copy_attr_function`. The copy callback function is invoked for each key value in `oldcomm` in arbitrary order. Each call to the copy callback is made with a key value and its corresponding attribute. If it returns `flag = 0` or `.FALSE.`, then the attribute is deleted in the duplicated communicator. Otherwise (`flag = 1` or `.TRUE.`), the new attribute value is set to the value returned in `attribute_val_out`. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case ~~`MPI_COMM_DUP`~~ ==[[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]]== or [[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] will fail).

~~Analogous to `comm_copy_attr_fn` is a callback deletion function, defined as follows. The `comm_delete_attr_fn` function is invoked when a communicator is deleted by [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to~~

~~[[versions/v31/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] . `comm_delete_attr_fn` should be of type `MPI_Comm_delete_attr_function`.~~

~~This function is called by [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v31/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] , and [[versions/v31/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] to do whatever is needed to remove an attribute. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case `MPI_COMM_FREE` will fail).~~

==Analogous to [[comm_copy_attr_fn]] is a callback deletion function, defined as follows. The [[comm_delete_attr_fn]] function is invoked when a communicator is deleted by [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v31/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] . [[comm_delete_attr_fn]] should be of type `MPI_Comm_delete_attr_function`.==

==This function is called by [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v31/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] , and [[versions/v31/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] to do whatever is needed to remove an attribute. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] will fail).==

~~Frees an extant attribute key. This function sets the value of `keyval` to~~

~~`MPI_KEYVAL_INVALID`. Note that it is not erroneous to free an attribute key that is in use, because the actual free does not transpire until after all references (in other communicators on the process) to the key have been freed. These references need to be explictly freed by the program, either via calls to [[versions/v31/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] that free one attribute instance, or by calls to [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] that free all attribute instances associated with the freed communicator.~~

==Frees an extant attribute key. This function sets the value of `keyval` to `MPI_KEYVAL_INVALID`. Note that it is not erroneous to free an attribute key that is in use, because the actual free does not transpire until after all references (in other communicators on the process) to the key have been freed. These references need to be explictly freed by the program, either via calls to [[versions/v31/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] that free one attribute instance, or by calls to [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] that free all attribute instances associated with the freed communicator.==

This function stores the stipulated attribute value `attribute_val` for subsequent retrieval by ~~`MPI_COMM_GET_ATTR`.~~ ==[[versions/v31/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] .== If the value is already present, then the outcome is as if [[versions/v31/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] was first called to delete the previous value (and the callback function [[comm_delete_attr_fn]] was executed), and a new value was next stored. The call is erroneous if there is no key with value `keyval`; in particular `MPI_KEYVAL_INVALID` is an erroneous key value. The call will fail if the [[comm_delete_attr_fn]] function returned an error code other than `MPI_SUCCESS`.

> The call to `MPI_Comm_set_attr` passes in `attribute_val` the *value* of the attribute; the call to `MPI_Comm_get_attr` passes in `attribute_val` the *address* of ~~> >~~ the location where the attribute value is to be returned. Thus, if the attribute value itself is a pointer of type `void*`, ~~> >~~ then the actual `attribute_val` parameter to `MPI_Comm_set_attr` will be of type `void*` and the actual `attribute_val` parameter to ~~> >~~ `MPI_Comm_get_attr` will be of type `void**`.

### MPI-3.1 → MPI-4.0  (7 changed paragraphs)

The ~~[[comm_copy_attr_fn]]~~ ==`comm_copy_attr_fn`== function is invoked when a communicator is duplicated by [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] ==, [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]]== or ~~[[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]~~ ==[[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]]== . ~~[[comm_copy_attr_fn]]~~ ==`comm_copy_attr_fn`== should be of type `MPI_Comm_copy_attr_function`. The copy callback function is invoked for each key value in `oldcomm` in arbitrary order. Each call to the copy callback is made with a key value and its corresponding attribute. If it returns ~~`flag =~~ ==`flag``=== 0` or `.FALSE.`, then the attribute is deleted in the duplicated communicator. Otherwise ~~(`flag =~~ ==(`flag``=== 1` or `.TRUE.`), the new attribute value is set to the value returned in `attribute_val_out`. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] or [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] will fail).

[[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] from either C or Fortran. [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] is a function that does nothing other than returning ~~`flag =~~ ==`flag``=== 0` or `.FALSE.` (depending on whether the keyval was created with a C or Fortran binding to [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] ) and `MPI_SUCCESS`. [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] is a ~~simple-minded~~ ==simple== copy function that sets ~~`flag =~~ ==`flag``=== 1` or `.TRUE.`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. These replace the MPI-1 predefined callbacks [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v40/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] , whose use is deprecated.

> Even though both formal arguments `attribute_val_in` and `attribute_val_out` are of type ~~`void *`,~~ ==`void*`,== their usage differs. The C copy function is passed by MPI in `attribute_val_in` the *value* of the attribute, and in `attribute_val_out` the *address* of the attribute, so as to allow the function to return the (new) attribute value. The use of type ~~`void *`~~ ==`void*`== for both is to avoid messy type casts. > > A valid copy function is one that completely duplicates the information by making a full duplicate copy of the data structures implied by an attribute; another might just make another reference to that data structure, while using a reference-count mechanism. Other types of attributes might not copy at all (they might be specific to `oldcomm` only).

Analogous to ~~[[comm_copy_attr_fn]]~~ ==`comm_copy_attr_fn`== is a callback deletion function, defined as follows. The ~~[[comm_delete_attr_fn]]~~ ==`comm_delete_attr_fn`== function is invoked when a communicator is deleted by [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v40/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] . ~~[[comm_delete_attr_fn]]~~ ==`comm_delete_attr_fn`== should be of type `MPI_Comm_delete_attr_function`.

This function stores the stipulated attribute value `attribute_val` for subsequent retrieval by [[versions/v40/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] . If the value is already present, then the outcome is as if [[versions/v40/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] was first called to delete the previous value (and the callback function ~~[[comm_delete_attr_fn]]~~ ==`comm_delete_attr_fn`== was executed), and a new value was next stored. The call is erroneous if there is no key with value `keyval`; in particular `MPI_KEYVAL_INVALID` is an erroneous key value. The call will fail if the ~~[[comm_delete_attr_fn]]~~ ==`comm_delete_attr_fn`== function returned an error code other than `MPI_SUCCESS`.

Retrieves attribute value by key. The call is erroneous if there is no key with value `keyval`. On the other hand, the call is correct if the key value exists, but no attribute is attached on `comm` for that key; in such case, the call returns ~~`flag =~~ ==`flag``=== false`. In particular `MPI_KEYVAL_INVALID` is an erroneous key value.

Whenever a communicator is replicated using the function [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] ==, [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]]== or ~~[[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]~~ ==[[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]]== , all call-back copy functions for attributes that are currently set are invoked (in arbitrary order). Whenever a communicator is deleted using the function [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] all callback delete functions for attributes that are currently set are invoked.

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

Generates a new attribute key. Keys are locally unique in ~~a~~ ==an MPI== process, and opaque to user, though they are explicitly stored in integers. Once allocated, the key value can be used to associate attributes and access them on any locally defined communicator.

With the `mpi` module and ~~`mpif.h`,~~ ==(deprecated) `mpif.h` include file,== the Fortran callback functions are:

~~The argument `comm_copy_attr_fn` may be specified as~~

~~[[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] or~~

~~[[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] from either C or Fortran. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] is a function that does nothing other than returning `flag``= 0` or `.FALSE.` (depending on whether the keyval was created with a C or Fortran binding to [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] ) and `MPI_SUCCESS`. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] is a simple copy function that sets `flag``= 1` or `.TRUE.`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. These replace the MPI-1 predefined callbacks [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] , whose use is deprecated.~~

==The argument `comm_copy_attr_fn` may be specified as [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] or [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] from either C or Fortran. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] is a function that does nothing other than returning `flag``= 0` or `.FALSE.` (depending on whether the keyval was created with a C or Fortran binding to [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] ) and `MPI_SUCCESS`. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] is a simple copy function that sets `flag``= 1` or `.TRUE.`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`. These replace the MPI-1 predefined callbacks [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] and [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] , whose use is deprecated.==

~~Analogous to `comm_copy_attr_fn` is a callback deletion function, defined as follows. The `comm_delete_attr_fn` function is invoked when a communicator is deleted by [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v41/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] . `comm_delete_attr_fn` should be of type `MPI_Comm_delete_attr_function`.~~

~~This function is called by [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v41/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] , and [[versions/v41/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] to do whatever is needed to remove an attribute. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] will fail).~~

~~The argument `comm_delete_attr_fn` may be specified as~~

~~[[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] from either C or Fortran. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] replaces [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] , whose use is deprecated.~~

~~If an attribute copy function or attribute delete function returns other than `MPI_SUCCESS`, then the call that caused it to be invoked (for example, [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] ), is erroneous.~~

==Analogous to `comm_copy_attr_fn` is a callback deletion function, defined as follows. The `comm_delete_attr_fn` function is invoked when a communicator is deleted by [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] or when a call is made explicitly to [[versions/v41/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] . `comm_delete_attr_fn` should be of type `MPI_Comm_delete_attr_function`.==

==This function is called by [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , [[versions/v41/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] , and [[versions/v41/API/MPI_COMM_SET_ATTR|MPI_COMM_SET_ATTR]] to do whatever is needed to remove an attribute. The function returns `MPI_SUCCESS` on success and an error code on failure (in which case [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] will fail).==

==The argument `comm_delete_attr_fn` may be specified as [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] from either C or Fortran. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`. [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] replaces [[versions/v41/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] , whose use is deprecated.==

==If an attribute copy function or attribute delete function returns other than `MPI_SUCCESS`, then the call that caused it to be invoked (for example, [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] ) is erroneous.==

> The predefined Fortran functions [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] , [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] , and [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] are defined in the `mpi` module (and ==deprecated== `mpif.h`) and the `mpi_f08` module with the same name, but with different interfaces. Each function can coexist twice with the same name in the same MPI library, one routine as an implicit interface outside of the `mpi` module, i.e., declared as `EXTERNAL`, and the other routine within `mpi_f08` declared with `CONTAINS`. These routines have different link names, which are also different to the link names used for the routines used in C.

> Callbacks, including the predefined Fortran functions [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] , [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] , and [[versions/v41/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_DELETE_FN]] should not be passed from one application routine that uses the `mpi_f08` module to another application routine that uses the `mpi` module or ~~`mpif.h`,~~ ==(deprecated) `mpif.h` include file,== and vice versa; see also the advice to users on page [[advice-bindings-predefined-Fortran-users]] .

Frees an extant attribute key. This function sets the value of `keyval` to `MPI_KEYVAL_INVALID`. Note that it is not erroneous to free an attribute key that is in use, because the actual free does not transpire until after all references (in other communicators on the ==MPI== process) to the key have been freed. These references need to be explictly freed by the program, either via calls to [[versions/v41/API/MPI_COMM_DELETE_ATTR|MPI_COMM_DELETE_ATTR]] that free one attribute instance, or by calls to [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] that free all attribute instances associated with the freed communicator.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Communicators]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Communicators]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Communicators]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Communicators]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Communicators]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Communicators]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Communicators]]
