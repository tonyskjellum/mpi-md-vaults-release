---
title: "User-Defined Reduction Operations"
chapter: coll
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# User-Defined Reduction Operations

Chapter **coll** · in [[versions/v21/sections/coll#User-Defined Reduction Operations|MPI-2.1]], [[versions/v22/sections/coll#User-Defined Reduction Operations|MPI-2.2]], [[versions/v30/sections/coll#User-Defined Reduction Operations|MPI-3.0]], [[versions/v31/sections/coll#User-Defined Reduction Operations|MPI-3.1]], [[versions/v40/sections/coll#User-Defined Reduction Operations|MPI-4.0]], [[versions/v41/sections/coll#User-Defined Reduction Operations|MPI-4.1]], [[versions/v50/sections/coll#User-Defined Reduction Operations|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (5 changed paragraphs)

`MPI_OP_CREATE` binds a user-defined ~~global~~ ==reduction== operation to an `op` handle that can subsequently be used in `MPI_REDUCE`, `MPI_ALLREDUCE`, `MPI_REDUCE_SCATTER`,

==The argument== `function` is the user-defined function, which must have the following four arguments: <span class="sans-serif">invec, inoutvec, len</span> and <span class="sans-serif">datatype</span>.

Informally, we can think of `invec` and `inoutvec` as arrays of `len` elements that `function` is combining. The result of the reduction over-writes values in `inoutvec`, hence the name. Each invocation of the function results in the pointwise evaluation of the reduce operator on `len` elements: ~~I.e,~~ ==i.e.,== the function returns in `inoutvec[i]` the value $`invec[i] \circ inoutvec[i]`$, for $`i=0, ... , count-1`$, where $`\circ`$ is the combining operation computed by the function.

> We outline below a naive and inefficient implementation of [[versions/v22/API/MPI_REDUCE|MPI_REDUCE]] > > not > > supporting the “in place” option. > > MPI_Comm_size(comm, &groupsize); > MPI_Comm_rank(comm, &rank); > if (rank > 0) { > MPI_Recv(tempbuf, count, datatype, rank-1,...); > User_reduce(tempbuf, sendbuf, count, datatype); > } > if (rank < groupsize-1) { > MPI_Send(sendbuf, count, datatype, rank+1, ...); > } > /* answer now resides in process groupsize-1 ... now send to root > */ > if (rank == root) { > MPI_Irecv(recvbuf, count, datatype, groupsize-1,..., &req); > } > if (rank == groupsize-1) { > MPI_Send(sendbuf, count, datatype, root, ...); > } > if (rank == root) { > MPI_Wait(&req, &status); > } > > The reduction computation proceeds, sequentially, from process `0` to process > > groupsize-1. > > This order is chosen so as to respect the order of a possibly non-commutative operator defined by the function `User_reduce()`. A more efficient implementation is achieved by taking advantage of associativity and using a logarithmic tree reduction. Commutativity can be used to advantage, for those cases in which the `commute` argument to `MPI_OP_CREATE` is true. Also, the amount of temporary buffer required can be reduced, and communication can be pipelined with computation, by transferring and reducing the elements in chunks of size `len` $`<`$`count`. > > The predefined reduce operations can be implemented as a library of user-defined operations. However, better performance might be achieved if [[versions/v22/API/MPI_REDUCE|MPI_REDUCE]] handles these functions as a special case.

Marks a user-defined reduction operation for deallocation and sets `op` to ~~MPI_OP_NULL.~~ ==`MPI_OP_NULL`.==

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~`MPI_OP_CREATE` binds a user-defined reduction operation to an `op` handle that can subsequently be used in `MPI_REDUCE`, `MPI_ALLREDUCE`, `MPI_REDUCE_SCATTER`,~~

~~`MPI_SCAN`, and `MPI_EXSCAN`.~~

~~The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`,~~

~~then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with process zero. The order of evaluation can be changed, talking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.~~

~~The argument `function` is the user-defined function, which must have the following four arguments: <span class="sans-serif">invec, inoutvec, len</span> and <span class="sans-serif">datatype</span>.~~

==`MPI_OP_CREATE` binds a user-defined reduction operation to an `op` handle that can subsequently be used in `MPI_REDUCE`, `MPI_ALLREDUCE`, [[versions/v30/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , `MPI_REDUCE_SCATTER`,==

==`MPI_SCAN`, `MPI_EXSCAN`, all nonblocking variants of those (see Section [[versions/v30/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v30/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`, then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with process zero. The order of evaluation can be changed, talking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.==

==The argument `user_fn` is the user-defined function, which must have the following four arguments: <span class="sans-serif">invec, inoutvec, len</span> and <span class="sans-serif">datatype</span>.==

~~ISO C~~

~~prototype for the function is the following.~~

~~The Fortran declaration of the user-defined function appears below.~~

~~The C++ declaration of the user-defined function appears below.~~

==ISO C prototype for the function is the following.==

==The Fortran declarations of the user-defined function `user_fn` appear below.==

Informally, we can think of `invec` and `inoutvec` as arrays of `len` elements that ~~`function`~~ ==`user_fn`== is combining. The result of the reduction over-writes values in `inoutvec`, hence the name. Each invocation of the function results in the pointwise evaluation of the reduce operator on `len` elements: i.e., the function returns in `inoutvec[i]` the value $`invec[i] \circ inoutvec[i]`$, for $`i=0, ... , count-1`$, where $`\circ`$ is the combining operation computed by the function.

> The > > `len` ~~> >~~ argument allows `MPI_REDUCE` to avoid calling the function for each element in the input buffer. Rather, the system can choose to apply the function to chunks of input. In C, it is passed in as a reference for reasons of compatibility with Fortran. > > By internally comparing the value of the `datatype` argument to known, global handles, it is possible to overload the use of a single user-defined function for several, different data types.

> We outline below a naive and inefficient implementation of [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] > > not ~~> >~~ supporting the “in place” option. > > MPI_Comm_size(comm, &groupsize); > MPI_Comm_rank(comm, &rank); > if (rank > 0) { > MPI_Recv(tempbuf, count, datatype, rank-1,...); > User_reduce(tempbuf, sendbuf, count, datatype); > } > if (rank < groupsize-1) { > MPI_Send(sendbuf, count, datatype, rank+1, ...); > } > /* answer now resides in process groupsize-1 ... now send to root > */ > if (rank == root) { > MPI_Irecv(recvbuf, count, datatype, groupsize-1,..., &req); > } > if (rank == groupsize-1) { > MPI_Send(sendbuf, count, datatype, root, ...); > } > if (rank == root) { > MPI_Wait(&req, &status); > } > > The reduction computation proceeds, sequentially, from process `0` to process > > groupsize-1. ~~> >~~ This order is chosen so as to respect the order of a possibly non-commutative operator defined by the function `User_reduce()`. A more efficient implementation is achieved by taking advantage of associativity and using a logarithmic tree reduction. Commutativity can be used to advantage, for those cases in which the `commute` argument to `MPI_OP_CREATE` is true. Also, the amount of temporary buffer required can be reduced, and communication can be pipelined with computation, by transferring and reducing the elements in chunks of size `len` $`<`$`count`. > > The predefined reduce operations can be implemented as a library of user-defined operations. However, better performance might be achieved if [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] handles these functions as a special case.

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~`MPI_OP_CREATE` binds a user-defined reduction operation to an `op` handle that can subsequently be used in `MPI_REDUCE`, `MPI_ALLREDUCE`, [[versions/v31/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , `MPI_REDUCE_SCATTER`,~~

~~`MPI_SCAN`, `MPI_EXSCAN`, all nonblocking variants of those (see Section [[versions/v31/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v31/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`, then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with process zero. The order of evaluation can be changed, talking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.~~

~~The argument `user_fn` is the user-defined function, which must have the following four arguments: <span class="sans-serif">invec, inoutvec, len</span> and <span class="sans-serif">datatype</span>.~~

~~The~~

~~ISO C prototype for the function is the following.~~

==[[versions/v31/API/MPI_OP_CREATE|MPI_OP_CREATE]] binds a user-defined reduction operation to an `op` handle that can subsequently be used in [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v31/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v31/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v31/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v31/API/MPI_SCAN|MPI_SCAN]] , [[versions/v31/API/MPI_EXSCAN|MPI_EXSCAN]] , all nonblocking variants of those (see Section [[versions/v31/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v31/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`, then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with process zero. The order of evaluation can be changed, taking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.==

==The argument `user_fn` is the user-defined function, which must have the following four arguments: `invec`, `inoutvec`, `len`, and `datatype`.==

==The ISO C prototype for the function is the following.==

The `datatype` argument is a handle to the data type that was passed into the call to ~~`MPI_REDUCE`.~~ ==[[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] .== The user reduce function should be written such that the following holds: Let ~~<span class="sans-serif">u\[0\], ...~~ ==`u[0], `$`...`$`== , ~~u\[len-1\]</span>~~ ==u[len-1]`== be the ~~<span class="sans-serif">len</span>~~ ==`len`== elements in the communication buffer described by the arguments `invec, len` and `datatype` when the function is invoked; let ~~<span class="sans-serif">v\[0\], ...~~ ==`v[0], `$`...`$`== , ~~v\[len-1\]</span>~~ ==v[len-1]`== be ~~<span class="sans-serif">len</span>~~ ==`len`== elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function is invoked; let ~~<span class="sans-serif">w\[0\], ...~~ ==`w[0], `$`...`$`== , ~~w\[len-1\]</span>~~ ==w[len-1]`== be ~~<span class="sans-serif">len</span>~~ ==`len`== elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function returns; then ~~<span class="sans-serif">w\[i\]~~ ==`w[i]== = ~~u\[i\]$`\circ`$v\[i\]</span>,~~ ==u[i]`$`\circ`$`v[i]`,== for ~~<span class="sans-serif">i=0~~ ==`i=0== , ~~...~~ ==`$`...`$`== , ~~len-1</span>,~~ ==len-1`,== where $`\circ`$ is the reduce operation that the function computes.

Informally, we can think of `invec` and `inoutvec` as arrays of `len` elements that `user_fn` is combining. The result of the reduction ~~over-writes~~ ==overwrites== values in `inoutvec`, hence the name. Each invocation of the function results in the pointwise evaluation of the reduce operator on `len` elements: i.e., the function returns in `inoutvec[i]` the value ~~$`invec[i]~~ ==$`\texttt{invec[i]}== \circ ~~inoutvec[i]`$,~~ ==\texttt{inoutvec[i]}`$,== for ~~$`i=0,~~ ==$`\texttt{i=0,== ... , ~~count-1`$,~~ ==count-1}`$,== where $`\circ`$ is the combining operation computed by the function.

> The ~~> >~~ `len` argument allows ~~`MPI_REDUCE`~~ ==[[versions/v31/API/MPI_REDUCE|MPI_REDUCE]]== to avoid calling the function for each element in the input buffer. Rather, the system can choose to apply the function to chunks of input. In C, it is passed in as a reference for reasons of compatibility with Fortran. > > By internally comparing the value of the `datatype` argument to known, global handles, it is possible to overload the use of a single user-defined function for several, different data types.

No MPI communication function may be called inside the user function. ~~`MPI_ABORT`~~ ==[[versions/v31/API/MPI_ABORT|MPI_ABORT]]== may be called inside the function in case of an error.

> We outline below a naive and inefficient implementation of [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] ~~> >~~ not supporting the “in place” option. > > MPI_Comm_size(comm, &groupsize); > MPI_Comm_rank(comm, &rank); > if (rank > 0) { > MPI_Recv(tempbuf, count, datatype, rank-1,...); > User_reduce(tempbuf, sendbuf, count, datatype); > } > if (rank < groupsize-1) { > MPI_Send(sendbuf, count, datatype, rank+1, ...); > } > /* answer now resides in process groupsize-1 ... now send to root > */ > if (rank == root) { > MPI_Irecv(recvbuf, count, datatype, groupsize-1,..., &req); > } > if (rank == groupsize-1) { > MPI_Send(sendbuf, count, datatype, root, ...); > } > if (rank == root) { > MPI_Wait(&req, &status); > } > > The reduction computation proceeds, sequentially, from process `0` to process ~~> > groupsize-1.~~ ==`groupsize-1`.== This order is chosen so as to respect the order of a possibly non-commutative operator defined by the function `User_reduce()`. A more efficient implementation is achieved by taking advantage of associativity and using a logarithmic tree reduction. Commutativity can be used to advantage, for those cases in which the `commute` argument to ~~`MPI_OP_CREATE`~~ ==[[versions/v31/API/MPI_OP_CREATE|MPI_OP_CREATE]]== is true. Also, the amount of temporary buffer required can be reduced, and communication can be pipelined with computation, by transferring and reducing the elements in chunks of size `len` $`<`$`count`. > > The predefined reduce operations can be implemented as a library of user-defined operations. However, better performance might be achieved if [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] handles these functions as a special case.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

~~[[versions/v40/API/MPI_OP_CREATE|MPI_OP_CREATE]] binds a user-defined reduction operation to an `op` handle that can subsequently be used in [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v40/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v40/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v40/API/MPI_SCAN|MPI_SCAN]] , [[versions/v40/API/MPI_EXSCAN|MPI_EXSCAN]] , all nonblocking variants of those (see Section [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v40/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`, then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with process zero. The order of evaluation can be changed, taking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.~~

==[[versions/v40/API/MPI_OP_CREATE|MPI_OP_CREATE]] binds a user-defined reduction operation to an `op` handle that can subsequently be used in [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v40/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v40/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v40/API/MPI_SCAN|MPI_SCAN]] , [[versions/v40/API/MPI_EXSCAN|MPI_EXSCAN]] , all nonblocking variants of those (see Section [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v40/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`, then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with process zero. The order of evaluation can be changed, talking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.==

==In Fortran when using `USE mpi_f08`, the large count variant shall be called explicitly as [[versions/v40/API/MPI_OP_CREATE|MPI_Op_create_c]] (i.e., with suffix “`_c`”) because interface polymorphism cannot be used to differentiate between the two different user callback prototypes despite their different type signatures.==

~~The ISO C prototype for the function is the following.~~

==`MPI_USER_FUNCTION` also supports large count types in separate additional MPI callback function prototype declarations in C (suffixed with the “`_c`”) and in Fortran when using `USE mpi_f08`.==

==The ISO C prototypes for the functions are the following.==

The `datatype` argument is a handle to the ~~data type~~ ==datatype== that was passed into the call to [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] . The user reduce function should be written such that the following holds: Let `u[0], ~~`$`...`$` ,~~ ==`$`...`$`,== u[len-1]` be the `len` elements in the communication buffer described by the arguments `invec, len` and `datatype` when the function is invoked; let `v[0], `$`...`$` , v[len-1]` be `len` elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function is invoked; let `w[0], `$`...`$` , w[len-1]` be `len` elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function returns; then `w[i] = u[i]`$`\circ`$`v[i]`, for `i=0 , `$`...`$` , len-1`, where $`\circ`$ is the reduce operation that the function computes.

Informally, we can think of `invec` and `inoutvec` as arrays of `len` elements that `user_fn` is combining. The result of the reduction ~~overwrites~~ ==over-writes== values in `inoutvec`, hence the name. Each invocation of the function results in the pointwise evaluation of the reduce operator on `len` elements: i.e., the function returns in `inoutvec[i]` the value $`\texttt{invec[i]} \circ \texttt{inoutvec[i]}`$, for $`\texttt{i=0, ... , count-1}`$, where $`\circ`$ is the combining operation computed by the function.

~~> The `len` argument allows [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] to avoid calling the function for each element in the input buffer. Rather, the system can choose to apply the function to chunks of input. In C, it is passed in as a reference for reasons of compatibility with Fortran. > > By internally comparing the value of the `datatype` argument to known, global handles, it is possible to overload the use of a single user-defined function for several, different data types.~~

==> The `len` argument allows [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] to avoid calling the function for each element in the input buffer. Rather, the system can choose to apply the function to chunks of input. In C, it is passed in as a reference for reasons of compatibility with Fortran. > > By internally comparing the value of the `datatype` argument to known, global handles, it is possible to overload the use of a single user-defined function for several, different datatypes.==

==When calling any reduction or prefix scan MPI procedure with a user-defined MPI operator, the type of the `count` parameter in the call to the reduction or prefix scan MPI procedure does not need to be identical to the type of the `len` parameter in the user function associated with the user-defined MPI operator. If the `count` parameter has a type of `int` in C or `INTEGER` in Fortran and the `len` parameter has a type of `MPI_COUNT`, then MPI will perform the appropriate widening type conversion of the `len` parameter. If the `count` parameter has a type of `MPI_COUNT` and the `len` parameter has a type of `int` in C or `INTEGER` in Fortran, then MPI will perform the appropriate narrowing type conversion of the `len` parameter. If this narrowing conversion would result in truncation of the `len` value, then MPI will call the user function multiple times with a sequence of values for `len` that sum to the value of `count`.==

==> [!warning] Advice to implementors==

==> If the number of data items cannot be represented in `len`, the implementation may need to invoke `user_fn` multiple times.==

> We outline below a naive and inefficient implementation of [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] not supporting the “in place” ~~option.~~ ==option and only valid for intra-communicators.== > > MPI_Comm_size(comm, &groupsize); > MPI_Comm_rank(comm, &rank); > if (rank > 0) { > MPI_Recv(tempbuf, count, datatype, rank-1,...); > User_reduce(tempbuf, sendbuf, count, datatype); > } > if (rank < groupsize-1) { > MPI_Send(sendbuf, count, datatype, rank+1, ...); > } > /* answer now resides in process groupsize-1 ... now send to root > */ > if (rank == root) { > MPI_Irecv(recvbuf, count, datatype, groupsize-1,..., &req); > } > if (rank == groupsize-1) { > MPI_Send(sendbuf, count, datatype, root, ...); > } > if (rank == root) { > MPI_Wait(&req, &status); > } > > The reduction computation proceeds, sequentially, from process `0` to process `groupsize-1`. This order is chosen so as to respect the order of a possibly ~~non-commutative~~ ==noncommutative== operator defined by the function `User_reduce()`. A more efficient implementation is achieved by taking advantage of associativity and using a logarithmic tree reduction. Commutativity can be used to advantage, for those cases in which the `commute` argument to [[versions/v40/API/MPI_OP_CREATE|MPI_OP_CREATE]] is true. Also, the amount of temporary buffer required can be reduced, and communication can be pipelined with computation, by transferring and reducing the elements in chunks of size `len` $`<`$`count`. > > The predefined reduce operations can be implemented as a library of user-defined operations. However, better performance might be achieved if [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] handles these functions as a special case.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

[[versions/v41/API/MPI_OP_CREATE|MPI_OP_CREATE]] binds a user-defined reduction operation to an `op` handle that can subsequently be used in [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v41/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , ==[[versions/v41/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] ,== [[versions/v41/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] ~~, [[versions/v41/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]]~~ , [[versions/v41/API/MPI_SCAN|MPI_SCAN]] , [[versions/v41/API/MPI_EXSCAN|MPI_EXSCAN]] , all nonblocking ==and persistent== variants of those (see Section [[versions/v41/sections/coll#Nonblocking Collective Operations|Nonblocking ==Collective Operations]] and Section [[versions/v41/sections/coll#Persistent Collective Operations|Persistent== Collective Operations]] ), and [[versions/v41/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`, then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with ==MPI== process ~~zero.~~ ==with rank `0` in the communicator `comm`.== The order of evaluation can be changed, talking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.

In Fortran when using `USE mpi_f08`, the large count variant shall be called explicitly as ~~[[versions/v41/API/MPI_OP_CREATE|MPI_Op_create_c]]~~ ==`MPI_Op_create_c`== (i.e., with suffix “`_c`”) because interface polymorphism cannot be used to differentiate between the two different user callback prototypes despite their different type signatures.

> We outline below a naive and inefficient implementation of [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] not supporting the “in place” option and only valid for intra-communicators. > ==> ``` [MPI]C== > MPI_Comm_size(comm, &groupsize); > MPI_Comm_rank(comm, &rank); > if (rank > 0) { > MPI_Recv(tempbuf, count, datatype, rank-1,...); > User_reduce(tempbuf, sendbuf, count, datatype); > } > if (rank < groupsize-1) { > MPI_Send(sendbuf, count, datatype, rank+1, ...); > } > /* answer now resides in ==MPI== process groupsize-1 ... ==> *== now send to root > */ > if (rank == root) { > MPI_Irecv(recvbuf, count, datatype, groupsize-1,..., &req); > } > if (rank == groupsize-1) { > MPI_Send(sendbuf, count, datatype, root, ...); > } > if (rank == root) { > MPI_Wait(&req, &status); > } > ==``` >== > The reduction computation proceeds, sequentially, from ==MPI== process ==with rank== `0` to ==MPI== process ==with rank== `groupsize-1`. This order is chosen so as to respect the order of a possibly noncommutative operator defined by the function `User_reduce()`. A more efficient implementation is achieved by taking advantage of associativity and using a logarithmic tree reduction. Commutativity can be used to advantage, for those cases in which the `commute` argument to [[versions/v41/API/MPI_OP_CREATE|MPI_OP_CREATE]] is true. Also, the amount of temporary buffer ==space== required can be reduced, and communication can be pipelined with computation, by transferring and reducing the elements in chunks of size `len` $`<`$`count`. > > The predefined reduce operations can be implemented as a library of user-defined operations. However, better performance might be achieved if [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] handles these functions as a special case.

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

The `datatype` argument is a handle to the datatype that was passed into the call to [[versions/v50/API/MPI_REDUCE|MPI_REDUCE]] . The user reduce function should be written such that the following holds: Let `u[0], ~~`$`...`$`,~~ ==`$`...`$` ,== u[len-1]` be the `len` elements in the communication buffer described by the arguments `invec, len` and `datatype` when the function is invoked; let `v[0], `$`...`$` , v[len-1]` be `len` elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function is invoked; let `w[0], `$`...`$` , w[len-1]` be `len` elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function returns; then `w[i] = u[i]`$`\circ`$`v[i]`, for `i=0 , `$`...`$` , len-1`, where $`\circ`$ is the reduce operation that the function computes.

~~> [!warning] Advice to implementors~~

~~> If the number of data items cannot be represented in `len`, the implementation may need to invoke `user_fn` multiple times.~~

> We outline below a naive and inefficient implementation of [[versions/v50/API/MPI_REDUCE|MPI_REDUCE]] not supporting the “in place” option and only valid for ~~intra-communicators.~~ ==intra-/communicators.== > > ``` [MPI]C > MPI_Comm_size(comm, &groupsize); > MPI_Comm_rank(comm, &rank); > if (rank > 0) { > MPI_Recv(tempbuf, count, datatype, rank-1,...); > User_reduce(tempbuf, sendbuf, count, datatype); > } > if (rank < groupsize-1) { > MPI_Send(sendbuf, count, datatype, rank+1, ...); > } > /* answer now resides in MPI process groupsize-1 ... > * now send to root > */ > if (rank == root) { > MPI_Irecv(recvbuf, count, datatype, groupsize-1,..., &req); > } > if (rank == groupsize-1) { > MPI_Send(sendbuf, count, datatype, root, ...); > } > if (rank == root) { > MPI_Wait(&req, &status); > } > ``` > > The reduction computation proceeds, sequentially, from MPI process with rank `0` to MPI process with rank `groupsize-1`. This order is chosen so as to respect the order of a possibly noncommutative operator defined by the function `User_reduce()`. A more efficient implementation is achieved by taking advantage of associativity and using a logarithmic tree reduction. Commutativity can be used to advantage, for those cases in which the `commute` argument to [[versions/v50/API/MPI_OP_CREATE|MPI_OP_CREATE]] is true. Also, the amount of temporary buffer space required can be reduced, and communication can be pipelined with computation, by transferring and reducing the elements in chunks of size `len` $`<`$`count`. > > The predefined reduce operations can be implemented as a library of user-defined operations. However, better performance might be achieved if [[versions/v50/API/MPI_REDUCE|MPI_REDUCE]] handles these functions as a special case.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#User-Defined Reduction Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#User-Defined Reduction Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#User-Defined Reduction Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#User-Defined Reduction Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#User-Defined Reduction Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#User-Defined Reduction Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#User-Defined Reduction Operations]]
