---
title: "The Fortran `ASYNCHRONOUS` Attribute"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# The Fortran `ASYNCHRONOUS` Attribute

Chapter **binding** · in [[versions/v30/sections/binding#The Fortran ASYNCHRONOUS Attribute|MPI-3.0]], [[versions/v31/sections/binding#The Fortran ASYNCHRONOUS Attribute|MPI-3.1]], [[versions/v40/sections/binding#The Fortran `ASYNCHRONOUS` Attribute|MPI-4.0]], [[versions/v41/sections/binding#The Fortran `ASYNCHRONOUS` Attribute|MPI-4.1]], [[versions/v50/sections/binding#The Fortran `ASYNCHRONOUS` Attribute|MPI-5.0]]

Heading by release: MPI-3.0: “The Fortran ASYNCHRONOUS Attribute”; MPI-3.1: “The Fortran ASYNCHRONOUS Attribute”; MPI-4.0: “The Fortran `ASYNCHRONOUS` Attribute”; MPI-4.1: “The Fortran `ASYNCHRONOUS` Attribute”; MPI-5.0: “The Fortran `ASYNCHRONOUS` Attribute”

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

Declaring an actual buffer argument with the `ASYNCHRONOUS` Fortran attribute in a scoping unit (or `BLOCK`) informs the compiler that any statement in the scoping unit may be executed while the buffer is affected by a pending asynchronous Fortran input/output operation (since Fortran 2003) or by an asynchronous communication (TS 29113 extension). Without the extensions specified in TS 29113, a Fortran compiler may totally ignore this attribute if the Fortran compiler implements asynchronous Fortran input/output operations with blocking I/O. The `ASYNCHRONOUS` attribute protects the buffer accesses from optimizations through code movements across routine calls, and the buffer itself from temporary and permanent data movements. If the choice buffer dummy argument of a nonblocking MPI routine is declared with `ASYNCHRONOUS` (which is mandatory for the `mpi_f08` module, with allowable exceptions listed in ~~Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page~~ [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] ), then the compiler has to guarantee call by reference and should report a compile-time error if call by reference is impossible, e.g., if vector subscripts are used. The `MPI_ASYNC_PROTECTS_NONBLOCKING` is set to `.TRUE.` if both the protection of the actual buffer argument through `ASYNCHRONOUS` according to the TS 29113 extension and the declaration of the dummy argument with `ASYNCHRONOUS` in the Fortran support method is guaranteed for all nonblocking routines, otherwise it is set to `.FALSE.`.

In Case (b), the read accesses to `b(1:100)` in the loop `i=2,99` are read accesses to a pending communication affector while input communication (i.e., the two `MPI_Irecv` calls) is pending. This is a contradiction to the rule that *for input communication, a pending communication affector shall not be referenced*. The problem can be solved by using separate variables for the halos and the inner array, or by splitting a common array into disjoint subarrays which are passed through different dummy arguments into a subroutine, as shown in ~~Example [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on page [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] .~~ ==[[Example]] exa:lang:async:separated.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

In Example [[versions/v40/sections/binding#Solutions|Solutions]] Case (a) on page [[versions/v40/sections/binding#Solutions|Solutions]] , the read accesses to `b` within `function(b(i-1), b(i), b(i+1))` cannot be moved by compiler optimizations to before the wait call because `b` was declared as `ASYNCHRONOUS`. Note that only the elements 0, 1, 100, and 101 of `b` are involved in asynchronous communication but by definition, the total variable `b` is the pending communication affector and is usable for input and output asynchronous communication between the ~~`MPI_I...`~~ ==`MPI_IXXX`== routines and `MPI_Waitall`. Case (a) works fine because the read accesses to `b` occur after the communication has completed.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

> “Asynchronous communication for a Fortran variable occurs through the action of procedures defined by means other than Fortran. It is initiated by execution of an asynchronous communication initiation procedure and completed by execution of an asynchronous communication completion procedure. Between the execution of the initiation and completion procedures, any variable of which any part is associated with any part of the asynchronous communication variable is a ~~pending~~ ==**pending== communication ~~affector.~~ ==affector**.== Whether a procedure is an asynchronous communication initiation or completion procedure is processor dependent. > > Asynchronous communication is either input communication or output communication. For input communication, a ~~pending~~ ==*pending== communication ~~affector~~ ==affector*== shall not be referenced, become defined, become undefined, become associated with a dummy argument that has the VALUE attribute, or have its pointer association status changed. For output communication, a ~~pending~~ ==*pending== communication ~~affector~~ ==affector*== shall not be redefined, become undefined, or have its pointer association status changed.”

In Example [[versions/v41/sections/binding#Solutions|Solutions]] Case (a) on page [[versions/v41/sections/binding#Solutions|Solutions]] , the read accesses to `b` within `function(b(i-1), b(i), b(i+1))` cannot be moved by compiler optimizations to before the wait call because `b` was declared as `ASYNCHRONOUS`. Note that only the elements 0, 1, 100, and 101 of `b` are involved in asynchronous communication but by definition, the total variable `b` is the ~~pending~~ ==*pending== communication ~~affector~~ ==affector*== and is usable for input and output asynchronous communication between the `MPI_IXXX` routines and `MPI_Waitall`. Case (a) works fine because the read accesses to `b` occur after the communication has completed.

In Case (b), the read accesses to `b(1:100)` in the loop `i=2,99` are read accesses to a ~~pending~~ ==*pending== communication ~~affector~~ ==affector*== while input communication (i.e., the two `MPI_Irecv` calls) is ~~pending.~~ ==*pending*.== This is a contradiction to the rule that *for input communication, ~~a pending~~ ==a* *pending== communication ~~affector shall~~ ==affector* *shall== not be referenced*. The problem can be solved by using separate variables for the halos and the inner array, or by splitting a common array into disjoint subarrays ~~which~~ ==that== are passed through different dummy arguments into a subroutine, as shown in [[Example]] exa:lang:async:separated.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

> “Asynchronous communication for a Fortran variable occurs through the action of procedures defined by means other than Fortran. It is initiated by execution of an asynchronous communication initiation procedure and completed by execution of an asynchronous communication completion procedure. Between the execution of the initiation and completion procedures, any variable of which any part is associated with any part of the asynchronous communication variable is a **pending communication affector**. Whether a procedure is an asynchronous communication initiation or completion procedure is processor dependent. > > Asynchronous communication is either input communication or output communication. For input communication, a *pending communication affector* shall not be referenced, become defined, become undefined, become associated with a dummy argument that has the ~~VALUE~~ ==`VALUE`== attribute, or have its pointer association status changed. For output communication, a *pending communication affector* shall not be redefined, become undefined, or have its pointer association status changed.”

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#The Fortran ASYNCHRONOUS Attribute]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#The Fortran ASYNCHRONOUS Attribute]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#The Fortran `ASYNCHRONOUS` Attribute]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#The Fortran `ASYNCHRONOUS` Attribute]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#The Fortran `ASYNCHRONOUS` Attribute]]
