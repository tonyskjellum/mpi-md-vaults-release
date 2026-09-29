3

# Miscellany



This chapter contains topics that do not fit conveniently into other chapters.

## Portable MPI Process Startup

A number of implementations of MPI-1 provide a startup command for MPI programs that is of the form

        mpirun <mpirun arguments> <program> <program arguments>

Separating the command to start the program from the program itself provides flexibility, particularly for network and heterogeneous implementations. For example, the startup script need not run on one of the machines that will be executing the MPI program itself.

Having a standard startup mechanism also extends the portability of MPI programs one step further, to the command lines and scripts that manage them. For example, a validation suite script that runs hundreds of programs can be a portable script if it is written using such a standard starup mechanism.

In order that the “standard” command not be confused with existing practice, which is not standard and not portable among implementations, instead of `mpirun` MPI specifies `mpiexec`.

While a standardized startup mechanism improves the usability of MPI, the range of environments is so diverse (e.g., there may not even be a command line interface) that MPI cannot mandate such a mechanism. Instead, MPI specifies an `mpiexec` startup command and recommends but does not require it, as advice to implementors. However, if an implementation does provide a command called `mpiexec`, it must be of the form described below.

It is suggested that

        mpiexec -n <numprocs> <program>

be at least one way to start `<program>` with an initial `MPI_COMM_WORLD` whose group contains `<numprocs>` processes. Other arguments to `mpiexec` may be implementation-dependent.

This is advice to implementors, rather than a required part of MPI-2. It is not suggested that this be the only way to

start MPI programs. If an implementation does provide a command called `mpiexec`, however, it must be of the form described here.

> [!warning] Advice to implementors

> Implementors, if they do provide a special startup command for MPI programs, are advised to give it the following form. The syntax is chosen in order that `mpiexec` be able to be viewed as a command-line version of [[MPI_COMM_SPAWN]] (See Section [[dynamic#Reserved Keys|Reserved Keys]] ).
>
> Analogous to [[MPI_COMM_SPAWN]] , we have
>
>         mpiexec -n    <maxprocs>
>                -soft  <        >
>                -host  <        >
>                -arch  <        >
>                -wdir  <        >
>                -path  <        >
>                -file  <        >
>                 ...
>                <command line>
>
> for the case where a single command line for the application program and its arguments will suffice. See Section [[dynamic#Reserved Keys|Reserved Keys]] for the meanings of these arguments. For the case corresponding to [[MPI_COMM_SPAWN_MULTIPLE]] there are two possible formats:
>
> Form A:
>
>         mpiexec { <above arguments> } : { ... } : { ... } : ... : { ... }
>
> As with [[MPI_COMM_SPAWN]] , all the arguments are optional. (Even the `-n x ` argument is optional; the default is implementation dependent. It might be `1`, it might be taken from an environment variable, or it might be specified at compile time.) The names and meanings of the arguments are taken from the keys in the `info` argument to [[MPI_COMM_SPAWN]] . There may be other, implementation-dependent arguments as well.
>
> Note that Form A, though convenient to type, prevents colons from being program arguments. Therefore an alternate, file-based form is allowed:
>
> Form B:
>
>         mpiexec -configfile <filename>
>
> where the lines of $`<`$`filename`$`>`$ are of the form separated by the colons in Form A. Lines beginning with ‘`#`’ are comments, and lines may be continued by terminating the partial line with ‘`‘`\
> ’.
>
> 
>
> Start 16 instances of `myprog` on the current or default machine:
>
>         mpiexec -n 16 myprog
>
> 
>
> 
>
> Start 10 processes on the machine called `ferrari`:
>
>         mpiexec -n 10 -host ferrari myprog
>
> 
>
> 
>
> Start three copies of the same program with different command-line arguments:
>
>         mpiexec myprog infile1 : myprog infile2 : myprog infile3
>
> 
>
> 
>
> Start the `ocean` program on five Suns and the `atmos` program on 10 RS/6000’s:
>
>         mpiexec -n 5 -arch sun ocean : -n 10 -arch rs6000 atmos
>
> It is assumed that the implementation in this case has a method for choosing hosts of the appropriate type. Their ranks are in the order specified.
>
> 
>
> 
>
> Start the `ocean` program on five Suns and the `atmos` program on 10 RS/6000’s (Form B):
>
>         mpiexec -configfile myfile
>
> where `myfile` contains
>
>         -n 5  -arch sun    ocean 
>         -n 10 -arch rs6000 atmos
>
> 

## Passing `NULL` to `MPI_Init`



In MPI-1.1, it is explicitly stated that an implementation is allowed to require that the arguments `argc` and `argv` passed by an application to [[MPI_INIT]] in C be the same arguments passed into the application as the arguments to `main`. In MPI-2 implementations are not allowed to impose this requirement. Conforming implementations of MPI are required to allow applications to pass `NULL` for both the `argc` and `argv` arguments of `main`. In C++, there is an alternative binding for `MPI::Init` that does not have these arguments at all.

> [!tip] Rationale

> In some applications, libraries may be making the call to `MPI_Init`, and may not have access to `argc` and `argv` from `main`. It is anticipated that applications requiring special information about the environment or information supplied by `mpiexec` can get that information from environment variables.

## Version Number

 The values for the MPI_VERSION and MPI_SUBVERSION for an MPI-2 implementation are 2 and 0 respectively. This applies both to the values of the above constants and to the values returned by [[MPI_GET_VERSION]] .

## Datatype Constructor [[MPI_TYPE_CREATE_INDEXED_BLOCK]]

This function is the same as [[MPI_TYPE_INDEXED]] except that the blocklength is the same for all blocks.

There are many codes using indirect addressing arising from unstructured grids where the blocksize is always 1 (gather/scatter). The following convenience function allows for constant blocksize and arbitrary displacements.

![[API/MPI_TYPE_CREATE_INDEXED_BLOCK]]

## Treatment of [[MPI_Status]]

The following features add to, but do not change, the functionality associated with [[MPI_STATUS]] .

### Passing MPI_STATUS_IGNORE for Status

Every call to [[MPI_RECV]] includes a `status` argument, wherein the system can return details about the message received.

There are also a number of other MPI calls, particularly in MPI-2, where `status` is returned.

An object of type [[MPI_STATUS]] is not an MPI opaque object; its structure is declared in `mpi.h` and `mpif.h`, and it exists in the user’s program. In many cases, application programs are constructed so that it is unnecessary for them to examine the `status` fields. In these cases, it is a waste for the user to allocate a status object, and it is particularly wasteful for the MPI implementation to fill in fields in this object.

To cope with this problem, there are two predefined constants, MPI_STATUS_IGNORE and MPI_STATUSES_IGNORE, which when passed to a receive, wait, or test function, inform the implementation that the status fields are not to be filled in. Note that MPI_STATUS_IGNORE is not a special type of `MPI_STATUS` object; rather, it is a special value for the argument. In C one would expect it to be NULL, not the address of a special `MPI_STATUS`.

MPI_STATUS_IGNORE, and the array version MPI_STATUSES_IGNORE, can be used everywhere a status argument is passed to a receive, wait, or test function. MPI_STATUS_IGNORE cannot be used when status is an IN argument.

Note that in Fortran MPI_STATUS_IGNORE and MPI_STATUSES_IGNORE are objects like MPI_BOTTOM (not usable for initialization or assignment). See Section [[terms#Named Constants|Named Constants]] .

In general, this optimization can apply to all functions for which `status` or an array of `status`es is an OUT argument.

Note that this converts `status` into an INOUT argument.

The functions that can be passed MPI_STATUS_IGNORE are all the various forms of

[[MPI_RECV]] , [[MPI_TEST]] , and [[MPI_WAIT]] , as well as [[MPI_REQUEST_GET_STATUS]] .

When an array is passed, as in the [[ANY]] and [[ALL]] functions, a separate constant, MPI_STATUSES_IGNORE, is passed for the array argument.

It is possible for an MPI function to return MPI_ERR_IN_STATUS even when MPI_STATUS_IGNORE or MPI_STATUSES_IGNORE has been passed to that function.

MPI_STATUS_IGNORE and MPI_STATUSES_IGNORE are not

required to have the same values in C and Fortran.

It is not allowed to have some of the statuses in an array of statuses for `_ANY` and `_ALL` functions set to MPI_STATUS_IGNORE; one either specifies ignoring *all* of the statuses in such a call with MPI_STATUSES_IGNORE, or *none* of them by passing normal statuses in all positions in the array of statuses.

There are no C++ bindings for [[MPI_STATUS_IGNORE]] or [[MPI_STATUSES_IGNORE]] .

To allow an OUT or INOUT `MPI::Status` argument to be ignored, all MPI C++ bindings that have OUT or INOUT `MPI::Status` parameters are overloaded with a second version that omits the OUT or INOUT `MPI::Status` parameter.

The C++ bindings for [[MPI_PROBE]] are:

`void MPI::Comm::Probe(int source, int tag, MPI::Status& status) const`

`void MPI::Comm::Probe(int source, int tag) const`

### Non-destructive Test of `status`

This call is useful for accessing the information associated with a request, without freeing the request (in case the user is expected to access it later). It allows one to layer libraries more conveniently, since multiple layers of software may access the same completed request and extract from it the status information.

![[API/MPI_REQUEST_GET_STATUS]]

Sets `flag=true` if the operation is complete, and, if so, returns in status the request status. However, unlike test or wait, it does not deallocate or inactivate the request; a subsequent call to test, wait or free should be executed with that request. It sets `flag=false` if the operation is not complete.

## Error Class for Invalid Keyval

Key values for attributes are system-allocated, by `MPI\_{TYPE,COMM,WIN}\_CREATE_KEYVAL` . Only such values can be passed to the functions that use key values as input arguments. In order to signal that an erroneous key value has been passed to one of these functions, there is a new MPI error class: `MPI_ERR_KEYVAL`. It can be

returned by [[MPI_ATTR_PUT]] , [[MPI_ATTR_GET]] , [[MPI_ATTR_DELETE]] , [[MPI_KEYVAL_FREE]] ,

`MPI\_{TYPE,COMM,WIN}\_DELETE_ATTR` , `MPI\_{TYPE,COMM,WIN}\_SET_ATTR` , `MPI\_{TYPE,COMM,WIN}\_GET_ATTR` , `MPI\_{TYPE,COMM,WIN}\_FREE_KEYVAL` ,

[[MPI_COMM_DUP]] , [[MPI_COMM_DISCONNECT]] , and [[MPI_COMM_FREE]] . The last three are included

because `keyval` is an argument to the copy and delete functions for attributes.

## Committing a Committed Datatype

In MPI-1.2, the effect of calling [[MPI_TYPE_COMMIT]] with a datatype that is already committed is not specified. For MPI-2, it is specified that [[MPI_TYPE_COMMIT]] will accept a committed datatype; in this case, it is equivalent to a no-op.

## Allowing User Functions at Process Termination

There are times in which it would be convenient to have actions happen when an MPI process finishes. For example, a routine may do initializations that are useful until the MPI job (or that part of the job that being terminated in the case of dynamically created processes) is finished. This can be accomplished in MPI-2 by attaching an attribute to MPI_COMM_SELF with a callback function. When [[MPI_FINALIZE]] is called, it will first execute the equivalent of an [[MPI_COMM_FREE]] on MPI_COMM_SELF. This will cause the delete callback function to be executed on all keys

associated with [[MPI_COMM_SELF]] , in an arbitrary order. If no key has been

attached to MPI_COMM_SELF, then no callback is invoked. The “freeing” of MPI_COMM_SELF occurs before any other parts of MPI are affected. Thus, for example, calling [[MPI_FINALIZED]] will return `false` in any of these callback functions. Once done with MPI_COMM_SELF, the order and rest of the actions taken by [[MPI_FINALIZE]]

is not specified.

> [!warning] Advice to implementors

> Since attributes can be added from any supported language, the MPI implementation needs to remember the creating language so the correct callback is made.

## Determining Whether MPI Has Finished

One of the goals of MPI was to allow for layered libraries. In order for a library to do this cleanly, it needs to know if MPI is active. In MPI-1 the function [[MPI_INITIALIZED]] was provided to tell if MPI had been initialized. The problem arises in knowing if MPI has been finalized. Once MPI has been finalized it is no longer active and cannot be restarted. A library needs to be able to determine this to act accordingly. To achieve this the following function is needed:

![[API/MPI_FINALIZED]]

This routine returns `true` if [[MPI_FINALIZE]] has completed. It is legal to call [[MPI_FINALIZED]] before [[MPI_INIT]] and after [[MPI_FINALIZE]] .

> [!note] Advice to users

> MPI is “active” and it is thus safe to call MPI functions if [[MPI_INIT]] *has* completed and [[MPI_FINALIZE]] *has not* completed. If a library has no other way of knowing whether MPI is active or not, then it can use [[MPI_INITIALIZED]] and [[MPI_FINALIZED]] to determine this. For example, MPI is “active” in callback functions that are invoked during [[MPI_FINALIZE]] .

## The `Info` Object



Many of the routines in MPI-2 take an argument `info`. `info` is an opaque object with a handle of type [[MPI_Info]] in C, `MPI::Info` in C++, and `INTEGER` in Fortran. It consists of (`key`,`value`) pairs (both `key` and `value` are strings). A key may have only one value. MPI reserves several keys and requires that if an implementation uses a reserved key, it must provide the specified functionality. An implementation is not required to support these keys and may support any others not reserved by MPI.

If a function does not recognize a key, it will ignore it, unless otherwise specified. If an implementation recognizes a key but does not recognize the format of the corresponding value, the result is undefined.

Keys have an implementation-defined maximum length of

MPI_MAX_INFO_KEY, which is at least 32 and at most 255.

Values have an implementation-defined maximum length of

MPI_MAX_INFO_VAL.

In Fortran, leading and trailing spaces are stripped from both. Returned values will never be larger than these maximum lengths.

Both `key` and `value` are case sensitive.

> [!tip] Rationale

> Keys have a maximum length because the set of known keys will always be finite and known to the implementation and because there is no reason for keys to be complex. The small maximum size allows
>
> applications to declare keys of size MPI_MAX_INFO_KEY.
>
> The limitation on value sizes is so that an implementation is not forced to deal with arbitrarily long strings.

> [!note] Advice to users

> MPI_MAX_INFO_VAL might be very large, so it
>
> might not be wise to declare a string of that size.

When it is an argument to a non-blocking routine, `info` is parsed before that routine returns, so that it may be modified or freed immediately after return.

When the descriptions refer to a key or value as being a boolean, an integer, or a list, they mean the string representation of these types. An implementation may define its own rules for how info value strings are converted to other types, but to ensure portability, every implementation must support the following representations. Legal values for a boolean must include the strings “true” and “false” (all lowercase). For integers, legal values must include string representations of decimal values of integers that are within the range of a standard integer type in the program. (However it is possible that not every legal integer is a legal value for a given key.) On positive numbers, $`+`$ signs are optional. No space may appear between a $`+`$ or $`-`$ sign and the leading digit of a number. For comma separated lists, the string must contain legal elements separated by commas. Leading and trailing spaces are stripped automatically from the types of info values described above and for each element of a comma separated list. These rules apply to all info values of these types. Implementations are free to specify a different interpretation for values of other info keys.

![[API/MPI_INFO_CREATE]]

[[MPI_INFO_CREATE]] creates a new info object. The newly created object contains no key/value pairs.

![[API/MPI_INFO_SET]]

[[MPI_INFO_SET]] adds the (key,value) pair to `info`, and overrides the value if a value for the same key was previously set. `key` and `value` are null-terminated strings in C. In Fortran, leading and trailing spaces in `key` and `value` are stripped. If either `key` or `value` are larger than

the allowed maximums, the errors `MPI_ERR_INFO_KEY` or

`MPI_ERR_INFO_VALUE` are raised, respectively.

![[API/MPI_INFO_DELETE]]

[[MPI_INFO_DELETE]] deletes a (key,value) pair from `info`. If `key` is not defined in `info`, the call raises an error of class `MPI_ERR_INFO_NOKEY`.

![[API/MPI_INFO_GET]]

This function retrieves the value associated with key in a previous call to [[MPI_INFO_SET]] . If such a key exists, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `valuelen` is the number of characters available in value. If it is less than the actual size of the value, the value is truncated. In C, `valuelen` should be one less than the amount of allocated space to allow for the null terminator.

If `key` is larger than MPI_MAX_INFO_KEY,

the call is erroneous.

![[API/MPI_INFO_GET_VALUELEN]]

Retrieves the length of the `value` associated with `key`. If `key` is defined, `valuelen` is set to the length of its associated value and `flag` is set to `true`. If `key` is not defined, `valuelen` is not touched and `flag` is set to `false`. The length returned in C or C++ does not include the end-of-string character.

If `key` is larger than MPI_MAX_INFO_KEY,

the call is erroneous.

![[API/MPI_INFO_GET_NKEYS]]

[[MPI_INFO_GET_NKEYS]] returns the number of currently defined keys in `info`.

![[API/MPI_INFO_GET_NTHKEY]]

This function returns the `n`th defined key in `info`. Keys are numbered $`0 ... N-1`$ where $`N`$ is the value returned by [[MPI_INFO_GET_NKEYS]] . All keys between $`0`$ and $`N-1`$ are guaranteed to be defined. The number of a given key does not change as long as `info` is not modified with [[MPI_INFO_SET]] or [[MPI_INFO_DELETE]] .

![[API/MPI_INFO_DUP]]

[[MPI_INFO_DUP]] duplicates an existing info object, creating a new object, with the same (key,value) pairs and the same ordering of keys.

![[API/MPI_INFO_FREE]]

This function frees `info` and sets it to MPI_INFO_NULL. The value of an info argument is interpreted each time the info is passed to a routine. Changes to an info after return from a routine do not affect that interpretation.

## Memory Allocation



In some systems, message-passing and remote-memory-access (RMA) operations run faster when accessing specially allocated memory (e.g., memory that is shared by the other processes in the communicating group on an SMP). MPI provides a mechanism for allocating and freeing such special memory. The use of such memory for message passing or RMA is not mandatory, and this memory can be used without restrictions as any other dynamically allocated memory. However, implementations may restrict the use of the [[MPI_WIN_LOCK]] and `MPI_WIN_UNLOCK` functions to windows allocated in such memory (see Section [[one-side#Lock|Lock]] .)

![[API/MPI_ALLOC_MEM]]

The `info` argument can be used to provide directives that control the desired location of the allocated memory. Such a directive does not affect the semantics of the call. Valid `info` values are implementation-dependent; a null directive value of `info = MPI_INFO_NULL` is always valid.

The function `MPI_ALLOC_MEM` may return an error code of class `MPI_ERR_NO_MEM` to indicate it failed because memory is exhausted.

![[API/MPI_FREE_MEM]]

The function [[MPI_FREE_MEM]] may return an error code of class `MPI_ERR_BASE` to indicate an invalid base argument.

> [!tip] Rationale

> The C and C++ bindings of [[MPI_ALLOC_MEM]] and [[MPI_FREE_MEM]] are similar to the bindings for the `malloc` and `free` C library calls: a call to [[MPI_Alloc_mem]] should be paired with a call to [[MPI_Free_mem]] (one less level of indirection). Both arguments are declared to be of same type void\* so as to facilitate type casting.
>
> The Fortran binding is consistent with the C and C++ bindings: the Fortran [[MPI_ALLOC_MEM]] call returns in `baseptr` the (integer valued) address of the allocated memory. The `base` argument of [[MPI_FREE_MEM]] is a choice argument, which passes (a reference to) the variable stored at that location.

> [!warning] Advice to implementors

> If [[MPI_ALLOC_MEM]] allocates special memory, then a design similar to the design of C `malloc` and `free` functions has to be used, in order to find out the size of a memory segment, when the segment is freed. If no special memory is used, [[MPI_ALLOC_MEM]] simply invokes `malloc`, and [[MPI_FREE_MEM]] invokes `free`.
>
> A call to [[MPI_ALLOC_MEM]] can be used in shared memory systems to allocate memory in a shared memory segment.

 Example of use of [[MPI_ALLOC_MEM]] , in Fortran with pointer support. We assume 4-byte `REAL`s, and assume that pointers are address-sized.

    REAL A
    POINTER (P, A(100,100))   ! no memory is allocated
    CALL MPI_ALLOC_MEM(4*100*100, MPI_INFO_NULL, P, IERR)
    ! memory is allocated
    ...
    A(3,5) = 2.71;
    ...
    CALL MPI_FREE_MEM(A, IERR) ! memory is freed

Since standard Fortran does not support (C-like) pointers, this code is not Fortran 77 or Fortran 90 code. Some compilers (in particular, at the time of writing, g77 and Fortran compilers for Intel) do not support this code.

Same example, in C

    float  (* f)[100][100] ;
    MPI_Alloc_mem(sizeof(float)*100*100, MPI_INFO_NULL, &f);
    ...
    (*f)[5][3] = 2.71;
    ...
    MPI_Free_mem(f);

## Language Interoperability



### Introduction

It is not uncommon for library developers to use one language to develop an applications library that may be called by an application program

written in a different language. MPI currently supports ISO (previously ANSI) C, C++, and Fortran bindings. It should

be possible for applications in any of the supported languages to call MPI-related functions in another language.

Moreover, MPI allows the development of client-server code, with MPI communication used between a parallel client and a parallel server. It should be possible to code the server in one language and the clients in another language.

To do so, communications should be possible between applications written in different languages.

There are several issues that need to be addressed in order to achieve interoperability.

Initialization  
We need to specify how the MPI environment is initialized for all languages.

Interlanguage passing of MPI opaque objects  
We need to specify how MPI object handles are passed between languages. We also need to specify what happens when an MPI object is accessed in one language, to retrieve information (e.g., attributes) set in another language.

Interlanguage communication  
We need to specify how messages sent in one language can be received in another language.

It is highly desirable that the solution for interlanguage interoperability be extendable to new languages, should MPI bindings be defined for such languages.

### Assumptions

We assume that conventions exist for programs written in one language to call functions in written in another language. These conventions specify how to link routines in different languages into one program, how to call functions in a different language, how to pass arguments between languages, and the correspondence between basic data types in different languages. In general, these conventions will be implementation dependent. Furthermore, not every basic datatype may have a matching type in other languages. For example, C/C++ character strings may not be compatible with Fortran `CHARACTER` variables. However, we assume that a Fortran `INTEGER`,

as well as a (sequence associated) Fortran array of `INTEGER`s,

can be passed to a C or C++ program.

We also assume that Fortran, C, and C++ have address-sized integers. This does not mean that the default-size integers are the same size as default-sized pointers, but only that there is some way to hold (and pass) a C address in a Fortran integer.

It is also assumed that `INTEGER(KIND=MPI_OFFSET_KIND)` can be passed from Fortran to C as

`MPI_Offset`.

### Initialization

A call to [[MPI_INIT]] or [[MPI_THREAD_INIT]] , from any language,

initializes MPI for execution in all languages.

> [!note] Advice to users

> Certain implementations use the (inout) `argc`, `argv` arguments of the C/C++ version of [[MPI_INIT]] in order to propagate values for `argc` and `argv` to all executing processes.
>
> Use of the Fortran version of [[MPI_INIT]] to initialize MPI may result in a loss of this ability.

The function [[MPI_INITIALIZED]] returns the same answer in all languages.

The function [[MPI_FINALIZE]] finalizes the MPI environments for all languages.

The function [[MPI_FINALIZED]] returns the same answer in all languages.

The function [[MPI_ABORT]] kills processes, irrespective of the language used by the caller or by the processes killed.

The MPI environment is initialized in the same manner for all languages by [[MPI_INIT]] . E.g., MPI_COMM_WORLD carries the same information regardless of language: same processes, same environmental attributes, same error handlers.

Information can be added to info objects in one language and retrieved in another.

> [!note] Advice to users

> The use of several languages in one MPI program may require the use of special options at compile and/or link time.

> [!warning] Advice to implementors

> Implementations may selectively link language specific MPI libraries only to codes that need them, so as not to increase the size of binaries for codes that use only one language. The MPI initialization code need perform initialization for a language only if that language library is loaded.

### Transfer of Handles



Handles are passed between Fortran and C or C++ by using an explicit C wrapper to convert Fortran handles to C handles. There is no direct access to C or C++ handles in Fortran. Handles are passed between C and C++ using overloaded C++ operators called from C++ code. There is no direct access to C++ objects from C.

The type definition MPI_Fint is provided in C/C++ for an integer of the size that matches a Fortran `INTEGER`; usually, MPI_Fint will be equivalent to int.

The following functions are provided in C to convert from a Fortran communicator handle (which is an integer) to a C communicator handle, and vice versa.

If `comm` is a valid Fortran handle to a communicator, then `MPI_Comm_f2c` returns a valid C handle to that same communicator; if `comm = MPI_COMM_NULL` (Fortran value), then `MPI_Comm_f2c` returns a null C handle; if `comm` is an invalid Fortran handle, then `MPI_Comm_f2c` returns an invalid C handle.

The function [[MPI_Comm_c2f]] translates a C communicator handle into a Fortran handle to the same communicator; it maps a null handle into a null handle and an invalid handle into an invalid handle.

Similar functions are provided for the other types of opaque objects.

The example below illustrates how the Fortran MPI function [[MPI_TYPE_COMMIT]] can be implemented by wrapping the C MPI function [[MPI_Type_commit]] with a C wrapper to do handle conversions. In this example a Fortran-C interface is assumed where a Fortran function is all upper case when referred to from C and arguments are passed by addresses.

    ! FORTRAN PROCEDURE
    SUBROUTINE MPI_TYPE_COMMIT( DATATYPE, IERR)
    INTEGER DATATYPE, IERR
    CALL MPI_X_TYPE_COMMIT(DATATYPE, IERR)
    RETURN
    END

    /* C wrapper */

    void MPI_X_TYPE_COMMIT( MPI_Fint *f_handle, MPI_Fint *ierr)
    {
    MPI_Datatype datatype;

    datatype = MPI_Type_f2c( *f_handle);
    *ierr = (MPI_Fint)MPI_Type_commit( &datatype);
    *f_handle = MPI_Type_c2f(datatype);
    return;
    }

The same approach can be used for all other MPI functions. The call to [[MPI_xxx_f2c]] (resp. [[MPI_xxx_c2f]] ) can be omitted when the handle is an OUT (resp. IN) argument, rather than INOUT.

> [!tip] Rationale

> The design here provides a convenient solution for the prevalent case, where a C wrapper is used to allow Fortran code to call a C library, or C code to call a Fortran library. The use of C wrappers is much more likely than the use of Fortran wrappers, because it is much more likely that a variable of type `INTEGER` can be passed to C, than a C handle can be passed to Fortran.
>
> Returning the converted value as a function value rather than through the argument list allows the generation of efficient inlined code when these functions are simple (e.g., the identity).
>
> The conversion function in the wrapper does not catch an invalid handle argument. Instead, an invalid handle is passed below to the library function, which, presumably, checks its input arguments.

##### C and C++

 The C++ language interface provides the functions listed below for mixed-language interoperability. The token `<CLASS>` is used below to indicate any valid MPI opaque handle name (e.g.,

`Group`), except where noted. For the case where the C++ class corresponding to `<CLASS>` has derived classes, functions are also provided for converting between the derived classes and the C `MPI_<CLASS>`.

The following function allows assignment from a C MPI handle to a C++ MPI handle.

The constructor below creates a C++ MPI object from a C MPI handle. This allows the automatic promotion of a C MPI handle to a C++ MPI handle.

In order for a C program to use a C++ library, the C++ library must export a C interface that provides appropriate conversions before invoking the underlying C++ library call. This example shows a C interface function that invokes a C++ library call with a C communicator; the communicator is automatically promoted to a C++ handle when the underlying C++ function is invoked.

    // C++ library function prototype
    void cpp_lib_call(MPI::Comm& cpp_comm);

    // Exported C function prototype
    extern "C" {
    void c_interface(MPI_Comm c_comm);
    }

    void c_interface(MPI_Comm c_comm)
    {
    // the MPI_Comm (c_comm) is automatically promoted to MPI::Comm
    cpp_lib_call(c_comm);
    }

The following function allows conversion from C++ objects to C MPI handles. In this case, the casting operator is overloaded to provide the functionality.

A C library routine is called from a C++ program. The C library routine is prototyped to take an `MPI_Comm` as an argument.

    // C function prototype
    extern "C" {
    void c_lib_call(MPI_Comm c_comm);
    }

    void cpp_function()
    {
    // Create a C++ communicator, and initialize it with a dup of
    //   MPI::COMM_WORLD
    MPI::Intracomm cpp_comm(MPI::COMM_WORLD.Dup());
    c_lib_call(cpp_comm);
    }

> [!tip] Rationale

> Providing conversion from C to C++ via constructors and from C++ to C via casting allows the compiler to make automatic conversions. Calling C from C++ becomes trivial, as does the provision of a C or Fortran interface to a C++ library.

> [!note] Advice to users

> Note that the casting and promotion operators return new handles by value. Using these new handles as INOUT parameters will affect the internal MPI object, but will *not* affect the original handle from which it was cast.

It is important to note that all C++ objects and their corresponding C handles can be used interchangeably by an application. For example, an application can cache an attribute on `MPI_­COMM_­WORLD` and later retrieve it from `MPI::­COMM_­WORLD`.

### Status

The following two procedures are provided in C to convert from a Fortran status (which is an array of integers) to a C status (which is a structure), and vice versa.

The conversion occurs on all the information in status, including that which is hidden. That is, no status information is lost in the conversion.

If `f_status` is a valid Fortran status, but not the Fortran value of MPI_STATUS_IGNORE or MPI_STATUSES_IGNORE, then `MPI_Status_f2c` returns in `c_status` a valid C status with the same content. If `f_status` is the Fortran value of MPI_STATUS_IGNORE or MPI_STATUSES_IGNORE, or if `f_status` is not a valid Fortran status, then the call is erroneous.

The C status has the same source, tag and error code values as the Fortran status, and returns the same answers when queried for count, elements, and cancellation. The conversion function may be called with a Fortran status argument that has an undefined error field, in which case the value of the error field in the C status argument is undefined.

Two global variables of type `MPI_Fint*`, MPI_F_STATUS_IGNORE and MPI_F_STATUSES_IGNORE are declared in mpi.h. They can be used to test, in C, whether `f_status` is the Fortran value of MPI_STATUS_IGNORE or MPI_STATUSES_IGNORE, respectively. These are global variables, not C constant expressions and cannot be used in places where C requires constant expressions. Their value is defined only between the calls to [[MPI_INIT]] and [[MPI_FINALIZE]] and should not be changed by user code.

To do the conversion in the other direction, we have the following:

This call converts a C status into a Fortran status, and has a behavior similar to [[MPI_Status_f2c]] . That is, the value of `c_status` must not be either MPI_STATUS_IGNORE or MPI_STATUSES_IGNORE.

> [!note] Advice to users

> There is not a separate conversion function for arrays of statuses, since one can simply loop through the array, converting each status.

> [!tip] Rationale

> The handling of MPI_STATUS_IGNORE is required in order to layer libraries with only a C wrapper: if the Fortran call has passed MPI_STATUS_IGNORE, then the C wrapper must handle this correctly. Note that this constant need not have the same value in Fortran and C. If [[MPI_Status_f2c]] were to handle MPI_STATUS_IGNORE, then the type of its result would have to be `MPI_Status**`, which was considered an inferior solution.

### MPI Opaque Objects

Unless said otherwise, opaque objects are “the same” in all languages:

they carry the same information, and have the same meaning in both languages. The mechanism described in the previous section can be used to pass references to MPI objects from language to language. An object created in one language can be accessed, modified or freed in another language.

We examine below in more detail, issues that arise for each type of MPI object.

#### Datatypes



Datatypes encode the same information in all languages. E.g., a datatype accessor like [[MPI_TYPE_GET_EXTENT]] will return the same information in all languages.

If a datatype defined in one language is used for a communication call in another language, then the message sent will be identical to the message that would be sent from the first language: the same communication buffer is accessed, and the same representation conversion is performed, if needed.

All predefined

datatypes can be used in datatype constructors in any language. If a datatype is committed, it can be used for communication in any language.

The function [[MPI_GET_ADDRESS]] returns the same value in all languages. Note that we do not require that the constant MPI_BOTTOM have the same value in all languages (see [[misc#Constants|Constants]] , page [[misc#Constants|Constants]] ).

  

    ! FORTRAN CODE
    REAL R(5)
    INTEGER TYPE, IERR
    INTEGER (KIND=MPI_ADDRESS_KIND) ADDR

    ! create an absolute datatype for array R
    CALL MPI_GET_ADDRESS( R, ADDR, IERR)
    CALL MPI_TYPE_CREATE_STRUCT(1, 5, ADDR, MPI_REAL, TYPE, IERR)
    CALL C_ROUTINE(TYPE)

    /* C code */

    void C_ROUTINE(MPI_Fint *ftype)
    {
    int count = 5;
    int lens[2] = {1,1};
    MPI_Aint displs[2];
    MPI_Datatype types[2], newtype;

    /* create an absolute datatype for buffer that consists   */
    /*  of count, followed by R(5)                            */

    MPI_Get_address(&count, &displs[0]);
    displs[1] = 0;
    types[0] = MPI_INT;
    types[1] = MPI_Type_f2c(*ftype);
    MPI_Type_create_struct(2, lens, displs, types, &newtype);
    MPI_Type_commit(&newtype);

    MPI_Send(MPI_BOTTOM, 1, newtype, 1, 0, MPI_COMM_WORLD);
    /* the message sent contains an int count of 5, followed  */
    /* by the 5 REAL entries of the Fortran array R.          */
    }

> [!warning] Advice to implementors

> The following implementation can be used: MPI addresses, as returned by [[MPI_GET_ADDRESS]] , will have the same value in all languages.
>
> One obvious choice is that MPI addresses be identical to regular addresses. The address is stored in the datatype, when datatypes with absolute addresses are constructed. When a send or receive operation is performed, then addresses stored in a datatype are interpreted as displacements that are all augmented by a base address. This base address is (the address of) `buf`, or zero, if `buf = MPI_BOTTOM`. Thus, if MPI_BOTTOM is zero then a send or receive call with `buf = MPI_BOTTOM` is implemented exactly as a call with a regular buffer argument: in both cases the base address is `buf`. On the other hand, if MPI_BOTTOM is not zero, then the implementation has to be slightly different. A test is performed to check whether `buf = MPI_BOTTOM`. If true, then the base address is zero, otherwise it is `buf`.
>
> In particular, if MPI_BOTTOM does not have the same value in Fortran and C/C++, then an additional test for `buf = MPI_BOTTOM` is needed in at least one of the languages.
>
> It may be desirable to use a value other than zero for MPI_BOTTOM even in C/C++, so as to distinguish it from a NULL pointer.
>
> If MPI_BOTTOM = c then one can still avoid the test
>
> `buf = MPI_BOTTOM`, by using the displacement from MPI_BOTTOM, i.e., the regular address - c, as the MPI address returned by [[MPI_GET_ADDRESS]] and stored in absolute datatypes.

#### Callback Functions

MPI calls may associate callback functions with MPI objects: error handlers are associated with communicators and files, attribute copy and delete functions are associated with attribute keys, reduce operations are assciated with operation objects, etc. In a multilanguage environment, a function passed in an MPI call in one language may be invoked by an MPI call in another language. MPI implementations must make sure that such invocation will use the calling convention of the language the function is bound to.

> [!warning] Advice to implementors

> Callback functions need to have a language tag. This tag is set when the callback function is passed in by the library function (which is presumably different for each language), and is used to generate the right calling sequence when the callback function is invoked.

#### Error Handlers

> [!warning] Advice to implementors

> Error handlers, have, in C and C++, a “`stdargs`” argument list.
>
> It might be useful to provide to the handler information on the language environment where the error occurred.

#### Reduce Operations

> [!note] Advice to users

> Reduce operations receive as one of their arguments the datatype of the operands.
>
> Thus, one can define “polymorphic” reduce operations that work for C, C++, and Fortran datatypes.

#### Addresses



Some of the datatype accessors and constructors have arguments of type `MPI_Aint` (in C) or `MPI::Aint` in C++, to hold addresses. The corresponding arguments, in Fortran, have type `INTEGER`. This causes Fortran and C/C++ to be incompatible, in an environment where addresses have 64 bits, but Fortran `INTEGER`s have 32 bits.

This is a problem, irrespective of interlanguage issues. Suppose that a Fortran process has an address space of $`\geq`$ 4 GB. What should be the value returned in Fortran by [[MPI_ADDRESS]] , for a variable with an address above $`2^{32}`$? The design described here addresses this issue, while maintaining compatibility with current Fortran codes.

The constant MPI_ADDRESS_KIND is defined so that, in Fortran 90,

`INTEGER(KIND=MPI_ADDRESS_KIND)`)

is an address sized integer type (typically, but not necessarily, the size of an `INTEGER(KIND=MPI_ADDRESS_KIND)` is 4 on 32 bit address machines and 8 on 64 bit address machines). Similarly, the constant MPI_INTEGER_KIND is defined so that

`INTEGER(KIND=MPI_INTEGER_KIND)` is a default size

`INTEGER`.

There are seven functions that have address arguments: [[MPI_TYPE_HVECTOR]] ,

[[MPI_TYPE_HINDEXED]] , [[MPI_TYPE_STRUCT]] , [[MPI_ADDRESS]] , [[MPI_TYPE_EXTENT]]

`MPI_TYPE_LB` and [[MPI_TYPE_UB]] .

Four new functions are provided to supplement the first four functions in this list. These functions are described in Section [[misc#New Datatype Manipulation Functions|New Datatype Manipulation Functions]] , page [[misc#New Datatype Manipulation Functions|New Datatype Manipulation Functions]] . The remaining three functions are supplemented by the new function

[[MPI_TYPE_GET_EXTENT]] , described in that same section. The new functions have the same functionality as the old functions

in C/C++, or on Fortran systems where default `INTEGER`s are address sized. In Fortran, they accept arguments of type

`INTEGER(KIND=MPI_ADDRESS_KIND)`, wherever arguments of type

MPI_Aint are used in C. On Fortran 77 systems that do not support the Fortran 90 `KIND` notation, and where addresses are 64 bits whereas default `INTEGER`s are 32 bits, these arguments will be of an appropriate integer type. The old functions will continue to be provided, for backward compatibility. However, users are encouraged to switch to the new functions, in Fortran, so as to avoid problems on systems with an address range $`> 2^{32}`$, and to provide compatibility across languages.

### Attributes



Attribute keys can be allocated in one language and freed in another. Similarly, attribute values can be set in one language and accessed in another. To achieve this, attribute keys will be allocated in an integer range that is valid all languages. The same holds true for system-defined attribute values (such as MPI_TAG_UB, MPI_WTIME_IS_GLOBAL, etc.)

Attribute keys declared in one language are associated with copy and delete functions in that language (the functions provided by the `MPI\_{TYPE,COMM,WIN}\_KEYVAL_CREATE` call). When a communicator is duplicated, for each attribute, the corresponding copy function is called, using the right calling convention for the language of that function; and similarly, for the delete callback function.

> [!warning] Advice to implementors

> This requires that attributes be tagged either as “C,” “C++” or “Fortran,” and that the language tag be checked in order to use the right calling convention for the callback function.

The attribute manipulation functions described in Section 5.7 of the MPI-1 standard define attributes arguments to be of type `void*` in C, and of type `INTEGER`, in Fortran. On some systems, `INTEGER`s will have 32 bits, while C/C++ pointers will have 64 bits. This is a problem if communicator attributes are used to move information from a Fortran caller to a C/C++ callee, or vice-versa.

MPI will store, internally, address sized attributes. If Fortran `INTEGER`s are smaller, then the Fortran function [[MPI_ATTR_GET]] will return the least significant part of the attribute word; the Fortran function [[MPI_ATTR_PUT]] will set the least significant part of the attribute word, which will be sign extended to the entire word. (These two functions may be invoked explicitly by user code, or implicitly, by attribute copying callback functions.)

As for addresses, new functions are provided that manipulate Fortran address sized attributes, and have the same functionality as the old functions in C/C++. These functions are described in

Section [[ei#New Attribute Caching Functions|New Attribute Caching Functions]] , page [[ei#New Attribute Caching Functions|New Attribute Caching Functions]] . Users are encouraged to use these new functions.

MPI supports two types of attributes: address-valued (pointer) attributes, and integer valued attributes. C and C++ attribute functions put and get address valued attributes. Fortran attribute functions put and get integer valued attributes. When an integer valued attribute is accessed from C or C++, then [[MPI_xxx_get_attr]] will return the address of (a pointer to) the integer valued attribute. When an address valued attribute is accessed from Fortran, then [[MPI_xxx_GET_ATTR]] will convert the address into an integer and return the result of this conversion. This conversion is lossless if new style (MPI-2) attribute functions are used, and an integer of kind [[MPI_ADDRESS_KIND]] is returned. The conversion may cause truncation if old style (MPI-1)attribute functions are used.

A. C to Fortran

      C code

    static int i = 5;
    void *p;
    p = &i;
    MPI_Comm_put_attr(..., p);
    ....

     Fortran code

    INTEGER(kind = MPI_ADDRESS_KIND) val
    CALL MPI_COMM_GET_ATTR(...,val,...)
    IF(val.NE.5) THEN CALL ERROR

B. Fortran to C

       Fortran code

    INTEGER(kind=MPI_ADDRESS_KIND) val
    val = 55555
    CALL MPI_COMM_PUT_ATTR(...,val,ierr)

       C code

    int *p;
    MPI_Comm_get_attr(...,&p, ...);
    if (*p != 55555) error();

The predefined MPI attributes can be integer valued or address valued. Predefined integer valued attributes, such as MPI_TAG_UB, behave as if they were put by a Fortran call. I.e., in Fortran, [[MPI_COMM_GET_ATTR]] will return in val the upper bound for tag value; in C, [[MPI_Comm_get_attr]] will return in `p` a pointer to an int containing the upper bound for tag value.

Address valued predefined attributes, such as [[MPI_WIN_BASE]] behave as if they were put by a C call. I.e., in Fortran, [[MPI_WIN_GET_ATTR]] will return in val the base address of the window, converted to an integer. In C, [[MPI_Win_get_attr]] will return in `p` a pointer to the window base, cast to `(void *)`.

> [!tip] Rationale

> The design is consistent with the behavior specified in MPI-1 for predefined attributes, and ensures that no information is lost when attributes are passed from language to language.

> [!warning] Advice to implementors

> Implementations should tag attributes either as address attributes or as integer attributes, according to whether they were set in C or in Fortran. Thus, the right choice can be made when the attribute is retrieved.

### Extra State

Extra-state should not be modified by the copy or delete callback functions. (This is obvious from the C binding, but not obvious from the Fortran binding). However, these functions may update state that is indirectly accessed via extra-state. E.g., in C, extra-state can be a pointer to a data structure that is modified by the copy or callback functions; in Fortran, extra-state can be an index into an entry in a `COMMON` array that is modified by the copy or callback functions. In a multithreaded environment, users should be aware that distinct threads may invoke the same callback function concurrently: if this function modifies state associated with extra-state, then mutual exclusion code must be used to protect updates and accesses to the shared state.

### Constants



MPI constants have the same value in all languages, unless specified otherwise.

This does not apply to constant handles (MPI_INT, MPI_COMM_WORLD, MPI_ERRORS_RETURN, MPI_SUM, etc.) These handles need to be converted, as explained in Section [[misc#Transfer of Handles|Transfer of Handles]] .

Constants that specify maximum lengths of strings (see Section [[appLang#Defined Constants|Defined Constants]] for a listing) have a value one less in Fortran than C/C++ since in C/C++ the length includes the null terminating character. Thus, these constants represent the amount of space which must be allocated to hold the largest possible such string, rather than the maximum number of printable characters the string could contain.

> [!note] Advice to users

> This definition means that it is safe in C/C++ to allocate a buffer to receive a string using a declaration like
>
>             char name [MPI_MAX_NAME_STRING];

Also constant “addresses,” i.e., special values for reference arguments that are not handles, such as MPI_BOTTOM or MPI_STATUS_IGNORE may have different values in different languages.

> [!tip] Rationale

> The current MPI standard specifies that `MPI_BOTTOM` can be used in initialization expressions in C, but not in Fortran. Since Fortran does not normally support call by value, then `MPI_BOTTOM` must be in Fortran the name of a predefined
>
> static variable, e.g., a variable in an MPI declared `COMMON`
>
> block. On the other hand, in C, it is natural to take
>
> MPI_BOTTOM = 0 (Caveat: Defining MPI_BOTTOM = 0
>
> implies that `NULL` pointer cannot be distinguished from
>
> MPI_BOTTOM; it may be that MPI_BOTTOM = 1 is better ...)
>
> Requiring that the Fortran and C values be the same will complicate the initialization process.

### Interlanguage Communication

The type matching rules for communications in MPI are not changed: the datatype specification for each item sent should match, in type signature, the datatype specification used to receive this item (unless one of the types is MPI_PACKED). Also, the type of a message item should match the type declaration for the corresponding communication buffer location, unless the type is MPI_BYTE or MPI_PACKED. Interlanguage communication is allowed if it complies with these rules.

In the example below, a Fortran array is sent from Fortran and received in C.

    ! FORTRAN CODE
    REAL R(5)
    INTEGER TYPE, IERR, MYRANK
    INTEGER(KIND=MPI_ADDRESS_KIND) ADDR

    ! create an absolute datatype for array R
    CALL MPI_GET_ADDRESS( R, ADDR, IERR)
    CALL MPI_TYPE_CREATE_STRUCT(1, 5, ADDR, MPI_REAL, TYPE, IERR)
    CALL MPI_TYPE_COMMIT(TYPE, IERR)

    CALL MPI_COMM_RANK( MPI_COMM_WORLD, MYRANK, IERR)
    IF (MYRANK.EQ.0) THEN
       CALL MPI_SEND( MPI_BOTTOM, 1, TYPE, 1, 0, MPI_COMM_WORLD, IERR)
    ELSE
       CALL C_ROUTINE(TYPE)
    END IF

    /* C code */

    void C_ROUTINE(MPI_Fint *fhandle)
    {
    MPI_Datatype type;
    MPI_Status status;

    type = MPI_Type_f2c(*fhandle);

    MPI_Recv( MPI_BOTTOM, 1, type, 0, 0, MPI_COMM_WORLD, &status);
    }

MPI implementors may weaken these type matching rules, and allow messages to be sent with Fortran types and received with C types, and vice versa, when those types match. I.e., if the Fortran type `INTEGER` is identical to the C type `int`, then an MPI implementation may allow data to be sent with datatype MPI_INTEGER and be received with datatype MPI_INT. However, such code is not portable.

## Error Handlers



MPI-1 attached error handlers only to communicators. MPI-2 attaches them to three types of objects: communicators, windows, and files. The extension was done while maintaining only one type of error handler opaque object. On the other hand, there are, in C and C++, distinct typedefs for user defined error handling callback functions that accept, respectively, communicator, file, and window arguments.

In Fortran there are three user routines.

An error handler object is created by a call to `MPI_XXX_CREATE_ERRHANDLER(function, errhandler)` , where XXX is, respectively, COMM, WIN, or FILE.

An error handler is attached to a communicator, window, or file by a call to `MPI_XXX_SET_ERRHANDLER` . The error handler must be either a predefined error handler, or an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` , with matching XXX.

The predefined error handlers MPI_ERRORS_RETURN and MPI_ERRORS_ARE_FATAL can be attached to communicators, windows, and files. In C++, the predefined error handler `MPI::ERRORS_THROW_EXCEPTIONS` can also be attached to communicators, windows, and files.

The error handler currently associated with a communicator, window, or file can be retrieved by a call to `MPI_XXX_GET_ERRHANDLER` .

The MPI-1 function [[MPI_ERRHANDLER_FREE]] can be used to free an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` .

> [!warning] Advice to implementors

> High quality implementation should raise an error when an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` is attached to an object of the wrong type with a call to `MPI_YYY_SET_ERRHANDLER` . To do so, it is necessary to maintain, with each error handler, information on the typedef of the associated user function.

The syntax for these calls is given below.

### Error Handlers for Communicators

![[API/MPI_COMM_CREATE_ERRHANDLER]]

Creates an error handler that can be attached to communicators. This function is identical to [[MPI_ERRHANDLER_CREATE]] ,

whose use is deprecated.

The user routine should be, in C, a function of type `MPI_Comm_errhandler_fn`, which is defined as

The first argument is the communicator in use, the second is the error code to be returned.

This typedef replaces [[MPI_Handler_function]] , whose use is deprecated.

In Fortran, the user routine should be of the form:

In C++, the user routine should be of the form:

![[API/MPI_COMM_SET_ERRHANDLER]]

Attaches a new error handler to a communicator. The error handler must be either a predefined error handler, or an error handler created by a call to [[MPI_COMM_CREATE_ERRHANDLER]] . This call is identical to `MPI_ERRHANDLER_SET`,

whose use is deprecated.

![[API/MPI_COMM_GET_ERRHANDLER]]

Retrieves the error handler currently associated with a communicator. This call is identical to [[MPI_ERRHANDLER_GET]] ,

whose use is deprecated.

### Error Handlers for Windows

![[API/MPI_WIN_CREATE_ERRHANDLER]]

The user routine should be, in C, a function of type `MPI_Win_errhandler_fn`, which is defined as

The first argument is the window in use, the second is the error code to be returned.

In Fortran, the user routine should be of the form:

In C++, the user routine should be of the form:

![[API/MPI_WIN_SET_ERRHANDLER]]

Attaches a new error handler to a window. The error handler must be either a predefined error handler, or an error handler created by a call to [[MPI_WIN_CREATE_ERRHANDLER]] .

![[API/MPI_WIN_GET_ERRHANDLER]]

Retrieves the error handler currently associated with a window.

### Error Handlers for Files

![[API/MPI_FILE_CREATE_ERRHANDLER]]

The user routine should be, in C, a function of type `MPI_File_errhandler_fn`, which is defined as

The first argument is the file in use, the second is the error code to be returned.

In Fortran, the user routine should be of the form:

In C++, the user routine should be of the form:

![[API/MPI_FILE_SET_ERRHANDLER]]

Attaches a new error handler to a file. The error handler must be either a predefined error handler, or an error handler created by a call to [[MPI_FILE_CREATE_ERRHANDLER]] .

![[API/MPI_FILE_GET_ERRHANDLER]]

Retrieves the error handler currently associated with a file.

## New Datatype Manipulation Functions



New functions are provided to supplement the type manipulation functions that have address sized integer arguments. The new functions will use, in their Fortran binding, address-sized `INTEGER`s, thus solving problems currently encountered when the application address range is $`> 2^{32}`$. Also, a new, more convenient type constructor is provided to modify the lower bound and extent of a datatype. The deprecated functions replaced by the new functions here are listed in Section [[terms#Deprecated Names and Functions|Deprecated Names and Functions]] .

### Type Constructors with Explicit Addresses

The four functions below supplement the four corresponding type constructor functions from MPI-1. The new functions are synonymous with the old functions in C/C++, or on Fortran systems where default `INTEGER`s are address sized.

(The old names are not available in C++.)

In Fortran, these functions accept arguments of type

`INTEGER(KIND=MPI_ADDRESS_KIND)`, wherever arguments of type MPI_Aint are used in C. On Fortran 77 systems that do not support the Fortran 90 `KIND` notation, and where addresses are 64 bits whereas default `INTEGER`s are 32 bits, these arguments will be of type `INTEGER*8`. The old functions will continue to be provided for backward compatibility. However, users are encouraged to switch to the new functions, in both Fortran and C.

The new functions are listed below.

The use of the old functions is deprecated.

![[API/MPI_TYPE_CREATE_HVECTOR]]

![[API/MPI_TYPE_CREATE_HINDEXED]]

![[API/MPI_TYPE_CREATE_STRUCT]]

![[API/MPI_GET_ADDRESS]]

> [!note] Advice to users

> Current Fortran MPI codes will run unmodified, and will port to any system. However, they may fail if addresses larger than $`2^{32} -1`$ are used in the program. New codes should be written so that they use the new functions. This provides compatibility with C/C++ and avoids errors on 64 bit architectures. However, such newly written codes may need to be (slightly) rewritten to port to old Fortran 77 environments that do not support `KIND` declarations.

### Extent and Bounds of Datatypes

The following function

replaces

the three functions [[MPI_TYPE_UB, MPI_TYPE_LB]] and [[MPI_TYPE_EXTENT]] . It also returns address sized integers, in the Fortran binding.

The use of [[MPI_TYPE_UB, MPI_TYPE_LB]] and [[MPI_TYPE_EXTENT]] is deprecated.

![[API/MPI_TYPE_GET_EXTENT]]

Returns the lower bound and the extent of `datatype` (as defined by the MPI-1 standard, Section 3.12.2).

MPI allows one to change the extent of a datatype, using lower bound and upper bound markers (MPI_LB and MPI_UB). This is useful, as it allows to control the stride of successive datatypes that are replicated by datatype constructors, or are replicated by the `count` argument in a send or recieve call. However, the current mechanism for achieving it is painful; also it is restrictive. MPI_LB and MPI_UB are “sticky”: once present in a datatype, they cannot be overridden (e.g., the upper bound can be moved up, by adding a new MPI_UB marker, but cannot be moved down below an existing `MPI_UB` marker).

A new type constructor is provided to facilitate these changes.

The use of MPI_LB and MPI_UB is deprecated.

![[API/MPI_TYPE_CREATE_RESIZED]]

Returns in `newtype` a handle to a new datatype that is identical to `oldtype`, except that the lower bound of this new datatype is set to be `lb`, and its upper bound is set to be `lb `$`+`$` extent`.

Any previous **lb** and **ub** markers are erased, and a new pair of lower bound and upper bound markers are put in the positions indicated by the `lb` and `extent` arguments. This affects the behavior of the datatype when used in communication operations, with `count `$`>1`$, and when used in the construction of new derived datatypes.

> [!note] Advice to users

> It is strongly recommended that users use these two new functions, rather than the old MPI-1 functions to set and access lower bound, upper bound and extent of datatypes.

### True Extent of Datatypes

Suppose we implement gather as a spanning tree implemented on top of point-to-point routines. Since the receive buffer is only valid on the root process, one will need to allocate some temporary space for receiving data on intermediate nodes. However, the datatype extent cannot be used as an estimate of the amount of space that needs to be allocated, if the user has modified the extent using the MPI_UB and MPI_LB values. A new function is provided which returns the true extent of the datatype.

![[API/MPI_TYPE_GET_TRUE_EXTENT]]

`true_lb` returns the offset of the lowest unit of store which is addressed by the datatype, i.e., the lower bound of the corresponding typemap, ignoring MPI_LB markers. `true_extent` returns the true size of the datatype, i.e., the extent of the corresponding typemap, ignoring MPI_LB and `MPI_UB` markers, and performing no rounding for alignment. If the typemap associated with `datatype` is
``` math
Typemap = \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1})\}
```
Then

``` math
true_lb(Typemap) = min_j  \{ disp_j  :  type_j \ne \textbf{lb, ub} \},
```
``` math
true_ub (Typemap) = max_j \{disp_j + sizeof(type_j)  :  type_j \ne
\textbf{lb, ub}\} ,
```

and
``` math
true_extent (Typemap) = true_ub(Typemap) - true_lb(typemap).
```
(Readers should compare this with the definitions in Section 3.12.3 of the MPI-1 standard, which describes the function [[MPI_TYPE_EXTENT]] .)

The `true_extent` is the minimum number of bytes of memory necessary to hold a datatype, uncompressed.

### Subarray Datatype Constructor



![[API/MPI_TYPE_CREATE_SUBARRAY]]

The subarray type constructor creates an MPI datatype describing an n-dimensional subarray of an n-dimensional array. The subarray may be situated anywhere within the full array, and may be of any nonzero size up to the size of the larger array as long as it is confined within this array.

This type constructor facilitates creating filetypes to access

arrays distributed in blocks among processes to a single file that contains the global array.

This type constructor can handle arrays with an arbitrary number of dimensions and works for both C and Fortran ordered matrices (i.e., row-major or column-major). Note that a C program may use Fortran order and a Fortran program may use C order.

The `ndims` parameter specifies the number of dimensions in the full data array and gives the number of elements in `array_of_sizes`, `array_of_subsizes`, and `array_of_starts`.

The number of elements of type `oldtype` in each dimension of the n-dimensional array and the requested subarray are specified by `array_of_sizes` and `array_of_subsizes`, respectively. For any dimension $`i`$, it is erroneous to specify `array_of_subsizes[i]` $`<`$ 1 or `array_of_subsizes[i]` $`>`$ `array_of_sizes[i]`.

The `array_of_starts` contains the starting coordinates of each

dimension of the subarray. Arrays are assumed to be indexed starting from zero.

For any dimension $`i`$, it is erroneous to specify `array_of_starts[i]` $`<`$ 0 or `array_of_starts[i]` $`>`$ (`array_of_sizes[i]` $`-`$ `array_of_subsizes[i]`).

> [!note] Advice to users

> In a Fortran program with arrays indexed starting from 1, if the starting coordinate of a particular dimension of the subarray is `n`, then the entry in `array_of_starts` for that dimension is `n-1`.

The `order` argument specifies the storage order for the subarray as well as the full array.

It must be set to one of the following:

MPI_ORDER_C  
The ordering used by C arrays, (i.e., row-major order)

MPI_ORDER_FORTRAN  
The ordering used by Fortran arrays, (i.e., column-major order)

A `ndims`-dimensional subarray (`newtype`) with no extra padding can be defined by the function Subarray() as follows:
``` math
\begin{eqnarray*}
\texttt{newtype} & = &  Subarray( ndims,
                        \{size_0, size_1,...,size_{ndims-1}\},        \\
                 &   &  \{subsize_0, subsize_1,...,subsize_{ndims-1}\}, \\
                 &   &  \{start_0, start_1,...,start_{ndims-1}\},
                        {\texttt{oldtype}} )
\end{eqnarray*}
```

Let the typemap of `oldtype` have the form:
``` math
\{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\}
```
where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = MPI_ORDER_FORTRAN, and Equation [[eq-subarray-c]] defines the recursion step when `order` = MPI_ORDER_C.

``` math
\begin{eqnarray}
Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
  \\
& & \quad \{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\})  \\
& = & \{(MPI_LB,0),  \\
& & (type_0,disp_0+start_0 \times ex),...,(type_{n-1},
        disp_{n-1} + start_0 \times ex),  \\
& & (type_0,disp_0+(start_0 + 1)\times ex),...,(type_{n-1},
\\
& & \hspace{.5in}disp_{n-1} + (start_0+1) \times ex), ...  \\
& & (type_0,disp_0+(start_0 + subsize_0 - 1)\times ex),...,
 \\
& & \hspace{.5in}(type_{n-1},disp_{n-1} + (start_0+subsize_0 - 1) \times ex),
 \\
& & (MPI_UB, size_0 \times ex) \}  \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},         \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad \{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
 \\
& = & Subarray(ndims-1,\{size_1, size_2,...,size_{ndims-1}\},
 \\
& &\quad\{subsize_1, subsize_2,...,subsize_{ndims-1}\}, \\
& &\quad\{start_1, start_2,...,start_{ndims-1}\},  \\
& & \hspace{.5in}Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
        \texttt{oldtype})) \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},           \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad\{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
  \\
& = & Subarray(ndims-1,\{size_0, size_1,...,size_{ndims-2}\},
 \\
& &\quad\{subsize_0, subsize_1,...,subsize_{ndims-2}\},  \\
& &\quad\{start_0, start_1,...,start_{ndims-2}\},  \\
& & \hspace{.5in}Subarray(1,\{size_{ndims-1}\},\{subsize_{ndims-1}\},
        \{start_{ndims-1}\},\texttt{oldtype}))
\end{eqnarray}
```

For an example use of [[MPI_TYPE_CREATE_SUBARRAY]] in the context of I/O see Section [[io#Subarray Filetype Constructor|Subarray Filetype Constructor]] .

### Distributed Array Datatype Constructor



The distributed array type constructor supports HPF-like data distributions. However, unlike in HPF, the storage order may be specified for C arrays as well as for Fortran arrays.

> [!note] Advice to users

> One can create an HPF-like file view using this type constructor as follows. Complementary filetypes are created by having every process of a group call this constructor with identical arguments (with the exception of `rank` which should be set appropriately). These filetypes (along with identical `disp` and `etype`) are then used to define the view (via `MPI_FILE_SET_VIEW`). Using this view, a collective data access operation (with identical offsets) will yield an HPF-like distribution pattern.

![[API/MPI_TYPE_CREATE_DARRAY]]

`MPI_TYPE_CREATE_DARRAY` can be used to generate the datatypes corresponding to the distribution of an `ndims`-dimensional array of `oldtype` elements

onto

an `ndims`-dimensional grid of logical processes.

Unused dimensions of `array_of_psizes` should be set to 1.

(See Example [[misc#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] , page [[misc#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] .)

For a call to `MPI_TYPE_CREATE_DARRAY` to be correct, the equation $`\prod_{i=0}^{ndims-1} array_of_psizes[i] = size`$ must be satisfied. The ordering of processes in the process grid is assumed to be row-major, as in the case of virtual Cartesian process topologies in MPI-1.

> [!note] Advice to users

> For both Fortran and C arrays, the ordering of processes in the process grid is assumed to be row-major. This is consistent with the ordering used in virtual Cartesian process topologies in MPI-1. To create such virtual process topologies, or to find the coordinates of a process in the process grid, etc., users may use the corresponding functions provided in MPI-1.

Each dimension of the array

can be

distributed in one of three ways:

- MPI_DISTRIBUTE_BLOCK - Block distribution

- MPI_DISTRIBUTE_CYCLIC - Cyclic distribution

- MPI_DISTRIBUTE_NONE - Dimension not distributed.

The constant MPI_DISTRIBUTE_DFLT_DARG specifies a default distribution argument.

The distribution argument for a dimension that is not distributed is ignored.

For any dimension $`i`$ in which the distribution is MPI_DISTRIBUTE_BLOCK, it erroneous to specify `array_of_dargs[i]` $`*`$ `array_of_psizes[i]` $`<`$ `array_of_gsizes[i]`.

For example, the HPF layout `ARRAY(CYCLIC(15))` corresponds to MPI_DISTRIBUTE_CYCLIC with a distribution argument of 15, and the HPF layout ARRAY(BLOCK)

corresponds to MPI_DISTRIBUTE_BLOCK with a distribution argument of MPI_DISTRIBUTE_DFLT_DARG.

The `order` argument is used as in `MPI_TYPE_CREATE_SUBARRAY` to specify the storage order.

Therefore, arrays described by this type constructor may be stored in Fortran (column-major) or C (row-major) order. Valid values for `order` are MPI_ORDER_FORTRAN and MPI_ORDER_C.

This routine creates a new MPI datatype with a typemap defined in terms of a function called “cyclic()” (see below).

Without loss of generality, it suffices to define the typemap for the MPI_DISTRIBUTE_CYCLIC case where MPI_DISTRIBUTE_DFLT_DARG is not used.

MPI_DISTRIBUTE_BLOCK and MPI_DISTRIBUTE_NONE can be reduced to the MPI_DISTRIBUTE_CYCLIC case for dimension $`i`$ as follows.

MPI_DISTRIBUTE_BLOCK with `array_of_dargs[i]` equal to MPI_DISTRIBUTE_DFLT_DARG is equivalent to MPI_DISTRIBUTE_CYCLIC with `array_of_dargs[i]` set to
``` math
(\texttt{array_of_gsizes[i]} + \texttt{array_of_psizes[i]} - 1)
        / \texttt{array_of_psizes[i]}.
```
If `array_of_dargs[i]` is not MPI_DISTRIBUTE_DFLT_DARG, then MPI_DISTRIBUTE_BLOCK and MPI_DISTRIBUTE_CYCLIC are equivalent.

MPI_DISTRIBUTE_NONE is equivalent to MPI_DISTRIBUTE_CYCLIC with `array_of_dargs[i]` set to `array_of_gsizes[i]`.

Finally, MPI_DISTRIBUTE_CYCLIC with `array_of_dargs[i]` equal to MPI_DISTRIBUTE_DFLT_DARG is equivalent to MPI_DISTRIBUTE_CYCLIC with `array_of_dargs[i]` set to 1.

For MPI_ORDER_FORTRAN, an `ndims`-dimensional distributed array (`newtype`) is defined by the following code fragment:

        oldtype[0] = oldtype;
        for ( i = 0; i < ndims; i++ ) {
           oldtype[i+1] = cyclic(array_of_dargs[i],
                                 array_of_gsizes[i],
                                 r[i], 
                                 array_of_psizes[i],
                                 oldtype[i]);
        }
        newtype = oldtype[ndims];

For MPI_ORDER_C, the code is:

        oldtype[0] = oldtype;
        for ( i = 0; i < ndims; i++ ) {
           oldtype[i + 1] = cyclic(array_of_dargs[ndims - i - 1], 
                                   array_of_gsizes[ndims - i - 1],
                                   r[ndims - i - 1], 
                                   array_of_psizes[ndims - i - 1],
                                   oldtype[i]);
        }
        newtype = oldtype[ndims];

where $`r[i]`$ is the position of the process (with rank `rank`) in the process grid at dimension $`i`$. The values of $`r[i]`$ are given by the following code fragment:

            t_rank = rank;
            t_size = 1;
            for (i = 0; i < ndims; i++)
                    t_size *= array_of_psizes[i];
            for (i = 0; i < ndims; i++) {
                t_size = t_size / array_of_psizes[i];
                r[i] = t_rank / t_size;
                t_rank = t_rank % t_size;
            }

Let the typemap of `oldtype` have the form:
``` math
\{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\}
```
where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`.

Given the above, the function cyclic() is defined as follows:
``` math
\begin{eqnarray*}
cyclic(darg, gsize, r, psize, \texttt{oldtype}) \\
&=& \{ (MPI_LB, 0), \\
& &  (type_0, disp_0 + r \times darg \times ex), ... , \\
& & \hspace{.5in}  (type_{n-1}, disp_{n-1} + r \times darg \times ex), \\
& &  (type_0, disp_0 + (r \times darg + 1) \times ex), ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1)\times ex), \\
& & ... \\
& &  (type_0, disp_0 + ((r+1) \times darg -1) \times ex), ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1)
                        \times darg - 1)\times ex), \\
& & \\
& &  (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex),
        ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex
                + psize \times darg \times ex), \\
& &  (type_0, disp_0 + (r \times darg + 1) \times ex
         + psize \times darg \times ex),
        ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex
                + psize \times darg \times ex), \\
& & ... \\
& &  (type_0, disp_0 + ((r+1) \times darg -1) \times ex
                 + psize \times darg \times ex), ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1) \times darg - 1)\times ex
                 + psize \times darg \times ex), \\
& & \hspace{.5in}\vdots \\
& &  (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex
                \times (count - 1)),
        ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex
                + psize \times darg \times ex \times (count - 1)), \\
& &  (type_0, disp_0 + (r \times darg + 1) \times ex
         + psize \times darg \times ex \times (count - 1)),
        ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex \\
& & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\
& & ... \\
& &  (type_0, disp_0 + (r \times darg + darg_{last}-1) \times ex \\
& & \hspace{1in} + psize \times darg \times ex \times (count-1)),
        ... , \\
& & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + darg_{last} - 1)
                \times ex \\
& & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\
& &   (MPI_UB, gsize * ex) \}
\end{eqnarray*}
```
where $`count`$ is defined by this code fragment:

            nblocks = (gsize + (darg - 1)) / darg;
            count = nblocks / psize;
            left_over = nblocks - count * psize;
            if (r < left_over)
                count = count + 1;

Here, $`nblocks`$ is the number of blocks that must be distributed among the processors. Finally, $`darg_{last}`$ is defined by this code fragment:

            if ((num_in_last_cyclic = gsize % (psize * darg)) == 0)
                 darg_last = darg;
            else
                 darg_last = num_in_last_cyclic - darg * r;
                 if (darg_last > darg)
                        darg_last = darg;
                 if (darg_last <= 0)
                        darg_last = darg;

Consider generating the filetypes corresponding to the HPF distribution:

          <oldtype> FILEARRAY(100, 200, 300)
    !HPF$ PROCESSORS PROCESSES(2, 3)
    !HPF$ DISTRIBUTE FILEARRAY(CYCLIC(10), *, BLOCK) ONTO PROCESSES

This can be achieved by the following Fortran code, assuming there will be six processes attached to the run:

        ndims = 3
        array_of_gsizes(1) = 100
        array_of_distribs(1) = MPI_DISTRIBUTE_CYCLIC
        array_of_dargs(1) = 10
        array_of_gsizes(2) = 200
        array_of_distribs(2) = MPI_DISTRIBUTE_NONE
        array_of_dargs(2) = 0
        array_of_gsizes(3) = 300
        array_of_distribs(3) = MPI_DISTRIBUTE_BLOCK
        array_of_dargs(3) = MPI_DISTRIBUTE_DFLT_ARG
        array_of_psizes(1) = 2
        array_of_psizes(2) = 1
        array_of_psizes(3) = 3
        call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierr)
        call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
        call MPI_TYPE_CREATE_DARRAY(size, rank, ndims, array_of_gsizes, &
             array_of_distribs, array_of_dargs, array_of_psizes,        &
             MPI_ORDER_FORTRAN, oldtype, newtype, ierr)

## New Predefined Datatypes



### Wide Characters

A new datatype, [[MPI_WCHAR]] , is added, for the purpose of dealing with international character sets such as Unicode.

[[MPI_WCHAR]] is a C type that corresponds to the type `wchar_t` defined in `<stddef.h>`.

There are no predefined reduction operations for [[MPI_WCHAR]] .

> [!tip] Rationale

> The fact that [[MPI_CHAR]] is associated with the C datatype `char`, which in turn is often used as a substitute for the “missing” `byte` datatype in C makes it most natural to define this as a new datatype specifically for multi-byte characters.

### Signed Characters and Reductions

MPI-1 doesn’t allow reductions on signed or unsigned `char`s. Since this restriction (formally) prevents a C programmer from performing reduction operations on such types (which could be useful, particularly in an image processing application where pixel values are often represented as “unsigned char”), we now specify a way for such reductions to be carried out.

MPI-1.2 already has the C types [[MPI_CHAR]] and [[MPI_UNSIGNED_CHAR]] . However there is a problem here in that [[MPI_CHAR]] is intended to represent a character, not a small integer, and therefore will be translated between machines with different character representations.

To overcome this, a new MPI predefined datatype, [[MPI_SIGNED_CHAR]] , is added to the predefined datatypes of MPI-2, which corresponds to the ANSI C and ANSI C++ datatype `signed char`.

> [!note] Advice to users

> The types [[MPI_CHAR]] and [[MPI_CHARACTER]] are intended for characters, and so will be translated to preserve the printable representation, rather than the bit value, if sent between machines with different character codes. The types [[MPI_SIGNED_CHAR]] and [[MPI_UNSIGNED_CHAR]] should be used in C if the integer value should be preserved.

The types [[MPI_SIGNED_CHAR]] and [[MPI_UNSIGNED_CHAR]] can be used in reduction operations. [[MPI_CHAR]] (which represents printable characters) cannot be used in reduction operations. This is an extension to MPI-1.2, since MPI-1.2 does not allow the use of [[MPI_UNSIGNED_CHAR]] in reduction operations (and does not have the [[MPI_SIGNED_CHAR]] type).

In a heterogeneous environment, [[MPI_CHAR]] and [[MPI_WCHAR]] will be translated so as to preserve the printable charater, whereas [[MPI_SIGNED_CHAR]] and [[MPI_UNSIGNED_CHAR]] will be translated so as to preserve the integer value.

### Unsigned long long Type

A new type, `MPI_UNSIGNED_LONG_LONG` in C and `MPI::UNSIGNED_LONG_LONG` in C++ is added as an optional datatype.

> [!tip] Rationale

> The ISO C9X committee has voted to include `long long` and `unsigned long long` as standard C types.

## Canonical [[MPI_PACK]] and [[MPI_UNPACK]]



These functions read/write data to/from the buffer in the “external32” data format specified in Section [[io#External Data Representation: “external32”|External Data Representation: “external32”]] , and calculate the size needed for packing. Their first arguments specify the data format, for future extensibility, but for MPI-2 the only valid value of the `datarep` argument is “external32.”

> [!note] Advice to users

> These functions could be used, for example, to send typed data in a portable format from one MPI implementation to another.

The buffer will contain exactly the packed data, without headers.

![[API/MPI_PACK_EXTERNAL]]

![[API/MPI_UNPACK_EXTERNAL]]

![[API/MPI_PACK_EXTERNAL_SIZE]]

## Functions and Macros



An implementation is allowed to implement [[MPI_WTIME]] , [[MPI_WTICK]] , [[PMPI_WTIME]] , [[PMPI_WTICK]] , and the handle-conversion functions ( [[MPI_Group_f2c]] , etc.) in Section [[misc#Transfer of Handles|Transfer of Handles]] , and no others, as macros in C.

> [!warning] Advice to implementors

> Implementors should document which routines are implemented as macros.

> [!note] Advice to users

> If these routines are implemented as macros, they will not work with the MPI profiling interface.

## Profiling Interface

 The profiling interface, as described in Chapter 8 of MPI-1.1, must be supported for all MPI-2 functions, except those allowed as macros (See Section [[misc#Functions and Macros|Functions and Macros]] ). This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI function. The profiling interface in C++ is described in Section [[binding#Profiling|Profiling]] .

For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version. This is a change from MPI-1.2.
