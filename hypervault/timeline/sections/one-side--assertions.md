---
title: "Assertions"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Assertions

Chapter **one-side** · in [[versions/v20/sections/one-side#Assertions|MPI-2.0]], [[versions/v21/sections/one-side#Assertions|MPI-2.1]], [[versions/v22/sections/one-side#Assertions|MPI-2.2]], [[versions/v30/sections/one-side#Assertions|MPI-3.0]], [[versions/v31/sections/one-side#Assertions|MPI-3.1]], [[versions/v40/sections/one-side#Assertions|MPI-4.0]], [[versions/v41/sections/one-side#Assertions|MPI-4.1]], [[versions/v50/sections/one-side#Assertions|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

The `assert` argument in the calls ~~[[MPI_WIN_POST, MPI_WIN_START, MPI_WIN_FENCE]]~~ ==[[versions/v21/API/MPI_WIN_POST|MPI_WIN_POST]] , [[versions/v21/API/MPI_WIN_START|MPI_WIN_START]] , [[versions/v21/API/MPI_WIN_FENCE|MPI_WIN_FENCE]]== and [[versions/v21/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is used to provide assertions on the context of the call that may be used to optimize performance. The `assert` argument does not change program semantics if it provides correct information on the program — it is erroneous to provides incorrect information. Users may always provide `assert = 0` to indicate a general case, where no guarantees are made.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

`assert` is the bit-vector OR of zero or more of the following integer constants: ~~MPI_MODE_NOCHECK, MPI_MODE_NOSTORE, MPI_MODE_NOPUT, MPI_MODE_NOPRECEDE~~ ==`MPI_MODE_NOCHECK`, `MPI_MODE_NOSTORE`, `MPI_MODE_NOPUT`, `MPI_MODE_NOPRECEDE`== and ~~MPI_MODE_NOSUCCEED.~~ ==`MPI_MODE_NOSUCCEED`.== The significant options are listed below, for each call.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

The `assert` argument in the calls [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] , [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] , [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] ==, [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] ,== and ~~[[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]]~~ ==[[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]]== is used to provide assertions on the context of the call that may be used to optimize performance. The `assert` argument does not change program semantics if it provides correct information on the program — it is erroneous to ~~provides~~ ==provide== incorrect information. Users may always provide `assert = 0` to indicate a general ~~case,~~ ==case== where no guarantees are made.

> Many implementations may not take advantage of the information in `assert`; some of the information is relevant only for ~~noncoherent,~~ ==noncoherent== shared memory machines. Users should consult their ~~implementation~~ ==implementation’s== manual to find which information is useful on each system. On the other hand, applications that provide correct assertions whenever applicable are portable and will take advantage of assertion specific ~~optimizations,~~ ==optimizations== whenever available.

`assert` is the bit-vector OR of zero or more of the following integer constants: `MPI_MODE_NOCHECK`, `MPI_MODE_NOSTORE`, `MPI_MODE_NOPUT`, ~~`MPI_MODE_NOPRECEDE`~~ ==`MPI_MODE_NOPRECEDE`,== and `MPI_MODE_NOSUCCEED`. The significant options are listed ~~below,~~ ==below== for each call.

~~**MPI_WIN_LOCK:**~~ ==**MPI_WIN_LOCK, MPI_WIN_LOCK_ALL:**==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> C/C++ users can use bit vector or ($`\mid`$) to combine these constants; Fortran 90 users can use the bit-vector `IOR` intrinsic. ~~Fortran 77 users can use (nonportably) bit vector `IOR` on systems that support it.~~ ==> >== Alternatively, Fortran users can portably use integer addition to OR the constants (each constant should appear at most once in the addition!).

~~**MPI_WIN_START:**~~ ==[[versions/v31/API/MPI_WIN_START|MPI_WIN_START]] :==

~~**MPI_WIN_POST:**~~ ==[[versions/v31/API/MPI_WIN_POST|MPI_WIN_POST]] :==

~~**MPI_WIN_FENCE:**~~ ==[[versions/v31/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] :==

~~**MPI_WIN_LOCK, MPI_WIN_LOCK_ALL:**~~ ==[[versions/v31/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v31/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] :==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

The `assert` argument in the calls [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] , [[versions/v40/API/MPI_WIN_START|MPI_WIN_START]] , [[versions/v40/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , and [[versions/v40/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] is used to provide assertions on the context of the call that may be used to optimize performance. The `assert` argument does not change program semantics if it provides correct information on the ~~program — it~~ ==program—it== is erroneous to provide incorrect information. Users may always provide ~~`assert =~~ ==`assert``=== 0` to indicate a general case where no guarantees are made.

`assert` is the ~~bit-vector OR~~ ==bit vector `OR`== of zero or more of the following integer constants: `MPI_MODE_NOCHECK`, `MPI_MODE_NOSTORE`, `MPI_MODE_NOPUT`, `MPI_MODE_NOPRECEDE`, and `MPI_MODE_NOSUCCEED`. The significant options are listed below for each call.

> C/C++ users can use bit vector ~~or~~ ==`OR`== ($`\mid`$) to combine these constants; Fortran 90 users can use the ~~bit-vector~~ ==bit vector== `IOR` intrinsic. > > Alternatively, Fortran users can portably use integer addition to ~~OR~~ ==`OR`== the constants (each constant should appear at most once in the addition!).

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

`assert` is the bit vector `OR` of zero or more of the following integer constants: `MPI_MODE_NOCHECK`, `MPI_MODE_NOSTORE`, `MPI_MODE_NOPUT`, `MPI_MODE_NOPRECEDE`, and `MPI_MODE_NOSUCCEED`. The significant options are listed below for each ~~call.~~ ==synchronization procedure.==

~~> C/C++ users can use bit vector `OR` ($`\mid`$) to combine these constants; Fortran 90 users can use the bit vector `IOR` intrinsic. > > Alternatively, Fortran users can portably use integer addition to `OR` the constants (each constant should appear at most once in the addition!).~~

~~ [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] :  ~~

~~ [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] :  ~~

~~ [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] :  ~~

~~ [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] :  ~~

==> C/C++ users can use bit vector `OR` ($`\mid`$) to combine these constants; Fortran 90 users can use the bit vector `IOR` intrinsic. > > Alternatively, Fortran users can portably use integer addition to `OR` the constants (each constant should appear at most once in the addition).==

== [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] :   `MPI_MODE_NOCHECK`:   the matching calls to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] have already completed on all target processes when the call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] is made. This option can be specified in a start call if and only if it is specified in each matching post call. This is similar to the optimization of “ready-send” that may save a handshake when the handshake is implicit in the code. However, ready-send is matched by a regular receive, whereas both start and post must specify the `MPI_MODE_NOCHECK` option.==

== [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] :   `MPI_MODE_NOCHECK`:   the matching calls to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] have not yet occurred on any origin processes when the call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] is made. This option can be specified by a post call if and only if it is specified by each matching start call.==

==`MPI_MODE_NOSTORE`:   the local window was not updated by stores (or get or receive operations) since the last synchronization. This may avoid the need for cache synchronization during the post call.==

==`MPI_MODE_NOPUT`:   the local window will not be updated by put or accumulate operations after the post call, until the ensuing (wait) synchronization. This may avoid the need for cache synchronization during the wait call.==

== [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] :   `MPI_MODE_NOSTORE`:   the local window was not updated by stores (or get or receive operations) since the last synchronization.==

==`MPI_MODE_NOPUT`:   the local window will not be updated by put or accumulate operations after the fence call, until the ensuing (fence) synchronization.==

==`MPI_MODE_NOPRECEDE`:   the fence does not complete any sequence of RMA operations initiated by the calling MPI process. If this assertion is given by any MPI process in the group of the window, then it must be given by all MPI processes in the group.==

==`MPI_MODE_NOSUCCEED`:   the fence does not start any sequence of RMA operations initiated by the calling MPI process. If the assertion is given by any MPI process in the group of the window, then it must be given by all MPI processes in the group.==

== [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] :   `MPI_MODE_NOCHECK`:   no other MPI process holds, or will attempt to acquire, a conflicting lock, while the calling MPI process holds the window lock. This is useful when mutual exclusion is achieved by other means, but the coherence operations that may be attached to the lock and unlock calls are still required.==

> ~~Note that the nostore~~ ==The `MPI_MODE_NOSTORE`== and ~~noprecede flags~~ ==`MPI_MODE_NOPRECEDE` options== provide information on what happened *before* the call; the ~~noput~~ ==`MPI_MODE_NOPUT`== and ~~nosucceed flags~~ ==`MPI_MODE_NOSUCCEED` options== provide information on what will happen *after* the call.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Assertions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Assertions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Assertions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Assertions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Assertions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Assertions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Assertions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Assertions]]
