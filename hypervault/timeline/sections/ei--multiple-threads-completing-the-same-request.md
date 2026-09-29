---
title: "Multiple threads completing the same request."
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# Multiple threads completing the same request.

Chapter **ei** · in [[versions/v20/sections/ei#Multiple threads completing the same request.|MPI-2.0]], [[versions/v21/sections/ei#Multiple threads completing the same request.|MPI-2.1]], [[versions/v22/sections/ei#Multiple threads completing the same request.|MPI-2.2]], [[versions/v30/sections/ei#Multiple threads completing the same request.|MPI-3.0]], [[versions/v31/sections/ei#Multiple threads completing the same request.|MPI-3.1]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~A program where two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent `MPI_WAIT{ANY$`|`$SOME$`|`$ALL}` calls. In MPI, a request can only be completed once. Any combination of wait or test which violates this rule is erroneous.~~

==A program where two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent==

==`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`==

==calls. In MPI, a request can only be completed once. Any combination of wait or test which violates this rule is erroneous.==

> This is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle. ==> >== With threads, an `MPI_WAIT{ANY$`|`$SOME$`|`$ALL}` may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[versions/v21/API/MPI_WAIT|MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`==

> This is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle. > > With threads, an ~~`MPI_WAIT{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI_WAIT<span class="roman">{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`== may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[versions/v22/API/MPI_WAIT|MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~A program where two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent~~

~~`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`~~

~~calls. In MPI, a request can only be completed once. Any combination of wait or test which violates this rule is erroneous.~~

==A program in which two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent==

==`MPI\_<span class="roman">{</span>WAIT$`|`$TEST<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` calls. In MPI, a request can only be completed once. Any combination of wait or test that violates this rule is erroneous.==

> This ==restriction== is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle. > > With threads, an `MPI_WAIT<span class="roman">{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[versions/v30/API/MPI_WAIT|MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Multiple threads completing the same request.]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Multiple threads completing the same request.]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Multiple threads completing the same request.]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Multiple threads completing the same request.]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Multiple threads completing the same request.]]
