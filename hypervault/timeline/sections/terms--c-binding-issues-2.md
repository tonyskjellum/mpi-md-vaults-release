---
title: "C++ Binding Issues"
chapter: terms
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/terms]
---

# C++ Binding Issues

Chapter **terms** · in [[versions/v20/sections/terms#C++ Binding Issues|MPI-2.0]], [[versions/v21/sections/terms#C++ Binding Issues|MPI-2.1]], [[versions/v22/sections/terms#C++ Binding Issues|MPI-2.2]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~We use the ANSI C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare variables or functions with names beginning with the prefix, `MPI_`. This is mandated to avoid possible name collisions.~~

==There are places in the standard that give rules for C and not for C++. In these cases, the C rule should be applied to the C++ case, as appropriate. In particular, the values of constants given in the text are the ones for C and Fortran. A cross index of these with the C++ names is given in Annex [[versions/v21/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .==

==We use the==

==ISO C++==

==declaration format. All MPI names are declared within the scope of a namespace called `MPI` and therefore are referenced with an `MPI::` prefix. Defined constants are in all capital letters, and class names, defined types, and functions have only their first letter capitalized. Programs must not declare variables or functions in the `MPI` namespace. This is mandated to avoid possible name collisions.==

~~Almost all C functions return an error code. The successful return code will be `MPI_SUCCESS`, but failure return codes are implementation dependent. A few C functions do not return values, so that they can be implemented as macros.~~

~~Type declarations are provided for handles to each category of opaque objects. Either a pointer or an integer type is used.~~

==> [!warning] Advice to implementors==

==> The file <span class="sans-serif">mpi.h</span> may contain both the C and C++ definitions. > > Usually one can simply use the defined value (generally `__cplusplus`, but not required) to see if one is using C++ to protect the C++ definitions. It is possible that a C compiler will require that the source protected this way be legal C code. In this case, all the C++ definitions can be placed in a different include file and the “`#include`” directive can be used to include the necessary C++ definitions in the <span class="sans-serif">mpi.h</span> file.==

==C++ functions that create objects or return information usually place the object or information in the return value. Since the language neutral prototypes of MPI functions include the C++ return value as an OUT parameter, semantic descriptions of MPI functions refer to the C++ return value by that parameter==

==name.==

==The remaining C++ functions return `void`.==

==In some circumstances, MPI permits users to indicate that they do not want a return value. For example, the user may indicate that the status is not filled in. Unlike C and Fortran where this is achieved through a special input value, in C++ this is done by having two bindings where one has the optional argument and one does not.==

==C++ functions do not return error codes. If the default error handler has been set to MPI::ERRORS_THROW_EXCEPTIONS, the C++ exception mechanism is used to signal an error by throwing an==

==`MPI::Exception`==

==object.==

==It should be noted that the default error handler (i.e., MPI::ERRORS_ARE_FATAL) on a given type has not changed. User error handlers are also permitted. MPI::ERRORS_RETURN simply returns control to the calling function; there is no provision for the user to retrieve the error code.==

==User callback functions that return integer error codes should not throw exceptions; the returned error will be handled by the MPI implementation by invoking the appropriate error handler.==

==> [!note] Advice to users==

==> C++ programmers that want to handle MPI errors on their own should use the MPI::ERRORS_THROW_EXCEPTIONS error handler, rather than MPI::ERRORS_RETURN, that is used for that purpose in C. Care should be taken using exceptions in mixed language situations.==

==Opaque object handles must be objects in themselves, and have the assignment and equality operators overridden to perform semantically like their C and Fortran counterparts.==

~~Logical flags are integers with value 0 meaning “false” and a non-zero value meaning “true.”~~

~~Choice arguments are pointers of type `void*`.~~

~~Address arguments are of MPI defined type MPI_Aint. This is defined to be an int of the size needed to hold any valid address on the target architecture.~~

~~All named MPI constants can be used in initialization expressions or assignments like C constants.~~

==Logical flags are of type `bool`.==

==Choice arguments are pointers of type `void *`.==

==Address arguments are of MPI-defined integer type `MPI::Aint`, defined to be an integer of the size needed to hold any valid address on the target architecture.==

==Analogously, `MPI::Offset` is an integer to hold file offsets.==

==Most MPI functions are methods of MPI C++ classes. MPI class names are generated from the language neutral MPI types by dropping the `MPI_` prefix and scoping the type within the `MPI` namespace. For example, `MPI_DATATYPE` becomes `MPI::Datatype`.==

==The names of==

==MPI==

==functions generally follow the naming rules given. In some circumstances, the==

==MPI function is related to a function defined already for MPI-1==

==with a name that does not follow the naming conventions. In this circumstance, the language neutral name is in analogy to the==

==MPI==

==name even though this gives an MPI-2 name that violates the naming conventions. The C and Fortran names are the same as the language neutral name in this case. However, the C++==

==names==

==do reflect the naming rules and can differ from the C and Fortran names. Thus, the analogous name in C++ to the==

==MPI name may be==

==different than the language neutral name. This results in the C++ name differing from the language neutral name. An example of this is the language neutral name of [[versions/v21/API/MPI_FINALIZED|MPI_FINALIZED]] and a C++ name of `MPI::Is_finalized` .==

==In C++, function `typedef`s are made publicly within appropriate classes. However, these declarations then become somewhat cumbersome, as with the following:==

==would look like the following:==

==    namespace MPI {       class Request {         // ...       };==

==      class Grequest : public MPI::Request {         // ...         typedef Query_function(void* extra_state, MPI::Status& status);       };     };==

==Rather than including this scaffolding when declaring C++ `typedef`s, we use an abbreviated form. In particular, we explicitly indicate the class and namespace scope for the `typedef` of the function. Thus, the example above is shown in the text as follows:==

==    typedef int MPI::Grequest::Query_function(void* extra_state,                                               MPI::Status& status)==

==The C++ bindings presented in Annex [[versions/v21/sections/appLang-C++#C++ Bindings|C++ Bindings]] and throughout this document were generated by applying a simple set of name generation rules to the MPI function specifications. While these guidelines may be sufficient in most cases, they may not be suitable for all situations. In cases of ambiguity or where a specific semantic statement is desired, these guidelines may be superseded as the situation dictates.==

==1.  All functions, types, and constants are declared within the scope of a `namespace` called `MPI`.==

==2.  Arrays of MPI handles are always left in the argument list (whether they are IN or OUT arguments).==

==3.  If the argument list of an MPI function contains a scalar IN handle, and it makes sense to define the function as a method of the object corresponding to that handle, the function is made a member function of the corresponding MPI class.==

==    The member functions are named according to the corresponding MPI function name, but without the “`MPI_`” prefix and without the object name prefix (if applicable). In addition:==

==    1.  The scalar IN handle is dropped from the argument list, and `this` corresponds to the dropped argument.==

==    2.  The function is declared `const`.==

==4.  MPI functions are made into class functions (static) when they belong on a class but do not have a unique scalar IN or INOUT parameter of that class.==

==5.  If the argument list contains a single OUT argument that is not of type `MPI_STATUS` (or an array), that argument is dropped from the list and the function returns that value.==

==    The C++ binding for [[versions/v21/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] is `int MPI::Comm::Get_size(void) const` .==

==6.  If there are multiple OUT arguments in the argument list, one is chosen as the return value and is removed from the list.==

==7.  If the argument list does not contain any OUT arguments, the function returns `void`.==

==    The C++ binding for [[versions/v21/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] is `void MPI::Request::Free(void)`==

==8.  MPI functions to which the above rules do not apply are not members of any class, but are defined in the `MPI` namespace.==

==    The C++ binding for [[versions/v21/API/MPI_BUFFER_ATTACH|MPI_BUFFER_ATTACH]] is `void MPI::Attach_buffer(void\*buffer, intsize)` .==

==9.  All class names, defined types, and function names have only their first letter capitalized. Defined constants are in all capital letters.==

==10. Any IN pointer, reference, or array argument must be declared `const`.==

==11. Handles are passed by reference.==

==12. Array arguments are denoted with square brackets (`[]`), not pointers, as this is more semantically precise.==

### MPI-2.0 → MPI-2.1  (6 changed paragraphs)

~~There are places in the standard that give rules for C and not for C++. In these cases, the C rule should be applied to the C++ case, as appropriate. In particular, the values of constants given in the text are the ones for C and Fortran. A cross index of these with the C++ names is given in Annex [[versions/v20/sections/appLang#Language Binding|Language Binding]] .~~

~~We use the ANSI C++ declaration format. All MPI names are declared within the scope of a namespace called `MPI` and therefore are referenced with an `MPI::` prefix. Defined constants are in all capital letters, and class names, defined types, and functions have only their first letter capitalized. Programs must not declare variables or functions in the `MPI` namespace. This is mandated to avoid possible name collisions.~~

==There are places in the standard that give rules for C and not for C++. In these cases, the C rule should be applied to the C++ case, as appropriate. In particular, the values of constants given in the text are the ones for C and Fortran. A cross index of these with the C++ names is given in Annex [[versions/v21/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .==

==We use the==

==ISO C++==

==declaration format. All MPI names are declared within the scope of a namespace called `MPI` and therefore are referenced with an `MPI::` prefix. Defined constants are in all capital letters, and class names, defined types, and functions have only their first letter capitalized. Programs must not declare variables or functions in the `MPI` namespace. This is mandated to avoid possible name collisions.==

~~C++ functions that create objects or return information usually place the object or information in the return value. Since the language neutral prototypes of MPI functions include the C++ return value as an OUT parameter, semantic descriptions of MPI functions refer to the C++ return value by that parameter name (see Section [[versions/v20/sections/appendix-c++#Function Name Cross Reference|Function Name Cross Reference]] on page [[versions/v20/sections/appendix-c++#Function Name Cross Reference|Function Name Cross Reference]] ). The remaining C++ functions return `void`.~~

==C++ functions that create objects or return information usually place the object or information in the return value. Since the language neutral prototypes of MPI functions include the C++ return value as an OUT parameter, semantic descriptions of MPI functions refer to the C++ return value by that parameter==

==name.==

==The remaining C++ functions return `void`.==

It should be noted that the default error handler (i.e., ~~`MPI::ERRORS_ARE_FATAL` )~~ ==MPI::ERRORS_ARE_FATAL)== on a given type has not changed. User error handlers are also permitted. ~~`MPI::ERRORS_RETURN`~~ ==MPI::ERRORS_RETURN== simply returns control to the calling function; there is no provision for the user to retrieve the error code.

> C++ programmers that want to handle MPI errors on their own should use the ~~`MPI::ERRORS_THROW_EXCEPTIONS`~~ ==MPI::ERRORS_THROW_EXCEPTIONS== error handler, rather than ~~`MPI::ERRORS_RETURN` ,~~ ==MPI::ERRORS_RETURN,== that is used for that purpose in C. Care should be taken using exceptions in mixed language situations.

~~The names of MPI-2 functions generally follow the naming rules given. In some circumstances, the new MPI-2 function is related to an MPI-1 function with a name that does not follow the naming conventions. In this circumstance, the language neutral name is in analogy to the MPI-1 name even though this gives an MPI-2 name that violates the naming conventions. The C and Fortran names are the same as the language neutral name in this case. However, the C++ names for MPI-1 do reflect the naming rules and can differ from the C and Fortran names. Thus, the analogous name in C++ to the MPI-1 name is different than the language neutral name. This results in the C++ name differing from the language neutral name. An example of this is the language neutral name of [[versions/v21/API/MPI_FINALIZED|MPI_FINALIZED]] and a C++ name of `MPI::Is_finalized` .~~

==The names of==

==MPI==

==functions generally follow the naming rules given. In some circumstances, the==

==MPI function is related to a function defined already for MPI-1==

==with a name that does not follow the naming conventions. In this circumstance, the language neutral name is in analogy to the==

==MPI==

==name even though this gives an MPI-2 name that violates the naming conventions. The C and Fortran names are the same as the language neutral name in this case. However, the C++==

==names==

==do reflect the naming rules and can differ from the C and Fortran names. Thus, the analogous name in C++ to the==

==MPI name may be==

==different than the language neutral name. This results in the C++ name differing from the language neutral name. An example of this is the language neutral name of [[versions/v21/API/MPI_FINALIZED|MPI_FINALIZED]] and a C++ name of `MPI::Is_finalized` .==

The C++ bindings presented in Annex ~~[[versions/v20/sections/appendix-c++#MPI-1 C++ Language Binding|MPI-1 C++ Language Binding]]~~ ==[[versions/v21/sections/appLang-C++#C++ Bindings|C++ Bindings]]== and throughout this document were generated by applying a simple set of name generation rules to the MPI function specifications. While these guidelines may be sufficient in most cases, they may not be suitable for all situations. In cases of ambiguity or where a specific semantic statement is desired, these guidelines may be superseded as the situation dictates.

### MPI-2.1 → MPI-2.2  (11 changed paragraphs)

==The C++ language bindings have been deprecated.==

C++ functions that create objects or return information usually place the object or information in the return value. Since the language neutral prototypes of MPI functions include the C++ return value as an ~~OUT~~ ==`OUT`== parameter, semantic descriptions of MPI functions refer to the C++ return value by that parameter

C++ functions do not return error codes. If the default error handler has been set to ~~MPI::ERRORS_THROW_EXCEPTIONS,~~ ==`MPI::ERRORS_THROW_EXCEPTIONS`,== the C++ exception mechanism is used to signal an error by throwing an

It should be noted that the default error handler (i.e., ~~MPI::ERRORS_ARE_FATAL)~~ ==`MPI::ERRORS_ARE_FATAL`)== on a given type has not changed. User error handlers are also permitted. ~~MPI::ERRORS_RETURN~~ ==`MPI::ERRORS_RETURN`== simply returns control to the calling function; there is no provision for the user to retrieve the error code.

> C++ programmers that want to handle MPI errors on their own should use the ~~MPI::ERRORS_THROW_EXCEPTIONS~~ ==`MPI::ERRORS_THROW_EXCEPTIONS`== error handler, rather than ~~MPI::ERRORS_RETURN,~~ ==`MPI::ERRORS_RETURN`,== that is used for that purpose in C. Care should be taken using exceptions in mixed language situations.

The C++ bindings presented in Annex [[versions/v22/sections/appLang-C++#C++ ~~Bindings|C++ Bindings]]~~ ==Bindings (deprecated)|C++ Bindings (deprecated)]]== and throughout this document were generated by applying a simple set of name generation rules to the MPI function specifications. While these guidelines may be sufficient in most cases, they may not be suitable for all situations. In cases of ambiguity or where a specific semantic statement is desired, these guidelines may be superseded as the situation dictates.

2. Arrays of MPI handles are always left in the argument list (whether they are ~~IN~~ ==`IN`== or ~~OUT~~ ==`OUT`== arguments).

3. If the argument list of an MPI function contains a scalar ~~IN~~ ==`IN`== handle, and it makes sense to define the function as a method of the object corresponding to that handle, the function is made a member function of the corresponding MPI class.

1. The scalar ~~IN~~ ==`IN`== handle is dropped from the argument list, and `this` corresponds to the dropped argument.

4. MPI functions are made into class functions (static) when they belong on a class but do not have a unique scalar ~~IN~~ ==`IN`== or ~~INOUT~~ ==`INOUT`== parameter of that class.

5. If the argument list contains a single ~~OUT~~ ==`OUT`== argument that is not of type `MPI_STATUS` (or an array), that argument is dropped from the list and the function returns that value.

6. If there are multiple ~~OUT~~ ==`OUT`== arguments in the argument list, one is chosen as the return value and is removed from the list.

7. If the argument list does not contain any ~~OUT~~ ==`OUT`== arguments, the function returns `void`.

10. Any ~~IN~~ ==`IN`== pointer, reference, or array argument must be declared `const`.

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~The C++ language bindings have been deprecated.~~

~~There are places in the standard that give rules for C and not for C++. In these cases, the C rule should be applied to the C++ case, as appropriate. In particular, the values of constants given in the text are the ones for C and Fortran. A cross index of these with the C++ names is given in Annex [[versions/v30/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .~~

~~ISO C++~~

~~declaration format. All MPI names are declared within the scope of a namespace called `MPI` and therefore are referenced with an `MPI::` prefix. Defined constants are in all capital letters, and class names, defined types, and functions have only their first letter capitalized. Programs must not declare variables or functions in the `MPI` namespace. This is mandated to avoid possible name collisions.~~

==ISO C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare names (identifiers), e.g., for variables, functions, constants, types, or macros, beginning with the prefix `MPI_`. To support the profiling interface, programs must not declare functions with names beginning with the prefix `PMPI_`.==

~~> [!warning] Advice to implementors~~

~~> The file <span class="sans-serif">mpi.h</span> may contain both the C and C++ definitions. > > Usually one can simply use the defined value (generally `__cplusplus`, but not required) to see if one is using C++ to protect the C++ definitions. It is possible that a C compiler will require that the source protected this way be legal C code. In this case, all the C++ definitions can be placed in a different include file and the “`#include`” directive can be used to include the necessary C++ definitions in the <span class="sans-serif">mpi.h</span> file.~~

~~C++ functions that create objects or return information usually place the object or information in the return value. Since the language neutral prototypes of MPI functions include the C++ return value as an `OUT` parameter, semantic descriptions of MPI functions refer to the C++ return value by that parameter~~

~~name.~~

~~The remaining C++ functions return `void`.~~

~~In some circumstances, MPI permits users to indicate that they do not want a return value. For example, the user may indicate that the status is not filled in. Unlike C and Fortran where this is achieved through a special input value, in C++ this is done by having two bindings where one has the optional argument and one does not.~~

~~C++ functions do not return error codes. If the default error handler has been set to `MPI::ERRORS_THROW_EXCEPTIONS`, the C++ exception mechanism is used to signal an error by throwing an~~

~~`MPI::Exception`~~

~~object.~~

~~It should be noted that the default error handler (i.e., `MPI::ERRORS_ARE_FATAL`) on a given type has not changed. User error handlers are also permitted. `MPI::ERRORS_RETURN` simply returns control to the calling function; there is no provision for the user to retrieve the error code.~~

~~User callback functions that return integer error codes should not throw exceptions; the returned error will be handled by the MPI implementation by invoking the appropriate error handler.~~

~~> [!note] Advice to users~~

~~> C++ programmers that want to handle MPI errors on their own should use the `MPI::ERRORS_THROW_EXCEPTIONS` error handler, rather than `MPI::ERRORS_RETURN`, that is used for that purpose in C. Care should be taken using exceptions in mixed language situations.~~

~~Opaque object handles must be objects in themselves, and have the assignment and equality operators overridden to perform semantically like their C and Fortran counterparts.~~

==Almost all C functions return an error code. The successful return code will be `MPI_SUCCESS`, but failure return codes are implementation dependent.==

==Type declarations are provided for handles to each category of opaque objects.==

Logical flags are ~~of type `bool`.~~ ==integers with value 0 meaning “false” and a non-zero value meaning “true.”==

~~Address arguments are of MPI-defined integer type `MPI::Aint`, defined to be an integer of the size needed to hold any valid address on the target architecture.~~

~~Analogously, `MPI::Offset` is an integer to hold file offsets.~~

~~Most MPI functions are methods of MPI C++ classes. MPI class names are generated from the language neutral MPI types by dropping the `MPI_` prefix and scoping the type within the `MPI` namespace. For example, `MPI_DATATYPE` becomes `MPI::Datatype`.~~

~~The names of~~

~~MPI~~

~~functions generally follow the naming rules given. In some circumstances, the~~

~~MPI function is related to a function defined already for MPI-1~~

~~with a name that does not follow the naming conventions. In this circumstance, the language neutral name is in analogy to the~~

~~MPI~~

~~name even though this gives an MPI-2 name that violates the naming conventions. The C and Fortran names are the same as the language neutral name in this case. However, the C++~~

~~names~~

~~do reflect the naming rules and can differ from the C and Fortran names. Thus, the analogous name in C++ to the~~

~~MPI name may be~~

~~different than the language neutral name. This results in the C++ name differing from the language neutral name. An example of this is the language neutral name of [[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] and a C++ name of `MPI::Is_finalized` .~~

~~In C++, function `typedef`s are made publicly within appropriate classes. However, these declarations then become somewhat cumbersome, as with the following:~~

~~would look like the following:~~

~~    namespace MPI {       class Request {         // ...       };~~

~~      class Grequest : public MPI::Request {         // ...         typedef Query_function(void* extra_state, MPI::Status& status);       };     };~~

~~Rather than including this scaffolding when declaring C++ `typedef`s, we use an abbreviated form. In particular, we explicitly indicate the class and namespace scope for the `typedef` of the function. Thus, the example above is shown in the text as follows:~~

~~    typedef int MPI::Grequest::Query_function(void* extra_state,                                               MPI::Status& status)~~

~~The C++ bindings presented in Annex [[versions/v22/sections/appLang-C++#C++ Bindings (deprecated)|C++ Bindings (deprecated)]] and throughout this document were generated by applying a simple set of name generation rules to the MPI function specifications. While these guidelines may be sufficient in most cases, they may not be suitable for all situations. In cases of ambiguity or where a specific semantic statement is desired, these guidelines may be superseded as the situation dictates.~~

~~1.  All functions, types, and constants are declared within the scope of a `namespace` called `MPI`.~~

~~2.  Arrays of MPI handles are always left in the argument list (whether they are `IN` or `OUT` arguments).~~

~~3.  If the argument list of an MPI function contains a scalar `IN` handle, and it makes sense to define the function as a method of the object corresponding to that handle, the function is made a member function of the corresponding MPI class.~~

~~    The member functions are named according to the corresponding MPI function name, but without the “`MPI_`” prefix and without the object name prefix (if applicable). In addition:~~

~~    1.  The scalar `IN` handle is dropped from the argument list, and `this` corresponds to the dropped argument.~~

~~    2.  The function is declared `const`.~~

~~4.  MPI functions are made into class functions (static) when they belong on a class but do not have a unique scalar `IN` or `INOUT` parameter of that class.~~

~~5.  If the argument list contains a single `OUT` argument that is not of type `MPI_STATUS` (or an array), that argument is dropped from the list and the function returns that value.~~

~~    The C++ binding for [[versions/v30/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] is `int MPI::Comm::Get_size(void) const` .~~

~~6.  If there are multiple `OUT` arguments in the argument list, one is chosen as the return value and is removed from the list.~~

~~7.  If the argument list does not contain any `OUT` arguments, the function returns `void`.~~

~~    The C++ binding for [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] is `void MPI::Request::Free(void)`~~

~~8.  MPI functions to which the above rules do not apply are not members of any class, but are defined in the `MPI` namespace.~~

~~    The C++ binding for [[versions/v30/API/MPI_BUFFER_ATTACH|MPI_BUFFER_ATTACH]] is `void MPI::Attach_buffer(void\*buffer, intsize)` .~~

~~9.  All class names, defined types, and function names have only their first letter capitalized. Defined constants are in all capital letters.~~

~~10. Any `IN` pointer, reference, or array argument must be declared `const`.~~

~~11. Handles are passed by reference.~~

~~12. Array arguments are denoted with square brackets (`[]`), not pointers, as this is more semantically precise.~~

==Address arguments are of MPI defined type `MPI_Aint`. File displacements are of type `MPI_Offset`. `MPI_Aint` is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~We use the~~

~~ISO C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare names (identifiers), e.g., for variables, functions, constants, types, or macros, beginning with the prefix `MPI_`. To support the profiling interface, programs must not declare functions with names beginning with the prefix `PMPI_`.~~

~~The definition of named constants, function prototypes, and type definitions must be supplied in an include file <span class="sans-serif">mpi.h</span>.~~

==We use the ISO C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare names (identifiers), e.g., for variables, functions, constants, types, or macros, beginning with any prefix of the form `MPI_`, where any of the letters are either upper or lower case. To support the profiling interface, programs must not declare functions with names beginning with any prefix of the form `PMPI_`, where any of the letters are either upper or lower case.==

==The definition of named constants, function prototypes, and type definitions must be supplied in an include file `mpi.h`.==

~~Address arguments are of MPI defined type `MPI_Aint`. File displacements are of type `MPI_Offset`. `MPI_Aint` is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.~~

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Choice arguments are pointers of type ~~`void *`.~~ ==`void*`.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Almost all C functions return an error code. The successful return ~~code~~ ==value== will be `MPI_SUCCESS`, but ==error codes raised after a== failure ~~return codes~~ are implementation dependent.

Logical flags are integers with value 0 meaning “false” and a ~~non-zero~~ ==nonzero== value meaning “true.”

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#C++ Binding Issues]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#C++ Binding Issues]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#C++ Binding Issues]]
