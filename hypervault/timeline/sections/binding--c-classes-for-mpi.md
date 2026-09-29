---
title: "C++ Classes for MPI"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# C++ Classes for MPI

Chapter **binding** · in [[versions/v20/sections/binding#C++ Classes for MPI|MPI-2.0]], [[versions/v21/sections/binding#C++ Classes for MPI|MPI-2.1]], [[versions/v22/sections/binding#C++ Classes for MPI|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~Thus, instead of the `MPI_` prefix that is used in C and Fortran, MPI functions essentially have an `MPI::` prefix.~~

~~> [!warning] Advice to implementors~~

~~> Although `namespace` is officially part of the draft ANSI C++ standard, as of this writing it not yet widely implemented in C++ compilers. Implementations using compilers without `namespace` may obtain the same scoping through the use of a non-instantiable `MPI` class. (To make the `MPI` class non-instantiable, all constructors must be `private`.)~~

~~The members of the `MPI` namespace are those classes corresponding to objects implicitly used by MPI. An abbreviated definition of the `MPI` namespace for MPI-1 and its member classes is as follows:~~

~~    namespace MPI {       class Comm                             {...};       class Intracomm : public Comm          {...};       class Graphcomm : public Intracomm     {...};       class Cartcomm  : public Intracomm     {...};       class Intercomm : public Comm          {...};       class Datatype                         {...};       class Errhandler                       {...};       class Exception                        {...};       class Group                            {...};       class Op                               {...};       class Request                          {...};       class Prequest  : public Request       {...};       class Status                           {...};     };~~

~~Additionally, the following classes defined for MPI-2:~~

~~    namespace MPI {       class File                             {...};       class Grequest  : public Request       {...};       class Info                             {...};       class Win                              {...};     };~~

==Thus, instead of the `MPI_` prefix that is used in C and Fortran, MPI functions essentially have an==

==`MPI::` prefix.==

==The members of the `MPI` namespace are those classes corresponding to objects implicitly used by MPI. An abbreviated definition of the `MPI` namespace and its member classes is as follows:==

==    namespace MPI {       class Comm                             {...};       class Intracomm : public Comm          {...};       class Graphcomm : public Intracomm     {...};       class Cartcomm  : public Intracomm     {...};       class Intercomm : public Comm          {...};       class Datatype                         {...};       class Errhandler                       {...};       class Exception                        {...};       class File                             {...};       class Group                            {...};       class Info                             {...};       class Op                               {...};       class Request                          {...};       class Prequest  : public Request       {...};       class Grequest  : public Request       {...};       class Status                           {...};       class Win                              {...};     };==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~    namespace MPI {       class Comm                             {...};       class Intracomm : public Comm          {...};       class Graphcomm : public Intracomm     {...};       class Cartcomm  : public Intracomm     {...};       class Intercomm : public Comm          {...};       class Datatype                         {...};       class Errhandler                       {...};       class Exception                        {...};       class File                             {...};       class Group                            {...};       class Info                             {...};       class Op                               {...};       class Request                          {...};       class Prequest  : public Request       {...};       class Grequest  : public Request       {...};       class Status                           {...};       class Win                              {...};     };~~

==(code block added)==
```
namespace MPI {
  class Comm                             {...};
  class Intracomm : public Comm          {...};
  class Graphcomm : public Intracomm     {...};
%
  class Distgraphcomm : public Intracomm {...}; 
%
  class Cartcomm  : public Intracomm     {...};
  class Intercomm : public Comm          {...};
  class Datatype                         {...};
  class Errhandler                       {...};
  class Exception                        {...};
  class File                             {...};
  class Group                            {...};
  class Info                             {...};
  class Op                               {...};
  class Request                          {...};
  class Prequest  : public Request       {...};
  class Grequest  : public Request       {...};
  class Status                           {...};
  class Win                              {...};
};
```

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#C++ Classes for MPI]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#C++ Classes for MPI]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#C++ Classes for MPI]]
