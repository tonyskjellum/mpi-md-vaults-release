---
title: "Naming Objects"
chapter: context
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Naming Objects

Chapter **context** · in [[versions/v21/sections/context#Naming Objects|MPI-2.1]], [[versions/v22/sections/context#Naming Objects|MPI-2.2]], [[versions/v30/sections/context#Naming Objects|MPI-3.0]], [[versions/v31/sections/context#Naming Objects|MPI-3.1]], [[versions/v40/sections/context#Naming Objects|MPI-4.0]], [[versions/v41/sections/context#Naming Objects|MPI-4.1]], [[versions/v50/sections/context#Naming Objects|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (7 changed paragraphs)

The length of the name which can be stored is limited to the value of ~~MPI_MAX_OBJECT_NAME~~ ==`MPI_MAX_OBJECT_NAME`== in Fortran and ~~MPI_MAX_OBJECT_NAME-1~~ ==`MPI_MAX_OBJECT_NAME`-1== in C and C++ to allow for the null terminator.

~~MPI_MAX_OBJECT_NAME~~ ==`MPI_MAX_OBJECT_NAME`== must have a value of at least 64.

> Under circumstances of store exhaustion an attempt to put a name of any length could fail, therefore the value of > > ~~MPI_MAX_OBJECT_NAME~~ ==`MPI_MAX_OBJECT_NAME`== should be viewed only as a strict upper > > bound on the name length, not a guarantee that setting names of less than this length will always succeed.

> Implementations which pre-allocate a fixed size space for a name should use the length of that allocation as the value of > > ~~MPI_MAX_OBJECT_NAME.~~ ==`MPI_MAX_OBJECT_NAME`.== Implementations which allocate space for the name from the heap should still define ~~MPI_MAX_OBJECT_NAME~~ ==`MPI_MAX_OBJECT_NAME`== to be a relatively small value, since the user has to allocate space for a string of up to this size when calling [[versions/v22/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] .

`name` should be allocated so that it can hold a resulting string of length ~~MPI_MAX_OBJECT_NAME~~ ==`MPI_MAX_OBJECT_NAME`== characters.

In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then ~~MPI_MAX_OBJECT-1.~~ ==`MPI_MAX_OBJECT_NAME`-1.== In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then ~~MPI_MAX_OBJECT.~~ ==`MPI_MAX_OBJECT_NAME`.==

If the user has not associated a name with a communicator, or an error occurs, [[versions/v22/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] will return an empty string (all spaces in Fortran, `""` in C and C++). The three predefined communicators will have predefined names associated with them. Thus, the names of ~~MPI_COMM_WORLD, MPI_COMM_SELF,~~ ==`MPI_COMM_WORLD`, `MPI_COMM_SELF`,== and

the communicator returned by [[versions/v22/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] (if not ~~MPI_COMM_NULL)~~ ==`MPI_COMM_NULL`)==

will have the default of ~~MPI_COMM_WORLD, MPI_COMM_SELF,~~ ==`MPI_COMM_WORLD`, `MPI_COMM_SELF`,== and ~~MPI_COMM_PARENT.~~ ==`MPI_COMM_PARENT`.== The fact that the system may have chosen to give a default name to a communicator does not prevent the user from setting a name on the same communicator; doing this removes the old name and assigns the new one.

For example, `MPI_WCHAR` has the default name of ~~MPI_WCHAR.~~ ==`MPI_WCHAR`.==

### MPI-2.2 → MPI-3.0  (7 changed paragraphs)

~~There are many occasions on which it would be useful to allow a user to associate a printable identifier with an MPI communicator, window, or datatype, for instance error reporting, debugging, and profiling.~~

~~The names attached to opaque objects do not propagate when the object is duplicated or copied by MPI routines.~~

~~For communicators this can be achieved using the following two functions.~~

==There are many occasions on which it would be useful to allow a user to associate a printable identifier with an MPI communicator, window, or datatype, for instance error reporting, debugging, and profiling. The names attached to opaque objects do not propagate when the object is duplicated or copied by MPI routines. For communicators this can be achieved using the following two functions.==

~~The length of the name which can be stored is limited to the value of `MPI_MAX_OBJECT_NAME` in Fortran and `MPI_MAX_OBJECT_NAME`-1 in C and C++ to allow for the null terminator.~~

~~Attempts to put names longer than this will result in truncation of the name.~~

~~`MPI_MAX_OBJECT_NAME` must have a value of at least 64.~~

==The length of the name which can be stored is limited to the value of `MPI_MAX_OBJECT_NAME` in Fortran and `MPI_MAX_OBJECT_NAME`-1 in C to allow for the null terminator. Attempts to put names longer than this will result in truncation of the name. `MPI_MAX_OBJECT_NAME` must have a value of at least 64.==

> Under circumstances of store exhaustion an attempt to put a name of any length could fail, therefore the value of ~~> >~~ `MPI_MAX_OBJECT_NAME` should be viewed only as a strict upper ~~> >~~ bound on the name length, not a guarantee that setting names of less than this length will always succeed.

> Implementations which pre-allocate a fixed size space for a name should use the length of that allocation as the value of ~~> >~~ `MPI_MAX_OBJECT_NAME`. Implementations which allocate space for the name from the heap should still define `MPI_MAX_OBJECT_NAME` to be a relatively small value, since the user has to allocate space for a string of up to this size when calling [[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] .

~~[[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns the last name which has previously been associated with the given communicator. The name may be set and got from any language. The same name will be returned independent of the language used.~~

~~`name` should be allocated so that it can hold a resulting string of length `MPI_MAX_OBJECT_NAME` characters.~~

~~[[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns a copy of the set name in `name`.~~

~~In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`.~~

~~If the user has not associated a name with a communicator, or an error occurs, [[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] will return an empty string (all spaces in Fortran, `""` in C and C++). The three predefined communicators will have predefined names associated with them. Thus, the names of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and~~

~~the communicator returned by [[versions/v30/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] (if not `MPI_COMM_NULL`)~~

~~will have the default of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and `MPI_COMM_PARENT`. The fact that the system may have chosen to give a default name to a communicator does not prevent the user from setting a name on the same communicator; doing this removes the old name and assigns the new one.~~

==[[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns the last name which has previously been associated with the given communicator. The name may be set and retrieved from any language. The same name will be returned independent of the language used. `name` should be allocated so that it can hold a resulting string of length `MPI_MAX_OBJECT_NAME` characters. [[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns a copy of the set name in `name`.==

==In C, a null character is additionally stored at `name[resultlen]`. The value of `resultlen` cannot be larger than `MPI_MAX_OBJECT_NAME`-1. In Fortran, `name` is padded on the right with blank characters. The value of `resultlen` cannot be larger than `MPI_MAX_OBJECT_NAME`.==

==If the user has not associated a name with a communicator, or an error occurs, [[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] will return an empty string (all spaces in Fortran, `""` in C). The three predefined communicators will have predefined names associated with them. Thus, the names of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and==

==the communicator returned by [[versions/v30/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] (if not `MPI_COMM_NULL`) will have the default of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and `MPI_COMM_PARENT`. The fact that the system may have chosen to give a default name to a communicator does not prevent the user from setting a name on the same communicator; doing this removes the old name and assigns the new one.==

The following functions are used for setting and getting names of datatypes. ==The constant `MPI_MAX_OBJECT_NAME` also applies to these names.==

~~Named predefined datatypes have the default names of the datatype name.~~

~~For example, `MPI_WCHAR` has the default name of `MPI_WCHAR`.~~

~~The following functions are used for setting and getting names of windows.~~

==Named predefined datatypes have the default names of the datatype name. For example, `MPI_WCHAR` has the default name of `MPI_WCHAR`.==

==The following functions are used for setting and getting names of windows. The constant `MPI_MAX_OBJECT_NAME` also applies to these names.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~If the user has not associated a name with a communicator, or an error occurs, [[versions/v31/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] will return an empty string (all spaces in Fortran, `""` in C). The three predefined communicators will have predefined names associated with them. Thus, the names of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and~~

~~the communicator returned by [[versions/v31/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] (if not `MPI_COMM_NULL`) will have the default of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and `MPI_COMM_PARENT`. The fact that the system may have chosen to give a default name to a communicator does not prevent the user from setting a name on the same communicator; doing this removes the old name and assigns the new one.~~

==If the user has not associated a name with a communicator, or an error occurs, [[versions/v31/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] will return an empty string (all spaces in Fortran, `""` in C). The three predefined communicators will have predefined names associated with them. Thus, the names of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and the communicator returned by [[versions/v31/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] (if not `MPI_COMM_NULL`) will have the default of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and `MPI_COMM_PARENT`. The fact that the system may have chosen to give a default name to a communicator does not prevent the user from setting a name on the same communicator; doing this removes the old name and assigns the new one.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

[[versions/v40/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns the last name which has previously been associated with the given communicator. The name may be set and retrieved from any language. The same name will be returned independent of the language used. ~~`name`~~ ==`comm_name`== should be allocated so that it can hold a resulting string of length `MPI_MAX_OBJECT_NAME` characters. [[versions/v40/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns a copy of the set name in ~~`name`.~~ ==`comm_name`.==

In C, a null character is additionally stored at ~~`name[resultlen]`.~~ ==`comm_name[resultlen]`.== The value of `resultlen` cannot be larger than `MPI_MAX_OBJECT_NAME`-1. In Fortran, ~~`name`~~ ==`comm_name`== is padded on the right with blank characters. The value of `resultlen` cannot be larger than `MPI_MAX_OBJECT_NAME`.

### MPI-4.0 → MPI-4.1  (8 changed paragraphs)

[[versions/v41/API/MPI_COMM_SET_NAME|MPI_COMM_SET_NAME]] allows a user to associate a name string with a communicator. The character string ~~which~~ ==that== is passed to [[versions/v41/API/MPI_COMM_SET_NAME|MPI_COMM_SET_NAME]] will be saved inside the MPI library (so it can be freed by the caller immediately after the call, or allocated on the stack). Leading spaces in `name` are significant but trailing ones are not.

[[versions/v41/API/MPI_COMM_SET_NAME|MPI_COMM_SET_NAME]] is a local ~~(non-collective)~~ ==(noncollective)== operation, which only affects the name of the communicator as seen in the ==MPI== process ~~which~~ ==that== made the [[versions/v41/API/MPI_COMM_SET_NAME|MPI_COMM_SET_NAME]] call. There is no requirement that the same (or any) name be assigned to a communicator in every ==MPI== process where it exists.

> Since [[versions/v41/API/MPI_COMM_SET_NAME|MPI_COMM_SET_NAME]] is provided to help debug code, it is sensible to give the same name to a communicator in all of the ==MPI== processes where it exists, to avoid confusion.

The length of the name ~~which~~ ==that== can be stored is limited to the value of `MPI_MAX_OBJECT_NAME` in Fortran and `MPI_MAX_OBJECT_NAME`-1 in C to allow for the null terminator. Attempts to put names longer than this will result in truncation of the name. `MPI_MAX_OBJECT_NAME` must have a value of at least 64.

> Implementations ~~which~~ ==that== pre-allocate a fixed size space for a name should use the length of that allocation as the value of `MPI_MAX_OBJECT_NAME`. Implementations ~~which~~ ==that== allocate space for the name from the heap should still define `MPI_MAX_OBJECT_NAME` to be a relatively small value, since the user has to allocate space for a string of up to this size when calling [[versions/v41/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] .

[[versions/v41/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns the last name ~~which~~ ==that== has previously been associated with the given communicator. The name may be set and retrieved from any language. The same name will be returned independent of the language used. `comm_name` should be allocated so that it can hold a resulting string of length `MPI_MAX_OBJECT_NAME` characters. [[versions/v41/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] returns a copy of the set name in `comm_name`.

If the user has not associated a name with a communicator, or an error occurs, [[versions/v41/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] will return an empty string (all spaces in Fortran, `""` in C). The three predefined communicators will have predefined names associated with them. Thus, the names of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and the communicator returned by [[versions/v41/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] (if not `MPI_COMM_NULL`) will have the default of `MPI_COMM_WORLD`, `MPI_COMM_SELF`, and `MPI_COMM_PARENT`. ==Passing `MPI_COMM_NULL` as `comm` will return the string `MPI_COMM_NULL`.== The fact that the system may have chosen to give a default name to a communicator does not prevent the user from setting a name on the same communicator; doing this removes the old name and assigns the new one.

> We provide separate functions for setting and getting the name of a communicator, rather than simply providing a predefined attribute key for the following reasons: > > - It is not, in general, possible to store a string as an attribute from Fortran. > > - It is not easy to set up the delete function for a string attribute unless it is known to have been allocated from the heap. > > - To make the attribute key useful additional code to call `strdup` is necessary. If this is not standardized then users have to write it. This is extra unneeded work ~~which~~ ==that== we can easily eliminate. > > - The Fortran binding is not trivial to write (it will depend on details of the Fortran compilation system), and will not be portable. Therefore it should be in the library rather than in user code.

Named predefined datatypes have the default names of the datatype name. For example, `MPI_WCHAR` has the default name of `MPI_WCHAR`. ==Passing `MPI_DATATYPE_NULL` as `datatype` will return the string `MPI_DATATYPE_NULL`.==

==Passing `MPI_WIN_NULL` as `win` will return the string `MPI_WIN_NULL`.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Naming Objects]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Naming Objects]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Naming Objects]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Naming Objects]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Naming Objects]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Naming Objects]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Naming Objects]]
