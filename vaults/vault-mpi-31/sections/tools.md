# Tool Support



## Introduction

This chapter discusses interfaces that allow debuggers, performance analyzers, and other tools to extract information about the operation of MPI processes. Specifically, this chapter defines both the MPI profiling interface (Section [[tools#Profiling Interface|Profiling Interface]] ), which supports the transparent interception and inspection of MPI calls, and the MPI tool information interface (Section [[tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] ), which supports the inspection and manipulation of MPI control and performance variables. The interfaces described in this chapter are all defined in the context of an MPI process, i.e., are callable from the same code that invokes other MPI functions.

## Profiling Interface



### Requirements



To meet the requirements for the MPI profiling interface, an implementation of the MPI functions *must*

1.  provide a mechanism through which all of the MPI defined functions, except those allowed as macros (See Section [[terms#Functions and Macros|Functions and Macros]] ), may be accessed with a name shift. This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI

    function in each provided language binding and language support method. For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version.

    For Fortran, the different support methods cause several specific procedure names. Therefore, several profiling routines (with these specific procedure names) are needed for each Fortran MPI routine, as described in [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] .

2.  ensure that those MPI functions that are not replaced may still be linked into an executable image without causing name clashes.

3.  document the implementation of different language bindings of the MPI interface if they are layered on top of each other, so that the profiler developer knows whether she must implement the profile interface for each binding, or can economize by implementing it only for the lowest level routines.

4.  where the implementation of different language bindings is done through a layered approach (e.g., the Fortran binding is a set of “wrapper” functions that call the C implementation), ensure that these wrapper functions are separable from the rest of the library.

    This separability is necessary to allow a separate profiling library to be correctly implemented, since (at least with Unix linker semantics) the profiling library must contain these wrapper functions if it is to perform as expected. This requirement allows the person who builds the profiling library to extract these functions from the original MPI library and add them into the profiling library without bringing along any other unnecessary code.

5.  provide a no-op routine [[MPI_PCONTROL]] in the MPI library.

### Discussion

The objective of the MPI profiling interface is to ensure that it is relatively easy for authors of profiling (and other similar) tools to interface their codes to MPI implementations on different machines.

Since MPI is a machine independent standard with many different implementations, it is unreasonable to expect that the authors of profiling tools for MPI will have access to the source code that implements MPI on any particular machine. It is therefore necessary to provide a mechanism by which the implementors of such tools can collect whatever performance information they wish *without* access to the underlying implementation.

We believe that having such an interface is important if MPI is to be attractive to end users, since the availability of many different tools will be a significant factor in attracting users to the MPI standard.

The profiling interface is just that, an interface. It says *nothing* about the way in which it is used. There is therefore no attempt to lay down what information is collected through the interface, or how the collected information is saved, filtered, or displayed.

While the initial impetus for the development of this interface arose from the desire to permit the implementation of profiling tools, it is clear that an interface like that specified may also prove useful for other purposes, such as “internetworking” multiple MPI implementations. Since all that is defined is an interface, there is no objection to its being used wherever it is useful.

As the issues being addressed here are intimately tied up with the way in which executable images are built, which may differ greatly on different machines, the examples given below should be treated solely as one way of implementing the objective of the MPI profiling interface. The actual requirements made of an implementation are those detailed in the Requirements section above, the whole of the rest of this section is only present as justification and discussion of the logic for those requirements.

The examples below show one way in which an implementation could be constructed to meet the requirements on a Unix system (there are doubtless others that would be equally valid).

### Logic of the Design

Provided that an MPI implementation meets the requirements above, it is possible for the implementor of the profiling system to intercept the MPI calls that are made by the user program. She can then collect whatever information she requires before calling the underlying MPI implementation (through its name shifted entry points) to achieve the desired effects.

### Miscellaneous Control of Profiling

There is a clear requirement for the user code to be able to control the profiler dynamically at run time. This capability is normally used for (at least) the purposes of

- Enabling and disabling profiling depending on the state of the calculation.

- Flushing trace buffers at non-critical points in the calculation.

- Adding user events to a trace file.

These requirements are met by use of [[MPI_PCONTROL]] .

![[API/MPI_PCONTROL]]

MPI libraries themselves make no use of this routine, and simply return immediately to the user code. However the presence of calls to this routine allows a profiling package to be explicitly called by the user.

Since MPI has no control of the implementation of the profiling code, we are unable to specify precisely the semantics that will be provided by calls to [[MPI_PCONTROL]] . This vagueness extends to the number of arguments to the function, and their datatypes.

However to provide some level of portability of user codes to different profiling libraries, we request the following meanings for certain values of level.

- `level==0` Profiling is disabled.

- `level==1` Profiling is enabled at a normal default level of detail.

- `level==2` Profile buffers are flushed, which may be a no-op in some profilers.

- All other values of `level` have profile library defined effects and additional arguments.

We also request that the default state after [[MPI_INIT]] has been called is for profiling to be enabled at the normal default level. (i.e., as if [[MPI_PCONTROL]] had just been called with the argument 1). This allows users to link with a profiling library and to obtain profile output without having to modify their source code at all.

The provision of [[MPI_PCONTROL]] as a no-op in the standard MPI library supports the collection of more detailed profiling information with source code that can still link against the standard MPI library.

### Profiler Implementation Example

A profiler can accumulate the total amount of data sent by the [[MPI_SEND]] function, along with the total elapsed time spent in the function as the following example shows:

    static int totalBytes = 0;
    static double totalTime = 0.0;

    int MPI_Send(const void* buffer, int count, MPI_Datatype datatype,
                 int dest, int tag, MPI_Comm comm)
    {
       double tstart = MPI_Wtime();       /* Pass on all arguments */
       int size;
       int result    = PMPI_Send(buffer,count,datatype,dest,tag,comm);   

       totalTime  += MPI_Wtime() - tstart;         /* and time          */

       MPI_Type_size(datatype, &size);  /* Compute size */
       totalBytes += count*size;

       return result;                       
    }

### MPI Library Implementation Example

If the MPI library is implemented in C on a Unix system, then there are various options, including the two presented here, for supporting the name-shift requirement. The choice between these two options depends partly on whether the linker and compiler support weak symbols.

#### Systems with Weak Symbols

If the compiler and linker support weak external symbols (e.g., Solaris 2.x, other System V.4 machines), then only a single library is required as the following example shows:

    #pragma weak MPI_Example = PMPI_Example

    int PMPI_Example(/* appropriate args */)
    {
        /* Useful content */        
    }

The effect of this `#pragma` is to define the external symbol `MPI_Example` as a weak definition. This means that the linker will not complain if there is another definition of the symbol (for instance in the profiling library); however if no other definition exists, then the linker will use the weak definition.

#### Systems Without Weak Symbols

In the absence of weak symbols then one possible solution would be to use the C macro preprocessor as the following example shows:

    #ifdef PROFILELIB
    #    ifdef __STDC__
    #        define FUNCTION(name) P##name
    #    else
    #        define FUNCTION(name) P/**/name
    #    endif
    #else
    #    define FUNCTION(name) name
    #endif

Each of the user visible functions in the library would then be declared thus

    int FUNCTION(MPI_Example)(/* appropriate args */)
    {
        /* Useful content */        
    }

The same source file can then be compiled to produce both versions of the library, depending on the state of the `PROFILELIB` macro symbol.

It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This is a somewhat unpleasant requirement, since it may mean that each external function has to be compiled from a separate file. However this is necessary so that the author of the profiling library need only define those MPI functions that she wishes to intercept, references to any others being fulfilled by the normal MPI library. Therefore the link step can look something like this

    % cc ... -lmyprof -lpmpi -lmpi

Here `libmyprof.a` contains the profiler functions that intercept some of the MPI functions, `libpmpi.a` contains the “name shifted” MPI functions, and `libmpi.a` contains the normal definitions of the MPI functions.

### Complications



#### Multiple Counting

Since parts of the MPI library may themselves be implemented using more basic MPI functions (e.g., a portable implementation of the collective operations implemented using point to point communications), there is potential for profiling functions to be called from within an MPI function that was called from a profiling function. This could lead to “double counting” of the time spent in the inner routine. Since this effect could actually be useful under some circumstances (e.g., it might allow one to answer the question “How much time is spent in the point to point routines when they are called from collective functions?”), we have decided not to enforce any restrictions on the author of the MPI library that would overcome this. Therefore the author of the profiling library should be aware of this problem, and guard against it. In a single-threaded world this is easily achieved through use of a static variable in the profiling code that remembers if you are already inside a profiling routine. It becomes more complex in a multi-threaded environment (as does the meaning of the times recorded).

#### Linker Oddities

The Unix linker traditionally operates in one pass: the effect of this is that functions from libraries are only included in the image if they are needed at the time the library is scanned. When combined with weak symbols, or multiple definitions of the same function, this can cause odd (and unexpected) effects.

Consider, for instance, an implementation of MPI in which the Fortran binding is achieved by using wrapper functions on top of the C implementation. The author of the profile library then assumes that it is reasonable only to provide profile functions for the C binding, since Fortran will eventually call these, and the cost of the wrappers is assumed to be small. However, if the wrapper functions are not in the profiling library, then none of the profiled entry points will be undefined when the profiling library is called. Therefore none of the profiling code will be included in the image. When the standard MPI library is scanned, the Fortran wrappers will be resolved, and will also pull in the base versions of the MPI functions. The overall effect is that the code will link successfully, but will not be profiled.

To overcome this we must ensure that the Fortran wrapper functions are included in the profiling version of the library. We ensure that this is possible by requiring that these be separable from the rest of the base MPI library. This allows them to be copied out of the base library and into the profiling one using a tool such as `ar`.

#### Fortran Support Methods

The different Fortran support methods and possible options for the support of subarrays (depending on whether the compiler can support `TYPE(*), DIMENSION(..)` choice buffers) imply different specific procedure names for the same Fortran MPI routine. The rules and implications for the profiling interface are described in [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] .

### Multiple Levels of Interception

The scheme given here does not directly support the nesting of profiling functions, since it provides only a single alternative name for each MPI function. Consideration was given to an implementation that would allow multiple levels of call interception, however we were unable to construct an implementation of this that did not have the following disadvantages

- assuming a particular implementation language,

- imposing a run time cost even when no profiling was taking place.

Since one of the objectives of MPI is to permit efficient, low latency implementations, and it is not the business of a standard to require a particular implementation language, we decided to accept the scheme outlined above.

Note, however, that it is possible to use the scheme above to implement a multi-level system, since the function called by the user may call many different profiling functions before calling the underlying MPI function. This capability has been demonstrated in the P$`^N`$MPI tool infrastructure .

## The MPI Tool Information Interface



MPI implementations often use internal variables to control their operation and performance. Understanding and manipulating these variables can provide a more efficient execution environment or improve performance for many applications. This section describes the MPI tool information interface, which provides a mechanism for MPI implementors to expose variables, each of which represents a particular property, setting, or performance measurement from within the MPI implementation. The interface is split into two parts: the first part provides information about and supports the setting of control variables through which the MPI implementation tunes its configuration. The second part provides access to performance variables that can provide insight into internal performance information of the MPI implementation.

To avoid restrictions on the MPI implementation, the MPI tool information interface allows the implementation to specify which control and performance variables exist. Additionally, the user of the MPI tool information interface can obtain metadata about each available variable, such as its datatype, and a textual description. The MPI tool information interface provides the necessary routines to find all variables that exist in a particular MPI implementation, to query their properties, to retrieve descriptions about their meaning, and to access and, if appropriate, to alter their values.

Variables and categories across connected processes with equivalent names are required to have the same meaning (see the definition of “equivalent” as related to strings in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] ). Furthermore, enumerations with equivalent names across connected processes are required to have the same meaning, but are allowed to comprise different enumeration items. Enumeration items that have equivalent names across connected processes in enumerations with the same meaning must also have the same meaning. In order for variables and categories to have the same meaning, routines in the tools information interface that return details for those variables and categories have requirements on what parameters must be identical. These requirements are specified in their respective sections.

> [!tip] Rationale

> The intent of requiring the same meaning for entities with equivalent names is to enforce consistency across connected processes. For example, variables describing the number of packets sent on different types of network devices should have different names to reflect their potentially different meanings.

The MPI tool information interface can be used independently from the MPI communication functionality. In particular, the routines of this interface can be called before [[MPI_INIT]] (or equivalent) and after [[MPI_FINALIZE]] . In order to support this behavior cleanly, the MPI tool information interface uses separate initialization and finalization routines. All identifiers used in the MPI tool information interface have the prefix MPI_T\_.

On success, all MPI tool information interface routines return `MPI_SUCCESS`, otherwise they return an appropriate and unique return code indicating the reason why the call was not successfully completed. Details on return codes can be found in Section [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] . However, unsuccessful calls to the MPI tool information interface are not fatal and do not impact the execution of subsequent MPI routines.

Since the MPI tool information interface primarily focuses on tools and support libraries, MPI implementations are only required to provide C bindings for functions and constants introduced in this section. Except where otherwise noted, all conventions and principles governing the C bindings of the MPI API also apply to the MPI tool information interface, which is available by including the `mpi.h` header file. All routines in this interface have local semantics.

> [!note] Advice to users

> The number and type of control variables and performance variables can vary between MPI implementations, platforms and different builds of the same implementation on the same platform as well as between runs. Hence, any application relying on a particular variable will not be portable. Further, there is no guarantee that the number of variables and variable indices are the same across connected processes.
>
> This interface is primarily intended for performance monitoring tools, support tools, and libraries controlling the application’s environment. When maximum portability is desired, application programmers should either avoid using the MPI tool information interface or avoid being dependent on the existence of a particular control or performance variable.

### Verbosity Levels



The MPI tool information interface provides access to internal configuration and performance information through a set of control and performance variables defined by the MPI implementation. Since some implementations may export a large number of variables, variables are classified by a verbosity level that categorizes both their intended audience (end users, performance tuners or MPI implementors) and a relative measure of level of detail (basic, detailed or all). These verbosity levels are described by a single integer. Table [[tools#Verbosity Levels|Verbosity Levels]] lists the constants for all possible verbosity levels. The values of the constants are monotonic in the order listed in the table; i.e., `MPI_T_VERBOSITY_USER_BASIC` $`<`$ `MPI_T_VERBOSITY_USER_DETAIL` $`<`$ ... $`<`$ `MPI_T_VERBOSITY_MPIDEV_ALL`.

|  |  |
|:---|:---|
| `MPI_T_VERBOSITY_USER_BASIC` | Basic information of interest to users |
| `MPI_T_VERBOSITY_USER_DETAIL` | Detailed information of interest to users |
| `MPI_T_VERBOSITY_USER_ALL` | All remaining information of interest to users |
| `MPI_T_VERBOSITY_TUNER_BASIC` | Basic information required for tuning |
| `MPI_T_VERBOSITY_TUNER_DETAIL` | Detailed information required for tuning |
| `MPI_T_VERBOSITY_TUNER_ALL` | All remaining information required for tuning |
| `MPI_T_VERBOSITY_MPIDEV_BASIC` | Basic information for MPI implementors |
| `MPI_T_VERBOSITY_MPIDEV_DETAIL` | Detailed information for MPI implementors |
| `MPI_T_VERBOSITY_MPIDEV_ALL` | All remaining information for MPI implementors |

MPI tool information interface verbosity levels



### Binding MPI Tool Information Interface Variables to MPI Objects



Each MPI tool information interface variable provides access to a particular control setting or performance property of the MPI implementation. A variable may refer to a specific MPI object such as a communicator, datatype, or one-sided communication window, or the variable may refer more generally to the MPI environment of the process. Except for the last case, the variable must be bound to exactly one MPI object before it can be used. Table [[tools#Binding MPI Tool Information Interface Variables to MPI Objects|Binding MPI Tool Information Interface Variables to MPI Objects]] lists all MPI object types to which an MPI tool information interface variable can be bound, together with the matching constant that MPI tool information interface routines return to identify the object type.

| Constant                    | MPI object                                  |
|:----------------------------|:--------------------------------------------|
| `MPI_T_BIND_NO_OBJECT`      | N/A; applies globally to entire MPI process |
| `MPI_T_BIND_MPI_COMM`       | MPI communicators                           |
| `MPI_T_BIND_MPI_DATATYPE`   | MPI datatypes                               |
| `MPI_T_BIND_MPI_ERRHANDLER` | MPI error handlers                          |
| `MPI_T_BIND_MPI_FILE`       | MPI file handles                            |
| `MPI_T_BIND_MPI_GROUP`      | MPI groups                                  |
| `MPI_T_BIND_MPI_OP`         | MPI reduction operators                     |
| `MPI_T_BIND_MPI_REQUEST`    | MPI requests                                |
| `MPI_T_BIND_MPI_WIN`        | MPI windows for one-sided communication     |
| `MPI_T_BIND_MPI_MESSAGE`    | MPI message object                          |
| `MPI_T_BIND_MPI_INFO`       | MPI info object                             |

Constants to identify associations of variables



> [!tip] Rationale

> Some variables have meanings tied to a specific MPI object. Examples include the number of send or receive operations that use a particular datatype, the number of times a particular error handler has been called, or the communication protocol and “eager limit” used for a particular communicator. Creating a new MPI tool information interface variable for each MPI object would cause the number of variables to grow without bound, since they cannot be reused to avoid naming conflicts. By associating MPI tool information interface variables with a specific MPI object, the MPI implementation only must specify and maintain a single variable, which can then be applied to as many MPI objects of the respective type as created during the program’s execution.

### Convention for Returning Strings



Several MPI tool information interface functions return one or more strings. These functions have two arguments for each string to be returned: an OUT parameter that identifies a pointer to the buffer in which the string will be returned, and an IN/OUT parameter to pass the length of the buffer. The user is responsible for the memory allocation of the buffer and must pass the size of the buffer ($`n`$) as the length argument. Let $`n`$ be the length value specified to the function. On return, the function writes at most $`n-1`$ of the string’s characters into the buffer, followed by a null terminator. If the returned string’s length is greater than or equal to $`n`$, the string will be truncated to $`n-1`$ characters. In this case, the length of the string plus one (for the terminating null character) is returned in the length argument. If the user passes the null pointer as the buffer argument or passes 0 as the length argument, the function does not return the string and only returns the length of the string plus one in the length argument. If the user passes the null pointer as the length argument, the buffer argument is ignored and nothing is returned.

MPI implementations behave as if they have an internal character array that is copied to the output character array supplied by the user. Such output strings are only defined to be equivalent if their notional source-internal character arrays are identical (up to and including the null terminator), even if the output string is truncated due to a small input length parameter $`n`$.

### Initialization and Finalization



The MPI tool information interface requires a separate set of initialization and finalization routines.

![[API/MPI_T_INIT_THREAD]]

All programs or tools that use the MPI tool information interface must initialize the MPI tool information interface in the processes that will use the interface before calling any other of its routines. A user can initialize the MPI tool information interface by calling [[MPI_T_INIT_THREAD]] , which can be called multiple times. In addition, this routine initializes the thread environment for all routines in the MPI tool information interface. Calling this routine when the MPI tool information interface is already initialized has no effect beyond increasing the reference count of how often the interface has been initialized. The argument `required` is used to specify the desired level of thread support. The possible values and their semantics are identical to the ones that can be used with [[MPI_INIT_THREAD]] listed in Section [[ei#MPI and Threads|MPI and Threads]] . The call returns in `provided` information about the actual level of thread support that will be provided by the MPI implementation for calls to MPI tool information interface routines. It can be one of the four values listed in Section [[ei#MPI and Threads|MPI and Threads]] .

The MPI specification does not require all MPI processes to exist before the call to [[MPI_INIT]] . If the MPI tool information interface is used before [[MPI_INIT]] has been called, the user is responsible for ensuring that the MPI tool information interface is initialized on all processes it is used in. Processes created by the MPI implementation during [[MPI_INIT]] inherit the status of the MPI tool information interface (whether it is initialized or not as well as all active sessions and handles) from the process from which they are created.

Processes created at runtime as a result of calls to MPI’s dynamic process management require their own initialization before they can use the MPI tool information interface.

> [!note] Advice to users

> If [[MPI_T_INIT_THREAD]] is called before [[MPI_INIT_THREAD]] , the requested and granted thread level for [[MPI_T_INIT_THREAD]] may influence the behavior and return value of [[MPI_INIT_THREAD]] . The same is true for the reverse order.

> [!warning] Advice to implementors

> MPI implementations should strive to make as many control or performance variables available before [[MPI_INIT]] (instead of adding them within [[MPI_INIT]] ) to allow tools the most flexibility. In particular, control variables should be available before [[MPI_INIT]] if their value cannot be changed after [[MPI_INIT]] .

![[API/MPI_T_FINALIZE]]

This routine finalizes the use of the MPI tool information interface and may be called as often as the corresponding [[MPI_T_INIT_THREAD]] routine up to the current point of execution. Calling it more times returns a corresponding error code. As long as the number of calls to [[MPI_T_FINALIZE]] is smaller than the number of calls to [[MPI_T_INIT_THREAD]] up to the current point of execution, the MPI tool information interface remains initialized and calls to its routines are permissible. Further, additional calls to [[MPI_T_INIT_THREAD]] after one or more calls to [[MPI_T_FINALIZE]] are permissible.

Once [[MPI_T_FINALIZE]] is called the same number of times as the routine [[MPI_T_INIT_THREAD]] up to the current point of execution, the MPI tool information interface is no longer initialized. The interface can be reinitialized by subsequent calls to [[MPI_T_INIT_THREAD]] .

At the end of the program execution, unless [[MPI_ABORT]] is called, an application must have called [[MPI_T_INIT_THREAD]] and [[MPI_T_FINALIZE]] an equal number of times.

### Datatype System



All variables managed through the MPI tool information interface represent their values through typed buffers of a given length and type using an MPI datatype (similar to regular send/receive buffers). Since the initialization of the MPI tool information interface is separate from the initialization of MPI, MPI tool information interface routines can be called before [[MPI_INIT]] . Consequently, these routines can also use MPI datatypes before [[MPI_INIT]] . Therefore, within the context of the MPI tool information interface, it is permissible to use a subset of MPI datatypes as specified below before a call to [[MPI_INIT]] (or equivalent).

|                          |
|:-------------------------|
| `MPI_INT`                |
| `MPI_UNSIGNED`           |
| `MPI_UNSIGNED_LONG`      |
| `MPI_UNSIGNED_LONG_LONG` |
| `MPI_COUNT`              |
| `MPI_CHAR`               |
| `MPI_DOUBLE`             |

MPI datatypes that can be used by the MPI tool information interface



> [!tip] Rationale

> The MPI tool information interface relies mainly on unsigned datatypes for integer values since most variables are expected to represent counters or resource sizes. `MPI_INT` is provided for additional flexibility and is expected to be used mainly for control variables and enumeration types (see below).
>
> Providing all basic datatypes, in particular providing all signed and unsigned variants of integer types, would lead to a larger number of types, which tools need to interpret. This would cause unnecessary complexity in the implementation of tools based on the MPI tool information interface.

The MPI tool information interface only relies on a subset of the basic MPI datatypes and does not use any derived MPI datatypes. Table [[tools#Datatype System|Datatype System]] lists all MPI datatypes that can be returned by the MPI tool information interface to represent its variables.

The use of the datatype `MPI_CHAR` in the MPI tool information interface implies a null-terminated character array, i.e., a string in the C language. If a variable has type `MPI_CHAR`, the value of the `count` parameter returned by [[MPI_T_CVAR_HANDLE_ALLOC]] and [[MPI_T_PVAR_HANDLE_ALLOC]] must be large enough to include any valid value, including its terminating null character. The contents of returned `MPI_CHAR` arrays are only defined from index 0 through the location of the first null character.

> [!tip] Rationale

> The MPI tool information interface requires a significantly simpler type system than MPI itself. Therefore, only its required subset must be present before [[MPI_INIT]] (or equivalent) and MPI implementations do not need to initialize the complete MPI datatype system.

For variables of type `MPI_INT`, an MPI implementation can provide additional information by associating names with a fixed number of values. We refer to this information in the following as an enumeration. In this case, the respective calls that provide additional metadata for each control or performance variable, i.e., [[MPI_T_CVAR_GET_INFO]] (Section [[tools#Control Variables|Control Variables]] ) and [[MPI_T_PVAR_GET_INFO]] (Section [[tools#Performance Variables|Performance Variables]] ), return a handle of type `MPI_T_enum` that can be passed to the following functions to extract additional information. Thus, the MPI implementation can describe variables with a fixed set of values that each represents a particular state. Each enumeration type can have $`N`$ different values, with a fixed $`N`$ that can be queried using [[MPI_T_ENUM_GET_INFO]] .

![[API/MPI_T_ENUM_GET_INFO]]

If `enumtype` is a valid enumeration, this routine returns the number of items represented by this enumeration type as well as its name. $`N`$ must be greater than $`0`$, i.e., the enumeration must represent at least one value.

The arguments `name` and `name``_len` are used to return the name of the enumeration as described in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] .

The routine is required to return a name of at least length one. This name must be unique with respect to all other names for enumerations that the MPI implementation uses.

Names associated with individual values in each enumeration `enumtype` can be queried using [[MPI_T_ENUM_GET_ITEM]] .

![[API/MPI_T_ENUM_GET_ITEM]]

The arguments `name` and `name``_len` are used to return the name of the enumeration item as described in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] .

If completed successfully, the routine returns the name/value pair that describes the enumeration at the specified index. The call is further required to return a name of at least length one. This name must be unique with respect to all other names of items for the same enumeration.

### Control Variables



The routines described in this section of the MPI tool information interface specification focus on the ability to list, query, and possibly set control variables exposed by the MPI implementation. These variables can typically be used by the user to fine tune properties and configuration settings of the MPI implementation. On many systems, such variables can be set using environment variables, although other configuration mechanisms may be available, such as configuration files or central configuration registries. A typical example that is available in several existing MPI implementations is the ability to specify an “eager limit,” i.e., an upper bound on the size of messages sent or received using an eager protocol.

#### Control Variable Query Functions

An MPI implementation exports a set of $`N`$ control variables through the MPI tool information interface. If $`N`$ is zero, then the MPI implementation does not export any control variables, otherwise the provided control variables are indexed from $`0`$ to $`N-1`$. This index number is used in subsequent calls to identify the individual variables.

An MPI implementation is allowed to increase the number of control variables during the execution of an MPI application when new variables become available through dynamic loading. However, MPI implementations are not allowed to change the index of a control variable or to delete a variable once it has been added to the set. When a variable becomes inactive, e.g., through dynamic unloading, accessing its value should return a corresponding error code.

> [!note] Advice to users

> While the MPI tool information interface guarantees that indices or variable properties do not change during a particular run of an MPI program, it does not provide a similar guarantee between runs.

The following function can be used to query the number of control variables, $`num_cvar`$:

![[API/MPI_T_CVAR_GET_NUM]]

The function [[MPI_T_CVAR_GET_INFO]] provides access to additional information for each variable.

![[API/MPI_T_CVAR_GET_INFO]]

After a successful call to [[MPI_T_CVAR_GET_INFO]] for a particular variable, subsequent calls to this routine that query information about the same variable must return the same information. An MPI implementation is not allowed to alter any of the returned values.

If any `OUT` parameter to [[MPI_T_CVAR_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.

The arguments `name` and `name``_len` are used to return the name of the control variable as described in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] .

If completed successfully, the routine is required to return a name of at least length one. The name must be unique with respect to all other names for control variables used by the MPI implementation.

The argument `verbosity` returns the verbosity level of the variable (see Section [[tools#Verbosity Levels|Verbosity Levels]] ).

The argument `datatype` returns the MPI datatype that is used to represent the control variable.

If the variable is of type `MPI_INT`, MPI can optionally specify an enumeration for the values represented by this variable and return it in `enumtype`. In this case, MPI returns an enumeration identifier, which can then be used to gather more information as described in Section [[tools#Datatype System|Datatype System]] . Otherwise, `enumtype` is set to `MPI_T_ENUM_NULL`. If the datatype is not `MPI_INT` or the argument `enumtype` is the null pointer, no enumeration type is returned.

The arguments `desc` and `desc``_len` are used to return a description of the control variable as described in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] .

Returning a description is optional. If an MPI implementation does not return a description, the first character for `desc` must be set to the null character and `desc_len` must be set to one at the return of this call.

The parameter `bind` returns the type of the MPI object to which the variable must be bound or the value `MPI_T_BIND_NO_OBJECT` (see Section [[tools#Binding MPI Tool Information Interface Variables to MPI Objects|Binding MPI Tool Information Interface Variables to MPI Objects]] ).

The scope of a variable determines whether changing a variable’s value is either local to the process or must be done by the user across multiple processes. The latter is further split into variables that require changes in a group of processes and those that require collective changes among all connected processes. Both cases can require all processes either to be set to consistent (but potentially different) values or to equal values on every participating process. The description provided with the variable must contain an explanation about the requirements and/or restrictions for setting the particular variable.

On successful return from [[MPI_T_CVAR_GET_INFO]] , the argument `scope` will be set to one of the constants listed in Table [[tools#Control Variable Query Functions|Control Variable Query Functions]] .

If the name of a control variable is equivalent across connected processes, the following `OUT` parameters must be identical: `verbosity`, `datatype`, `enumtype`, `bind`, and `scope`. The returned description must be equivalent.

| Scope Constant | Description |
|:---|:---|
| `MPI_T_SCOPE_CONSTANT` | read-only, value is constant |
| `MPI_T_SCOPE_READONLY` | read-only, cannot be written, but can change |
| `MPI_T_SCOPE_LOCAL` | may be writeable, writing is a local operation |
| `MPI_T_SCOPE_GROUP` | may be writeable, must be done to a group of processes, |
|  | all processes in a group must be set to consistent values |
| `MPI_T_SCOPE_GROUP_EQ` | may be writeable, must be done to a group of processes, |
|  | all processes in a group must be set to the same value |
| `MPI_T_SCOPE_ALL` | may be writeable, must be done to all processes, |
|  | all connected processes must be set to consistent values |
| `MPI_T_SCOPE_ALL_EQ` | may be writeable, must be done to all processes, |
|  | all connected processes must be set to the same value |

Scopes for control variables



> [!note] Advice to users

> The `scope` of a variable only indicates if a variable might be changeable; it is not a guarantee that it can be changed at any time.

![[API/MPI_T_CVAR_GET_INDEX]]

[[MPI_T_CVAR_GET_INDEX]] is a function for retrieving the index of a control variable given a known variable name. The `name` parameter is provided by the caller, and `cvar_index` is returned by the MPI implementation. The `name` parameter is a string terminated with a null character.

This routine returns `MPI_SUCCESS` on success and returns `MPI_T_ERR_INVALID_NAME` if `name` does not match the name of any control variable provided by the implementation at the time of the call.

> [!tip] Rationale

> This routine is provided to enable fast retrieval of control variables by a tool, assuming it knows the name of the variable for which it is looking. The number of variables exposed by the implementation can change over time, so it is not possible for the tool to simply iterate over the list of variables once at initialization. Although using MPI implementation specific variable names is not portable across MPI implementations, tool developers may choose to take this route for lower overhead at runtime because the tool will not have to iterate over the entire set of variables to find a specific one.

#### Example: Printing All Control Variables

The following example shows how the MPI tool information interface can be used to query and to print the names of all available control variables.

    #include <stdio.h>
    #include <stdlib.h>
    #include <mpi.h>

    int main(int argc, char *argv[]) {
      int i, err, num, namelen, bind, verbose, scope;
      int threadsupport;
      char name[100];
      MPI_Datatype datatype;
            
      err=MPI_T_init_thread(MPI_THREAD_SINGLE,&threadsupport);
      if (err!=MPI_SUCCESS) 
        return err;
                    
      err=MPI_T_cvar_get_num(&num);
      if (err!=MPI_SUCCESS) 
        return err;

      for (i=0; i<num; i++) {
        namelen=100;
        err=MPI_T_cvar_get_info(i, name, &namelen,
                &verbose, &datatype, NULL,
                NULL, NULL, /*no description */
                &bind, &scope);
        if (err!=MPI_SUCCESS || err!=MPI_T_ERR_INVALID_INDEX) return err;
        printf("Var %i: %s\n", i, name);
      }
      
      err=MPI_T_finalize();
      if (err!=MPI_SUCCESS) 
        return 1;
      else
        return 0;
    }

#### Handle Allocation and Deallocation

Before reading or writing the value of a variable, a user must first allocate a handle of type `MPI_T_cvar_handle` for the variable by binding it to an MPI object (see also Section [[tools#Binding MPI Tool Information Interface Variables to MPI Objects|Binding MPI Tool Information Interface Variables to MPI Objects]] ).

> [!tip] Rationale

> Handles used in the MPI tool information interface are distinct from handles used in the remaining parts of the MPI standard because they must be usable before [[MPI_INIT]] and after [[MPI_FINALIZE]] . Further, accessing handles, in particular for performance variables, can be time critical and having a separate handle space enables optimizations.

![[API/MPI_T_CVAR_HANDLE_ALLOC]]

This routine binds the control variable specified by the argument `index` to an MPI object. The object is passed in the argument `obj_handle` as an address to a local variable that stores the object’s handle. The argument `obj_handle` is ignored if the [[MPI_T_CVAR_GET_INFO]] call for this control variable returned `MPI_T_BIND_NO_OBJECT` in the argument `bind`. The handle allocated to reference the variable is returned in the argument `handle`. Upon successful return, `count` contains the number of elements (of the datatype returned by a previous [[MPI_T_CVAR_GET_INFO]] call) used to represent this variable.

> [!note] Advice to users

> The `count` can be different based on the MPI object to which the control variable was bound. For example, variables bound to communicators could have a count that matches the size of the communicator.
>
> It is not portable to pass references to predefined MPI object handles, such as `MPI_COMM_WORLD` to this routine, since their implementation depends on the MPI library. Instead, such object handles should be stored in a local variable and the address of this local variable should be passed into [[MPI_T_CVAR_HANDLE_ALLOC]] .

The value of `cvar_index` should be in the range $`0`$ to $`num_cvar-1`$, where $`num_cvar`$ is the number of available control variables as determined from a prior call to [[MPI_T_CVAR_GET_NUM]] . The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to [[MPI_T_CVAR_GET_INFO]] .

![[API/MPI_T_CVAR_HANDLE_FREE]]

When a handle is no longer needed, a user of the MPI tool information interface should call [[MPI_T_CVAR_HANDLE_FREE]] to free the handle and the associated resources in the MPI implementation. On a successful return, MPI sets the handle to `MPI_T_CVAR_HANDLE_NULL`.

#### Control Variable Access Functions

![[API/MPI_T_CVAR_READ]]

This routine queries the value of a control variable identified by the argument `handle` and stores the result in the buffer identified by the parameter `buf`. The user must ensure that the buffer is of the appropriate size to hold the entire value of the control variable (based on the returned datatype and count from prior corresponding calls to [[MPI_T_CVAR_GET_INFO]] and [[MPI_T_CVAR_HANDLE_ALLOC]] , respectively).

![[API/MPI_T_CVAR_WRITE]]

This routine sets the value of the control variable identified by the argument `handle` to the data stored in the buffer identified by the parameter `buf`. The user must ensure that the buffer is of the appropriate size to hold the entire value of the control variable (based on the returned datatype and count from prior corresponding calls to [[MPI_T_CVAR_GET_INFO]] and [[MPI_T_CVAR_HANDLE_ALLOC]] , respectively).

If the variable has a global scope (as returned by a prior corresponding [[MPI_T_CVAR_GET_INFO]] call), any write call to this variable must be issued by the user in all connected (as defined in Section [[dynamic#Releasing Connections|Releasing Connections]] ) MPI processes. If the variable has group scope, any write call to this variable must be issued by the user in all MPI processes in the group, which must be described by the MPI implementation in the description by the [[MPI_T_CVAR_GET_INFO]] .

In both cases, the user must ensure that the writes in all processes are consistent. If the scope is either `MPI_T_SCOPE_ALL_EQ` or `MPI_T_SCOPE_GROUP_EQ` this means that the variable in all processes must be set to the same value.

If it is not possible to change the variable at the time the call is made, the function returns either `MPI_T_ERR_CVAR_SET_NOT_NOW`, if there may be a later time at which the variable could be set, or `MPI_T_ERR_CVAR_SET_NEVER`, if the variable cannot be set for the remainder of the application’s execution.

#### Example: Reading the Value of a Control Variable

The following example shows a routine that can be used to query the value with a control variable with a given index. The example assumes that the variable is intended to be bound to an MPI communicator.

    int getValue_int_comm(int index, MPI_Comm comm, int *val) {
      int err,count;
      MPI_T_cvar_handle handle;
        
      /* This example assumes that the variable index */
      /* can be bound to a communicator */

      err=MPI_T_cvar_handle_alloc(index,&comm,&handle,&count);
      if (err!=MPI_SUCCESS) return err;

      /* The following assumes that the variable is */
      /* represented by a single integer */

      err=MPI_T_cvar_read(handle,val);
      if (err!=MPI_SUCCESS) return err;

      err=MPI_T_cvar_handle_free(&handle);
      return err;
    }

### Performance Variables



The following section focuses on the ability to list and to query performance variables provided by the MPI implementation. Performance variables provide insight into MPI implementation specific internals and can represent information such as the state of the MPI implementation (e.g., waiting blocked, receiving, not active), aggregated timing data for submodules, or queue sizes and lengths.

> [!tip] Rationale

> The interface for performance variables is separate from the interface for control variables, since performance variables have different requirements and parameters. By keeping them separate, the interface provides cleaner semantics and allows for more performance optimization opportunities.

#### Performance Variable Classes



Each performance variable is associated with a class that describes its basic semantics, possible datatypes, basic behavior, its starting value, whether it can overflow, and when and how an MPI implementation can change the variable’s value. The starting value is the value that is assigned to the variable the first time that it is used or whenever it is reset.

> [!note] Advice to users

> If a performance variable belongs to a class that can overflow, it is up to the user to protect against this overflow, e.g., by frequently reading and resetting the variable value.

> [!warning] Advice to implementors

> MPI implementations should use large enough datatypes for each performance variable to avoid overflows under normal circumstances.

The classes are defined by the following constants:

- `MPI_T_PVAR_CLASS_STATE`\
  A performance variable in this class represents a set of discrete states. Variables of this class are represented by `MPI_INT` and can be set by the MPI implementation at any time. Variables of this type should be described further using an enumeration, as discussed in Section [[tools#Datatype System|Datatype System]] . The starting value is the current state of the implementation at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_LEVEL`\
  A performance variable in this class represents a value that describes the utilization level of a resource. The value of a variable of this class can change at any time to match the current utilization level of the resource. Values returned from variables in this class are non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_SIZE`\
  A performance variable in this class represents a value that is the size of a resource. Values returned from variables in this class are non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current size of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_PERCENTAGE`\
  The value of a performance variable in this class represents the percentage utilization of a finite resource. The value of a variable of this class can change at any time to match the current utilization level of the resource. It will be returned as an `MPI_DOUBLE` datatype. The value must always be between 0.0 (resource not used at all) and 1.0 (resource completely used). The starting value is the current percentage utilization level of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_HIGHWATERMARK`\
  A performance variable in this class represents a value that describes the high watermark utilization of a resource. The value of a variable of this class is non-negative and grows monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the variable is started or reset. MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_LOWWATERMARK`\
  A performance variable in this class represents a value that describes the low watermark utilization of a resource. The value of a variable of this class is non-negative and decreases monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the variable is started or reset. MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_COUNTER`\
  A performance variable in this class counts the number of occurrences of a specific event (e.g., the number of memory allocations within an MPI library). The value of a variable of this class increases monotonically from the initialization or reset of the performance variable by one for each specific event that is observed. Values must be non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`. The starting value for variables of this class is 0. Variables of this class can overflow.

- `MPI_T_PVAR_CLASS_AGGREGATE`\
  The value of a performance variable in this class is an an aggregated value that represents a sum of arguments processed during a specific event (e.g., the amount of memory allocated by all memory allocations). This class is similar to the counter class, but instead of counting individual events, the value can be incremented by arbitrary amounts. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. Variables of this class can overflow.

- `MPI_T_PVAR_CLASS_TIMER`\
  The value of a performance variable in this class represents the aggregated time that the MPI implementation spends executing a particular event, type of event, or section of the MPI library. This class has the same basic semantics as `MPI_T_PVAR_CLASS_AGGREGATE`, but explicitly records a timing value. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. If the type `MPI_DOUBLE` is used, the units that represent time in this datatype must match the units used by [[MPI_WTIME]] . Otherwise, the time units should be documented, e.g., in the description returned by [[MPI_T_PVAR_GET_INFO]] . Variables of this class can overflow.

- `MPI_T_PVAR_CLASS_GENERIC`\
  This class can be used to describe a variable that does not fit into any of the other classes. For variables in this class, the starting value is variable-specific and implementation-defined.

#### Performance Variable Query Functions

An MPI implementation exports a set of $`N`$ performance variables through the MPI tool information interface. If $`N`$ is zero, then the MPI implementation does not export any performance variables; otherwise the provided performance variables are indexed from $`0`$ to $`N-1`$. This index number is used in subsequent calls to identify the individual variables.

An MPI implementation is allowed to increase the number of performance variables during the execution of an MPI application when new variables become available through dynamic loading. However, MPI implementations are not allowed to change the index of a performance variable or to delete a variable once it has been added to the set. When a variable becomes inactive, e.g., through dynamic unloading, accessing its value should return a corresponding error code.

The following function can be used to query the number of performance variables, $`N`$:

![[API/MPI_T_PVAR_GET_NUM]]

The function [[MPI_T_PVAR_GET_INFO]] provides access to additional information for each variable.

![[API/MPI_T_PVAR_GET_INFO]]

After a successful call to [[MPI_T_PVAR_GET_INFO]] for a particular variable, subsequent calls to this routine that query information about the same variable must return the same information. An MPI implementation is not allowed to alter any of the returned values.

If any `OUT` parameter to [[MPI_T_PVAR_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.

The arguments `name` and `name``_len` are used to return the name of the performance variable as described in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] .

If completed successfully, the routine is required to return a name of at least length one.

The argument `verbosity` returns the verbosity level of the variable (see Section [[tools#Verbosity Levels|Verbosity Levels]] ).

The class of the performance variable is returned in the parameter `var_class`. The class must be one of the constants defined in Section [[tools#Performance Variable Classes|Performance Variable Classes]] .

The combination of the name and the class of the performance variable must be unique with respect to all other names for performance variables used by the MPI implementation.

> [!warning] Advice to implementors

> Groups of variables that belong closely together, but have different classes, can have the same name. This choice is useful, e.g., to refer to multiple variables that describe a single resource (like the level, the total size, as well as high and low watermarks).

The argument `datatype` returns the MPI datatype that is used to represent the performance variable.

If the variable is of type `MPI_INT`, MPI can optionally specify an enumeration for the values represented by this variable and return it in `enumtype`. In this case, MPI returns an enumeration identifier, which can then be used to gather more information as described in Section [[tools#Datatype System|Datatype System]] . Otherwise, `enumtype` is set to `MPI_T_ENUM_NULL`. If the datatype is not `MPI_INT` or the argument `enumtype` is the null pointer, no enumeration type is returned.

Returning a description is optional. If an MPI implementation does not return a description, the first character for `desc` must be set to the null character and `desc_len` must be set to one at the return from this function.

The parameter `bind` returns the type of the MPI object to which the variable must be bound or the value `MPI_T_BIND_NO_OBJECT` (see Section [[tools#Binding MPI Tool Information Interface Variables to MPI Objects|Binding MPI Tool Information Interface Variables to MPI Objects]] ).

Upon return, the argument `readonly` is set to zero if the variable can be written or reset by the user. It is set to one if the variable can only be read.

Upon return, the argument `continuous` is set to zero if the variable can be started and stopped by the user, i.e., it is possible for the user to control if and when the value of a variable is updated. It is set to one if the variable is always active and cannot be controlled by the user.

Upon return, the argument `atomic` is set to zero if the variable cannot be read and reset atomically. Only variables for which the call sets `atomic` to one can be used in a call to [[MPI_T_PVAR_READRESET]] .

If a performance variable has an equivalent name and has the same class across connected processes, the following `OUT` parameters must be identical: `verbosity`, `varclass`, `datatype`, `enumtype`, `bind`, `readonly`, `continuous`, and `atomic`. The returned description must be equivalent.

![[API/MPI_T_PVAR_GET_INDEX]]

[[MPI_T_PVAR_GET_INDEX]] is a function for retrieving the index of a performance variable given a known variable name and class. The `name` and `var_class` parameters are provided by the caller, and `pvar_index` is returned by the MPI implementation. The `name` parameter is a string terminated with a null character.

This routine returns `MPI_SUCCESS` on success and returns `MPI_T_ERR_INVALID_NAME` if `name` does not match the name of any performance variable of the specified `var_class` provided by the implementation at the time of the call.

> [!tip] Rationale

> This routine is provided to enable fast retrieval of performance variables by a tool, assuming it knows the name of the variable for which it is looking. The number of variables exposed by the implementation can change over time, so it is not possible for the tool to simply iterate over the list of variables once at initialization. Although using MPI implementation specific variable names is not portable across MPI implementations, tool developers may choose to take this route for lower overhead at runtime because the tool will not have to iterate over the entire set of variables to find a specific one.

#### Performance Experiment Sessions



Within a single program, multiple components can use the MPI tool information interface. To avoid collisions with respect to accesses to performance variables, users of the MPI tool information interface must first create a session. Subsequent calls that access performance variables can then be made within the context of this session. Any call executed in a session must not influence the results in any other session.

![[API/MPI_T_PVAR_SESSION_CREATE]]

This call creates a new session for accessing performance variables and returns a handle for this session in the argument `session` of type `MPI_T_pvar_session`.

![[API/MPI_T_PVAR_SESSION_FREE]]

This call frees an existing session. Calls to the MPI tool information interface can no longer be made within the context of a session after it is freed. On a successful return, MPI sets the session identifier to `MPI_T_PVAR_SESSION_NULL`.

#### Handle Allocation and Deallocation

Before using a performance variable, a user must first allocate a handle of type `MPI_T_pvar_handle` for the variable by binding it to an MPI object (see also Section [[tools#Binding MPI Tool Information Interface Variables to MPI Objects|Binding MPI Tool Information Interface Variables to MPI Objects]] ).

![[API/MPI_T_PVAR_HANDLE_ALLOC]]

This routine binds the performance variable specified by the argument `index` to an MPI object in the session identified by the parameter `session`. The object is passed in the argument `obj_handle` as an address to a local variable that stores the object’s handle. The argument `obj_handle` is ignored if the [[MPI_T_PVAR_GET_INFO]] call for this performance variable returned `MPI_T_BIND_NO_OBJECT` in the argument `bind`. The handle allocated to reference the variable is returned in the argument `handle`. Upon successful return, `count` contains the number of elements (of the datatype returned by a previous [[MPI_T_PVAR_GET_INFO]] call) used to represent this variable.

> [!note] Advice to users

> The `count` can be different based on the MPI object to which the performance variable was bound. For example, variables bound to communicators could have a count that matches the size of the communicator.
>
> It is not portable to pass references to predefined MPI object handles, such as `MPI_COMM_WORLD`, to this routine, since their implementation depends on the MPI library. Instead, such an object handle should be stored in a local variable and the address of this local variable should be passed into [[MPI_T_PVAR_HANDLE_ALLOC]] .

The value of index should be in the range $`0`$ to $`\texttt{num_pvar}-1`$, where $`\texttt{num_pvar}`$ is the number of available performance variables as determined from a prior call to [[MPI_T_PVAR_GET_NUM]] . The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to [[MPI_T_PVAR_GET_INFO]] .

For all routines in the rest of this section that take both `handle` and `session` as IN or INOUT arguments, if the `handle` argument passed in is not associated with the `session` argument, `MPI_T_ERR_INVALID_HANDLE` is returned.

![[API/MPI_T_PVAR_HANDLE_FREE]]

When a handle is no longer needed, a user of the MPI tool information interface should call [[MPI_T_PVAR_HANDLE_FREE]] to free the handle in the session identified by the parameter `session` and the associated resources in the MPI implementation. On a successful return, MPI sets the handle to `MPI_T_PVAR_HANDLE_NULL`.

#### Starting and Stopping of Performance Variables

Performance variables that have the continuous flag set during the query operation are continuously operating once a handle has been allocated. Such variables may be queried at any time, but they cannot be started or stopped by the user. All other variables are in a stopped state after their handle has been allocated; their values are not updated until they have been started by the user.

![[API/MPI_T_PVAR_START]]

This functions starts the performance variable with the handle identified by the parameter `handle` in the session identified by the parameter `session`.

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to start all variables within the session identified by the parameter `session` for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are started successfully (even if there are no non-continuous variables to be started), otherwise `MPI_T_ERR_PVAR_NO_STARTSTOP` is returned. Continuous variables and variables that are already started are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

![[API/MPI_T_PVAR_STOP]]

This functions stops the performance variable with the handle identified by the parameter `handle` in the session identified by the parameter `session`.

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to stop all variables within the session identified by the parameter `session` for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are stopped successfully (even if there are no non-continuous variables to be stopped), otherwise `MPI_T_ERR_PVAR_NO_STARTSTOP` is returned. Continuous variables and variables that are already stopped are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

#### Performance Variable Access Functions

![[API/MPI_T_PVAR_READ]]

The [[MPI_T_PVAR_READ]] call queries the value of the performance variable with the handle `handle` in the session identified by the parameter `session` and stores the result in the buffer identified by the parameter `buf`. The user is responsible to ensure that the buffer is of the appropriate size to hold the entire value of the performance variable (based on the datatype and count returned by the corresponding previous calls to [[MPI_T_PVAR_GET_INFO]] and [[MPI_T_PVAR_HANDLE_ALLOC]] , respectively).

The constant `MPI_T_PVAR_ALL_HANDLES` cannot be used as an argument for the function [[MPI_T_PVAR_READ]] .

![[API/MPI_T_PVAR_WRITE]]

The [[MPI_T_PVAR_WRITE]] call attempts to write the value of the performance variable with the handle identified by the parameter `handle` in the session identified by the parameter `session`. The value to be written is passed in the buffer identified by the parameter `buf`. The user must ensure that the buffer is of the appropriate size to hold the entire value of the performance variable (based on the datatype and count returned by the corresponding previous calls to [[MPI_T_PVAR_GET_INFO]] and [[MPI_T_PVAR_HANDLE_ALLOC]] , respectively).

If it is not possible to change the variable, the function returns `MPI_T_ERR_PVAR_NO_WRITE`.

The constant `MPI_T_PVAR_ALL_HANDLES` cannot be used as an argument for the function [[MPI_T_PVAR_WRITE]] .

![[API/MPI_T_PVAR_RESET]]

The [[MPI_T_PVAR_RESET]] call sets the performance variable with the handle identified by the parameter `handle` to its starting value specified in Section [[tools#Performance Variable Classes|Performance Variable Classes]] . If it is not possible to change the variable, the function returns `MPI_T_ERR_PVAR_NO_WRITE`.

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to reset all variables within the session identified by the parameter `session` for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are reset successfully (even if there are no valid handles or all are read-only), otherwise `MPI_T_ERR_PVAR_NO_WRITE` is returned. Read-only variables are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

![[API/MPI_T_PVAR_READRESET]]

This call atomically combines the functionality of [[MPI_T_PVAR_READ]] and [[MPI_T_PVAR_RESET]] with the same semantics as if these two calls were called separately. If atomic operations on this variable are not supported, this routine returns `MPI_T_ERR_PVAR_NO_ATOMIC`.

The constant `MPI_T_PVAR_ALL_HANDLES` cannot be used as an argument for the function [[MPI_T_PVAR_READRESET]] .

> [!warning] Advice to implementors

> Sampling-based tools rely on the ability to call the MPI tool information interface, in particular routines to start, stop, read, write, and reset performance variables, from any program context, including asynchronous contexts such as signal handlers. MPI implementations should strive, if possible in their particular environment, to enable these usage scenarios for all or a subset of the routines mentioned above. If implementing only a subset, the read, write, and reset routines are typically the most critical for sampling based tools. An MPI implementation should clearly document any restrictions on the program contexts in which the MPI tool information interface can be used. Restrictions might include guaranteeing usage outside of all signals or outside a specific set of signals. Any restrictions could be documented, for example, through the description returned by [[MPI_T_PVAR_GET_INFO]] .

> [!tip] Rationale

> All routines to read, to write or to reset performance variables require the session argument. This requirement keeps the interface consistent and allows the use of `MPI_T_PVAR_ALL_HANDLES` where appropriate. Further, this opens up additional performance optimizations for the implementation of handles.

#### Example: Tool to Detect Receives with Long Unexpected Message Queues

The following example shows a sample tool to identify receive operations that occur during times with long message queues. This examples assumes that the MPI implementation exports a variable with the name “`MPI_T_UMQ_LENGTH`” to represent the current length of the unexpected message queue. The tool is implemented as a PMPI tool using the MPI profiling interface.

The tool consists of three parts: (1) the initialization (by intercepting the call to [[MPI_INIT]] ), (2) the test for long unexpected message queues (by intercepting calls to [[MPI_RECV]] ), and (3) the clean-up phase (by intercepting the call to [[MPI_FINALIZE]] ). To capture all receives, the example would have to be extended to have similar wrappers for all receive operations.

##### Part 1— Initialization:

During initialization, the tool searches for the variable and, once the right index is found, allocates a session and a handle for the variable with the found index, and starts the performance variable.

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <assert.h>
    #include <mpi.h>

    /* Global variables for the tool */
    static MPI_T_pvar_session session;
    static MPI_T_pvar_handle handle;

    int MPI_Init(int *argc, char ***argv ) {
          int err, num, i, index, namelen, verbosity;
          int var_class, bind, threadsup;
          int readonly, continuous, atomic, count;
          char name[18];
          MPI_Comm comm;
          MPI_Datatype datatype;
          MPI_T_enum enumtype;

          err=PMPI_Init(argc,argv);
          if (err!=MPI_SUCCESS) return err;

          err=PMPI_T_init_thread(MPI_THREAD_SINGLE,&threadsup);
          if (err!=MPI_SUCCESS) return err;

          err=PMPI_T_pvar_get_num(&num);
          if (err!=MPI_SUCCESS) return err; 
          index=-1;
          i=0;
          while ((i<num) && (index<0) && (err==MPI_SUCCESS)) {
                /* Pass a buffer that is at least one character longer than */
                /* the name of the variable being searched for to avoid */
                /* finding variables that have a name that has a prefix */
                /* equal to the name of the variable being searched. */
                namelen=18;
                err=PMPI_T_pvar_get_info(i, name, &namelen, &verbosity, 
                        &var_class, &datatype, &enumtype, NULL, NULL, &bind, 
                        &readonly, &continuous, &atomic);
                if (strcmp(name,"MPI_T_UMQ_LENGTH")==0) index=i;        
                i++; }
          if (err!=MPI_SUCCESS) return err; 

          /* this could be handled in a more flexible way for a generic tool */
          assert(index>=0);
          assert(var_class==MPI_T_PVAR_CLASS_LEVEL);
          assert(datatype==MPI_INT);
          assert(bind==MPI_T_BIND_MPI_COMM);

          /* Create a session */
          err=PMPI_T_pvar_session_create(&session);
          if (err!=MPI_SUCCESS) return err;

          /* Get a handle and bind to MPI_COMM_WORLD */
          comm=MPI_COMM_WORLD;
          err=PMPI_T_pvar_handle_alloc(session, index, &comm, &handle, &count);
          if (err!=MPI_SUCCESS) return err;

          /* this could be handled in a more flexible way for a generic tool */
          assert(count==1);

          /* Start variable */
          err=PMPI_T_pvar_start(session, handle);
          if (err!=MPI_SUCCESS) return err;

          return MPI_SUCCESS;
    }

##### Part 2 — Testing the Queue Lengths During Receives:

During every receive operation, the tool reads the unexpected queue length through the matching performance variable and compares it against a predefined threshold.

    #define THRESHOLD 5

    int MPI_Recv(void *buf, int count, MPI_Datatype datatype, int source,
                 int tag, MPI_Comm comm, MPI_Status *status)
    {
            int value, err;

            if (comm==MPI_COMM_WORLD) {
                    err=PMPI_T_pvar_read(session, handle, &value);
                    if ((err==MPI_SUCCESS) && (value>THRESHOLD))
                    {
                            /* tool identified receive called with long UMQ */
                            /* execute tool functionality, */
                            /* e.g., gather and print call stack */
                    }                
            }

            return PMPI_Recv(buf, count, datatype, source, tag, comm, status);
    }         

##### Part 3 — Termination:

In the wrapper for [[MPI_FINALIZE]] , the MPI tool information interface is finalized.

    int MPI_Finalize(void)
    {
            int err;
            err=PMPI_T_pvar_handle_free(session, &handle);
            err=PMPI_T_pvar_session_free(&session);
            err=PMPI_T_finalize();
            return PMPI_Finalize();
    }

### Variable Categorization



MPI implementations can optionally group performance and control variables into categories to express logical relationships between various variables. For example, an MPI implementation could group all control and performance variables that refer to message transfers in the MPI implementation and thereby distinguish them from variables that refer to local resources such as memory allocations or other interactions with the operating system.

Categories can also contain other categories to form a hierarchical grouping. Categories can never include themselves, either directly or transitively within other included categories. Expanding on the example above, this allows MPI to refine the grouping of variables referring to message transfers into variables to control and to monitor message queues, message matching activities and communication protocols. Each of these groups of variables would be represented by a separate category and these categories would then be listed in a single category representing variables for message transfers.

The category information may be queried in a fashion similar to the mechanism for querying variable information. The MPI implementation exports a set of $`N`$ categories via the MPI tool information interface. If $`N=0`$, then the MPI implementation does not export any categories, otherwise the provided categories are indexed from $`0`$ to $`N-1`$. This index number is used in subsequent calls to functions of the MPI tool information interface to identify the individual categories.

An MPI implementation is permitted to increase the number of categories during the execution of an MPI program when new categories become available through dynamic loading. However, MPI implementations are not allowed to change the index of a category or delete it once it has been added to the set.

Similarly, MPI implementations are allowed to add variables to categories, but they are not allowed to remove variables from categories or change the order in which they are returned.

The following function can be used to query the number of categories, $`N`$.

![[API/MPI_T_CATEGORY_GET_NUM]]

Individual category information can then be queried by calling the following function:

![[API/MPI_T_CATEGORY_GET_INFO]]

The arguments `name` and `name``_len` are used to return the name of the category as described in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] .

The routine is required to return a name of at least length one. This name must be unique with respect to all other names for categories used by the MPI implementation.

If any `OUT` parameter to [[MPI_T_CATEGORY_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.

The arguments `desc` and `desc``_len` are used to return the description of the category as described in Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] .

Returning a description is optional. If an MPI implementation decides not to return a description, the first character for `desc` must be set to the null character and `desc_len` must be set to one at the return of this call.

The function returns the number of control variables, performance variables and other categories contained in the queried category in the arguments `num_cvars`, `num_pvars`, and `num_categories`, respectively.

If the name of a category is equivalent across connected processes, then the returned description must be equivalent.

![[API/MPI_T_CATEGORY_GET_INDEX]]

[[MPI_T_CATEGORY_GET_INDEX]] is a function for retrieving the index of a category given a known category name. The `name` parameter is provided by the caller, and `cat_index` is returned by the MPI implementation. The `name` parameter is a string terminated with a null character.

This routine returns `MPI_SUCCESS` on success and returns `MPI_T_ERR_INVALID_NAME` if `name` does not match the name of any category provided by the implementation at the time of the call.

> [!tip] Rationale

> This routine is provided to enable fast retrieval of a category index by a tool, assuming it knows the name of the category for which it is looking. The number of categories exposed by the implementation can change over time, so it is not possible for the tool to simply iterate over the list of categories once at initialization. Although using MPI implementation specific category names is not portable across MPI implementations, tool developers may choose to take this route for lower overhead at runtime because the tool will not have to iterate over the entire set of categories to find a specific one.

![[API/MPI_T_CATEGORY_GET_CVARS]]

[[MPI_T_CATEGORY_GET_CVARS]] can be used to query which control variables are contained in a particular category. A category contains zero or more control variables.

![[API/MPI_T_CATEGORY_GET_PVARS]]

[[MPI_T_CATEGORY_GET_PVARS]] can be used to query which performance variables are contained in a particular category. A category contains zero or more performance variables.

![[API/MPI_T_CATEGORY_GET_CATEGORIES]]

[[MPI_T_CATEGORY_GET_CATEGORIES]] can be used to query which other categories are contained in a particular category. A category contains zero or more other categories.

As mentioned above, MPI implementations can grow the number of categories as well as the number of variables or other categories within a category. In order to allow users of the MPI tool information interface to check quickly whether new categories have been added or new variables or categories have been added to a category, MPI maintains a virtual timestamp. This timestamp is monotonically increasing during the execution and is returned by the following function:

![[API/MPI_T_CATEGORY_CHANGED]]

If two subsequent calls to this routine return the same timestamp, it is guaranteed that the category information has not changed between the two calls. If the timestamp retrieved from the second call is higher, then some categories have been added or expanded.

> [!note] Advice to users

> The timestamp value is purely virtual and only intended to check for changes in the category information. It should not be used for any other purpose.

The index values returned in `indices` by [[MPI_T_CATEGORY_GET_CVARS]] , [[MPI_T_CATEGORY_GET_PVARS]] and [[MPI_T_CATEGORY_GET_CATEGORIES]] can be used as input to [[MPI_T_CVAR_GET_INFO]] , [[MPI_T_PVAR_GET_INFO]] and [[MPI_T_CATEGORY_GET_INFO]] , respectively.

The user is responsible for allocating the arrays passed into the functions [[MPI_T_CATEGORY_GET_CVARS]] , [[MPI_T_CATEGORY_GET_PVARS]] and [[MPI_T_CATEGORY_GET_CATEGORIES]] . Starting from array index $`0`$, each function writes up to `len` elements into the array. If the category contains more than `len` elements, the function returns an arbitrary subset of size len. Otherwise, the entire set of elements is returned in the beginning entries of the array, and any remaining array entries are not modified.

### Return Codes for the MPI Tool Information Interface



All functions defined as part of the MPI tool information interface return an integer error code (see Table [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] ) to indicate whether the function was completed successfully or was aborted. In the latter case the error code indicates the reason for not completing the routine. Such errors neither impact the execution of the MPI process nor invoke MPI error handlers. The MPI process continues executing regardless of the return code from the call. The MPI implementation is not required to check all user-provided parameters; if a user passes invalid parameter values to any routine the behavior of the implementation is undefined.

All error codes with the prefix `MPI_T_` must be unique values and cannot overlap with any other error codes or error classes returned by the MPI implementation. Further, they shall be treated as MPI error classes as defined in [[inquiry#Error Codes and Classes|Error Codes and Classes]] and follow the same rules and restrictions. In particular, they must satisfy:

``` math
0 = \texttt{MPI_SUCCESS} < \texttt{MPI_T_ERR_XXX} \leq \texttt{MPI_ERR_LASTCODE}.
```

> [!tip] Rationale

> All MPI tool information interface functions must return error classes, because applications cannot portably call [[MPI_ERROR_CLASS]] before [[MPI_INIT]] or [[MPI_INIT_THREAD]] to map an arbitrary error code to an error class.

\|l\|l\| Return Code & Description\
\
`MPI_SUCCESS` & Call completed successfully\
`MPI_T_ERR_INVALID` & Invalid use of the interface or bad parameter\
& values(s)\
`MPI_T_ERR_MEMORY` & Out of memory\
`MPI_T_ERR_NOT_INITIALIZED` & Interface not initialized\
`MPI_T_ERR_CANNOT_INIT` & Interface not in the state to be initialized \
`MPI_T_ERR_INVALID_INDEX` & The enumeration index is invalid\
`MPI_T_ERR_INVALID_ITEM` & The item index queried is out of range\
& (for [[MPI_T_ENUM_GET_ITEM]] only)\
\
`MPI_T_ERR_INVALID_INDEX` & The variable or category index is invalid `MPI_T_ERR_INVALID_NAME` & The variable or category name is invalid \
`MPI_T_ERR_INVALID_INDEX` & The variable index is invalid  `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_OUT_OF_HANDLES` & No more handles available \
`MPI_T_ERR_OUT_OF_SESSIONS` & No more sessions available `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\
\
\
`MPI_T_ERR_CVAR_SET_NOT_NOW` & Variable cannot be set at this moment\
`MPI_T_ERR_CVAR_SET_NEVER` & Variable cannot be set until end of execution\
`MPI_T_ERR_INVALID_HANDLE` & The handle is invalid \
\
`MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\
`MPI_T_ERR_PVAR_NO_STARTSTOP` & Variable cannot be started or stopped\
& (for [[MPI_T_PVAR_START]] and\
& [[MPI_T_PVAR_STOP]] )\
`MPI_T_ERR_PVAR_NO_WRITE` & Variable cannot be written or reset\
& (for [[MPI_T_PVAR_WRITE]] and\
& [[MPI_T_PVAR_RESET]] )  `MPI_T_ERR_PVAR_NO_ATOMIC` & Variable cannot be read and written atomically\
& (for [[MPI_T_PVAR_READRESET]] )\
\
`MPI_T_ERR_INVALID_INDEX` & The category index is invalid\



### Profiling Interface

All requirements for the profiling interfaces, as described in Section [[tools#Profiling Interface|Profiling Interface]] , also apply to the MPI tool information interface. All rules, guidelines, and recommendations from Section [[tools#Profiling Interface|Profiling Interface]] apply equally to calls defined as part of the MPI tool information interface.
