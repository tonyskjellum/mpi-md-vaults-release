---
title: "Functionality"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Functionality

Chapter **context** · in [[versions/v13/sections/context#Functionality|MPI-1.3]], [[versions/v21/sections/context#Functionality|MPI-2.1]], [[versions/v22/sections/context#Functionality|MPI-2.2]], [[versions/v30/sections/context#Functionality|MPI-3.0]], [[versions/v31/sections/context#Functionality|MPI-3.1]], [[versions/v40/sections/context#Functionality|MPI-4.0]], [[versions/v41/sections/context#Functionality|MPI-4.1]], [[versions/v50/sections/context#Functionality|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~Attributes are attached to communicators. Attributes are local to the process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using `MPI_COMM_DUP` (and even then the application must give specific permission through callback functions for the attribute to be copied).~~

==Attributes==

==can be==

==attached to communicators,==

==windows, and datatypes.==

==Attributes are local to the process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using `MPI_COMM_DUP` (and even then the application must give specific permission through callback functions for the attribute to be copied).==

~~The caching interface defined here represents that attributes be stored by MPI opaquely within a communicator. Accessor functions include the following:~~

==The caching interface defined here==

==requires==

==that attributes be stored by MPI opaquely within a communicator,==

==window, and datatype.==

==Accessor functions include the following:==

~~![[versions/v21/API/MPI_KEYVAL_CREATE]]~~

~~Generates a new attribute key. Keys are locally unique in a process, and opaque to user, though they are explicitly stored in integers. Once allocated, the key value can be used to associate attributes and access them on any locally defined communicator.~~

~~The `copy_fn` function is invoked when a communicator is duplicated by [[versions/v21/API/MPI_COMM_DUP|MPI_COMM_DUP]] . `copy_fn` should be of type MPI_Copy_function, which is defined as follows:~~

~~    typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,                                   void *extra_state, void *attribute_val_in,                                   void *attribute_val_out, int *flag)~~

~~A Fortran declaration for such a function is as follows:~~

~~The copy callback function is invoked for each key value in `oldcomm` in arbitrary order. Each call to the copy callback is made with a key value and its corresponding attribute. If it returns flag = 0, then the attribute is deleted in the duplicated communicator. Otherwise (flag = 1),~~

~~the new attribute value is set to the value returned in `attribute_val_out`.~~

~~The function returns MPI_SUCCESS on success and an error code on failure (in which case `MPI_COMM_DUP` will fail).~~

~~`copy_fn` may be specified as [[versions/v21/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] or [[versions/v21/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] from either C or FORTRAN; [[versions/v21/API/MPI_KEYVAL_CREATE|MPI_NULL_COPY_FN]] is a function that does nothing other than returning flag = 0 and MPI_SUCCESS. [[versions/v21/API/MPI_KEYVAL_CREATE|MPI_DUP_FN]] is a simple-minded copy function that sets flag = 1, returns the value of `attribute_val_in` in `attribute_val_out`, and returns MPI_SUCCESS.~~

~~> [!note] Advice to users~~

~~> Even though both formal arguments `attribute_val_in` and `attribute_val_out` are of type void \*, their usage differs. The C copy function is passed by MPI in `attribute_val_in` the *value* of the attribute, and in `attribute_val_out` the *address* of the attribute, so as to allow the function to return the (new) attribute value. The use of type void \* for both is to avoid messy type casts. > > A valid copy function is one that completely duplicates the information by making a full duplicate copy of the data structures implied by an attribute; another might just make another reference to that data structure, while using a reference-count mechanism. Other types of attributes might not copy at all (they might be specific to `oldcomm` only).~~

~~> [!warning] Advice to implementors~~

~~> A C interface should be assumed for copy and delete functions associated with key values created in C; a Fortran calling interface should be assumed for key values created in Fortran.~~

~~Analogous to `copy_fn` is a callback deletion function, defined as follows. The `delete_fn` function is invoked when a communicator is deleted by [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] or when a call is made explicitly to [[versions/v21/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] . `delete_fn` should be of type MPI_Delete_function, which is defined as follows:~~

~~    typedef int MPI_Delete_function(MPI_Comm comm, int keyval,                     void *attribute_val, void *extra_state);~~

~~A Fortran declaration for such a function is as follows:~~

~~This function is called by [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] , [[versions/v21/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] ,~~

~~and [[versions/v21/API/MPI_ATTR_PUT|MPI_ATTR_PUT]]~~

~~to do whatever is needed to remove an attribute.~~

~~The function returns MPI_SUCCESS on success and an error code on failure (in which case `MPI_COMM_FREE` will fail).~~

~~`delete_fn` may be specified as [[versions/v21/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] from either C or FORTRAN; [[versions/v21/API/MPI_KEYVAL_CREATE|MPI_NULL_DELETE_FN]] is a function that does nothing, other than returning MPI_SUCCESS.~~

~~If an attribute copy function or attribute delete function returns other than MPI_SUCCESS, then the call that caused it to be invoked (for example, [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] ), is erroneous.~~

~~The special key value MPI_KEYVAL_INVALID is never returned by [[versions/v21/API/MPI_KEYVAL_CREATE|MPI_KEYVAL_CREATE]] . Therefore, it can be used for static initialization of key values.~~

~~![[versions/v21/API/MPI_KEYVAL_FREE]]~~

~~Frees an extant attribute key. This function sets the value of `keyval` to MPI_KEYVAL_INVALID. Note that it is not erroneous to free an attribute key that is in use, because the actual free does not transpire until after all references (in other communicators on the process) to the key have been freed. These references need to be explictly freed by the program, either via calls to [[versions/v21/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] that free one attribute instance, or by calls to [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] that free all attribute instances associated with the freed communicator.~~

~~![[versions/v21/API/MPI_ATTR_PUT]]~~

~~This function stores the stipulated attribute value `attribute_val` for subsequent retrieval by `MPI_ATTR_GET`. If the value is already present, then the outcome is as if [[versions/v21/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] was first called to delete the previous value (and the callback function [[delete_fn]] was executed), and a new value was next stored. The call is erroneous if there is no key with value `keyval`; in particular MPI_KEYVAL_INVALID is an erroneous key value.~~

~~The call will fail if the [[delete_fn]] function returned an error code other than MPI_SUCCESS.~~

~~![[versions/v21/API/MPI_ATTR_GET]]~~

~~Retrieves attribute value by key. The call is erroneous if there is no key with value `keyval`. On the other hand, the call is correct if the key value exists, but no attribute is attached on `comm` for that key; in such case, the call returns `flag = false`. In particular MPI_KEYVAL_INVALID is an erroneous key value.~~

~~> [!note] Advice to users~~

~~> The call to [[versions/v21/API/MPI_ATTR_PUT|MPI_Attr_put]] passes in `attribute_val` the *value* of the attribute; the call to [[versions/v21/API/MPI_ATTR_GET|MPI_Attr_get]] passes in `attribute_val` the *address* of the the location where the attribute value is to be returned. Thus, if the attribute value itself is a pointer of type > > void\*, then the actual `attribute_val` parameter to [[versions/v21/API/MPI_ATTR_PUT|MPI_Attr_put]] will be of type void\* and the actual `attribute_val` parameter to [[versions/v21/API/MPI_ATTR_PUT|MPI_Attr_put]] will be of type void\*\*.~~

~~> [!tip] Rationale~~

~~> The use of a formal parameter `attribute_val` or type void\* (rather than void\*\*) avoids the messy type casting that would be needed if the attribute value is declared with a type other than void\*.~~

~~![[versions/v21/API/MPI_ATTR_DELETE]]~~

~~Delete attribute from cache by key. This function invokes the attribute delete function `delete_fn` specified when the `keyval` was created.~~

~~The call will fail if the `delete_fn` function returns an error code other than MPI_SUCCESS.~~

~~Whenever a communicator is replicated using the function [[versions/v21/API/MPI_COMM_DUP|MPI_COMM_DUP]] , all call-back copy functions for attributes that are currently set are invoked (in arbitrary order). Whenever a communicator is deleted using the function [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] all callback delete functions for attributes that are currently set are invoked.~~

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> Attributes in C are of type ~~void \*.~~ ==`void *`.== Typically, such an attribute will be a pointer to a structure that contains further information, or a handle to an MPI object. In Fortran, attributes are of type ~~INTEGER.~~ ==`INTEGER`.== Such attribute can be a handle to an MPI object, or just an integer-valued attribute.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~can be~~

~~attached to communicators,~~

~~windows, and datatypes.~~

~~Attributes are local to the process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using `MPI_COMM_DUP` (and even then the application must give specific permission through callback functions for the attribute to be copied).~~

==can be attached to communicators, windows, and datatypes. Attributes are local to the process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using `MPI_COMM_DUP` or [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] (and even then the application must give specific permission through callback functions for the attribute to be copied).==

~~requires~~

~~that attributes be stored by MPI opaquely within a communicator,~~

~~window, and datatype.~~

~~Accessor functions include the following:~~

==requires that attributes be stored by MPI opaquely within a communicator, window, and datatype. Accessor functions include the following:==

> Caching and callback functions are only called synchronously, in response to explicit application requests. This ~~avoid~~ ==avoids== problems that result from repeated crossings between user and system space. (This synchronous calling rule is a general property of MPI.) > > The choice of key values is under control of MPI. This allows MPI to optimize its implementation of attribute sets. It also avoids conflict between independent modules caching information on the same communicators. > > A much smaller interface, consisting of just a callback facility, would allow the entire caching facility to be implemented by portable code. However, with the minimal callback interface, some form of table searching is implied by the need to handle arbitrary communicators. In contrast, the more complete interface defined here permits rapid access to attributes through the use of pointers in communicators (to find the attribute table) and cleverly chosen key values (to retrieve individual attributes). In light of the efficiency “hit” inherent in the minimal interface, the more complete interface defined here is seen to be superior.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~Attributes~~

~~can be attached to communicators, windows, and datatypes. Attributes are local to the process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using `MPI_COMM_DUP` or [[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] (and even then the application must give specific permission through callback functions for the attribute to be copied).~~

==Attributes can be attached to communicators, windows, and datatypes. Attributes are local to the process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using [[versions/v31/API/MPI_COMM_DUP|MPI_COMM_DUP]] or [[versions/v31/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] (and even then the application must give specific permission through callback functions for the attribute to be copied).==

~~The caching interface defined here~~

~~requires that attributes be stored by MPI opaquely within a communicator, window, and datatype. Accessor functions include the following:~~

==The caching interface defined here requires that attributes be stored by MPI opaquely within a communicator, window, and datatype. Accessor functions include the following:==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

Attributes can be attached to communicators, windows, and datatypes. Attributes are local to the process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] ~~or~~ ==,== [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] ==, [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , and [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]]== (and even then the application must give specific permission through callback functions for the attribute to be copied).

> Attributes in C are of type ~~`void *`.~~ ==`void*`.== Typically, such an attribute will be a pointer to a structure that contains further information, or a handle to an MPI object. In Fortran, attributes are of type `INTEGER`. Such attribute can be a handle to an MPI object, or just an integer-valued attribute.

The caching interface defined here requires that attributes be stored by MPI opaquely within a communicator, window, ~~and~~ ==or== datatype. Accessor functions include the following:

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Attributes can be attached to communicators, windows, and datatypes. Attributes are local to the ==MPI== process and specific to the communicator to which they are attached. Attributes are not propagated by MPI from one communicator to another except when the communicator is duplicated using [[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v41/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v41/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , and [[versions/v41/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] (and even then the application must give specific permission through callback functions for the attribute to be ~~copied).~~ ==copied. Please refer to Section [[versions/v41/sections/context#Communicator Constructors|Communicator Constructors]] and Section [[versions/v41/sections/context#Communicators|Communicators]] for attributes propagation rules).==

MPI provides the following services related to caching. They are all ==MPI== process local.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Functionality]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Functionality]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Functionality]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Functionality]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Functionality]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Functionality]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Functionality]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Functionality]]
