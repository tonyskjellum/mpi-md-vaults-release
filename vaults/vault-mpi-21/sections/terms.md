# MPI Terms and Conventions





This chapter explains notational terms and conventions used throughout the

MPI

document, some of the choices that have been made, and the rationale behind those choices. It is similar to the MPI-1 Terms and Conventions chapter but differs in some major and minor ways. Some of the major areas of difference are the naming conventions, some semantic definitions, file objects, Fortran 90 *vs* Fortran 77, C++, processes, and

interaction with signals.

## Document Notation

> [!tip] Rationale

> Throughout this document, the rationale for the design choices made in the interface specification is set off in this format. Some readers may wish to skip these sections, while readers interested in interface design may want to read them carefully.

> [!note] Advice to users

> Throughout this document, material aimed at users and that illustrates usage is set off in this format. Some readers may wish to skip these sections, while readers interested in programming in MPI may want to read them carefully.

> [!warning] Advice to implementors

> Throughout this document, material that is primarily commentary to implementors is set off in this format. Some readers may wish to skip these sections, while readers interested in MPI implementations may want to read them carefully.

## Naming Conventions

In many cases MPI names for C functions are of the form [[Class_action_subset]] . This convention originated with MPI-1. Since MPI-2 an attempt has been made to standardize the names of MPI functions according to the following rules. The C++ bindings in particular follow these rules (see Section [[terms-cpp]] on page [[terms-cpp]] ).

1.  In C, all routines associated with a particular type of MPI object should be of the form [[Class_action_subset]] or, if no subset exists, of the form [[Class_action]] . In Fortran, all routines associated with a particular type of MPI object should be of the form [[CLASS_ACTION_SUBSET]] or, if no subset exists, of the form [[CLASS_ACTION]] . For C and Fortran we use the C++ terminology to define the [[Class]] . In C++, the routine is a method on **Class** and is named **MPI::Class::Action_subset**.

    If the routine is associated with a certain class, but does not make sense as an object method, it is a static member function of the class.

2.  If the routine is not associated with a class, the name should be of the form [[Action_subset]] in C and [[ACTION_SUBSET]] in Fortran, and in C++ should be scoped in the **MPI** namespace, **MPI::Action_subset**.

3.  The names of certain actions have been standardized. In particular, **Create** creates a new object, **Get** retrieves information about an object, **Set** sets this information, **Delete** deletes information, **Is** asks whether or not an object has a certain property.

C and Fortran names for

some MPI functions (that were defined during the MPI-1 process)

violate these rules in several cases. The most common exceptions are the omission of the **Class** name from the routine and the omission of the **Action** where one can be inferred.

MPI identifiers are limited to 30 characters (31 with the profiling interface). This is done to avoid exceeding the limit on some compilation systems.

## Procedure Specification

MPI procedures are specified using a language-independent notation. The arguments of procedure calls are marked as `IN`, `OUT` or `INOUT`. The meanings of these are:

- `IN`: the call may use the input value but does not update the argument,

- `OUT`: the call may update the argument but does not use its input value,

- `INOUT`: the call may both use and update the argument.

There is one special case — if an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked

`INOUT` or

`OUT`. It is marked this way even though the handle itself is not modified — we use the

`INOUT` or

`OUT` attribute to denote that what the handle *references* is updated. Thus, in C++, `IN` arguments are

usually

either references or pointers to `const` objects.

> [!tip] Rationale

> The definition of MPI tries to avoid, to the largest possible extent, the use of `INOUT` arguments, because such use is error-prone, especially for scalar arguments.

MPI’s use of `IN`, `OUT` and `INOUT` is intended to indicate to the user how an argument is

to be used, but

does not provide a rigorous classification that can be translated directly into

all

language bindings (e.g., `INTENT` in Fortran 90 bindings or `const` in C bindings). For instance, the “constant” MPI_BOTTOM can usually be passed to `OUT` buffer arguments. Similarly, MPI_STATUS_IGNORE can be passed as the `OUT` status argument.

A common occurrence for MPI functions is an argument that is used as

`IN`

by some processes and `OUT` by other processes. Such an argument is, syntactically, an `INOUT` argument and is marked as such, although, semantically, it is not used in one call both for input and for output on a single process.

Another frequent situation arises when an argument value is needed only by a subset of the processes. When an argument is not significant at a process then an arbitrary value can be passed as an argument.

Unless specified otherwise, an argument of type `OUT` or type `INOUT` cannot be aliased with any other argument passed to an MPI procedure. An example of argument aliasing in C appears below. If we define a C procedure like this,

    void copyIntBuffer( int *pin, int *pout, int len )
    {   int i;
        for (i=0; i<len; ++i) *pout++ = *pin++;
    }

then a call to it in the following code fragment has aliased arguments.

    int a[10];
    copyIntBuffer( a, a+3, 7);

Although the C language allows this, such usage of MPI procedures is forbidden unless otherwise specified. Note that Fortran prohibits aliasing of arguments.

All MPI functions are first specified in the language-independent notation. Immediately below this, the

ISO C

version of the function is shown followed by a version of the same function in Fortran and then the C++ binding.

Fortran in this document refers to Fortran 90; see Section [[terms#Language Binding|Language Binding]] .

## Semantic Terms



When discussing MPI procedures the following semantic terms are used.

**nonblocking**  
A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e. a call to [[MPI_TEST]] will return `flag` = true. A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = true. This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is

**freed**, and becomes **inactive** if it was persistent.

A **communication completes** when all participating operations complete.

**blocking**  
A procedure is blocking if return from the procedure indicates the user is allowed to reuse resources specified in the call.

**local**  
A procedure is local if completion of the procedure depends only on the local executing process.

**non-local**  
A procedure is non-local if completion of the operation may require the execution of some MPI procedure on another process. Such an operation may require communication occurring with another user process.

**collective**  
A procedure is collective if all processes in a process group need to invoke the procedure. A collective call may or may not be synchronizing.

Collective calls over the same communicator

must be executed in the same order by all members of the process group.

**predefined**  
A predefined datatype is a datatype with a predefined (constant) name (such as MPI_INT, MPI_FLOAT_INT, or MPI_UB) or a datatype constructed with [[MPI_TYPE_CREATE_F90_INTEGER]] , [[MPI_TYPE_CREATE_F90_REAL]] , or [[MPI_TYPE_CREATE_F90_COMPLEX]] . The former are **named** whereas the latter are **unnamed**.

**derived**  
A derived datatype is any datatype that is not predefined.

**portable**  
A datatype is portable, if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[MPI_TYPE_CONTIGUOUS]] , [[MPI_TYPE_VECTOR]] , [[MPI_TYPE_INDEXED]] ,

[[MPI_TYPE_CREATE_INDEXED_BLOCK]] ,

[[MPI_TYPE_CREATE_SUBARRAY]] , [[MPI_TYPE_DUP]] , and [[MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[MPI_TYPE_CREATE_HINDEXED]] , [[MPI_TYPE_CREATE_HVECTOR]] or [[MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.

**equivalent**  
Two datatypes are equivalent if they appear to have been created with the same sequence of calls (and arguments) and thus have the same typemap. Two equivalent datatypes do not necessarily have the same cached attributes or the same names.

## Data Types

### Opaque Objects



MPI manages **system memory** that is used for buffering messages and for storing internal representations of various MPI objects such as groups, communicators, datatypes, etc. This memory is not directly accessible to the user, and objects stored there are **opaque**: their size and shape is not visible to the user. Opaque objects are accessed via **handles**, which exist in user space. MPI procedures that operate on opaque objects are passed handle arguments to access these objects. In addition to their use by MPI calls for object access, handles can participate in assignments and comparisons.

In Fortran, all handles have type `INTEGER`. In C and C++, a different handle type is defined for each category of objects. In addition, handles themselves are distinct objects in C++. The C and C++ types must support the use of the assignment and equality operators.

> [!warning] Advice to implementors

> In Fortran, the handle can be an index into a table of opaque objects in a system table; in C it can be such an index or a pointer to the object. C++ handles can simply “wrap up” a table index or pointer.

Opaque objects are allocated and deallocated by calls that are specific to each object type. These are listed in the sections where the objects are described. The calls accept a handle argument of matching type. In an allocate call this is an `OUT` argument that returns a valid reference to the object. In a call to deallocate this is an `INOUT` argument which returns with an “invalid handle” value. MPI provides an “invalid handle” constant for each object type. Comparisons to this constant are used to test for validity of the handle.

A call to a deallocate routine invalidates the handle and marks the object for deallocation. The object is not accessible to the user after the call. However, MPI need not deallocate the object immediately. Any operation pending (at the time of the deallocate) that involves this object will complete normally; the object will be deallocated afterwards.

An opaque object and its handle are significant only at the process where the object was created and cannot be transferred to another process.

MPI provides certain predefined opaque objects and predefined, static handles to these objects. The user must not free such objects. In C++, this is enforced by declaring the handles to these predefined objects to be `static const`.

> [!tip] Rationale

> This design hides the internal representation used for MPI data structures, thus allowing similar calls in C, C++, and Fortran. It also avoids conflicts with the typing rules in these languages, and easily allows future extensions of functionality. The mechanism for opaque objects used here loosely follows the POSIX Fortran binding standard.
>
> The explicit separation of handles in user space and objects in system space allows space-reclaiming and deallocation calls to be made at appropriate points in the user program. If the opaque objects were in user space, one would have to be very careful not to go out of scope before any pending operation requiring that object completed. The specified design allows an object to be marked for deallocation, the user program can then go out of scope, and the object itself still persists until any pending operations are complete.
>
> The requirement that handles support assignment/comparison is made since such operations are common. This restricts the domain of possible implementations. The alternative would have been to allow handles to have been an arbitrary, opaque type. This would force the introduction of routines to do assignment and comparison, adding complexity, and was therefore ruled out.

> [!note] Advice to users

> A user may accidently create a dangling reference by assigning to a handle the value of another handle, and then deallocating the object associated with these handles. Conversely, if a handle variable is deallocated before the associated object is freed, then the object becomes inaccessible (this may occur, for example, if the handle is a local variable within a subroutine, and the subroutine is exited before the associated object is deallocated). It is the user’s responsibility to avoid adding or deleting references to opaque objects, except as a result of MPI calls that allocate or deallocate such objects.

> [!warning] Advice to implementors

> The intended semantics of opaque objects is that opaque objects are separate from one another; each call to allocate such an object copies all the information required for the object. Implementations may avoid excessive copying by substituting referencing for copying. For example, a derived datatype may contain references to its components, rather then copies of its components; a call to [[MPI_COMM_GROUP]] may return a reference to the group associated with the communicator, rather than a copy of this group. In such cases, the implementation must maintain reference counts, and allocate and deallocate objects in such a way that the visible effect is as if the objects were copied.

### Array Arguments

An MPI call may need an argument that is an array of opaque objects, or an array of handles. The array-of-handles is a regular array with entries that are handles to objects of the same type in consecutive locations in the array. Whenever such an array is used, an additional `len` argument is required to indicate the number of valid entries (unless this number can be derived otherwise). The valid entries are at the beginning of the array; `len` indicates how many of them there are, and need not be the size of the entire array. The same approach is followed for other array arguments. In some cases `NULL` handles are considered valid entries. When a `NULL` argument is desired for an array of statuses, one uses MPI_STATUSES_IGNORE.

### State

MPI procedures use at various places arguments with *state* types. The values of such a data type are all identified by names, and no operation is defined on them.

For example, the `MPI_TYPE_CREATE_SUBARRAY` routine has a state argument `order` with values MPI_ORDER_C and MPI_ORDER_FORTRAN.

### Named Constants



MPI procedures sometimes assign a special meaning to a special value of a basic type argument; e.g., `tag` is an integer-valued argument of point-to-point communication operations, with a special wild-card value, MPI_ANY_TAG. Such arguments will have a range of regular values, which is a proper subrange of the range of values of the corresponding basic type; special values (such as MPI_ANY_TAG) will be outside the regular range.

The range of regular values, such as `tag`, can be queried using environmental inquiry functions (Chapter 7 of the MPI-1 document). The range of other values, such as `source`, depends on values given by other MPI routines (in the case of `source` it is the communicator size).

MPI also provides predefined named constant handles, such as MPI_COMM_WORLD.

All named constants, with the exceptions noted below for Fortran, can be used in initialization expressions or assignments. These constants do not change values during execution. Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ( [[MPI_INIT]] ) and MPI completion ( [[MPI_FINALIZE]] ).

The constants that cannot be used in initialization expressions or assignments in Fortran are:

      MPI_BOTTOM
      MPI_STATUS_IGNORE
      MPI_STATUSES_IGNORE
      MPI_ERRCODES_IGNORE
      MPI_IN_PLACE
      MPI_ARGV_NULL
      MPI_ARGVS_NULL

> [!warning] Advice to implementors

> In Fortran the implementation of these special constants may require the use of language constructs that are outside the Fortran standard. Using special values for the constants (e.g., by defining them through `parameter` statements) is not possible because an implementation cannot distinguish these values from legal data. Typically, these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, this address can be extracted by some mechanism outside the Fortran standard (e.g., by Fortran extensions or by implementing the function in C).

### Choice

MPI functions sometimes use arguments with a *choice* (or union) data type. Distinct calls to the same routine may pass by reference actual arguments of different types. The mechanism for providing such arguments will differ from language to language. For Fortran, the document uses <span class="sans-serif">$`<`$type$`>`$</span> to represent a choice variable; for C and C++, we use <span class="sans-serif">void \*</span>.

### Addresses

Some MPI procedures use *address* arguments that represent an absolute address in the calling program. The datatype of such an argument

is `MPI_Aint` in C, `MPI::Aint` in C++ and `INTEGER (KIND=MPI_ADDRESS_KIND)` in Fortran. There is the MPI constant MPI_BOTTOM to indicate

the start of the address range.

### File Offsets

For I/O there is a need to give the size, displacement, and offset into a file. These quantities can easily be larger than 32 bits which can be the default size of a Fortran integer. To overcome this, these quantities are declared to be `INTEGER (KIND=MPI_OFFSET_KIND)` in Fortran.

In C one uses `MPI_Offset` whereas in C++ one uses `MPI::Offset`.

## Language Binding



This section defines the rules for MPI language binding in general and for Fortran,

ISO C,

and C++, in particular.

(Note that ANSI C has been replaced by ISO C.)

Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.

MPI bindings are for Fortran 90, though they are designed to be usable in Fortran 77 environments.

Since the word `PARAMETER` is a keyword in the Fortran language, we use the word “argument” to denote the arguments to a subroutine. These are normally referred to as parameters in C and C++, however, we expect that C and C++ programmers will understand the word “argument” (which has no specific meaning in C/C++), thus allowing us to avoid unnecessary confusion for Fortran programmers.

Since Fortran is case insensitive, linkers may use either lower case or upper case when resolving Fortran names. Users of case sensitive languages should avoid the “mpi\_” and “pmpi\_” prefixes.

### Deprecated Names and Functions



A number of chapters refer to deprecated or replaced MPI-1 constructs. These are constructs that continue to be part of the MPI standard,

as documented in Chapter [[deprecated#Deprecated Functions|Deprecated Functions]] ,

but that users are recommended not to continue using, since

better solutions were provided with MPI-2.

For example, the Fortran binding for MPI-1 functions that have address arguments uses `INTEGER`. This is not consistent with the C binding, and causes problems on machines with 32 bit `INTEGER`s and 64 bit addresses. In MPI-2, these functions

were given new names with

new bindings for the address arguments. The use of the old functions is deprecated. For consistency, here and

in

a few other cases, new C functions are also provided, even though the new functions are equivalent to the old functions. The old names are deprecated. Another example is provided by the MPI-1 predefined datatypes MPI_UB and MPI_LB. They are deprecated, since their use is awkward and error-prone.

The

MPI-2 function [[MPI_TYPE_CREATE_RESIZED]] provides a more convenient mechanism to achieve the same effect.

Table [[terms#Deprecated Names and Functions|Deprecated Names and Functions]] shows

a list of all of the deprecated constructs. Note that the constants MPI_LB and MPI_UB are replaced by the function [[MPI_TYPE_CREATE_RESIZED]] ; this is because their

principal

use was as input datatypes to [[MPI_TYPE_STRUCT]] to create resized datatypes. Also note that some C typedefs and Fortran subroutine names are included in this list; they are the types of callback functions.

| Deprecated                    | MPI-2 Replacement                     |
|:------------------------------|:--------------------------------------|
| [[MPI_ADDRESS]]           | [[MPI_GET_ADDRESS]]               |
| [[MPI_TYPE_HINDEXED]]     | [[MPI_TYPE_CREATE_HINDEXED]]      |
| [[MPI_TYPE_HVECTOR]]      | [[MPI_TYPE_CREATE_HVECTOR]]       |
| [[MPI_TYPE_STRUCT]]       | [[MPI_TYPE_CREATE_STRUCT]]        |
| [[MPI_TYPE_EXTENT]]       | [[MPI_TYPE_GET_EXTENT]]           |
| [[MPI_TYPE_UB]]           | [[MPI_TYPE_GET_EXTENT]]           |
| [[MPI_TYPE_LB]]           | [[MPI_TYPE_GET_EXTENT]]           |
| [[MPI_LB]]                | [[MPI_TYPE_CREATE_RESIZED]]       |
| [[MPI_UB]]                | [[MPI_TYPE_CREATE_RESIZED]]       |
| [[MPI_ERRHANDLER_CREATE]] | [[MPI_COMM_CREATE_ERRHANDLER]]    |
| [[MPI_ERRHANDLER_GET]]    | [[MPI_COMM_GET_ERRHANDLER]]       |
| [[MPI_ERRHANDLER_SET]]    | [[MPI_COMM_SET_ERRHANDLER]]       |
| [[MPI_Handler_function]]  | [[MPI_Comm_errhandler_fn]]        |
| [[MPI_KEYVAL_CREATE]]     | [[MPI_COMM_CREATE_KEYVAL]]        |
| [[MPI_KEYVAL_FREE]]       | [[MPI_COMM_FREE_KEYVAL]]          |
| [[MPI_DUP_FN]]            | [[MPI_COMM_DUP_FN]]               |
| [[MPI_NULL_COPY_FN]]      | [[MPI_COMM_NULL_COPY_FN]]         |
| [[MPI_NULL_DELETE_FN]]    | [[MPI_COMM_NULL_DELETE_FN]]       |
| [[MPI_Copy_function]]     | [[MPI_Comm_copy_attr_function]]   |
| [[COPY_FUNCTION]]         | [[COMM_COPY_ATTR_FN]]             |
| [[MPI_Delete_function]]   | [[MPI_Comm_delete_attr_function]] |
| [[DELETE_FUNCTION]]       | [[COMM_DELETE_ATTR_FN]]           |
| [[MPI_ATTR_DELETE]]       | [[MPI_COMM_DELETE_ATTR]]          |
| [[MPI_ATTR_GET]]          | [[MPI_COMM_GET_ATTR]]             |
| [[MPI_ATTR_PUT]]          | [[MPI_COMM_SET_ATTR]]             |

Deprecated constructs



### Fortran Binding Issues

Originally,

MPI-1.1

provided bindings for Fortran 77.

These bindings are retained,

but they are now interpreted in the context of the Fortran 90 standard. MPI can still be used with most Fortran 77 compilers, as noted below.

When the term Fortran is used it means Fortran 90.

All MPI names have an `MPI_` prefix, and all characters are capitals. Programs must not declare variables, parameters, or functions with names beginning with the prefix `MPI_`. To avoid conflicting with the profiling interface, programs should also avoid functions with the prefix `PMPI_`. This is mandated to avoid possible name collisions.

All MPI Fortran subroutines have a return code in the last argument. A few MPI operations which are functions do not have the return code argument. The return code value for successful completion is MPI_SUCCESS. Other error codes are implementation dependent; see the error codes in

Chapter [[inquiry#MPI Environmental Management|MPI Environmental Management]] and Annex [[appLang-Const#Language Bindings Summary|Language Bindings Summary]] .

Constants representing the maximum length of a string are one smaller in Fortran than in C and C++ as discussed in Section [[binding#Constants|Constants]] .

Handles are represented in Fortran as `INTEGER`s. Binary-valued variables are of type `LOGICAL`.

Array arguments are indexed from one.

The MPI Fortran binding is inconsistent with the Fortran 90 standard in several respects. These

inconsistencies, such as register optimization problems,

have implications for user codes that are discussed in detail in Section [[binding#A Problem with Register Optimization|A Problem with Register Optimization]] . They are also inconsistent with Fortran 77.

- An MPI subroutine with a choice argument may be called with different argument types.

- An MPI subroutine with an assumed-size dummy argument may be passed an actual scalar argument.

- Many MPI routines assume that actual arguments are passed by address and that arguments are not copied on entrance to or exit from the subroutine.

- An MPI implementation may read or modify user data (e.g., communication buffers used by nonblocking communications) concurrently with a user program executing outside MPI calls.

- Several named “constants,” such as MPI_BOTTOM, MPI_STATUS_IGNORE, and MPI_ERRCODES_IGNORE, are not ordinary Fortran constants and require a special implementation. See Section [[terms#Named Constants|Named Constants]] on page [[terms#Named Constants|Named Constants]] for more information.

Additionally, MPI is inconsistent with Fortran 77 in a number of ways, as noted below.

- MPI identifiers exceed 6 characters.

- MPI identifiers may contain underscores after the first character.

- MPI requires an include file, `mpif.h`. On systems that do not support include files, the implementation should specify the values of named constants.

- Many routines in

  MPI

  have KIND-parameterized integers (e.g., MPI_ADDRESS_KIND and MPI_OFFSET_KIND) that hold address information. On systems that do not support Fortran 90-style parameterized types, `INTEGER*8` or `INTEGER` should be used instead.

- The memory allocation routine [[MPI_ALLOC_MEM]]

  cannot

  be usefully used in Fortran without a language extension that allows the allocated memory to be associated with a Fortran variable.

### C Binding Issues

We use the

ISO C

declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare variables or functions with names beginning with the prefix `MPI_`. To support the profiling interface, programs should not declare functions with names beginning with the prefix `PMPI_`.

The definition of named constants, function prototypes, and type definitions must be supplied in an include file <span class="sans-serif">mpi.h</span>.

Almost all C functions return an error code. The successful return code will be MPI_SUCCESS, but failure return codes are implementation dependent.

Type declarations are provided for handles to each category of opaque objects.

Array arguments are indexed from zero.

Logical flags are integers with value 0 meaning “false” and a non-zero value meaning “true.”

Choice arguments are pointers of type `void *`.

Address arguments are of MPI defined type

`MPI_Aint`.

File displacements are of type `MPI_Offset`. MPI_Aint is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.

### C++ Binding Issues



There are places in the standard that give rules for C and not for C++. In these cases, the C rule should be applied to the C++ case, as appropriate. In particular, the values of constants given in the text are the ones for C and Fortran. A cross index of these with the C++ names is given in Annex [[appLang-Const#Language Bindings Summary|Language Bindings Summary]] .

We use the

ISO C++

declaration format. All MPI names are declared within the scope of a namespace called `MPI` and therefore are referenced with an `MPI::` prefix. Defined constants are in all capital letters, and class names, defined types, and functions have only their first letter capitalized. Programs must not declare variables or functions in the `MPI` namespace. This is mandated to avoid possible name collisions.

The definition of named constants, function prototypes, and type definitions must be supplied in an include file <span class="sans-serif">mpi.h</span>.

> [!warning] Advice to implementors

> The file <span class="sans-serif">mpi.h</span> may contain both the C and C++ definitions.
>
> Usually one can simply use the defined value (generally `__cplusplus`, but not required) to see if one is using C++ to protect the C++ definitions. It is possible that a C compiler will require that the source protected this way be legal C code. In this case, all the C++ definitions can be placed in a different include file and the “`#include`” directive can be used to include the necessary C++ definitions in the <span class="sans-serif">mpi.h</span> file.

C++ functions that create objects or return information usually place the object or information in the return value. Since the language neutral prototypes of MPI functions include the C++ return value as an OUT parameter, semantic descriptions of MPI functions refer to the C++ return value by that parameter

name.

The remaining C++ functions return `void`.

In some circumstances, MPI permits users to indicate that they do not want a return value. For example, the user may indicate that the status is not filled in. Unlike C and Fortran where this is achieved through a special input value, in C++ this is done by having two bindings where one has the optional argument and one does not.

C++ functions do not return error codes. If the default error handler has been set to MPI::ERRORS_THROW_EXCEPTIONS, the C++ exception mechanism is used to signal an error by throwing an

`MPI::Exception`

object.

It should be noted that the default error handler (i.e., MPI::ERRORS_ARE_FATAL) on a given type has not changed. User error handlers are also permitted. MPI::ERRORS_RETURN simply returns control to the calling function; there is no provision for the user to retrieve the error code.

User callback functions that return integer error codes should not throw exceptions; the returned error will be handled by the MPI implementation by invoking the appropriate error handler.

> [!note] Advice to users

> C++ programmers that want to handle MPI errors on their own should use the MPI::ERRORS_THROW_EXCEPTIONS error handler, rather than MPI::ERRORS_RETURN, that is used for that purpose in C. Care should be taken using exceptions in mixed language situations.

Opaque object handles must be objects in themselves, and have the assignment and equality operators overridden to perform semantically like their C and Fortran counterparts.

Array arguments are indexed from zero.

Logical flags are of type `bool`.

Choice arguments are pointers of type `void *`.

Address arguments are of MPI-defined integer type `MPI::Aint`, defined to be an integer of the size needed to hold any valid address on the target architecture.

Analogously, `MPI::Offset` is an integer to hold file offsets.

Most MPI functions are methods of MPI C++ classes. MPI class names are generated from the language neutral MPI types by dropping the `MPI_` prefix and scoping the type within the `MPI` namespace. For example, `MPI_DATATYPE` becomes `MPI::Datatype`.

The names of

MPI

functions generally follow the naming rules given. In some circumstances, the

MPI function is related to a function defined already for MPI-1

with a name that does not follow the naming conventions. In this circumstance, the language neutral name is in analogy to the

MPI

name even though this gives an MPI-2 name that violates the naming conventions. The C and Fortran names are the same as the language neutral name in this case. However, the C++

names

do reflect the naming rules and can differ from the C and Fortran names. Thus, the analogous name in C++ to the

MPI name may be

different than the language neutral name. This results in the C++ name differing from the language neutral name. An example of this is the language neutral name of [[MPI_FINALIZED]] and a C++ name of `MPI::Is_finalized` .

In C++, function `typedef`s are made publicly within appropriate classes. However, these declarations then become somewhat cumbersome, as with the following:

would look like the following:

    namespace MPI {
      class Request {
        // ...
      };

      class Grequest : public MPI::Request {
        // ...
        typedef Query_function(void* extra_state, MPI::Status& status);
      };
    };

Rather than including this scaffolding when declaring C++ `typedef`s, we use an abbreviated form. In particular, we explicitly indicate the class and namespace scope for the `typedef` of the function. Thus, the example above is shown in the text as follows:

    typedef int MPI::Grequest::Query_function(void* extra_state,
                                              MPI::Status& status)

The C++ bindings presented in Annex [[appLang-C++#C++ Bindings|C++ Bindings]] and throughout this document were generated by applying a simple set of name generation rules to the MPI function specifications. While these guidelines may be sufficient in most cases, they may not be suitable for all situations. In cases of ambiguity or where a specific semantic statement is desired, these guidelines may be superseded as the situation dictates.

1.  All functions, types, and constants are declared within the scope of a `namespace` called `MPI`.

2.  Arrays of MPI handles are always left in the argument list (whether they are IN or OUT arguments).

3.  If the argument list of an MPI function contains a scalar IN handle, and it makes sense to define the function as a method of the object corresponding to that handle, the function is made a member function of the corresponding MPI class.

    The member functions are named according to the corresponding MPI function name, but without the “`MPI_`” prefix and without the object name prefix (if applicable). In addition:

    1.  The scalar IN handle is dropped from the argument list, and `this` corresponds to the dropped argument.

    2.  The function is declared `const`.

4.  MPI functions are made into class functions (static) when they belong on a class but do not have a unique scalar IN or INOUT parameter of that class.

5.  If the argument list contains a single OUT argument that is not of type `MPI_STATUS` (or an array), that argument is dropped from the list and the function returns that value.

    

    The C++ binding for [[MPI_COMM_SIZE]] is `int MPI::Comm::Get_size(void) const` .

    

6.  If there are multiple OUT arguments in the argument list, one is chosen as the return value and is removed from the list.

7.  If the argument list does not contain any OUT arguments, the function returns `void`.

    

    The C++ binding for [[MPI_REQUEST_FREE]] is `void MPI::Request::Free(void)`

    

8.  MPI functions to which the above rules do not apply are not members of any class, but are defined in the `MPI` namespace.

    

    The C++ binding for [[MPI_BUFFER_ATTACH]] is `void MPI::Attach_buffer(void\*buffer, intsize)` .

    

9.  All class names, defined types, and function names have only their first letter capitalized. Defined constants are in all capital letters.

10. Any IN pointer, reference, or array argument must be declared `const`.

11. Handles are passed by reference.

12. Array arguments are denoted with square brackets (`[]`), not pointers, as this is more semantically precise.

### Functions and Macros



An implementation is allowed to implement [[MPI_WTIME]] , [[MPI_WTICK]] , [[PMPI_WTIME]] , [[PMPI_WTICK]] , and the handle-conversion functions (`MPI_Group_f2c`, etc.) in Section [[binding#Transfer of Handles|Transfer of Handles]] , and no others, as macros in C.

> [!warning] Advice to implementors

> Implementors should document which routines are implemented as macros.

> [!note] Advice to users

> If these routines are implemented as macros, they will not work with the MPI profiling interface.

## Processes

An MPI program consists of autonomous processes, executing their own code, in

an

MIMD style. The codes executed by each process need not be identical. The processes communicate via calls to MPI communication primitives. Typically, each process executes in its own address space, although shared-memory implementations of MPI are possible.

This document specifies the behavior of a parallel program assuming that only MPI calls are used. The interaction of an MPI program with other possible means of communication, I/O, and process management is not specified. Unless otherwise stated in the specification of the standard, MPI places no requirements on the result of its interaction with external mechanisms that provide similar or equivalent functionality. This includes, but is not limited to, interactions with external mechanisms for process control, shared and remote memory access, file system access and control, interprocess communication, process signaling, and terminal I/O. High quality implementations should strive to make the results of such interactions intuitive to users, and attempt to document restrictions where deemed necessary.

> [!warning] Advice to implementors

> Implementations that support such additional mechanisms for functionality supported within MPI are expected to document how these interact with MPI.

The interaction of MPI and threads is defined in Section [[ei#MPI and Threads|MPI and Threads]] .

## Error Handling

MPI provides the user with reliable message transmission. A message sent is always received correctly, and the user does not need to check for transmission errors, time-outs, or other error conditions. In other words, MPI does not provide mechanisms for dealing with failures in the communication system. If the MPI implementation is built on an unreliable underlying mechanism, then it is the job of the implementor of the MPI subsystem to insulate the user from this unreliability, or to reflect unrecoverable errors as failures. Whenever possible, such failures will be reflected as errors in the relevant communication call. Similarly, MPI itself provides no mechanisms for handling processor failures.

Of course, MPI programs may still be erroneous. A **program error** can occur when an MPI call is made with an incorrect argument (non-existing destination in a send operation, buffer too small in a receive operation, etc.). This type of error would occur in any implementation. In addition, a **resource error** may occur when a program exceeds the amount of available system resources (number of pending messages, system buffers, etc.). The occurrence of this type of error depends on the amount of available resources in the system and the resource allocation mechanism used; this may differ from system to system. A high-quality implementation will provide generous limits on the important resources so as to alleviate the portability problem this represents.

In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort,

except for file operations.

However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described

in Section [[inquiry#Error Handling|Error Handling]] .

The return values of C++ functions are not error codes.

If the default error handler has been set to MPI::ERRORS_THROW_EXCEPTIONS, the C++ exception mechanism is used to signal an error by throwing an

`MPI::Exception`

object.

See also Section [[binding#Exceptions|Exceptions]] on page [[binding#Exceptions|Exceptions]] .

Several factors limit the ability of MPI calls to return with meaningful error codes when an error occurs. MPI may not be able to detect some errors; other errors may be too expensive to detect in normal execution mode; finally some errors may be “catastrophic” and may prevent MPI from returning control to the caller in a consistent state.

Another subtle issue arises because of the nature of asynchronous communications: MPI calls may initiate operations that continue asynchronously after the call returned. Thus, the operation may return with a code indicating successful completion, yet later cause an error exception to be raised. If there is a subsequent call that relates to the same operation (e.g., a call that verifies that an asynchronous operation has completed) then the error argument associated with this call will be used to indicate the nature of the error. In a few cases, the error may occur after all calls that relate to the operation have completed, so that no error value can be used to indicate the nature of the error (e.g., an error on the receiver in a send with the ready mode). Such an error must be treated as fatal, since information cannot be returned for the user to recover from it.

This document does not specify the state of a computation after an erroneous MPI call has occurred. The desired behavior is that a relevant error code be returned, and the effect of the error be localized to the greatest possible extent. E.g., it is highly desirable that an erroneous receive call will not cause any part of the receiver’s memory to be overwritten, beyond the area specified for receiving the message.

Implementations may go beyond this document in supporting in a meaningful manner MPI calls that are defined here to be erroneous. For example, MPI specifies strict type matching rules between matching send and receive operations: it is erroneous to send a floating point variable and receive an integer. Implementations may go beyond these type matching rules, and provide automatic type conversion in such situations. It will be helpful to generate warnings for such non-conforming behavior.

MPI

defines a way for users to create new error codes as defined in Section [[inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] .

## Implementation Issues

There are a number of areas where an MPI implementation may interact with the operating environment and system. While MPI does not mandate that any services (such as signal handling) be provided, it does strongly suggest the behavior to be provided if those services are available. This is an important point in achieving portability across platforms that provide the same set of services.

### Independence of Basic Runtime Routines

MPI programs require that library routines that are part of the

basic language environment (such as `write` in Fortran and `printf` and `malloc` in

ISO C)

and are executed after [[MPI_INIT]] and before [[MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.

Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an

ISO C

environment regardless of the size of MPI_COMM_WORLD (assuming that `printf` is available at the executing nodes).

    int rank;
    MPI_Init((void *)0, (void *)0);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    if (rank == 0) printf("Starting program\n");
    MPI_Finalize();

The corresponding Fortran and C++ programs are also expected to complete.

An example of what is *not* required is any particular ordering of the action of these routines when called by several tasks. For example, MPI makes neither requirements nor recommendations for the output from the following program (again assuming that I/O is available at the executing nodes).

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    printf("Output from task rank %d\n", rank);

In addition, calls that fail because of resource exhaustion or other error are not considered a violation of the requirements here (however, they are required to complete, just not to complete successfully).

### Interaction with Signals

MPI does not specify the interaction of processes with signals and does not require that MPI be signal safe. The implementation may reserve some signals for its own use. It is required that the implementation document which signals it uses, and it is strongly recommended that it not use `SIGALRM`, `SIGFPE`, or `SIGIO`. Implementations may also prohibit the use of MPI calls from within signal handlers.

In multithreaded environments, users can avoid conflicts between signals and the MPI library by catching signals only on threads that do not execute MPI calls. High quality single-threaded implementations will be signal safe: an MPI call suspended by a signal will resume and complete normally after the signal is handled.

## Examples

The examples in this document are for illustration purposes only. They are not intended to specify the standard. Furthermore, the examples have not been carefully checked or verified.
