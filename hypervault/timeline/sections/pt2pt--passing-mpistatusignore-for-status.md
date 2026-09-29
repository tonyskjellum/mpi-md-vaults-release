---
title: "Passing `MPI_STATUS_IGNORE` for Status"
chapter: pt2pt
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Passing `MPI_STATUS_IGNORE` for Status

Chapter **pt2pt** · in [[versions/v21/sections/pt2pt#Passing MPI_STATUS_IGNORE for Status|MPI-2.1]], [[versions/v22/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status|MPI-2.2]], [[versions/v30/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status|MPI-3.0]], [[versions/v31/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status|MPI-3.1]], [[versions/v40/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status|MPI-4.0]], [[versions/v41/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status|MPI-4.1]], [[versions/v50/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status|MPI-5.0]]

Heading by release: MPI-2.1: “Passing MPI_STATUS_IGNORE for Status”; MPI-2.2: “Passing `MPI_STATUS_IGNORE` for Status”; MPI-3.0: “Passing `MPI_STATUS_IGNORE` for Status”; MPI-3.1: “Passing `MPI_STATUS_IGNORE` for Status”; MPI-4.0: “Passing `MPI_STATUS_IGNORE` for Status”; MPI-4.1: “Passing `MPI_STATUS_IGNORE` for Status”; MPI-5.0: “Passing `MPI_STATUS_IGNORE` for Status”

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

To cope with this problem, there are two predefined constants, ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== and ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== which when passed to a receive, wait, or test function, inform the implementation that the status fields are not to be filled in. Note that ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== is not a special type of `MPI_STATUS` object; rather, it is a special value for the argument. In C one would expect it to be ~~NULL,~~ ==`NULL`,== not the address of a special `MPI_STATUS`.

~~MPI_STATUS_IGNORE,~~ ==`MPI_STATUS_IGNORE`,== and the array version ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== can be used everywhere a status argument is passed to a receive, wait, or test function. ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== cannot be used when status is an IN argument.

Note that in Fortran ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== and ~~MPI_STATUSES_IGNORE~~ ==`MPI_STATUSES_IGNORE`== are objects like ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== (not usable for initialization or assignment). See Section [[versions/v22/sections/terms#Named Constants|Named Constants]] .

The functions that can be passed ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== are all the various forms of

~~`MPI\_{TEST$`|`$WAIT}{ALL$`|`$SOME}`~~ ==`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>`==

functions, a separate constant, ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== is passed for the array argument.

It is possible for an MPI function to return ~~MPI_ERR_IN_STATUS~~ ==`MPI_ERR_IN_STATUS`== even when ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== or ~~MPI_STATUSES_IGNORE~~ ==`MPI_STATUSES_IGNORE`== has been passed to that function.

~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== and ~~MPI_STATUSES_IGNORE~~ ==`MPI_STATUSES_IGNORE`== are not

~~`MPI\_{TEST$`|`$WAIT}{ALL$`|`$SOME}`~~ ==`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>`==

functions set to ~~MPI_STATUS_IGNORE;~~ ==`MPI_STATUS_IGNORE`;== one either specifies ignoring *all* of the statuses in such a call with ~~MPI_STATUSES_IGNORE,~~ ==`MPI_STATUSES_IGNORE`,== or *none* of them by passing normal statuses in all positions in the array of statuses.

There are no C++ bindings for ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== or ~~MPI_STATUSES_IGNORE.~~ ==`MPI_STATUSES_IGNORE`.==

To allow an ~~OUT~~ ==`OUT`== or ~~INOUT~~ ==`INOUT`== `MPI::Status` argument to be ignored, all MPI C++ bindings that have ~~OUT~~ ==`OUT`== or ~~INOUT~~ ==`INOUT`== `MPI::Status` parameters are overloaded with a second version that omits the ~~OUT~~ ==`OUT`== or ~~INOUT~~ ==`INOUT`== `MPI::Status` parameter.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~Every call to [[versions/v30/API/MPI_RECV|MPI_RECV]] includes a `status` argument, wherein the system can return details about the message received.~~

~~There are also a number of other MPI calls~~

~~where `status` is returned.~~

~~An object of type `MPI_STATUS` is not an MPI opaque object; its structure is declared in `mpi.h` and `mpif.h`, and it exists in the user’s program. In many cases, application programs are constructed so that it is unnecessary for them to examine the `status` fields. In these cases, it is a waste for the user to allocate a status object, and it is particularly wasteful for the MPI implementation to fill in fields in this object.~~

~~To cope with this problem, there are two predefined constants, `MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE`, which when passed to a receive, wait, or test function, inform the implementation that the status fields are not to be filled in. Note that `MPI_STATUS_IGNORE` is not a special type of `MPI_STATUS` object; rather, it is a special value for the argument. In C one would expect it to be `NULL`, not the address of a special `MPI_STATUS`.~~

~~`MPI_STATUS_IGNORE`, and the array version `MPI_STATUSES_IGNORE`, can be used everywhere a status argument is passed to a receive, wait, or test function. `MPI_STATUS_IGNORE` cannot be used when status is an IN argument.~~

~~Note that in Fortran `MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v30/sections/terms#Named Constants|Named Constants]] .~~

~~In general, this optimization can apply to all functions for which `status` or an array of `status`es is an OUT argument.~~

~~Note that this converts `status` into an INOUT argument.~~

~~The functions that can be passed `MPI_STATUS_IGNORE` are all the various forms of~~

~~[[versions/v30/API/MPI_RECV|MPI_RECV]] , [[versions/v30/API/MPI_TEST|MPI_TEST]] , and [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , as well as [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] .~~

~~When an array is passed, as in the~~

~~`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>`~~

~~functions, a separate constant, `MPI_STATUSES_IGNORE`, is passed for the array argument.~~

~~It is possible for an MPI function to return `MPI_ERR_IN_STATUS` even when `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` has been passed to that function.~~

~~`MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE` are not~~

~~required to have the same values in C and Fortran.~~

==Every call to [[versions/v30/API/MPI_RECV|MPI_RECV]] includes a `status` argument, wherein the system can return details about the message received. There are also a number of other MPI calls==

==where `status` is returned. An object of type `MPI_Status` is not an MPI opaque object; its structure is declared in `mpi.h` and `mpif.h`, and it exists in the user’s program. In many cases, application programs are constructed so that it is unnecessary for them to examine the `status` fields. In these cases, it is a waste for the user to allocate a status object, and it is particularly wasteful for the MPI implementation to fill in fields in this object.==

==To cope with this problem, there are two predefined constants, `MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE`,==

==which when passed to a receive, probe, wait, or test function, inform the implementation that the status fields are not to be filled in. Note that `MPI_STATUS_IGNORE` is not a special type of `MPI_Status` object; rather, it is a special value for the argument. In C one would expect it to be `NULL`, not the address of a special `MPI_Status`.==

==`MPI_STATUS_IGNORE`, and the array version `MPI_STATUSES_IGNORE`, can be used everywhere a status argument is passed to a receive, wait, or test function. `MPI_STATUS_IGNORE` cannot be used when status is an IN argument. Note that in Fortran `MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE` are objects like `MPI_BOTTOM` (not usable for initialization or assignment). See Section [[versions/v30/sections/terms#Named Constants|Named Constants]] .==

==In general, this optimization can apply to all functions for which `status` or an array of `status`es is an OUT argument. Note that this converts `status` into an INOUT argument. The functions that can be passed `MPI_STATUS_IGNORE` are all the various forms of [[versions/v30/API/MPI_RECV|MPI_RECV]] , [[versions/v30/API/MPI_PROBE|MPI_PROBE]] , [[versions/v30/API/MPI_TEST|MPI_TEST]] , and [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , as well as [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] . When an array is passed, as in the==

==`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>` functions, a separate constant, `MPI_STATUSES_IGNORE`, is passed for the array argument. It is possible for an MPI function to return `MPI_ERR_IN_STATUS` even when `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` has been passed to that function.==

==`MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE` are not required to have the same values in C and Fortran.==

~~`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>`~~

~~functions set to `MPI_STATUS_IGNORE`; one either specifies ignoring *all* of the statuses in such a call with `MPI_STATUSES_IGNORE`, or *none* of them by passing normal statuses in all positions in the array of statuses.~~

~~There are no C++ bindings for `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE`.~~

~~To allow an `OUT` or `INOUT` `MPI::Status` argument to be ignored, all MPI C++ bindings that have `OUT` or `INOUT` `MPI::Status` parameters are overloaded with a second version that omits the `OUT` or `INOUT` `MPI::Status` parameter.~~

~~The C++ bindings for [[versions/v30/API/MPI_PROBE|MPI_PROBE]] are:~~

~~`void MPI::Comm::Probe(int source, int tag, MPI::Status& status) const`~~

~~`void MPI::Comm::Probe(int source, int tag) const`~~

==`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>` functions set to `MPI_STATUS_IGNORE`; one either specifies ignoring *all* of the statuses in such a call with `MPI_STATUSES_IGNORE`, or *none* of them by passing normal statuses in all positions in the array of statuses.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~Every call to [[versions/v31/API/MPI_RECV|MPI_RECV]] includes a `status` argument, wherein the system can return details about the message received. There are also a number of other MPI calls~~

~~where `status` is returned. An object of type `MPI_Status` is not an MPI opaque object; its structure is declared in `mpi.h` and `mpif.h`, and it exists in the user’s program. In many cases, application programs are constructed so that it is unnecessary for them to examine the `status` fields. In these cases, it is a waste for the user to allocate a status object, and it is particularly wasteful for the MPI implementation to fill in fields in this object.~~

~~To cope with this problem, there are two predefined constants, `MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE`,~~

~~which when passed to a receive, probe, wait, or test function, inform the implementation that the status fields are not to be filled in. Note that `MPI_STATUS_IGNORE` is not a special type of `MPI_Status` object; rather, it is a special value for the argument. In C one would expect it to be `NULL`, not the address of a special `MPI_Status`.~~

==Every call to [[versions/v31/API/MPI_RECV|MPI_RECV]] includes a `status` argument, wherein the system can return details about the message received. There are also a number of other MPI calls where `status` is returned. An object of type `MPI_Status` is not an MPI opaque object; its structure is declared in `mpi.h` and `mpif.h`, and it exists in the user’s program. In many cases, application programs are constructed so that it is unnecessary for them to examine the `status` fields. In these cases, it is a waste for the user to allocate a status object, and it is particularly wasteful for the MPI implementation to fill in fields in this object.==

==To cope with this problem, there are two predefined constants, `MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE`, which when passed to a receive, probe, wait, or test function, inform the implementation that the status fields are not to be filled in. Note that `MPI_STATUS_IGNORE` is not a special type of `MPI_Status` object; rather, it is a special value for the argument. In C one would expect it to be `NULL`, not the address of a special `MPI_Status`.==

~~In general, this optimization can apply to all functions for which `status` or an array of `status`es is an OUT argument. Note that this converts `status` into an INOUT argument. The functions that can be passed `MPI_STATUS_IGNORE` are all the various forms of [[versions/v31/API/MPI_RECV|MPI_RECV]] , [[versions/v31/API/MPI_PROBE|MPI_PROBE]] , [[versions/v31/API/MPI_TEST|MPI_TEST]] , and [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , as well as [[versions/v31/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] . When an array is passed, as in the~~

~~`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>` functions, a separate constant, `MPI_STATUSES_IGNORE`, is passed for the array argument. It is possible for an MPI function to return `MPI_ERR_IN_STATUS` even when `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` has been passed to that function.~~

==In general, this optimization can apply to all functions for which `status` or an array of `status`es is an OUT argument. Note that this converts `status` into an INOUT argument. The functions that can be passed `MPI_STATUS_IGNORE` are all the various forms of [[versions/v31/API/MPI_RECV|MPI_RECV]] , [[versions/v31/API/MPI_PROBE|MPI_PROBE]] , [[versions/v31/API/MPI_TEST|MPI_TEST]] , and [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , as well as [[versions/v31/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] . When an array is passed, as in the ``MPI_`<span class="roman">{</span>`TEST`$`|`$`WAIT`<span class="roman">}{</span>`ALL`$`|`$`SOME`<span class="roman">}</span>` functions, a separate constant, `MPI_STATUSES_IGNORE`, is passed for the array argument. It is possible for an MPI function to return `MPI_ERR_IN_STATUS` even when `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` has been passed to that function.==

~~It is not allowed to have some of the statuses in an array of statuses for~~

~~`MPI\_<span class="roman">{</span><span class="sans-serif">TEST$`|`$WAIT</span><span class="roman">}{</span><span class="sans-serif">ALL$`|`$SOME</span><span class="roman">}</span>` functions set to `MPI_STATUS_IGNORE`; one either specifies ignoring *all* of the statuses in such a call with `MPI_STATUSES_IGNORE`, or *none* of them by passing normal statuses in all positions in the array of statuses.~~

==It is not allowed to have some of the statuses in an array of statuses for ``MPI_`<span class="roman">{</span>`TEST`$`|`$`WAIT`<span class="roman">}{</span>`ALL`$`|`$`SOME`<span class="roman">}</span>` functions set to `MPI_STATUS_IGNORE`; one either specifies ignoring *all* of the statuses in such a call with `MPI_STATUSES_IGNORE`, or *none* of them by passing normal statuses in all positions in the array of statuses.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

Every call to [[versions/v41/API/MPI_RECV|MPI_RECV]] includes a `status` argument, wherein the system can return details about the message received. There are also a number of other MPI calls where `status` is returned. An object of type `MPI_Status` is not an MPI opaque object; its structure is declared in `mpi.h` and ==(deprecated)== `mpif.h`, and it exists in the user’s program. In many cases, application programs are constructed so that it is unnecessary for them to examine the `status` fields. In these cases, it is a waste for the user to allocate a status object, and it is particularly wasteful for the MPI implementation to fill in fields in this object.

`MPI_STATUS_IGNORE`, and the array version `MPI_STATUSES_IGNORE`, can be used everywhere a status argument is passed to a receive, wait, or test function. `MPI_STATUS_IGNORE` cannot be used when status is an IN argument. Note that in Fortran `MPI_STATUS_IGNORE` and `MPI_STATUSES_IGNORE` are objects like `MPI_BOTTOM` (not usable for initialization or ~~assignment). See~~ ==assignment), see== Section [[versions/v41/sections/terms#Named Constants|Named Constants]] .

In general, this optimization can apply to all functions for which `status` or an array of `status`es is an OUT argument. Note that this converts `status` into an INOUT argument. The functions that can be passed `MPI_STATUS_IGNORE` are all the various forms of [[versions/v41/API/MPI_RECV|MPI_RECV]] , [[versions/v41/API/MPI_PROBE|MPI_PROBE]] , [[versions/v41/API/MPI_TEST|MPI_TEST]] , and [[versions/v41/API/MPI_WAIT|MPI_WAIT]] , as well as [[versions/v41/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] . When an array is passed, as in the ~~``MPI_`<span class="roman">{</span>`TEST`$`|`$`WAIT`<span class="roman">}{</span>`ALL`$`|`$`SOME`<span class="roman">}</span>`~~ ==``MPI_`{`TEST`$`|`$`WAIT`}{`ALL`$`|`$`SOME`}`== functions, a separate constant, `MPI_STATUSES_IGNORE`, is passed for the array argument. It is possible for an MPI function to return `MPI_ERR_IN_STATUS` even when `MPI_STATUS_IGNORE` or `MPI_STATUSES_IGNORE` has been passed to that function.

It is not allowed to have some of the statuses in an array of statuses for ~~``MPI_`<span class="roman">{</span>`TEST`$`|`$`WAIT`<span class="roman">}{</span>`ALL`$`|`$`SOME`<span class="roman">}</span>`~~ ==``MPI_`{`TEST`$`|`$`WAIT`}{`ALL`$`|`$`SOME`}`== functions set to `MPI_STATUS_IGNORE`; one either specifies ignoring *all* of the statuses in such a call with `MPI_STATUSES_IGNORE`, or *none* of them by passing normal statuses in all positions in the array of statuses.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Passing MPI_STATUS_IGNORE for Status]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Passing `MPI_STATUS_IGNORE` for Status]]
