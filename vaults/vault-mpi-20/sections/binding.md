9

# Language Bindings



## C++

### Overview



This section presents a complete C++ language interface for MPI.

There are some issues specific to C++ that must be considered in the design of this interface that go beyond the simple description of language bindings. In particular, in C++, we must be concerned with the design of objects and their interfaces, rather than just the design of a language-specific functional interface to MPI. Fortunately, the original design of MPI was based on the notion of objects, so a natural set of classes is already part of MPI.

Since the original design of MPI-1 did not include a C++ language interface, a complete list of C++ bindings for MPI-1 functions is provided in Annex [[appendix-c++#MPI-1 C++ Language Binding|MPI-1 C++ Language Binding]] .

MPI-2 includes C++ bindings as part of its function specifications.

In some cases, MPI-2 provides new names for the C bindings of MPI-1 functions. In this case, the C++ binding matches the new C name — there is no binding for the deprecated name. As such, the C++ binding for the new name appears in Annex [[appLang#Language Binding|Language Binding]] , not Annex [[appendix-c++#MPI-1 C++ Language Binding|MPI-1 C++ Language Binding]] .

### Design



The C++ language interface for MPI is designed according to the following criteria:

1.  The C++ language interface consists of a small set of classes with a lightweight functional interface to MPI. The classes are based upon the fundamental MPI object types (e.g., communicator, group, etc.).

2.  The MPI C++ language bindings provide a semantically correct interface to MPI.

3.  To the greatest extent possible, the C++ bindings for MPI functions are member functions of MPI classes.

> [!tip] Rationale

> Providing a lightweight set of MPI objects that correspond to the basic MPI types is the best fit to MPI’s implicit object-based design; methods can be supplied for these objects to realize MPI functionality. The existing C bindings can be used in C++ programs, but much of the expressive power of the C++ language is forfeited. On the other hand, while a comprehensive class library would make user programming more elegant, such a library it is not suitable as a language binding for MPI since a binding must provide a direct and unambiguous mapping to the specified functionality of MPI.

.

### C++ Classes for MPI

All MPI classes, constants, and functions are declared within the scope of an `MPI` `namespace`.

Thus, instead of the `MPI_` prefix that is used in C and Fortran, MPI functions essentially have an `MPI::` prefix.

> [!warning] Advice to implementors

> Although `namespace` is officially part of the draft ANSI C++ standard, as of this writing it not yet widely implemented in C++ compilers. Implementations using compilers without `namespace` may obtain the same scoping through the use of a non-instantiable `MPI` class. (To make the `MPI` class non-instantiable, all constructors must be `private`.)

The members of the `MPI` namespace are those classes corresponding to objects implicitly used by MPI. An abbreviated definition of the `MPI` namespace for MPI-1 and its member classes is as follows:

    namespace MPI {
      class Comm                             {...};
      class Intracomm : public Comm          {...};
      class Graphcomm : public Intracomm     {...};
      class Cartcomm  : public Intracomm     {...};
      class Intercomm : public Comm          {...};
      class Datatype                         {...};
      class Errhandler                       {...};
      class Exception                        {...};
      class Group                            {...};
      class Op                               {...};
      class Request                          {...};
      class Prequest  : public Request       {...};
      class Status                           {...};
    };

Additionally, the following classes defined for MPI-2:

    namespace MPI {
      class File                             {...};
      class Grequest  : public Request       {...};
      class Info                             {...};
      class Win                              {...};
    };

Note that there are a small number of derived classes, and that virtual inheritance is *not* used.

### Class Member Functions for MPI

Besides the member functions which constitute the C++ language bindings for MPI, the C++ language interface has additional functions (as required by the C++ language). In particular, the C++ language interface must provide a constructor and destructor, an assignment operator, and comparison operators.

The complete set of C++ language bindings for MPI-1 is presented in Annex [[appendix-c++#MPI-1 C++ Language Binding|MPI-1 C++ Language Binding]] .

The bindings take advantage of some important C++ features, such as references and `const`.

Declarations (which apply to all `MPI` member classes) for construction, destruction, copying, assignment, comparison, and mixed-language operability are also provided.

To maintain consistency with what has gone before, the binding definitions are given in the same order as given for the C bindings in .

Except where indicated, all non-static member functions (except for constructors and the assignment operator)

of `MPI` member classes are virtual functions.

> [!tip] Rationale

> Providing virtual member functions is an important part of design for inheritance. Virtual functions can be bound at run-time, which allows users of libraries to re-define the behavior of objects already contained in a library. There is a small performance penalty that must be paid (the virtual function must be looked up before it can be called). However, users concerned about this performance penalty can force compile-time function binding.

Example showing a derived MPI class.

    class foo_comm : public MPI::Intracomm {
    public:
      void Send(void* buf, int count, const MPI::Datatype& type, 
                int dest, int tag) const 
      {
        // Class library functionality
        MPI::Intracomm::Send(buf, count, type, dest, tag);
        // More class library functionality
      }
    };

> [!warning] Advice to implementors

> Implementors must be careful to avoid unintended side effects from class libraries that use inheritance, especially in layered implementations. For example, if [[MPI_BCAST]] is implemented by repeated calls to [[MPI_SEND]] or [[MPI_RECV]] , the behavior of [[MPI_BCAST]] cannot be changed by derived communicator classes that might redefine [[MPI_SEND]] or [[MPI_RECV]] . The implementation of [[MPI_BCAST]] must explicitly use the [[MPI_SEND]] (or [[MPI_RECV]] ) of the base `MPI::Comm` class.

### Semantics



The semantics of the member functions constituting the C++ language binding for MPI are specified by the MPI function description itself. Here, we specify the semantics for those portions of the C++ language interface that are not part of the language binding.

In this subsection, functions are prototyped using the type `MPI::<CLASS>` rather than listing each function for every MPI class; the word `<CLASS>` can be replaced with any valid MPI class name (e.g., `Group`),

except as noted.

##### Construction / Destruction

The default constructor and destructor are prototyped as follows:

In terms of construction and destruction, opaque MPI user level objects behave like handles. Default constructors for all MPI objects

except `MPI::Status`

create corresponding MPI::\*\_­NULL handles. That is, when an MPI object is instantiated, comparing it with its corresponding MPI::\*\_­NULL object will return `true`. The default constructors do not create new MPI opaque objects. Some classes have a member function `Create()` for this purpose.

In the following code fragment, the test will return `true` and the message will be sent to `cout`.

    void foo()
    {
      MPI::Intracomm bar;

      if (bar == MPI::COMM_NULL) 
        cout << "bar is MPI::COMM_NULL" << endl;
    }

The destructor for each MPI user level object does *not* invoke the corresponding `MPI\_\*\_FREE` function (if it exists).

> [!tip] Rationale

> `MPI\_\*\_FREE` functions are not automatically invoked for the following reasons:
>
> 1.  Automatic destruction contradicts the shallow-copy semantics of the MPI classes.
>
> 2.  The model put forth in MPI makes memory allocation and deallocation the responsibility of the user, not the implementation.
>
> 3.  Calling `MPI\_\*\_FREE` upon destruction could have unintended side effects, including triggering collective operations (this also affects the copy, assignment, and construction semantics). In the following example, we would want neither `foo_comm` nor `bar_comm` to automatically invoke `MPI\_\*\_FREE` upon exit from the function.
>
>         void example_function() 
>         {
>           MPI::Intracomm foo_comm(MPI::COMM_WORLD), bar_comm;
>           bar_comm = MPI::COMM_WORLD.Dup();
>           // rest of function
>         }

##### Copy / Assignment

The copy constructor and assignment operator are prototyped as follows:

In terms of copying and assignment, opaque MPI user level objects behave like handles. Copy constructors perform handle-based (shallow) copies.

`MPI::­Status` objects are exceptions to this rule. These objects perform deep copies for assignment and copy construction.

> [!warning] Advice to implementors

> Each MPI user level object is likely to contain, by value or by reference, implementation-dependent state information. The assignment and copying of MPI object handles may simply copy this value (or reference).

Example using assignment operator. In this example, MPI::Intracomm::Dup() is *not* called for `foo_comm`. The object `foo_comm` is simply an alias for `MPI::COMM_WORLD`. But `bar_comm` is created with a call to `MPI::Intracomm::Dup()` and is therefore a different communicator than `foo_comm` (and thus different from `MPI::COMM_WORLD`). `baz_comm` becomes an alias for `bar_comm`. If one of `bar_comm` or `baz_comm` is freed with [[MPI_COMM_FREE]] it will be set to `MPI::COMM_NULL` . The state of the other handle will be undefined — it will be invalid, but not necessarily set to `MPI::COMM_NULL` .

      MPI::Intracomm foo_comm, bar_comm, baz_comm;

      foo_comm = MPI::COMM_WORLD;
      bar_comm = MPI::COMM_WORLD.Dup();
      baz_comm = bar_comm;

##### Comparison



The comparison operators are prototyped as follows:

The member function `operator==()` returns `true` only when the handles reference the same internal MPI object, `false` otherwise. `operator!=()` returns the boolean complement of `operator==()`.

However, since the `Status` class is not a handle to an underlying MPI object, it does not make sense to compare `Status` instances. Therefore, the `operator==()` and `operator!=()` functions are not defined on the `Status` class.

##### Constants

Constants are singleton objects and are declared `const`. Note that not all globally defined MPI objects are constant. For example, `MPI::COMM_WORLD` and `MPI::COMM_SELF` are not `const`.

### C++ Datatypes

Table [[binding#C++ Datatypes|C++ Datatypes]] lists all of the C++ predefined MPI datatypes and their corresponding C and C++ datatypes, Table [[binding#C++ Datatypes|C++ Datatypes]] lists all of the Fortran predefined MPI datatypes and their corresponding Fortran 77 datatypes. Table [[binding#C++ Datatypes|C++ Datatypes]] lists the C++ names for all other MPI datatypes.

`MPI::BYTE` and `MPI::PACKED` conform to the same restrictions as `MPI_BYTE` and `MPI_PACKED`, listed in Sections 3.2.2 and 3.13 of MPI-1, respectively.

| MPI datatype               | C datatype       | C++ datatype           |
|:---------------------------|:-----------------|:-----------------------|
| `MPI::CHAR`                | `char`           | `char`                 |
| `MPI::WCHAR`               | `wchar_t`        | `wchar_t`              |
| `MPI::SHORT`               | `signed short`   | `signed short`         |
| `MPI::INT`                 | `signed int`     | `signed int`           |
| `MPI::LONG`                | `signed long`    | `signed long`          |
| `MPI::SIGNED_CHAR`         | `signed char`    | `signed char`          |
| `MPI::UNSIGNED_CHAR`       | `unsigned char`  | `unsigned char`        |
| `MPI::UNSIGNED_SHORT`      | `unsigned short` | `unsigned short`       |
| `MPI::UNSIGNED`            | `unsigned int`   | `unsigned int`         |
| `MPI::UNSIGNED_LONG`       | `unsigned long`  | `unsigned long int`    |
| `MPI::FLOAT`               | `float`          | `float`                |
| `MPI::DOUBLE`              | `double`         | `double`               |
| `MPI::LONG_DOUBLE`         | `long double`    | `long double`          |
| `MPI::BOOL`                |                  | `bool`                 |
| `MPI::COMPLEX`             |                  | `Complex<float>`       |
| `MPI::DOUBLE_COMPLEX`      |                  | `Complex<double>`      |
| `MPI::LONG_DOUBLE_COMPLEX` |                  | `Complex<long double>` |
| `MPI::BYTE`                |                  |                        |
| `MPI::PACKED`              |                  |                        |

C++ names for the MPI C and C++ predefined datatypes, and their corresponding C/C++ datatypes.



| MPI datatype            | Fortran datatype   |
|:------------------------|:-------------------|
| `MPI::CHARACTER`        | `CHARACTER(1)`     |
| `MPI::INTEGER`          | `INTEGER`          |
| `MPI::REAL`             | `REAL`             |
| `MPI::DOUBLE_PRECISION` | `DOUBLE PRECISION` |
| `MPI::LOGICAL`          | `LOGICAL`          |
| `MPI::F_COMPLEX`        | `COMPLEX`          |
| `MPI::BYTE`             |                    |
| `MPI::PACKED`           |                    |

C++ names for the MPI Fortran predefined datatypes, and their corresponding Fortran 77 datatypes.



| MPI datatype               | Description            |
|:---------------------------|:-----------------------|
| `MPI::FLOAT_INT`           | C/C++ reduction type   |
| `MPI::DOUBLE_INT`          | C/C++ reduction type   |
| `MPI::LONG_INT`            | C/C++ reduction type   |
| `MPI::TWOINT`              | C/C++ reduction type   |
| `MPI::SHORT_INT`           | C/C++ reduction type   |
| `MPI::LONG_DOUBLE_INT`     | C/C++ reduction type   |
| `MPI::LONG_LONG`           | Optional C/C++ type    |
| `MPI::UNSIGNED_LONG_LONG`  | Optional C/C++ type    |
| `MPI::TWOREAL`             | Fortran reduction type |
| `MPI::TWODOUBLE_PRECISION` | Fortran reduction type |
| `MPI::TWOINTEGER`          | Fortran reduction type |
| `MPI::F_DOUBLE_COMPLEX`    | Optional Fortran type  |
| `MPI::INTEGER1`            | Explicit size type     |
| `MPI::INTEGER2`            | Explicit size type     |
| `MPI::INTEGER4`            | Explicit size type     |
| `MPI::INTEGER8`            | Explicit size type     |
| `MPI::REAL4`               | Explicit size type     |
| `MPI::REAL8`               | Explicit size type     |
| `MPI::REAL16`              | Explicit size type     |

C++ names for other MPI datatypes. Implementations may also define other optional types (e.g., `MPI::INTEGER8`).



The following table defines groups of MPI predefined datatypes:

`MPI::INT, MPI::LONG, MPI::SHORT,`

`MPI::UNSIGNED_SHORT, MPI::UNSIGNED,`

`MPI::UNSIGNED_LONG, MPI::SIGNED_CHAR,`

`MPI::UNSIGNED_CHAR`

`MPI::INTEGER`

`MPI::FLOAT, MPI::DOUBLE, MPI::REAL,`

`MPI::DOUBLE_PRECISION,`

`MPI::LONG_DOUBLE`

`MPI::LOGICAL, MPI::BOOL`

`MPI::F_COMPLEX, MPI::COMPLEX,`

`MPI::F_DOUBLE_COMPLEX,`

`MPI::DOUBLE_COMPLEX,`

`MPI::LONG_DOUBLE_COMPLEX`

`MPI::BYTE`

Valid datatypes for each reduction operation is specified below in terms of the groups defined above.

Allowed Types

`C integer, Fortran integer, Floating point`

`C integer, Fortran integer, Floating point, Complex`

`C integer, Logical`

`C integer, Fortran integer, Byte`

MPI::MINLOC and MPI::MAXLOC perform just as their C and Fortran counterparts; see Section 4.9.3 in MPI-1.

### Communicators



The `MPI::Comm` class hierarchy makes explicit the different kinds of communicators implicitly defined by MPI and allows them to be strongly typed. Since the original design of MPI defined only one type of handle for all types of communicators, the following clarifications are provided for the C++ design.

##### Types of communicators

There are five different types of communicators: `MPI::Comm`, `MPI::Intercomm`, `MPI::Intracomm`, `MPI::Cartcomm`, and `MPI::Graphcomm`.

`MPI::Comm` is the abstract base communicator class, encapsulating the functionality common to all MPI communicators. `MPI::Intercomm` and `MPI::Intracomm` are derived from `MPI::Comm`. `MPI::Cartcomm` and `MPI::Graphcomm` are derived from `MPI::Intracomm`.

> [!note] Advice to users

> Initializing a derived class with an instance of a base class is not legal in C++. For instance, it is not legal to initialize a Cartcomm from an Intracomm. Moreover, because `MPI::Comm` is an abstract base class, it is non-instantiable, so that it is not possible to have an object of class MPI::Comm. However, it is possible to have a reference or a pointer to an `MPI::Comm`.
>
> 
>
> The following code is erroneous.
>
>       Intracomm intra = MPI::COMM_WORLD.Dup();
>       Cartcomm cart(intra);         // This is erroneous
>
> 

##### MPI::COMM_NULL

The specific type of MPI::COMM_NULL is implementation dependent. MPI::COMM_NULL must be able to be used in comparisons and initializations with all types of communicators. MPI::COMM_NULL must also be able to be passed to a function that expects a communicator argument in the parameter list (provided that MPI::COMM_NULL is an allowed value for the communicator argument).

> [!tip] Rationale

> There are several possibilities for implementation of MPI::COMM_NULL. Specifying its required behavior, rather than its realization, provides maximum flexibility to implementors.

The following example demonstrates the behavior of assignment and comparison using MPI::COMM_NULL.

    MPI::Intercomm comm;
    comm = MPI::COMM_NULL;            // assign with COMM_NULL
    if (comm == MPI::COMM_NULL)       // true
      cout << "comm is NULL" << endl;
    if (MPI::COMM_NULL == comm)       // note -- a different function!
      cout << "comm is still NULL" << endl;

`Dup()` is not defined as a member function of `MPI::Comm`, but it is defined for the derived classes of `MPI::Comm`. `Dup()` is not virtual and it returns its OUT/ parameter by value.

##### `MPI::Comm::Clone()`

The C++ language interface for MPI includes a new function `Clone()`. `MPI::Comm::Clone()` is a pure virtual function. For the derived communicator classes, `Clone()` behaves like `Dup()` except that it returns a new object by reference. The `Clone()` functions are prototyped as follows:

> [!tip] Rationale

> `Clone()` provides the “virtual dup” functionality that is expected by C++ programmers and library writers. Since `Clone()` returns a new object by reference, users are responsible for eventually deleting the object. A new name is introduced rather than changing the functionality of `Dup()`.

> [!warning] Advice to implementors

> Within their class declarations, prototypes for `Clone()` and `Dup()` would look like the following:
>
>     namespace MPI {
>       class Comm {
>          virtual Comm& Clone() const = 0;
>       };
>       class Intracomm : public Comm {
>          Intracomm Dup() const { ... };
>          virtual Intracomm& Clone() const { ... };
>       };
>       class Intercomm : public Comm {
>          Intercomm Dup() const { ... };
>          virtual Intercomm& Clone() const { ... };
>       };
>       // Cartcomm and Graphcomm are similarly defined
>     };
>
> Compilers that do not support the variable return type feature of virtual functions may return a reference to `Comm`. Users can cast to the appropriate type as necessary.

### Exceptions



The C++ language interface for MPI includes the predefined error handler `MPI::ERRORS_THROW_EXCEPTIONS` for use with the `Set_errhandler()` member functions.

`MPI::ERRORS_THROW_EXCEPTIONS` can only be set or retrieved by C++ functions.

If a non-C++ program causes an error that invokes the `MPI::ERRORS_THROW_EXCEPTIONS` error handler, the exception will pass up the calling stack until C++ code can catch it. If there is no C++ code to catch it, the behavior is undefined. In a multi-threaded environment or if a non-blocking MPI call throws an exception while making progress in the background, the behavior is implementation dependent.

The error handler `MPI::ERRORS_THROW_EXCEPTIONS` causes an `MPI::Exception` to be thrown for any MPI result code other than `MPI::SUCCESS`. The public interface to `MPI::Exception` class is defined as follows:

    namespace MPI {
      class Exception {
      public:

        Exception(int error_code); 

        int Get_error_code() const;
        int Get_error_class() const;
        const char *Get_error_string() const;
      };
    };

> [!warning] Advice to implementors

> The exception will be thrown within the body of `MPI::ERRORS_THROW_EXCEPTIONS`. It is expected that control will be returned to the user when the exception is thrown. Some MPI functions specify certain return information in their parameters in the case of an error and `MPI_ERRORS_RETURN` is specified. The same type of return information must be provided when exceptions are thrown.
>
> For example, [[MPI_WAITALL]] puts an error code for each request in the corresponding entry in the status array and returns MPI_ERR_IN_STATUS. When using `MPI::ERRORS_THROW_EXCEPTIONS`, it is expected that the error codes in the status array will be set appropriately before the exception is thrown.

### Mixed-Language Operability



The C++ language interface provides functions listed below for mixed-language operability. These functions provide for a seamless transition between C and C++.

For the case where the C++ class corresponding to `<CLASS>` has derived classes, functions are also provided for converting between the derived classes and the C `MPI_<CLASS>`.

These functions are discussed in Section [[misc#C and C++|C and C++]] .

### Profiling



This section specifies the requirements of a C++ profiling interface to MPI.

> [!warning] Advice to implementors

> Since the main goal of profiling is to intercept function calls from user code, it is the implementor’s decision how to layer the underlying implementation to allow function calls to be intercepted and profiled. If an implementation of the MPI C++ bindings is layered on top of MPI bindings in another language (such as C), or if the C++ bindings are layered on top of a profiling interface in another language, no extra profiling interface is necessary because the underlying MPI implementation already meets the MPI profiling interface requirements.
>
> Native C++ MPI implementations that do not have access to other profiling interfaces must implement an interface that meets the requirements outlined in this section.
>
> High quality implementations can implement the interface outlined in this section in order to promote portable C++ profiling libraries. Implementors may wish to provide an option whether to build the C++ profiling interface or not; C++ implementations that are already layered on top of bindings in another language or another profiling interface will have to insert a third layer to implement the C++ profiling interface.

To meet the requirements of the C++ MPI profiling interface, an implementation of the MPI functions *must*:

1.  Provide a mechanism through which all of the MPI defined functions may be accessed with a name shift. Thus all of the MPI functions (which normally start with the prefix “`MPI::`”) should also be accessible with the prefix “`PMPI::`.”

2.  Ensure that those MPI functions which are not replaced may still be linked into an executable image without causing name clashes.

3.  Document the implementation of different language bindings of the MPI interface if they are layered on top of each other, so that profiler developer knows whether they must implement the profile interface for each binding, or can economize by implementing it only for the lowest level routines.

4.  Where the implementation of different language bindings is is done through a layered approach (e.g., the C++ binding is a set of “wrapper” functions which call the C implementation), ensure that these wrapper functions are separable from the rest of the library.

    This is necessary to allow a separate profiling library to be correctly implemented, since (at least with Unix linker semantics) the profiling library must contain these wrapper functions if it is to perform as expected. This requirement allows the author of the profiling library to extract these functions from the original MPI library and add them into the profiling library without bringing along any other unnecessary code.

5.  Provide a no-op routine `MPI::­Pcontrol` in the MPI library.

> [!warning] Advice to implementors

> There are (at least) two apparent options for implementing the C++ profiling interface: inheritance or caching. An inheritance-based approach may not be attractive because it may require a virtual inheritance implementation of the communicator classes. Thus, it is most likely that implementors still cache `PMPI` objects on their corresponding `MPI` objects. The caching scheme is outlined below.
>
> The “real” entry points to each routine can be provided within a `namespace PMPI`. The non-profiling version can then be provided within a `namespace MPI`.
>
> Caching instances of `PMPI` objects in the `MPI` handles provides the “has a” relationship that is necessary to implement the profiling scheme.
>
> Each instance of an `MPI` object simply “wraps up” an instance of a `PMPI` object. `MPI` objects can then perform profiling actions before invoking the corresponding function in their internal `PMPI` object.
>
> The key to making the profiling work by simply re-linking programs is by having a header file that *declares* all the MPI functions. The functions must be *defined* elsewhere, and compiled into a library. MPI constants should be declared `extern` in the `MPI` namespace. For example, the following is an excerpt from a sample `mpi.h` file:
>
> 
>
> Sample `mpi.h` file.
>
>     namespace PMPI {
>       class Comm {
>       public:
>         int Get_size() const;
>       };
>       // etc.
>     };
>
>     namespace MPI {
>     public:
>       class Comm {
>       public:
>         int Get_size() const;
>
>       private:
>         PMPI::Comm pmpi_comm;
>       };
>     };
>
> 
>
> Note that all constructors, the assignment operator, and the destructor in the `MPI` class will need to initialize/destroy the internal `PMPI` object as appropriate.
>
> The definitions of the functions must be in separate object files; the `PMPI` class member functions and the non-profiling versions of the `MPI` class member functions can be compiled into `libmpi.a`, while the profiling versions can be compiled into `libpmpi.a`. Note that the `PMPI` class member functions and the `MPI` constants must be in different object files than the non-profiling `MPI` class member functions in the `libmpi.a` library to prevent multiple definitions of `MPI` class member function names when linking both `libmpi.a` and `libpmpi.a`. For example:
>
> 
>
> `pmpi.cc`, to be compiled into `libmpi.a`.
>
>     int PMPI::Comm::Get_size() const
>     {
>       // Implementation of MPI_COMM_SIZE
>     }
>
> 
>
> 
>
> `constants.cc`, to be compiled into `libmpi.a`.
>
>     const MPI::Intracomm MPI::COMM_WORLD;
>
> 
>
> 
>
> `mpi_no_profile.cc`, to be compiled into `libmpi.a`.
>
>     int MPI::Comm::Get_size() const
>     {
>       return pmpi_comm.Get_size();
>     }
>
> 
>
> 
>
> `mpi_profile.cc`, to be compiled into `libpmpi.a`.
>
>     int MPI::Comm::Get_size() const
>     {
>       // Do profiling stuff
>       int ret = pmpi_comm.Get_size();
>       // More profiling stuff
>       return ret;
>     }
>
> 

## Fortran Support

### Overview



Fortran 90 is the current international Fortran standard. MPI-2 Fortran bindings are Fortran 90 bindings that in most cases are “Fortran 77 friendly.” That is, with few exceptions (e.g., `KIND`-parameterized types, and the `mpi` module, both of which can be avoided) Fortran 77 compilers should be able to compile MPI programs.

> [!tip] Rationale

> Fortran 90 contains numerous features designed to make it a more “modern” language than Fortran 77. It seems natural that MPI should be able to take advantage of these new features with a set of bindings tailored to Fortran 90. MPI does not (yet)
>
> use many of these features
>
> because of a number of technical difficulties.

MPI defines two levels of Fortran support, described in Sections [[f90-basic]] and [[f90-extended]] . A third level of Fortran support is envisioned, but is deferred to future standardization efforts. In the rest of this section, “Fortran” shall refer to Fortran 90 (or its successor) unless qualified.

1.   Basic Fortran Support An implementation with this level of Fortran support provides the original Fortran bindings specified in MPI-1, with small additional requirements specified in Section [[f90-basic]] .

2.   Extended Fortran Support An implementation with this level of Fortran support provides Basic Fortran Support plus additional features that specifically support Fortran 90, as described in Section [[f90-extended]] .

A compliant MPI-2 implementation providing a Fortran interface must provide Extended Fortran Support unless the target compiler does not support modules or `KIND`-parameterized types.

### Problems With Fortran Bindings for MPI

This section discusses a number of problems that may arise when using MPI in a Fortran program. It is intended as advice to users, and clarifies how MPI interacts with Fortran. It does not add to the standard, but is intended to clarify the standard.

As noted in the original MPI specification, the interface violates the Fortran standard in several ways. While these cause few problems for Fortran 77 programs, they become more significant for Fortran 90 programs, so that users must exercise care when using new Fortran 90 features. The violations were originally adopted and have been retained because they are important for the usability of MPI. The rest of this section describes the potential problems in detail. It supersedes and replaces the discussion of Fortran bindings in the original MPI specification (for Fortran 90, not Fortran 77).

The following MPI features are inconsistent with Fortran 90.

1.  An MPI subroutine with a choice argument may be called with different argument types.

2.  An MPI subroutine with an assumed-size dummy argument may be passed an actual scalar argument.

3.  Many MPI routines assume that actual arguments are passed by address and that arguments are not copied on entrance to or exit from the subroutine.

4.  An MPI implementation may read or modify user data (e.g., communication buffers used by nonblocking communications) concurrently

    with a user program that is executing outside of MPI calls.

5.  Several named “constants,” such as MPI_BOTTOM, MPI_IN_PLACE, MPI_STATUS_IGNORE, MPI_STATUSES_IGNORE, MPI_ERRCODES_IGNORE, MPI_ARGV_NULL, and MPI_ARGVS_NULL are not ordinary Fortran constants and require a special implementation. See Section [[terms#Named Constants|Named Constants]] on page [[terms#Named Constants|Named Constants]] for more information.

6.  The memory allocation routine [[MPI_ALLOC_MEM]] can’t be usefully used in Fortran without a language extension that allows the allocated memory to be associated with a Fortran variable.

MPI-1 contained several routines that take address-sized information as input or return address-sized information as output. In C such arguments were of type `MPI_Aint` and in Fortran of type `INTEGER`. On machines where integers are smaller than addresses, these routines can lose information. In MPI-2 the use of these functions has been deprecated and they have been replaced by routines taking `INTEGER` arguments of `KIND=MPI_ADDRESS_KIND`. A number of new MPI-2 functions also take `INTEGER` arguments of non-default `KIND`. See Section [[terms#Language Binding|Language Binding]] on page [[terms#Language Binding|Language Binding]] and Section [[misc#New Datatype Manipulation Functions|New Datatype Manipulation Functions]] on page [[misc#New Datatype Manipulation Functions|New Datatype Manipulation Functions]] for more information.

#### Problems Due to Strong Typing

All MPI functions with choice arguments associate actual arguments of different Fortran datatypes with the same dummy argument. This is not allowed by Fortran 77, and in Fortran 90 is technically only allowed if the function is overloaded with a different function for each type. In C, the use of `void*` formal arguments avoids these problems.

The following code fragment is technically illegal and may generate a compile-time error.

      integer i(5)
      real    x(5)
      ...
      call mpi_send(x, 5, MPI_REAL, ...)
      call mpi_send(i, 5, MPI_INTEGER, ...)

In practice, it is rare for compilers to do more than issue a warning, though there is concern that Fortran 90 compilers are more likely to return errors.

It is also technically illegal in Fortran to pass a scalar actual argument to an array dummy argument. Thus the following code fragment may generate an error since the `buf` argument to [[MPI_SEND]] is declared as an assumed-size array `<type> buf(*)`.

      integer a
      call mpi_send(a, 1, MPI_INTEGER, ...)

> [!note] Advice to users

> In the event that you run into one of the problems related to type checking, you may be able to work around it by using a compiler flag, by compiling separately, or by using an MPI implementation with Extended Fortran Support as described in Section [[f90-extended]] . An alternative that will usually work with variables local to a routine but not with arguments to a function or subroutine is to use the `EQUIVALENCE` statement to create another variable with a type accepted by the compiler.

#### Problems Due to Data Copying and Sequence Association



Implicit in MPI is the idea of a contiguous chunk of memory accessible through a linear address space. MPI copies data to and from this memory. An MPI program specifies the location of data by providing memory addresses and offsets. In the C language, sequence association rules plus pointers provide all the necessary low-level structure.

In Fortran 90, user data is not necessarily stored contiguously. For example, the array section `A(1:N:2)` involves only the elements of `A` with indices 1, 3, 5, ... . The same is true for a pointer array whose target is such a section. Most compilers ensure that an array that is a dummy argument is held in contiguous memory if it is declared with an explicit shape (e.g., `B(N)`) or is of assumed size (e.g., `B(*)`). If necessary, they do this by making a copy of the array into contiguous memory. Both Fortran 77 and Fortran 90 are carefully worded to allow such copying to occur, but few Fortran 77 compilers do it.[^1]

Because MPI dummy buffer arguments are assumed-size arrays, this leads to a serious problem for a non-blocking call: the compiler copies the temporary array back on return but MPI continues to copy data to the memory that held it. For example, consider the following code fragment:

        real a(100)
        call MPI_IRECV(a(1:100:2), MPI_REAL, 50, ...)

Since the first dummy argument to [[MPI_IRECV]] is an assumed-size array (`<type> buf(*)`), the array section `a(1:100:2)` is copied to a temporary before being passed to [[MPI_IRECV]] , so that it is contiguous in memory. [[MPI_IRECV]] returns immediately, and data is copied from the temporary back into the array `a`. Sometime later, MPI

may write to the address of the deallocated temporary.

Copying is also a problem for [[MPI_ISEND]] since the temporary array may be deallocated before the data has all been sent from it.

Most Fortran 90 compilers do not make a copy if the actual argument is the whole of an explicit-shape or assumed-size array or is a ‘simple’ section such as `A(1:N)` of such an array. (We define ‘simple’ more fully in the next paragraph.) Also, many compilers treat allocatable arrays the same as they treat explicit-shape arrays in this regard (though we know of one that does not). However, the same is not true for assumed-shape and pointer arrays; since they may be discontiguous, copying is often done. It is this copying that causes problems for MPI as described in the previous paragraph.

Our formal definition of a ‘simple’ array section is

       name ( [:,]... [<subscript>]:[<subscript>] [,<subscript>]... )

That is, there are zero or more dimensions that are selected in full, then one dimension selected without a stride, then zero or more dimensions that are selected with a simple subscript. Examples are

       A(1:N), A(:,N), A(:,1:N,1), A(1:6,N), A(:,:,1:N)

Because of Fortran’s column-major ordering, where the first index varies fastest, a simple section of a contiguous array will also be contiguous.[^2]

The same problem can occur with a scalar argument. Some compilers, even for Fortran 77, make a copy of some scalar dummy arguments within a called procedure. That this can cause a problem is illustrated by the example

          call user1(a,rq) 
          call MPI_WAIT(rq,status,ierr) 
          write (*,*) a 

          subroutine user1(buf,request)
          call MPI_IRECV(buf,...,request,...) 
          end 

If `a` is copied, [[MPI_IRECV]] will alter the copy when it completes the communication and will not alter `a` itself.

Note that copying will almost certainly occur for an argument that is a non-trivial expression (one with at least one operator or function call), a section that does not select a contiguous part of its parent (e.g., `A(1:n:2)`), a pointer whose target is such a section, or an assumed-shape array that is (directly or indirectly) associated with such a section.

If there is a compiler option that inhibits copying of arguments, in either the calling or called procedure, this should be employed.

If a compiler makes copies in the calling procedure of arguments that are explicit-shape or assumed-size arrays, simple array sections of such arrays, or scalars, and if there is no compiler option to inhibit this, then the compiler cannot be used for applications that use

[[MPI_GET_ADDRESS]] , or any non-blocking MPI routine. If a

compiler copies scalar arguments in the called procedure and there is no compiler option to inhibit this, then this compiler cannot be used for applications that use memory references across subroutine calls as in the example above.

#### Special Constants

MPI requires a number of special “constants” that cannot be implemented as normal Fortran constants, including MPI_BOTTOM, MPI_STATUS_IGNORE, MPI_IN_PLACE, MPI_STATUSES_IGNORE and MPI_ERRCODES_IGNORE. In C, these are implemented as constant pointers, usually as `NULL` and are used where the function prototype calls for a pointer to a variable, not the variable itself.

In Fortran the implementation of these special constants may require the use of language constructs that are outside the Fortran standard. Using special values for the constants (e.g., by defining them through `parameter` statements) is not possible because an implementation cannot distinguish these values from legal data. Typically these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, this address can be extracted by some mechanism outside the Fortran standard (e.g., by Fortran extensions or by implementing the function in C).

#### Fortran 90 Derived Types

MPI does not explicitly support passing Fortran 90 derived types to choice dummy arguments. Indeed, for MPI implementations that provide explicit interfaces through the `mpi` module

a compiler will reject derived type actual arguments at compile time. Even when

no explicit interfaces are given, users should be aware that Fortran 90 provides no guarantee of sequence association for derived types or arrays of derived types. For instance, an array of a derived type consisting of two elements may be implemented as an array of the first elements followed by an array of the second. Use of the `SEQUENCE` attribute may help here, somewhat.

The following code fragment shows one possible way to send a derived type in Fortran. The example assumes that all data is passed by address.

        type mytype
           integer i
           real x
           double precision d
        end type mytype

        type(mytype) foo
        integer blocklen(3), type(3)
        integer(MPI_ADDRESS_KIND) disp(3), base

        call MPI_GET_ADDRESS(foo%i, disp(1), ierr)
        call MPI_GET_ADDRESS(foo%x, disp(2), ierr)
        call MPI_GET_ADDRESS(foo%d, disp(3), ierr)
         
        base = disp(1)
        disp(1) = disp(1) - base
        disp(2) = disp(2) - base
        disp(3) = disp(3) - base

        blocklen(1) = 1
        blocklen(2) = 1
        blocklen(3) = 1

        type(1) = MPI_INTEGER
        type(2) = MPI_REAL
        type(3) = MPI_DOUBLE_PRECISION

        call MPI_TYPE_CREATE_STRUCT(3, blocklen, disp, type, newtype, ierr)
        call MPI_TYPE_COMMIT(newtype, ierr)

    ! unpleasant to send foo%i instead of foo, but it works for scalar
    ! entities of type mytype
        call MPI_SEND(foo%i, 1, newtype, ...)

#### A Problem with Register Optimization



MPI provides operations that may be hidden from the user code

and run concurrently with it, accessing the same memory as user

code. Examples include the data transfer for an [[MPI_IRECV]] . The optimizer of a compiler will assume that it can recognize periods when a copy of a variable can be kept in a register without reloading from or storing to memory. When the user code is working with a register copy of some variable while the hidden operation reads or writes the memory copy, problems occur. This section discusses register optimization pitfalls.

When a variable is local to a Fortran subroutine (i.e., not in a module or `COMMON block`), the compiler will assume that it cannot be modified by a called subroutine unless it is an actual argument of the call. In the most common linkage convention, the subroutine is expected to save and restore certain registers. Thus, the optimizer will assume that a register which held a valid copy of such a variable before the call will still hold a valid copy on return.

Normally users are not afflicted with this. But the user should pay attention to this section if in his/her program a buffer argument to an [[MPI_SEND]] , [[MPI_RECV]] etc., uses a name which hides the actual variables involved. [[MPI_BOTTOM]] with an [[MPI_Datatype]] containing absolute addresses is one example. Creating a datatype which uses one variable as an anchor and brings along others by using [[MPI_GET_ADDRESS]] to determine their offsets from the anchor is another. The anchor variable would be the only one mentioned in the call. Also attention must be paid if MPI operations are used that run in parallel with the user’s application.

The following example shows what Fortran compilers are allowed to do.

This source ... can be compiled as:

    call MPI_GET_ADDRESS(buf,bufaddr,       call MPI_GET_ADDRESS(buf,...)
                   ierror)
    call MPI_TYPE_CREATE_STRUCT(1,1,        call MPI_TYPE_CREATE_STRUCT(...)
                   bufaddr,
                   MPI_REAL,type,ierror)
    call MPI_TYPE_COMMIT(type,ierror)       call MPI_TYPE_COMMIT(...)
    val_old = buf                           register = buf
                                            val_old = register
    call MPI_RECV(MPI_BOTTOM,1,type,...)    call MPI_RECV(MPI_BOTTOM,...)
    val_new = buf                           val_new = register

The compiler does not invalidate the register because it cannot see that [[MPI_RECV]] changes the value of [[buf]] . The access of [[buf]] is hidden by the use of [[MPI_GET_ADDRESS]] and [[MPI_BOTTOM]] .

The next example shows extreme, but allowed, possibilities.

Source compiled as or compiled as

    call MPI_IRECV(buf,..req)  call MPI_IRECV(buf,..req)  call MPI_IRECV(buf,..req)
                               register = buf             b1 = buf
    call MPI_WAIT(req,..)      call MPI_WAIT(req,..)      call MPI_WAIT(req,..)
    b1 = buf                   b1 := register

[[MPI_WAIT]] on a concurrent thread modifies [[buf]] between the invocation of [[MPI_IRECV]] and the finish of [[MPI_WAIT]] . But the compiler cannot see any possibility that [[buf]] can be changed after [[MPI_IRECV]] has returned, and may schedule the load of [[buf]] earlier than typed in the source. It has no reason to avoid using a register to hold [[buf]] across the call to [[MPI_WAIT]] . It also may reorder the instructions as in the case on the right.

To prevent instruction reordering or the allocation of a buffer in a register there are two possibilities in portable Fortran code:

- The compiler may be prevented from moving a reference to a buffer across a call to an MPI subroutine by surrounding the call by calls to an external subroutine with the buffer as an actual argument. Note that if the intent is declared in the external subroutine, it must be `OUT` or `INOUT`. The subroutine itself may have an empty body, but the compiler does not know this and has to assume that the buffer may be altered. For example, the above call of [[MPI_RECV]] might be replaced by

              call DD(buf)
              call MPI_RECV(MPI_BOTTOM,...)
              call DD(buf)

  with the separately compiled

              subroutine DD(buf)
                integer buf
              end

  (assuming that `buf` has type `INTEGER`). The compiler may be similarly prevented from moving a reference to a variable across a call to an MPI subroutine.

  In the case of a non-blocking call, as in the above call of [[MPI_WAIT]] , no reference to the buffer is permitted until it has been verified that the transfer has been completed. Therefore, in this case, the extra call ahead of the MPI call is not necessary, i.e., the call of [[MPI_WAIT]] in the example might be replaced by

                call MPI_WAIT(req,..)
                call DD(buf)

- An alternative is to put the buffer or variable into a module or a common block and access it through a `USE` or `COMMON` statement in each scope where it is referenced, defined or appears as an actual argument in a call to an MPI routine. The compiler will then have to assume that the MPI procedure ( [[MPI_RECV]] in the above example) may alter the buffer or variable, provided that the compiler cannot analyze that the MPI procedure does not reference the module or common block.

In the longer term, the attribute `VOLATILE` is under consideration for Fortran 2000 and would give the buffer or variable the properties needed, but it would inhibit optimization of any code containing the buffer or variable.

In C, subroutines which modify variables that are not in the argument

list will not cause register optimization problems. This is because taking pointers to storage objects by using the & operator and later referencing the objects by way of the pointer is an integral part of the language. A C compiler understands the implications, so that the problem should not occur, in general. However, some compilers do offer optional aggressive optimization levels which may not be safe.

### Basic Fortran Support



Because Fortran 90 is (for all practical purposes) a superset of Fortran 77, Fortran 90 (and future) programs can use the original Fortran interface. The following additional requirements are added:

1.  Implementations are required to provide the file `mpif.h`, as described in the original MPI-1 specification.

2.  `mpif.h` must be valid and equivalent for both fixed- and free- source form.

> [!warning] Advice to implementors

> To make `mpif.h` compatible with both fixed- and free-source forms, to allow automatic inclusion by preprocessors, and to allow extended fixed-form line length, it is recommended that requirement two be met by constructing `mpif.h` without any continuation lines. This should be possible because `mpif.h` contains only declarations, and because common block declarations can be split among several lines. To support Fortran 77 as well as Fortran 90, it may be necessary to eliminate all comments from `mpif.h`.

### Extended Fortran Support



Implementations with Extended Fortran support must provide:

1.  An `mpi` module

2.  A new set of functions to provide additional support for Fortran intrinsic numeric types, including parameterized types: [[MPI_SIZEOF]] , [[MPI_TYPE_MATCH_SIZE]] , [[MPI_TYPE_CREATE_F90_INTEGER]] , [[MPI_TYPE_CREATE_F90_REAL]] and [[MPI_TYPE_CREATE_F90_COMPLEX]] . Parameterized types are Fortran intrinsic types which are specified using `KIND` type parameters. These routines are described in detail in Section [[f90-types]] .

Additionally, high quality implementations should provide a mechanism to prevent fatal type mismatch errors for MPI routines with choice arguments.

#### The `mpi` Module

An MPI implementation must provide a module named `mpi` that can be `USE`d in a Fortran 90 program. This module must:

- Define all named MPI constants

- Declare MPI functions that return a value.

An MPI implementation may provide in the `mpi` module other features that enhance the usability of MPI while maintaining adherence to the standard. For example, it may:

- Provide interfaces for all or for a subset of MPI routines.

- Provide `INTENT` information in these interface blocks.

> [!warning] Advice to implementors

> The appropriate `INTENT` may be different from what is given in the MPI generic interface. Implementations must choose `INTENT` so that the function adheres to the MPI standard.

> [!tip] Rationale

> The intent given by the MPI generic interface is not precisely defined and does not in all cases correspond to the correct Fortran `INTENT`. For instance, receiving into a buffer specified by a datatype with absolute addresses may require associating MPI_BOTTOM with a dummy `OUT` argument. Moreover, “constants” such as MPI_BOTTOM and MPI_STATUS_IGNORE are not constants as defined by Fortran, but “special addresses” used in a nonstandard way. Finally, the MPI-1 generic intent is changed in several places by MPI-2. For instance, MPI_IN_PLACE changes the sense of an `OUT` argument to be `INOUT`.

Applications may use either the `mpi` module or the `mpif.h` include file. An implementation may require use of the module to prevent type mismatch errors (see below).

> [!note] Advice to users

> It is recommended to use the `mpi` module even if it is not necessary to use it to avoid type mismatch errors on a particular system. Using a module provides several potential advantages over using an include file.

It must be possible to link together routines some of which `USE` `mpi` and others of which `INCLUDE` `mpif.h`.

#### No Type Mismatch Problems for Subroutines with Choice Arguments

A high quality MPI implementation should provide a mechanism to ensure that MPI choice arguments do not cause fatal compile-time or run-time errors due to type mismatch. An MPI implementation may require applications to use the `mpi` module, or require that it be compiled with a particular compiler flag, in order to avoid type mismatch problems.

> [!warning] Advice to implementors

> In the case where the compiler does not generate errors, nothing needs to be done to the existing interface. In the case where the compiler may generate errors, a set of overloaded functions may be used. See the paper of M. Hennecke . Even if the compiler does not generate errors, explicit interfaces for all routines would be useful for detecting errors in the argument list. Also, explicit interfaces which give `INTENT` information can reduce the amount of copying for `BUF(*)` arguments.

### Additional Support for Fortran Numeric Intrinsic Types



The routines in this section are part of Extended Fortran Support described in Section [[f90-extended]] .

MPI-1 provides a small number of named datatypes that correspond to named intrinsic types supported by C and Fortran. These include MPI_INTEGER, MPI_REAL, MPI_INT, MPI_DOUBLE, etc., as well as the optional types MPI_REAL4, MPI_REAL8, etc. There is a one-to-one correspondence between language declarations and MPI types.

Fortran (starting with Fortran 90) provides so-called `KIND`-parameterized types. These types are declared using an intrinsic type (one of `INTEGER`, `REAL`, `COMPLEX`, `LOGICAL` and `CHARACTER`) with an optional integer `KIND` parameter that selects from among one or more variants. The specific meaning of different `KIND` values themselves are implementation dependent and not specified by the language. Fortran provides the `KIND` selection functions `selected_real_kind` for `REAL` and `COMPLEX` types, and `selected_int_kind` for `INTEGER` types that allow users to declare variables with a minimum precision or number of digits. These functions provide a portable way to declare `KIND`-parameterized `REAL`, `COMPLEX` and `INTEGER` variables in Fortran.

This scheme is backward compatible with Fortran 77. `REAL` and `INTEGER` Fortran variables have a default `KIND` if none is specified. Fortran DOUBLE PRECISION variables are of intrinsic type `REAL` with a non-default `KIND`. The following two declarations are equivalent:

        double precision x
        real(KIND(0.0d0)) x

MPI provides two orthogonal methods to communicate using numeric intrinsic types. The first method can be used when variables have been declared in a portable way — using default `KIND` or using `KIND` parameters obtained with the `selected_int_kind` or `selected_real_kind` functions. With this method, MPI automatically selects the correct data size (e.g., 4 or 8 bytes) and provides representation conversion in heterogeneous environments. The second method gives the user complete control over communication by exposing machine representations.

#### Parameterized Datatypes with Specified Precision and Exponent Range

MPI-1 provides named datatypes corresponding to standard Fortran 77 numeric types — MPI_INTEGER, MPI_COMPLEX, MPI_REAL, MPI_DOUBLE_PRECISION and MPI_DOUBLE_COMPLEX. MPI automatically selects the correct data size and provides representation conversion in heterogeneous environments. The mechanism described in this section extends this MPI-1 model to support portable parameterized numeric types.

The model for supporting portable parameterized types is as follows. Real variables are declared (perhaps indirectly) using `selected_real_kind(p, r)` to determine the `KIND` parameter, where `p` is decimal digits of precision and `r` is an exponent range.

Implicitly MPI maintains

a two-dimensional array of predefined MPI datatypes `D(p, r)`. `D(p, r)` is defined for each value of `(p, r)` supported by the compiler, including pairs for which one value is unspecified. Attempting to access an element of the array with an index `(p, r)` not supported by the compiler is erroneous.

MPI implicitly maintains a similar array of `COMPLEX` datatypes.

For integers, there is a similar implicit array related to `selected_int_kind` and indexed by

the requested number of digits `r`. Note that the predefined datatypes

contained in these implicit arrays are not the same as the named MPI datatypes MPI_REAL, etc., but a new set.

> [!warning] Advice to implementors

> The above description is for explanatory purposes only. It is not expected that implementations will have such internal arrays.

> [!note] Advice to users

> `selected_real_kind()` maps a large number of `(p,r)` pairs to a much smaller number of `KIND` parameters supported by the compiler. `KIND` parameters are not specified by the language and are not portable. From the language point of view intrinsic types of the same base type and `KIND` parameter are of the same type. In order to allow interoperability in a heterogeneous environment, MPI is more stringent. The corresponding MPI datatypes match if and only if they have the same `(p,r)` value (`REAL` and `COMPLEX`) or `r` value (`INTEGER`). Thus MPI has many more datatypes than there are fundamental language types.

![[API/MPI_TYPE_CREATE_F90_REAL]]

This function returns a predefined MPI datatype that matches a `REAL` variable of `KIND` `selected_real_kind(p, r)`. In the model described above it returns a handle for the element `D(p, r)`.

Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to MPI_UNDEFINED.

In communication, an MPI datatype `A` returned by [[MPI_TYPE_CREATE_F90_REAL]] matches a datatype `B` if and only if `B` was returned by [[MPI_TYPE_CREATE_F90_REAL]] called with the same values for `p` and `r` or `B` is a duplicate of such a datatype.

Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .

It is erroneous to supply values for `p` and `r` not supported by the compiler.

![[API/MPI_TYPE_CREATE_F90_COMPLEX]]

This function returns a predefined MPI datatype that matches a `COMPLEX` variable of `KIND` `selected_real_kind(p, r)`.

Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to MPI_UNDEFINED.

Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[MPI_TYPE_CREATE_F90_REAL]] .

Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .

It is erroneous to supply values for `p` and `r` not supported by the compiler.

![[API/MPI_TYPE_CREATE_F90_INTEGER]]

This function returns a predefined MPI datatype that matches a `INTEGER` variable of `KIND` `selected_int_kind(r)`. Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[MPI_TYPE_CREATE_F90_REAL]] .

Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .

It is erroneous to supply a value for `r` that is not supported by the compiler.

Example:

       integer       longtype, quadtype
       integer, parameter :: long = selected_int_kind(15)
       integer(long) ii(10)
       real(selected_real_kind(30)) x(10)
       call MPI_TYPE_CREATE_F90_INTEGER(15, longtype, ierror)
       call MPI_TYPE_CREATE_F90_REAL(30, MPI_UNDEFINED, quadtype, ierror)
       ...

       call MPI_SEND(ii, 10, longtype, ...)
       call MPI_SEND(x,  10, quadtype, ...)

> [!note] Advice to users

> The datatypes returned by the above functions are predefined datatypes. They cannot be freed; they do not need to be committed; they can be used with predefined reduction operations. There are two situations in which they behave differently syntactically, but not semantically, from the MPI named predefined datatypes.
>
> 1.  [[MPI_TYPE_GET_ENVELOPE]] returns special combiners that allow a program to retrieve the values of [[p]] and [[r]] .
>
> 2.  Because the datatypes are not named, they cannot be used as compile-time initializers or otherwise accessed before a call to one of the [[MPI_TYPE_CREATE_F90]] routines.
>
> If a variable was declared specifying a non-default `KIND` value that was not obtained with `selected_real_kind()` or `selected_int_kind()`, the only way to obtain a matching MPI datatype is to use the size-based mechanism described in the next section.

> [!tip] Rationale

> The [[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] interface needs as input the original range and precision values to be able to define useful and compiler-independent external (Section [[io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[io#External Data Representation: “external32”|External Data Representation: “external32”]] ) or user-defined (Section [[io#User-Defined Data Representations|User-Defined Data Representations]] on page [[io#User-Defined Data Representations|User-Defined Data Representations]] ) data representations, and in order to be able to perform automatic and efficient data conversions in a heterogeneous environment.

We now specify how the datatypes described in this section behave when used with the “external32” external data representation described in Section [[io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[io#External Data Representation: “external32”|External Data Representation: “external32”]] .

The external32 representation specifies data formats for integer and floating point values. Integer values are represented in two’s complement big-endian format. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double” and “Double Extended” formats, requiring 4, 8 and 16 bytes of storage, respectively.

For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits, bias = +10383, 112 fraction bits, and an encoding analogous to the “Double” format.

The external32 representations of the datatypes returned by [[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] are given by the following rules.

  For [[MPI_TYPE_CREATE_F90_REAL]] :

       if      (p > 33) or (r > 4931) then  external32 representation
                                            is undefined  
       else if (p > 15) or (r >  307) then  external32_size = 16
       else if (p >  6) or (r >   37) then  external32_size =  8
       else                                 external32_size =  4

For [[MPI_TYPE_CREATE_F90_COMPLEX]] : twice the size as for [[MPI_TYPE_CREATE_F90_REAL]] .  For [[MPI_TYPE_CREATE_F90_INTEGER]] :

       if      (r > 38) then  external32 representation is undefined
       else if (r > 18) then  external32_size =  16 
       else if (r >  9) then  external32_size =  8 
       else if (r >  4) then  external32_size =  4
       else if (r >  2) then  external32_size =  2 
       else                   external32_size =  1 

If the external32 representation of a datatype is undefined, the result of using the datatype directly or indirectly (i.e., as part of another datatype or through a duplicated datatype) in operations that require the external32 representation is undefined. These operations include [[MPI_PACK_EXTERNAL]] , [[MPI_UNPACK_EXTERNAL]] and many [[MPI_FILE]] functions, when the “external32” data representation is used. The ranges for which the external32 representation is undefined are reserved for future standardization.

#### Support for Size-specific MPI Datatypes



MPI-1 provides named datatypes corresponding to optional Fortran 77 numeric types that contain explicit byte lengths — MPI_REAL4, MPI_INTEGER8, etc. This section describes a mechanism that generalizes this model to support all Fortran numeric intrinsic types.

We assume that for each **typeclass** (integer, real, complex) and each word size there is a unique machine representation. For every pair (**typeclass**, **n**) supported by a compiler, MPI must provide a named size-specific datatype. The name of this datatype is of the form `MPI_`$`<`$`TYPE`$`>`$`n` in C and Fortran and of the form `MPI::`$`<`$`TYPE`$`>`$`n` in C++ where $`<`$`TYPE`$`>`$ is one of `REAL`, `INTEGER` and `COMPLEX`, and **n** is the length in bytes of the machine representation. This datatype locally matches all variables of type (**typeclass**, **n**). The list of names for such types includes:

    MPI_REAL4   
    MPI_REAL8
    MPI_REAL16   
    MPI_COMPLEX8
    MPI_COMPLEX16
    MPI_COMPLEX32
    MPI_INTEGER1
    MPI_INTEGER2   
    MPI_INTEGER4
    MPI_INTEGER8   
    MPI_INTEGER16   

In MPI-1 these datatypes are all optional and correspond to the optional, nonstandard declarations supported by many Fortran compilers. In MPI-2, one datatype is required for each representation supported by the compiler. To be backward compatible with the interpretation of these types in MPI-1, we assume that the nonstandard declarations `REAL*n`, `INTEGER*n`, always create a variable whose representation is of size **n**. All these datatypes are predefined.

The following functions allow a user to obtain a size-specific MPI datatype for any intrinsic Fortran type.

![[API/MPI_SIZEOF]]

This function returns the size in bytes of the machine representation of the given variable. It is a generic Fortran routine and has a Fortran binding only.

> [!note] Advice to users

> This function is similar to the C and C++ *sizeof* operator but behaves slightly differently. If given an array argument, it returns the size of the base element, not the size of the whole array.

> [!tip] Rationale

> This function is not available in other languages because it would not be useful.

![[API/MPI_TYPE_MATCH_SIZE]]

`typeclass` is one of MPI_TYPECLASS_REAL, MPI_TYPECLASS_INTEGER and MPI_TYPECLASS_COMPLEX, corresponding to the desired **typeclass**. The function returns an MPI datatype matching a local variable of type (**typeclass**, **size**).

This function returns a reference (handle) to one of the predefined named datatypes, not a duplicate. This type cannot be freed.

[[MPI_TYPE_MATCH_SIZE]] can be used to obtain a size-specific type that matches a Fortran numeric intrinsic type by first calling [[MPI_SIZEOF]] in order to compute the variable size, and then calling [[MPI_TYPE_MATCH_SIZE]] to find a suitable datatype.

In C and C++, one can use the C function [[sizeof]] , instead of [[MPI_SIZEOF]] . In addition, for variables of default kind the variable’s size can be computed by a call to [[MPI_TYPE_GET_EXTENT]] , if the `typeclass` is known. It is erroneous to specify a size not supported by the compiler.

> [!tip] Rationale

> This is a convenience function. Without it, it can be tedious to find the correct named type. See note to implementors below.

> [!warning] Advice to implementors

> This function could be implemented as a series of tests.
>
>     int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *rtype)
>     {
>       switch(typeclass) {
>           case MPI_TYPECLASS_REAL: switch(size) {
>             case 4: *rtype = MPI_REAL4; return MPI_SUCCESS;
>             case 8: *rtype = MPI_REAL8; return MPI_SUCCESS;
>             default: error(...);
>           }
>           case MPI_TYPECLASS_INTEGER: switch(size) {
>              case 4: *rtype = MPI_INTEGER4; return MPI_SUCCESS;         
>              case 8: *rtype = MPI_INTEGER8; return MPI_SUCCESS;
>              default: error(...);       }
>          ... etc ... 
>        }
>     } 

#### Communication With Size-specific Types

The usual type matching rules apply to size-specific datatypes: a value sent with datatype `MPI_`$`<`$`TYPE`$`>`$`n` can be received with this same datatype on another process. Most modern computers use 2’s complement for integers and IEEE format for floating point. Thus, communication using these size-specific datatypes will not entail loss of precision or truncation errors.

> [!note] Advice to users

> Care is required when communicating in a heterogeneous environment. Consider the following code:
>
>     real(selected_real_kind(5)) x(100)   
>     call MPI_SIZEOF(x, size, ierror)   
>     call MPI_TYPE_MATCH_SIZE(MPI_TYPECLASS_REAL, size, xtype, ierror)   
>     if (myrank .eq. 0) then
>         ... initialize x ...      
>         call MPI_SEND(x, xtype, 100, 1, ...)   
>     else if (myrank .eq. 1) then      
>         call MPI_RECV(x, xtype, 100, 0, ...)
>     endif 
>
> This may not work in a heterogeneous environment if the value of `size` is not the same on process 1 and process 0. There should be no problem in a homogeneous environment. To communicate in a heterogeneous environment, there are at least four options. The first is to declare variables of default type and use the MPI datatypes for these types, e.g., declare a variable of type `REAL` and use MPI_REAL. The second is to use `selected_real_kind` or `selected_int_kind` and with the functions of the previous section. The third is to declare a variable that is known to be the same size on all architectures (e.g., `selected_real_kind(12)` on almost all compilers will result in an 8-byte representation). The fourth is to carefully check representation size before communication. This may require explicit conversion to a variable of size that can be communicated and handshaking between sender and receiver to agree on a size.
>
> Note finally that using the “external32” representation for I/O requires explicit attention to the representation sizes. Consider the following code:
>
>     real(selected_real_kind(5)) x(100)  
>     call MPI_SIZEOF(x, size, ierror)   
>     call MPI_TYPE_MATCH_SIZE(MPI_TYPECLASS_REAL, size, xtype, ierror)
>
>     if (myrank .eq. 0) then
>        call MPI_FILE_OPEN(MPI_COMM_SELF, 'foo',                &
>                           MPI_MODE_CREATE+MPI_MODE_WRONLY,     &
>                           MPI_INFO_NULL, fh, ierror)
>        call MPI_FILE_SET_VIEW(fh, 0, xtype, xtype, 'external32',  &
>                               MPI_INFO_NULL, ierror)
>        call MPI_FILE_WRITE(fh, x, 100, xtype, status, ierror)
>        call MPI_FILE_CLOSE(fh, ierror)
>     endif
>
>     call MPI_BARRIER(MPI_COMM_WORLD, ierror)
>
>     if (myrank .eq. 1) then
>        call MPI_FILE_OPEN(MPI_COMM_SELF, 'foo', MPI_MODE_RDONLY,  &
>                      MPI_INFO_NULL, fh, ierror)
>        call MPI_FILE_SET_VIEW(fh, 0, xtype, xtype, 'external32',  &
>                               MPI_INFO_NULL, ierror)
>        call MPI_FILE_WRITE(fh, x, 100, xtype, status, ierror)
>        call MPI_FILE_CLOSE(fh, ierror)
>     endif
>
> If processes 0 and 1 are on different machines, this code may not work as expected if the `size` is different on the two machines.

[^1]: Technically, the Fortran standards are worded to allow non-contiguous storage of any array data.

[^2]: To keep the definition of ‘simple’ simple, we have chosen to require all but one of the section subscripts to be without bounds. A colon without bounds makes it obvious both to the compiler and to the reader that the whole of the dimension is selected. It would have been possible to allow cases where the whole dimension is selected with one or two bounds, but this means for the reader that the array declaration or most recent allocation has to be consulted and for the compiler that a run-time check may be required.
