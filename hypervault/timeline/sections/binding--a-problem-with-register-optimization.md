---
title: "A Problem with Register Optimization"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# A Problem with Register Optimization

Chapter **binding** · in [[versions/v20/sections/binding#A Problem with Register Optimization|MPI-2.0]], [[versions/v21/sections/binding#A Problem with Register Optimization|MPI-2.1]], [[versions/v22/sections/binding#A Problem with Register Optimization|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

~~Normally users are not afflicted with this. But the user should pay attention to this section if in his/her program a buffer argument to an [[versions/v21/API/MPI_SEND|MPI_SEND]] , [[versions/v21/API/MPI_RECV|MPI_RECV]] etc., uses a name which hides the actual variables involved. [[MPI_BOTTOM]] with an [[MPI_Datatype]] containing absolute addresses is one example. Creating a datatype which uses one variable as an anchor and brings along others by using [[versions/v21/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to determine their offsets from the anchor is another. The anchor variable would be the only one mentioned in the call. Also attention must be paid if MPI operations are used that run in parallel with the user’s application.~~

~~The following example shows what Fortran compilers are allowed to do.~~

~~This source ... can be compiled as:~~

==Normally users are not afflicted with this. But the user should pay attention to this section if in his/her program a buffer argument to an [[versions/v21/API/MPI_SEND|MPI_SEND]] , [[versions/v21/API/MPI_RECV|MPI_RECV]] etc., uses a name which hides the actual variables involved. MPI_BOTTOM with an `MPI_Datatype` containing absolute addresses is one example. Creating a datatype which uses one variable as an anchor and brings along others by using [[versions/v21/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to determine their offsets from the anchor is another. The anchor variable would be the only one mentioned in the call. Also attention must be paid if MPI operations are used that run in parallel with the user’s application.==

==Example [[versions/v21/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]]==

==shows what Fortran compilers are allowed to do.==

==Fortran 90 register optimization.\ This source ... can be compiled as:==

~~The compiler does not invalidate the register because it cannot see that [[versions/v21/API/MPI_RECV|MPI_RECV]] changes the value of [[buf]] . The access of [[buf]] is hidden by the use of [[versions/v21/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and [[MPI_BOTTOM]] .~~

~~The next example shows extreme, but allowed, possibilities.~~

~~Source compiled as or compiled as~~

==The compiler does not invalidate the register because it cannot see that [[versions/v21/API/MPI_RECV|MPI_RECV]] changes the value of `buf`. The access of `buf` is hidden by the use of [[versions/v21/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and MPI_BOTTOM.==

==Example [[versions/v21/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]]==

==shows extreme, but allowed, possibilities.==

==Fortran 90 register optimization – extreme.\ Source compiled as or compiled as==

[[versions/v21/API/MPI_WAIT|MPI_WAIT]] on a concurrent thread modifies ~~[[buf]]~~ ==`buf`== between the invocation of [[versions/v21/API/MPI_IRECV|MPI_IRECV]] and the finish of [[versions/v21/API/MPI_WAIT|MPI_WAIT]] . But the compiler cannot see any possibility that ~~[[buf]]~~ ==`buf`== can be changed after [[versions/v21/API/MPI_IRECV|MPI_IRECV]] has returned, and may schedule the load of ~~[[buf]]~~ ==`buf`== earlier than typed in the source. It has no reason to avoid using a register to hold ~~[[buf]]~~ ==`buf`== across the call to [[versions/v21/API/MPI_WAIT|MPI_WAIT]] . It also may reorder the instructions as in the case on the right.

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

Normally users are not afflicted with this. But the user should pay attention to this section if in his/her program a buffer argument to an [[versions/v22/API/MPI_SEND|MPI_SEND]] , [[versions/v22/API/MPI_RECV|MPI_RECV]] etc., uses a name which hides the actual variables involved. ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== with an `MPI_Datatype` containing absolute addresses is one example. Creating a datatype which uses one variable as an anchor and brings along others by using [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to determine their offsets from the anchor is another. The anchor variable would be the only one mentioned in the call. Also attention must be paid if MPI operations are used that run in parallel with the user’s application.

The compiler does not invalidate the register because it cannot see that [[versions/v22/API/MPI_RECV|MPI_RECV]] changes the value of `buf`. The access of `buf` is hidden by the use of [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and ~~MPI_BOTTOM.~~ ==`MPI_BOTTOM`.==

In the case of a ~~non-blocking~~ ==nonblocking== call, as in the above call of [[versions/v22/API/MPI_WAIT|MPI_WAIT]] , no reference to the buffer is permitted until it has been verified that the transfer has been completed. Therefore, in this case, the extra call ahead of the MPI call is not necessary, i.e., the call of [[versions/v22/API/MPI_WAIT|MPI_WAIT]] in the example might be replaced by

~~In the longer term, the attribute~~ ==The== `VOLATILE` ~~is under consideration for Fortran 2000 and would give~~ ==attribute, available in later versions of Fortran, gives== the buffer or variable the properties needed, but it ~~would~~ ==may== inhibit optimization of any code containing the buffer or variable.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#A Problem with Register Optimization]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#A Problem with Register Optimization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#A Problem with Register Optimization]]
