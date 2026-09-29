---
title: "Initialization"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# Initialization

Chapter **ei** · in [[versions/v20/sections/ei#Initialization|MPI-2.0]], [[versions/v21/sections/ei#Initialization|MPI-2.1]], [[versions/v22/sections/ei#Initialization|MPI-2.2]], [[versions/v30/sections/ei#Initialization|MPI-3.0]], [[versions/v31/sections/ei#Initialization|MPI-3.1]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (5 changed paragraphs)

> In C and C++, the passing of `argc` and `argv` is optional. > > In C, this is accomplished by passing the appropriate null pointer. > > In C++, this is accomplished with two separate bindings to cover these two cases. > > This is as with [[versions/v21/API/MPI_INIT|MPI_INIT]] as discussed in Section ~~[[versions/v21/sections/misc#Passing NULL to MPIInit|Passing NULL to MPIInit]]~~ ==[[versions/v21/sections/inquiry#Startup|Startup]]== .

~~MPI_THREAD_FUNNELED   The process may be multi-threaded, but only the main thread will make MPI calls (all MPI calls are “funneled” to the main thread).~~

==MPI_THREAD_FUNNELED   The process may be multi-threaded, but==

==the application must ensure that only the main thread makes MPI calls (for the definition of main thread, see [[versions/v21/API/MPI_IS_THREAD_MAIN|MPI_IS_THREAD_MAIN]] on page [[function-mpiisthreadmain]] ).==

~~The level(s) of thread support that can be provided by [[versions/v21/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with arguments to [[mpiexec]] ). If possible, the call will return `provided = required`. Failing this, the call will return the least supported level such that `provided `$`>`$` required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.~~

==The level(s) of thread support that can be provided by [[versions/v21/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will depend on the implementation, and may depend on information provided by the user before the program started to execute (e.g., with==

==arguments to `mpiexec`). If possible, the call will return `provided = required`. Failing this, the call will return the least supported level such that `provided `$`>`$` required` (thus providing a stronger level of support than required by the user). Finally, if the user requirement cannot be satisfied, then the call will return in `provided` the highest supported level.==

~~Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI program is started, e.g., with arguments to [[mpiexec]] . This will affect the outcome of calls to [[versions/v21/API/MPI_INIT|MPI_INIT]] and `MPI_INIT_THREAD`. Suppose, for example, that an MPI program has been started so that only MPI_THREAD_MULTIPLE is available. Then [[versions/v21/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[versions/v21/API/MPI_INIT|MPI_INIT]] will also initialize the MPI thread support level to MPI_THREAD_MULTIPLE. Suppose, on the other hand, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[versions/v21/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = required`; on the other hand, a call to [[versions/v21/API/MPI_INIT|MPI_INIT]] will initialize the MPI thread support level to MPI_THREAD_SINGLE.~~

==Vendors may provide (implementation dependent) means to specify the level(s) of thread support available when the MPI==

==program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[versions/v21/API/MPI_INIT|MPI_INIT]] and `MPI_INIT_THREAD`. Suppose, for example, that an MPI program has been started so that only MPI_THREAD_MULTIPLE is available. Then [[versions/v21/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[versions/v21/API/MPI_INIT|MPI_INIT]] will also initialize the MPI thread support level to MPI_THREAD_MULTIPLE. Suppose, on the other hand, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[versions/v21/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = required`; on the other hand, a call to [[versions/v21/API/MPI_INIT|MPI_INIT]] will initialize the MPI thread support level to MPI_THREAD_SINGLE.==

> Various optimizations are possible when MPI code is executed single-threaded, or is executed on multiple threads, but not concurrently: mutual exclusion code may be omitted. Furthermore, if only one thread executes, then the MPI library can use library functions that are not thread safe, without risking conflicts with user threads. Also, the model of one communication thread, multiple computation threads fits ~~well~~ ==> >== many ~~applications. E.g.,~~ ==applications well, e.g., > >== if the process code is a sequential Fortran/C/C++ program with MPI calls that has been parallelized by a compiler for execution on an SMP node, in a cluster of SMPs, then the process computation is multi-threaded, but MPI calls will likely execute on a single thread. > > The design accommodates a static specification of the thread support level, for environments that require static binding of libraries, and for compatibility for current multi-threaded MPI codes.

### MPI-2.1 → MPI-2.2  (5 changed paragraphs)

~~MPI_THREAD_SINGLE~~ ==`MPI_THREAD_SINGLE`== Only one thread will execute.

~~MPI_THREAD_FUNNELED~~ ==`MPI_THREAD_FUNNELED`== The process may be multi-threaded, but

~~MPI_THREAD_SERIALIZED~~ ==`MPI_THREAD_SERIALIZED`== The process may be multi-threaded, and multiple threads may make MPI calls, but only one at a time: MPI calls are not made concurrently from two distinct threads (all MPI calls are “serialized”).

~~MPI_THREAD_MULTIPLE~~ ==`MPI_THREAD_MULTIPLE`== Multiple threads may call MPI, with no restrictions.

These values are monotonic; i.e., ~~MPI_THREAD_SINGLE~~ ==`MPI_THREAD_SINGLE`== $`<`$ ~~MPI_THREAD_FUNNELED~~ ==`MPI_THREAD_FUNNELED`== $`<`$ ~~MPI_THREAD_SERIALIZED~~ ==`MPI_THREAD_SERIALIZED`== $`<`$ ~~MPI_THREAD_MULTIPLE.~~ ==`MPI_THREAD_MULTIPLE`.==

Different processes in ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== may require different levels of thread support.

program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[versions/v22/API/MPI_INIT|MPI_INIT]] and `MPI_INIT_THREAD`. Suppose, for example, that an MPI program has been started so that only ~~MPI_THREAD_MULTIPLE~~ ==`MPI_THREAD_MULTIPLE`== is available. Then [[versions/v22/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[versions/v22/API/MPI_INIT|MPI_INIT]] will also initialize the MPI thread support level to ~~MPI_THREAD_MULTIPLE.~~ ==`MPI_THREAD_MULTIPLE`.== Suppose, on the other hand, that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[versions/v22/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = required`; on the other hand, a call to [[versions/v22/API/MPI_INIT|MPI_INIT]] will initialize the MPI thread support level to ~~MPI_THREAD_SINGLE.~~ ==`MPI_THREAD_SINGLE`.==

> If `provided` is not ~~MPI_THREAD_SINGLE~~ ==`MPI_THREAD_SINGLE`== then the MPI library should not > > invoke C/ C++/Fortran library calls that are not thread safe, e.g., in an environment where `malloc` is not thread safe, then `malloc` should not be used by the MPI library. > > Some implementors may want to use different MPI libraries for different levels of thread support. They can do so using dynamic linking and selecting which library will be linked when [[versions/v22/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is invoked. If this is not possible, then optimizations for lower levels of thread support will occur only when the level of thread support required is specified at link time.

> It is possible to spawn threads before MPI is initialized, but no MPI call other than [[versions/v22/API/MPI_INITIALIZED|MPI_INITIALIZED]] should be executed by these threads, until [[versions/v22/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is invoked by one thread (which, thereby, becomes the main thread). In particular, it is possible to enter the MPI execution with a multi-threaded process. > > The level of thread support provided is a global property of the MPI process that can be specified only once, when MPI is initialized on that process (or before). Portable third party libraries have to be written so as to accommodate any provided level of thread support. Otherwise, their usage will be restricted to specific level(s) of thread support. If such a library can run only with specific level(s) of thread support, e.g., only with ~~MPI_THREAD_MULTIPLE,~~ ==`MPI_THREAD_MULTIPLE`,== then [[versions/v22/API/MPI_QUERY_THREAD|MPI_QUERY_THREAD]] can be used to check whether the user initialized MPI to the correct level of thread support and, if not, raise an exception.

### MPI-2.2 → MPI-3.0  (10 changed paragraphs)

The following function may be used to initialize MPI, and ==to== initialize the MPI thread environment, instead of [[versions/v30/API/MPI_INIT|MPI_INIT]] .

~~> In C and C++, the passing of `argc` and `argv` is optional. > > In C, this is accomplished by passing the appropriate null pointer. > > In C++, this is accomplished with two separate bindings to cover these two cases. > > This is as with [[versions/v30/API/MPI_INIT|MPI_INIT]] as discussed in Section [[versions/v30/sections/inquiry#Startup|Startup]] .~~

~~This call initializes MPI in the same way that a call to [[versions/v30/API/MPI_INIT|MPI_INIT]] would. In addition, it initializes the thread environment. The argument `required`~~

~~is used to specify the desired level of thread support.~~

~~The possible values are listed in increasing order of thread support.~~

==> In C, the passing of `argc` and `argv` is optional, as with [[versions/v30/API/MPI_INIT|MPI_INIT]] as discussed in Section [[versions/v30/sections/inquiry#Startup|Startup]] . In C, null pointers may be passed in their place.==

==This call initializes MPI in the same way that a call to [[versions/v30/API/MPI_INIT|MPI_INIT]] would. In addition, it initializes the thread environment. The argument `required` is used to specify the desired level of thread support. The possible values are listed in increasing order of thread support.==

~~`= MPI_THREAD_MULTIPLE`, irrespective of the value of `required`. At the other extreme, an MPI library that is not thread compliant may always return `provided = MPI_THREAD_SINGLE`, irrespective of the value of `required`.~~

==`= MPI_THREAD_MULTIPLE`, irrespective of the value of `required`.==

==An MPI library that is not thread compliant must always return `provided=MPI_THREAD_SINGLE`, even if [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is called on a multithreaded process. The library should also return correct values for the MPI calls that can be executed before initialization, even if multiple threads have been spawned.==

==> [!tip] Rationale==

==> Such code is erroneous, but if the MPI initialization is performed by a library, the error cannot be detected until [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is called. The requirements in the previous paragraph ensure that the error can be properly detected.==

program is started, e.g., with arguments to `mpiexec`. This will affect the outcome of calls to [[versions/v30/API/MPI_INIT|MPI_INIT]] and `MPI_INIT_THREAD`. Suppose, for example, that an MPI program has been started so that only `MPI_THREAD_MULTIPLE` is available. Then [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = MPI_THREAD_MULTIPLE`, irrespective of the value of `required`; a call to [[versions/v30/API/MPI_INIT|MPI_INIT]] will also initialize the MPI thread support level to `MPI_THREAD_MULTIPLE`. Suppose, ~~on the other hand,~~ ==instead,== that an MPI program has been started so that all four levels of thread support are available. Then, a call to [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] will return `provided = required`; ~~on the other hand,~~ ==alternatively,== a call to [[versions/v30/API/MPI_INIT|MPI_INIT]] will initialize the MPI thread support level to `MPI_THREAD_SINGLE`.

> Various optimizations are possible when MPI code is executed single-threaded, or is executed on multiple threads, but not concurrently: mutual exclusion code may be omitted. Furthermore, if only one thread executes, then the MPI library can use library functions that are not thread safe, without risking conflicts with user threads. Also, the model of one communication thread, multiple computation threads fits > > many applications well, e.g., ~~> >~~ if the process code is a sequential ~~Fortran/C/C++~~ ==Fortran/C== program with MPI calls that has been parallelized by a compiler for execution on an SMP node, in a cluster of SMPs, then the process computation is multi-threaded, but MPI calls will likely execute on a single thread. > > The design accommodates a static specification of the thread support level, for environments that require static binding of libraries, and for compatibility for current multi-threaded MPI codes.

> If `provided` is not `MPI_THREAD_SINGLE` then the MPI library should not ~~> >~~ invoke ~~C/ C++/Fortran~~ ==C or Fortran== library calls that are not thread safe, e.g., in an environment where `malloc` is not thread safe, then `malloc` should not be used by the MPI library. > > Some implementors may want to use different MPI libraries for different levels of thread support. They can do so using dynamic linking and selecting which library will be linked when [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is invoked. If this is not possible, then optimizations for lower levels of thread support will occur only when the level of thread support required is specified at link time. ==> > Note that `required` need not be the same value on all processes of [[MPI_COMM_WORLD]] .==

The call returns in `provided` the current level of thread ~~support. This~~ ==support, which== will be the value returned in `provided` by [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , if MPI was initialized by a call to [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] .

This function can be called by a thread to ~~find out whether~~ ==determine if== it is the main thread (the thread that called [[versions/v30/API/MPI_INIT|MPI_INIT]] or [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] ).

> MPI libraries are required to provide these calls even if they do not support threads, so that portable code that contains invocations to these functions ~~be able to~~ ==can== link correctly. [[versions/v30/API/MPI_INIT|MPI_INIT]] continues to be supported so as to provide compatibility with current MPI codes.

> It is possible to spawn threads before MPI is initialized, but no MPI call other than ==[[versions/v30/API/MPI_GET_VERSION|MPI_GET_VERSION]] ,== [[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] ==, or [[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]]== should be executed by these threads, until [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] is invoked by one thread (which, thereby, becomes the main thread). In particular, it is possible to enter the MPI execution with a multi-threaded process. > > The level of thread support provided is a global property of the MPI process that can be specified only once, when MPI is initialized on that process (or before). Portable third party libraries have to be written so as to accommodate any provided level of thread support. Otherwise, their usage will be restricted to specific level(s) of thread support. If such a library can run only with specific level(s) of thread support, e.g., only with `MPI_THREAD_MULTIPLE`, then [[versions/v30/API/MPI_QUERY_THREAD|MPI_QUERY_THREAD]] can be used to check whether the user initialized MPI to the correct level of thread support and, if not, raise an exception.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~`MPI_THREAD_FUNNELED`   The process may be multi-threaded, but~~

~~the application must ensure that only the main thread makes MPI calls (for the definition of main thread, see [[versions/v31/API/MPI_IS_THREAD_MAIN|MPI_IS_THREAD_MAIN]] on page [[function-mpiisthreadmain]] ).~~

==`MPI_THREAD_FUNNELED`   The process may be multi-threaded, but the application must ensure that only the main thread makes MPI calls (for the definition of main thread, see [[versions/v31/API/MPI_IS_THREAD_MAIN|MPI_IS_THREAD_MAIN]] on page [[function-mpiisthreadmain]] ).==

~~A **thread compliant** MPI implementation will be able to return `provided`~~

~~`= MPI_THREAD_MULTIPLE`. Such an implementation may always return `provided`~~

~~`= MPI_THREAD_MULTIPLE`, irrespective of the value of `required`.~~

==A **thread compliant** MPI implementation will be able to return `provided` `= MPI_THREAD_MULTIPLE`. Such an implementation may always return `provided` `= MPI_THREAD_MULTIPLE`, irrespective of the value of `required`.==

> Various optimizations are possible when MPI code is executed single-threaded, or is executed on multiple threads, but not concurrently: mutual exclusion code may be omitted. Furthermore, if only one thread executes, then the MPI library can use library functions that are not thread safe, without risking conflicts with user threads. Also, the model of one communication thread, multiple computation threads fits ~~> >~~ many applications well, e.g., if the process code is a sequential Fortran/C program with MPI calls that has been parallelized by a compiler for execution on an SMP node, in a cluster of SMPs, then the process computation is multi-threaded, but MPI calls will likely execute on a single thread. > > The design accommodates a static specification of the thread support level, for environments that require static binding of libraries, and for compatibility for current multi-threaded MPI codes.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Initialization]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Initialization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Initialization]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Initialization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Initialization]]
