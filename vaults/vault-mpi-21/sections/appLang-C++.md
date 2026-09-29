# C++ Bindings



## Point-to-Point Communication C++ Bindings

    namespace MPI {

    };

## Datatypes C++ Bindings

    namespace MPI {

    };

## Collective Communication C++ Bindings

    namespace MPI {

    };

## Groups, Contexts, Communicators, and Caching C++ Bindings

    namespace MPI {

    };

## Process Topologies C++ Bindings

    namespace MPI {

    };

## MPI Environmenta Management C++ Bindings

    namespace MPI {

    };

## The Info Object C++ Bindings

    namespace MPI {

    };

## Process Creation and Management C++ Bindings

    namespace MPI {

    };

## One-Sided Communications C++ Bindings

    namespace MPI {

    };

## External Interfaces C++ Bindings

    namespace MPI {

    };

## I/O C++ Bindings

    namespace MPI {

    };

## Language Bindings C++ Bindings

    namespace MPI {

    };

## Profiling Interface C++ Bindings

    namespace MPI {

    };

## Deprecated C++ Bindings

    namespace MPI {

    };

## C++ Bindings on all MPI Classes

The C++ language requires all classes to have four special functions: a default constructor, a copy constructor, a destructor, and an assignment operator. The bindings for these functions are listed below; their semantics are discussed in Section [[binding#Semantics|Semantics]] .

The two constructors are *not* `virtual`.

The bindings prototype functions

are

using the type `<CLASS>` rather than listing each function for every MPI

class. The

token `<CLASS>` can be replaced with valid MPI-2 class names, such as `Group`, `Datatype`, etc., except when noted.

In addition, bindings are provided for comparison and inter-language operability from Sections [[binding#Comparison|Comparison]] and [[binding#Mixed-Language Operability|Mixed-Language Operability]] .

## Construction / Destruction

    namespace MPI {

    };

## Copy / Assignment

    namespace MPI {

    };

## Comparison

Since `Status` instances are not handles to underlying MPI objects, the `operator==()` and `operator!=()` functions are not defined on the `Status` class.

    namespace MPI {

    };

## Inter-language Operability

Since there are no C++ `MPI::STATUS_IGNORE` and `MPI::STATUSES_IGNORE` objects, the

result

of promoting the C or Fortran handles (MPI_STATUS_IGNORE and MPI_STATUSES_IGNORE) to C++ is undefined.

    namespace MPI {

    };
