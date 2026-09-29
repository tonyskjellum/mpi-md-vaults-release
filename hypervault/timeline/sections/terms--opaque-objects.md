---
title: "Opaque Objects"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Opaque Objects

Chapter **terms** · in [[versions/v13/sections/terms#Opaque objects|MPI-1.3]], [[versions/v20/sections/terms#Opaque Objects|MPI-2.0]], [[versions/v21/sections/terms#Opaque Objects|MPI-2.1]], [[versions/v22/sections/terms#Opaque Objects|MPI-2.2]], [[versions/v30/sections/terms#Opaque Objects|MPI-3.0]], [[versions/v31/sections/terms#Opaque Objects|MPI-3.1]], [[versions/v40/sections/terms#Opaque Objects|MPI-4.0]], [[versions/v41/sections/terms#Opaque Objects|MPI-4.1]], [[versions/v50/sections/terms#Opaque Objects|MPI-5.0]]

Heading by release: MPI-1.3: “Opaque objects”; MPI-2.0: “Opaque Objects”; MPI-2.1: “Opaque Objects”; MPI-2.2: “Opaque Objects”; MPI-3.0: “Opaque Objects”; MPI-3.1: “Opaque Objects”; MPI-4.0: “Opaque Objects”; MPI-4.1: “Opaque Objects”; MPI-5.0: “Opaque Objects”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

~~MPI manages **system memory** that is used for buffering messages and for storing internal representations of various MPI objects such as groups, communicators, datatypes, etc. This memory is not directly accessible to the user, and objects stored there are **opaque**: their size and shape is not visible to the user. Opaque objects are accessed via **handles**, which exist in user space. MPI procedures that operate on opaque objects are passed handle arguments to access these objects. In addition to their use by MPI calls for object access, handles can participate in assignment and comparisons.~~

~~In Fortran, all handles have type `INTEGER`. In C, a different handle type is defined for each category of objects. These should be types that support assignment and equality operators.~~

~~In Fortran, the handle can be an index to a table of opaque objects in system table; in C it can be such index or a pointer to the object. More bizarre possibilities exist.~~

~~Opaque objects are allocated and deallocated by calls that are specific to each object type. These are listed in the sections where the objects are described. The calls accept a handle argument of matching type. In an allocate call this is an `OUT` argument that returns a valid reference to the object. In a call to deallocate this is an `INOUT` argument which returns with a~~

~~“null handle” value. MPI provides a “null handle” constant for each object type.~~

~~Comparisons to this constant are used to test for validity of the handle.~~

~~A call to deallocate invalidates the handle and marks the object for deallocation. The object is not accessible to the user after the call. However, MPI need not deallocate the object immediatly. Any operation pending (at the time of the deallocate) that involves this object will complete normally; the object will be deallocated afterwards.~~

~~MPI calls do not change the value of handles, with the exception of calls that allocate and deallocate objects, and of the call [[versions/v21/API/MPI_TYPE_COMMIT|MPI_TYPE_COMMIT]] , in Section [[versions/v21/sections/pt2pt#Commit and free|Commit and free]] .~~

~~A null handle argument is an erroneous `IN` argument in MPI calls, unless an exception is explicitly stated in the text that defines the function. Such exception is allowed for handles to request objects in Wait and Test calls (sections [[versions/v21/sections/pt2pt#Communication Completion|Communication Completion]] and [[versions/v21/sections/pt2pt#Multiple Completions|Multiple Completions]] ). Otherwise, a null handle can only be passed to a function that allocates a new object and returns a reference to it in the handle.~~

~~An opaque object and its handle are significant only at the process where the object was created, and cannot be transferred to another process.~~

~~MPI provides certain predefined opaque objects and predefined, static handles to these objects. Such objects may not be destroyed.~~

==MPI manages **system memory** that is used for buffering messages and for storing internal representations of various MPI objects such as groups, communicators, datatypes, etc. This memory is not directly accessible to the user, and objects stored there are **opaque**: their size and shape is not visible to the user. Opaque objects are accessed via **handles**, which exist in user space. MPI procedures that operate on opaque objects are passed handle arguments to access these objects. In addition to their use by MPI calls for object access, handles can participate in assignments and comparisons.==

==In Fortran, all handles have type `INTEGER`. In C and C++, a different handle type is defined for each category of objects. In addition, handles themselves are distinct objects in C++. The C and C++ types must support the use of the assignment and equality operators.==

==> [!warning] Advice to implementors==

==> In Fortran, the handle can be an index into a table of opaque objects in a system table; in C it can be such an index or a pointer to the object. C++ handles can simply “wrap up” a table index or pointer.==

==Opaque objects are allocated and deallocated by calls that are specific to each object type. These are listed in the sections where the objects are described. The calls accept a handle argument of matching type. In an allocate call this is an `OUT` argument that returns a valid reference to the object. In a call to deallocate this is an `INOUT` argument which returns with an “invalid handle” value. MPI provides an “invalid handle” constant for each object type. Comparisons to this constant are used to test for validity of the handle.==

==A call to a deallocate routine invalidates the handle and marks the object for deallocation. The object is not accessible to the user after the call. However, MPI need not deallocate the object immediately. Any operation pending (at the time of the deallocate) that involves this object will complete normally; the object will be deallocated afterwards.==

==An opaque object and its handle are significant only at the process where the object was created and cannot be transferred to another process.==

==MPI provides certain predefined opaque objects and predefined, static handles to these objects. The user must not free such objects. In C++, this is enforced by declaring the handles to these predefined objects to be `static const`.==

> This design hides the internal representation used for MPI data structures, thus allowing similar calls in ~~C~~ ==C, C++,== and Fortran. It also avoids conflicts with the typing rules in these languages, and easily allows future extensions of functionality. The mechanism for opaque objects used here loosely follows the POSIX Fortran binding standard. > > The explicit ~~separating~~ ==separation== of handles in user ~~space,~~ ==space and== objects in system ~~space,~~ ==space== allows ~~space-reclaiming,~~ ==space-reclaiming and== deallocation calls to be made at appropriate points in the user program. If the opaque objects were in user space, one would have to be very careful not to go out of scope before any pending operation requiring that object completed. The specified design allows an object to be marked for deallocation, the user program can then go out of scope, and the object itself still persists until any pending operations are complete. > > The requirement that handles support assignment/comparison is made since such operations are common. This restricts the domain of possible implementations. The alternative would have been to allow handles to have been an arbitrary, opaque type. This would force the introduction of routines to do assignment and comparison, adding complexity, and was therefore ruled out.

> A user may accidently create a dangling reference by assigning to a handle the value of another handle, and then deallocating the object associated with these handles. Conversely, if a handle variable is deallocated before the associated object is freed, then the object becomes inaccessible (this may occur, for example, if the handle is a local variable within a subroutine, and the subroutine is exited before the associated object is deallocated). It is the user’s responsibility to avoid adding or deleting references to opaque objects, except as a result of ==MPI== calls that allocate or deallocate such objects.

> The intended semantics of opaque objects is that ~~each~~ opaque ~~object is~~ ==objects are== separate from ~~each other;~~ ==one another;== each call to allocate such an object copies all the information required for the object. Implementations may avoid excessive copying by substituting referencing for copying. For example, a derived datatype may contain references to its components, rather then copies of its components; a call to [[versions/v21/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] may return a reference to the group associated with the communicator, rather than a copy of this group. In such cases, the implementation must maintain reference counts, and allocate and deallocate objects ==in== such ==a way== that the visible effect is as if the objects were copied.

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~In Fortran, all handles have type `INTEGER`. In C and C++, a different handle type is defined for each category of objects. In addition, handles themselves are distinct objects in C++. The C and C++ types must support the use of the assignment and equality operators.~~

==In Fortran with `USE` `mpi` or `INCLUDE` `’mpif.h’`, all handles have type `INTEGER`. In Fortran with `USE mpi_f08`, and in C, a different handle type is defined for each category of objects.==

==With Fortran `USE mpi_f08`, the handles are defined as Fortran `BIND(C)` derived types that consist of only==

==one element `INTEGER` `::` `MPI_VAL`. The internal handle value is identical to the Fortran `INTEGER` value used in the `mpi` module and `mpif.h`.==

==The operators `.EQ.`, `.NE.`, `==` and `/=` are overloaded to allow the comparison of these handles.==

==The type names are identical to the names in C, except that they are not case sensitive. For example:==

==    TYPE, BIND(C) :: MPI_Comm       INTEGER   :: MPI_VAL     END TYPE MPI_Comm==

==The C types must support the use of the assignment and equality operators.==

~~> In Fortran, the handle can be an index into a table of opaque objects in a system table; in C it can be such an index or a pointer to the object. C++ handles can simply “wrap up” a table index or pointer.~~

==> In Fortran, the handle can be an index into a table of opaque objects in a system table; in C it can be such an index or a pointer to the object.==

==> [!tip] Rationale==

==> Since the Fortran integer values are equivalent, applications can easily convert MPI handles between all three supported Fortran methods. For example, an integer communicator handle `COMM` can be converted directly into an exactly equivalent `mpi_f08` communicator handle named `comm_f08` by `comm_f08%MPI_VAL=COMM`, and vice versa. The use of the `INTEGER` defined handles and the `BIND(C)` derived type handles is different: Fortran 2003 (and later) define that `BIND(C)` derived types can be used within user defined common blocks, but it is up to the rules of the companion C compiler how many numerical storage units are used for these `BIND(C)` derived type handles. > > Most compilers use one unit for both, the `INTEGER` handles and the handles defined as `BIND(C)` derived types.==

==> [!note] Advice to users==

==> If a user wants to substitute `mpif.h` or the `mpi` module by the `mpi_f08` module and the application program stores a handle in a Fortran common block then it is necessary to change the Fortran support method in all application routines that use this common block, because the number of numerical storage units of such a handle can be different in the two modules.==

MPI provides certain predefined opaque objects and predefined, static handles to these objects. The user must not free such objects. ~~In C++, this is enforced by declaring the handles to these predefined objects to be `static const`.~~

> This design hides the internal representation used for MPI data structures, thus allowing similar calls in ~~C, C++,~~ ==C== and Fortran. It also avoids conflicts with the typing rules in these languages, and easily allows future extensions of functionality. The mechanism for opaque objects used here loosely follows the POSIX Fortran binding standard. > > The explicit separation of handles in user space and objects in system space allows space-reclaiming and deallocation calls to be made at appropriate points in the user program. If the opaque objects were in user space, one would have to be very careful not to go out of scope before any pending operation requiring that object completed. The specified design allows an object to be marked for deallocation, the user program can then go out of scope, and the object itself still persists until any pending operations are complete. > > The requirement that handles support assignment/comparison is made since such operations are common. This restricts the domain of possible implementations. The alternative would have been to allow handles to have been an arbitrary, opaque type. This would force the introduction of routines to do assignment and comparison, adding complexity, and was therefore ruled out.

> A user may ~~accidently~~ ==accidentally== create a dangling reference by assigning to a handle the value of another handle, and then deallocating the object associated with these handles. Conversely, if a handle variable is deallocated before the associated object is freed, then the object becomes inaccessible (this may occur, for example, if the handle is a local variable within a subroutine, and the subroutine is exited before the associated object is deallocated). It is the user’s responsibility to avoid adding or deleting references to opaque objects, except as a result of MPI calls that allocate or deallocate such objects.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~In Fortran with `USE` `mpi` or `INCLUDE` `’mpif.h’`, all handles have type `INTEGER`. In Fortran with `USE mpi_f08`, and in C, a different handle type is defined for each category of objects.~~

~~With Fortran `USE mpi_f08`, the handles are defined as Fortran `BIND(C)` derived types that consist of only~~

~~one element `INTEGER` `::` `MPI_VAL`. The internal handle value is identical to the Fortran `INTEGER` value used in the `mpi` module and `mpif.h`.~~

~~The operators `.EQ.`, `.NE.`, `==` and `/=` are overloaded to allow the comparison of these handles.~~

~~The type names are identical to the names in C, except that they are not case sensitive. For example:~~

==In Fortran with `USE` `mpi` or `INCLUDE` `’mpif.h’`, all handles have type `INTEGER`. In Fortran with `USE mpi_f08`, and in C, a different handle type is defined for each category of objects. With Fortran `USE mpi_f08`, the handles are defined as Fortran `BIND(C)` derived types that consist of only one element `INTEGER` `::` `MPI_VAL`. The internal handle value is identical to the Fortran `INTEGER` value used in the `mpi` module and `mpif.h`. The operators `.EQ.`, `.NE.`, `==` and `/=` are overloaded to allow the comparison of these handles. The type names are identical to the names in C, except that they are not case sensitive. For example:==

> Since the Fortran integer values are equivalent, applications can easily convert MPI handles between all three supported Fortran methods. For example, an integer communicator handle `COMM` can be converted directly into an exactly equivalent `mpi_f08` communicator handle named `comm_f08` by `comm_f08%MPI_VAL=COMM`, and vice versa. The use of the `INTEGER` defined handles and the `BIND(C)` derived type handles is different: Fortran 2003 (and later) define that `BIND(C)` derived types can be used within user defined common blocks, but it is up to the rules of the companion C compiler how many numerical storage units are used for these `BIND(C)` derived type handles. ~~> >~~ Most compilers use one unit for both, the `INTEGER` handles and the handles defined as `BIND(C)` derived types.

> This design hides the internal representation used for MPI data structures, thus allowing similar calls in C and Fortran. It also avoids conflicts with the typing rules in these languages, and easily allows future extensions of functionality. The mechanism for opaque objects used here loosely follows the POSIX Fortran binding standard. > > The explicit separation of handles in user space and objects in system space allows space-reclaiming and deallocation calls to be made at appropriate points in the user program. If the opaque objects were in user space, one would have to be very careful not to go out of scope before any pending operation requiring that object completed. The specified design allows an object to be marked for deallocation, the user program can then go out of scope, and the object itself still persists until any pending operations are complete. > > The requirement that handles support assignment/comparison is made since such operations are common. This restricts the domain of possible implementations. The alternative ==in C== would have been to allow handles to have been an arbitrary, opaque type. This would force the introduction of routines to do assignment and comparison, adding complexity, and was therefore ruled out. ==In Fortran, the handles are defined such that assignment and comparison are available through the operators of the language or overloaded versions of these operators.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Opaque objects are allocated and deallocated by calls that are specific to each object type. These are listed in the sections where the objects are described. The calls accept a handle argument of matching type. In an allocate call this is an ~~`OUT`~~ ==OUT== argument that returns a valid reference to the object. In a call to deallocate this is an ~~`INOUT`~~ ==INOUT== argument which returns with an “invalid handle” value. MPI provides an “invalid handle” constant for each object type. Comparisons to this constant are used to test for validity of the handle.

> The intended semantics of opaque objects is that opaque objects are separate from one another; each call to allocate such an object copies all the information required for the object. Implementations may avoid excessive copying by substituting referencing for copying. For example, a derived datatype may contain references to its components, rather ~~then~~ ==than== copies of its components; a call to [[versions/v40/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] may return a reference to the group associated with the communicator, rather than a copy of this group. In such cases, the implementation must maintain reference counts, and allocate and deallocate objects in such a way that the visible effect is as if the objects were copied.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~In Fortran with `USE` `mpi` or `INCLUDE` `’mpif.h’`, all handles have type `INTEGER`. In Fortran with `USE mpi_f08`, and in C, a different handle type is defined for each category of objects. With Fortran `USE mpi_f08`, the handles are defined as Fortran `BIND(C)` derived types that consist of only one element `INTEGER` `::` `MPI_VAL`. The internal handle value is identical to the Fortran `INTEGER` value used in the `mpi` module and `mpif.h`. The operators `.EQ.`, `.NE.`, `==` and `/=` are overloaded to allow the comparison of these handles. The type names are identical to the names in C, except that they are not case sensitive. For example:~~

~~    TYPE, BIND(C) :: MPI_Comm       INTEGER   :: MPI_VAL     END TYPE MPI_Comm~~

==In Fortran with `USE mpi` or (deprecated) `INCLUDE ’mpif.h’`, all handles have type `INTEGER`. In Fortran with `USE mpi_f08`, and in C, a different handle type is defined for each category of objects. With Fortran `USE mpi_f08`, the handles are defined as Fortran `BIND(C)` derived types that consist of only one element `INTEGER` `::` `MPI_VAL`. The internal handle value is identical to the Fortran `INTEGER` value used in the `mpi` module and (deprecated) `mpif.h`. The operators `.EQ.`, `.NE.`, `==` and `/=` are overloaded to allow the comparison of these handles. The type names are identical to the names in C, except that they are not case sensitive. For example:==

==(code block added)==
``` [MPI08]Fortran
TYPE, BIND(C) :: MPI_Comm
  INTEGER   :: MPI_VAL
END TYPE MPI_Comm
```

> If a user wants to substitute ~~`mpif.h` or~~ the `mpi` module ==or the (deprecated) `mpif.h`== by the `mpi_f08` module and the application program stores a handle in a Fortran common block then it is necessary to change the Fortran support method in all application routines that use this common block, because the number of numerical storage units of such a handle can be different in the two modules.

Opaque objects are allocated and deallocated by calls that are specific to each object type. These are listed in the sections where the objects are described. The calls accept a handle argument of matching type. In an allocate call this is an OUT argument that returns a valid reference to the object. In a call to deallocate this is an INOUT argument ~~which~~ ==that== returns with an “invalid handle” value. MPI provides an “invalid handle” constant for each object type. Comparisons to this constant are used to test for validity of the handle.

A call to a deallocate routine invalidates the handle and marks the object for deallocation. The object is not accessible to the user after the call. However, MPI need not deallocate the object immediately. Any operation ~~pending~~ ==*pending*== (at the time of the deallocate) ==and *decoupled MPI activity* (see [[versions/v41/sections/terms#Progress|Progress]] )== that involves this object will complete normally; the object will be deallocated afterwards.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Opaque objects]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Opaque Objects]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Opaque Objects]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Opaque Objects]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Opaque Objects]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Opaque Objects]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Opaque Objects]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Opaque Objects]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Opaque Objects]]
