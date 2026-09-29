---
title: "Profiling"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Profiling

Chapter **binding** · in [[versions/v20/sections/binding#Profiling|MPI-2.0]], [[versions/v21/sections/binding#Profiling|MPI-2.1]], [[versions/v22/sections/binding#Profiling|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

> Since the main goal of profiling is to intercept function calls from user code, it is the implementor’s decision how to layer the underlying implementation to allow function calls to be intercepted and profiled. If an implementation of the MPI C++ bindings is layered on top of MPI bindings in another language (such as C), or if the C++ bindings are layered on top of a profiling interface in another language, no extra profiling interface is necessary because the underlying MPI implementation already meets the MPI profiling interface requirements. > > Native C++ MPI implementations that do not have access to other profiling interfaces must implement an interface that meets the requirements outlined in this section. > > ~~High quality~~ ==High-quality== implementations can implement the interface outlined in this section in order to promote portable C++ profiling libraries. Implementors may wish to provide an option whether to build the C++ profiling interface or not; C++ implementations that are already layered on top of bindings in another language or another profiling interface will have to insert a third layer to implement the C++ profiling interface.

~~4.  Where the implementation of different language bindings is is done through a layered approach (e.g., the C++ binding is a set of “wrapper” functions which call the C implementation), ensure that these wrapper functions are separable from the rest of the library.~~

==4.  Where the implementation of different language bindings==

==    is==

==    done through a layered approach (e.g., the C++ binding is a set of “wrapper” functions which call the C implementation), ensure that these wrapper functions are separable from the rest of the library.==

> There are (at least) two apparent options for implementing the C++ profiling interface: inheritance or caching. An inheritance-based approach may not be attractive because it may require a virtual inheritance implementation of the communicator classes. Thus, it is most likely that implementors ~~still~~ ==> > will > >== cache `PMPI` objects on their corresponding `MPI` objects. The caching scheme is outlined below. > > The “real” entry points to each routine can be provided within a `namespace PMPI`. The non-profiling version can then be provided within a `namespace MPI`. > > Caching instances of `PMPI` objects in the `MPI` handles provides the “has a” relationship that is necessary to implement the profiling scheme. > > Each instance of an `MPI` object simply “wraps up” an instance of a `PMPI` object. `MPI` objects can then perform profiling actions before invoking the corresponding function in their internal `PMPI` object. > > The key to making the profiling work by simply re-linking programs is by having a header file that *declares* all the MPI functions. The functions must be *defined* elsewhere, and compiled into a library. MPI constants should be declared `extern` in the `MPI` namespace. For example, the following is an excerpt from a sample `mpi.h` file: > > > > Sample `mpi.h` file. > > namespace PMPI { > class Comm { > public: > int Get_size() const; > }; > // etc. > }; > > namespace MPI { > public: > class Comm { > public: > int Get_size() const; > > private: > PMPI::Comm pmpi_comm; > }; > }; > > > > Note that all constructors, the assignment operator, and the destructor in the `MPI` class will need to initialize/destroy the internal `PMPI` object as appropriate. > > The definitions of the functions must be in separate object files; the `PMPI` class member functions and the non-profiling versions of the `MPI` class member functions can be compiled into `libmpi.a`, while the profiling versions can be compiled into `libpmpi.a`. Note that the `PMPI` class member functions and the `MPI` constants must be in different object files than the non-profiling `MPI` class member functions in the `libmpi.a` library to prevent multiple definitions of `MPI` class member function names when linking both `libmpi.a` and `libpmpi.a`. For example: > > > > `pmpi.cc`, to be compiled into `libmpi.a`. > > int PMPI::Comm::Get_size() const > { > // Implementation of MPI_COMM_SIZE > } > > > > > > `constants.cc`, to be compiled into `libmpi.a`. > > const MPI::Intracomm MPI::COMM_WORLD; > > > > > > `mpi_no_profile.cc`, to be compiled into `libmpi.a`. > > int MPI::Comm::Get_size() const > { > return pmpi_comm.Get_size(); > } > > > > > > `mpi_profile.cc`, to be compiled into `libpmpi.a`. > > int MPI::Comm::Get_size() const > { > // Do profiling stuff > int ret = pmpi_comm.Get_size(); > // More profiling stuff > return ret; > } > >

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Profiling]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Profiling]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Profiling]]
