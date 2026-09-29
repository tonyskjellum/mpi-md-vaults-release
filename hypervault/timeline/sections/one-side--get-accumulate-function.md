---
title: "Get Accumulate Function"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/one-side]
---

# Get Accumulate Function

Chapter **one-side** · in [[versions/v30/sections/one-side#Get Accumulate Function|MPI-3.0]], [[versions/v31/sections/one-side#Get Accumulate Function|MPI-3.1]], [[versions/v40/sections/one-side#Get Accumulate Function|MPI-4.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

==MPI_REPLACE, like the other predefined operations, is defined only for the predefined MPI datatypes.==

==> [!tip] Rationale==

==> The rationale for this is that, for consistency, MPI_REPLACE should have the same limitations as the other operations. Extending it to all datatypes doesn’t provide any real benefit.==

SUBROUTINE SUM(A, B, map, m, comm, p) USE MPI INTEGER m, map(m), comm, p, ~~sizeofreal,~~ win, ierr REAL A(m), B(m) ==INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal==

CALL ~~MPI_TYPE_EXTENT(MPI_REAL,~~ ==MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound,== sizeofreal, ierr) CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL, & comm, win, ierr)

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

~~A new predefined operation, MPI_REPLACE, is defined. It corresponds to the associative function $`f(a,b) = b`$; i.e., the current value in the target memory is replaced by the value supplied by the origin.~~

~~MPI_REPLACE, like the other predefined operations, is defined only for the predefined MPI datatypes.~~

~~> [!tip] Rationale~~

~~> The rationale for this is that, for consistency, MPI_REPLACE should have the same limitations as the other operations. Extending it to all datatypes doesn’t provide any real benefit.~~

==A new predefined operation, `MPI_REPLACE`, is defined. It corresponds to the associative function $`f(a,b) = b`$; i.e., the current value in the target memory is replaced by the value supplied by the origin.==

==`MPI_REPLACE` can be used only in [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , not in collective reduction operations, such as [[versions/v22/API/MPI_REDUCE|MPI_REDUCE]] and others.==

> [[versions/v22/API/MPI_PUT|MPI_PUT]] is a special case of [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , with the operation ~~MPI_REPLACE.~~ ==`MPI_REPLACE`.== Note, however, that [[versions/v22/API/MPI_PUT|MPI_PUT]] and `MPI_ACCUMULATE` have different constraints on concurrent updates.

CALL MPI_WIN_FENCE(0, win, ierr) DO i=1,m j = ~~map(i)/p~~ ==map(i)/m== k = ~~MOD(map(i),p)~~ ==MOD(map(i),m)== CALL MPI_ACCUMULATE(A(i), 1, MPI_REAL, j, k, 1, MPI_REAL, & MPI_SUM, win, ierr) END DO CALL MPI_WIN_FENCE(0, win, ierr)

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~It is often useful in a put operation to combine the data moved to the target process with the data that resides at that process, rather then replacing the data there. This will allow, for example, the accumulation of a sum by having all involved processes add their contribution to the sum variable in the memory of one process.~~

~~![[versions/v30/API/MPI_ACCUMULATE]]~~

~~Accumulate the contents of the origin buffer (as defined by `origin_addr`, `origin_count` and `origin_datatype`) to the buffer specified by arguments `target_count` and `target_datatype`, at offset `target_disp`, in the target window specified by `target_rank` and `win`, using the operation `op`. This is like [[versions/v30/API/MPI_PUT|MPI_PUT]] except that data is combined into the target area instead of overwriting it.~~

~~Any of the predefined operations for [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] can be used. User-defined functions cannot be used. For example, if `op` is `MPI_SUM`, each element of the origin buffer is added to the corresponding element in the target, replacing the former value in the target.~~

~~Each datatype argument must be a predefined datatype or a derived datatype, where all basic components are of the same predefined datatype. Both datatype arguments must be constructed from the same predefined datatype. The operation `op` applies to elements of that predefined type. `target_datatype` must not specify overlapping entries, and the target buffer must fit in the target window.~~

~~A new predefined operation, `MPI_REPLACE`, is defined. It corresponds to the associative function $`f(a,b) = b`$; i.e., the current value in the target memory is replaced by the value supplied by the origin.~~

~~`MPI_REPLACE` can be used only in [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , not in collective reduction operations, such as [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] and others.~~

==It is often useful to have fetch-and-accumulate semantics such that the remote data is returned to the caller before the sent data is accumulated into the remote data. The get and accumulate steps are executed atomically for each basic element in the datatype (see Section [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] for details). The predefined operation `MPI_REPLACE` provides fetch-and-set behavior.==

==![[versions/v30/API/MPI_GET_ACCUMULATE]]==

==Accumulate `origin_count` elements of type `origin_datatype` from the origin buffer (`origin_addr`) to the buffer at offset `target_disp`, in the target window specified by `target_rank` and `win`, using the operation `op` and return in the result buffer `result_addr` the content of the target buffer before the accumulation.==

==The origin and result buffers (`origin_addr` and `result_addr`) must be disjoint. Each datatype argument must be a predefined datatype or a derived datatype where all basic components are of the same predefined datatype. All datatype arguments must be constructed from the same predefined datatype. The operation `op` applies to elements of that predefined type. `target_datatype` must not specify overlapping entries, and the target buffer must fit in the target window or in attached memory in a dynamic window.==

==The operation is executed atomically for each basic datatype; see Section [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] for details.==

==Any of the predefined operations for [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] , as well as `MPI_NO_OP` or `MPI_REPLACE` can be specified as `op`. User-defined functions cannot be used.==

==A new predefined operation, `MPI_NO_OP`, is defined. It corresponds to the associative function $`f(a,b) = a`$; i.e., the current value in the target memory is returned in the result buffer at the origin and no operation is performed on the target buffer.==

==`MPI_NO_OP` can be used only in [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , [[versions/v30/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] , and [[versions/v30/API/MPI_FETCH_AND_OP|MPI_FETCH_AND_OP]] . `MPI_NO_OP` cannot be used in [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v30/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] , or collective reduction operations, such as [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] and others.==

~~> [[versions/v30/API/MPI_PUT|MPI_PUT]] is a special case of [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , with the operation `MPI_REPLACE`. Note, however, that [[versions/v30/API/MPI_PUT|MPI_PUT]] and `MPI_ACCUMULATE` have different constraints on concurrent updates.~~

~~ We want to compute $`B(j) = \sum_{map(i) = j} A(i)`$. The arrays `A, B` and `map` are distributed in the same manner. We write the simple version.~~

~~    SUBROUTINE SUM(A, B, map, m, comm, p)     USE MPI     INTEGER m, map(m), comm, p, win, ierr     REAL A(m), B(m)     INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal~~

~~    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, sizeofreal, ierr)     CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL,  &                         comm, win, ierr)~~

~~    CALL MPI_WIN_FENCE(0, win, ierr)     DO i=1,m       j = map(i)/m       k = MOD(map(i),m)       CALL MPI_ACCUMULATE(A(i), 1, MPI_REAL, j, k, 1, MPI_REAL,   &                           MPI_SUM, win, ierr)     END DO     CALL MPI_WIN_FENCE(0, win, ierr)~~

~~    CALL MPI_WIN_FREE(win, ierr)     RETURN     END~~

~~This code is identical to the code in Example [[versions/v30/sections/one-side#Examples|Examples]] , page [[versions/v30/sections/one-side#Examples|Examples]] , except that a call to get has been replaced by a call to accumulate. (Note that, if `map` is one-to-one, then the code computes $`B = A(map^{-1})`$, which is the reverse assignment to the one computed in that previous example.) In a similar manner, we can replace in Example [[versions/v30/sections/one-side#Examples|Examples]] , page [[versions/v30/sections/one-side#Examples|Examples]] , the call to get by a call to accumulate, thus performing the computation with only one communication between any two processes.~~

==> [[versions/v30/API/MPI_GET|MPI_GET]] is similar to [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , with the operation `MPI_NO_OP`. Note, however, that [[versions/v30/API/MPI_GET|MPI_GET]] and [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] have different constraints on concurrent updates.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

Accumulate `origin_count` elements of type `origin_datatype` from the origin buffer (`origin_addr`) to the buffer at offset `target_disp`, in the target window specified by `target_rank` and `win`, using the operation `op` and return in the result buffer `result_addr` the content of the target buffer before the ~~accumulation.~~ ==accumulation, specified by `target_disp`, `target_count`, and `target_datatype`. The data transferred from origin to target must fit, without truncation, in the target buffer. Likewise, the data copied from target to origin must fit, without truncation, in the result buffer.==

==When `MPI_NO_OP` is specified as the operation, the `origin_addr`, `origin_count`, and `origin_datatype` arguments are ignored.== `MPI_NO_OP` can be used only in [[versions/v31/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , [[versions/v31/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] , and [[versions/v31/API/MPI_FETCH_AND_OP|MPI_FETCH_AND_OP]] . `MPI_NO_OP` cannot be used in [[versions/v31/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v31/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] , or collective reduction operations, such as [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] and others.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~It is often useful to have fetch-and-accumulate semantics such that the remote data is returned to the caller before the sent data is accumulated into the remote data. The get and accumulate steps are executed atomically for each basic element in the datatype (see Section [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] for details). The predefined operation `MPI_REPLACE` provides fetch-and-set behavior.~~

~~![[versions/v41/API/MPI_GET_ACCUMULATE]]~~

~~Accumulate `origin_count` elements of type `origin_datatype` from the origin buffer (`origin_addr`) to the buffer at offset `target_disp`, in the target window specified by `target_rank` and `win`, using the operation `op` and return in the result buffer `result_addr` the content of the target buffer before the accumulation, specified by `target_disp`, `target_count`, and `target_datatype`. The data transferred from origin to target must fit, without truncation, in the target buffer. Likewise, the data copied from target to origin must fit, without truncation, in the result buffer.~~

~~The origin and result buffers (`origin_addr` and `result_addr`) must be disjoint. Each datatype argument must be a predefined datatype or a derived datatype where all basic components are of the same predefined datatype. All datatype arguments must be constructed from the same predefined datatype. The operation `op` applies to elements of that predefined type. `target_datatype` must not specify overlapping entries, and the target buffer must fit in the target window or in attached memory in a dynamic window.~~

~~The operation is executed atomically for each basic datatype; see Section [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] for details.~~

~~Any of the predefined operations for [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] , as well as `MPI_NO_OP` or `MPI_REPLACE` can be specified as `op`. User-defined functions cannot be used.~~

~~A new predefined operation, `MPI_NO_OP`, is defined. It corresponds to the associative function $`f(a,b) = a`$; i.e., the current value in the target memory is returned in the result buffer at the origin and no operation is performed on the target buffer.~~

~~When `MPI_NO_OP` is specified as the operation, the `origin_addr`, `origin_count`, and `origin_datatype` arguments are ignored. `MPI_NO_OP` can be used only in [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , [[versions/v41/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] , and [[versions/v41/API/MPI_FETCH_AND_OP|MPI_FETCH_AND_OP]] . `MPI_NO_OP` cannot be used in [[versions/v41/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v41/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] , or collective reduction operations, such as [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] and others.~~

~~> [!note] Advice to users~~

~~> [[versions/v41/API/MPI_GET|MPI_GET]] is similar to [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , with the operation `MPI_NO_OP`. Note, however, that [[versions/v41/API/MPI_GET|MPI_GET]] and [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] have different constraints on concurrent updates.~~

==It is often useful in a put operation to combine the data moved to the target process with the data that resides at that MPI process, rather than replacing it. This will allow, for example, the accumulation of a sum by having all involved MPI processes add their contributions to the sum variable in the memory of one MPI process. The accumulate functions have slightly different semantics with respect to overlapping data accesses than the put and get functions; see Section [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] for details.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Get Accumulate Function]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Get Accumulate Function]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Get Accumulate Function]]
