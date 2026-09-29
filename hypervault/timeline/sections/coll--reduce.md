---
title: "Reduce"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Reduce

Chapter **coll** · in [[versions/v13/sections/coll#Reduce|MPI-1.3]], [[versions/v21/sections/coll#Reduce|MPI-2.1]], [[versions/v22/sections/coll#Reduce|MPI-2.2]], [[versions/v30/sections/coll#Reduce|MPI-3.0]], [[versions/v31/sections/coll#Reduce|MPI-3.1]], [[versions/v40/sections/coll#Reduce|MPI-4.0]], [[versions/v41/sections/coll#Reduce|MPI-4.1]], [[versions/v50/sections/coll#Reduce|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (5 changed paragraphs)

==If `comm` is an intracommunicator,==

~~Sec.~~ ==Section== [[coll-predefined-op]] , lists the set of predefined operations provided by MPI. That section also enumerates the datatypes each operation can be applied to. In addition, users may define their own operations that can be overloaded to operate on several datatypes, either basic or derived. This is further explained in ~~Sec.~~ ==Section== [[versions/v21/sections/coll#User-Defined ==Reduction== Operations|User-Defined ==Reduction== Operations]] .

~~The `datatype` argument of [[versions/v21/API/MPI_REDUCE|MPI_REDUCE]] must be compatible with `op`. Predefined operators work only with the MPI types listed in Sec. [[coll-predefined-op]] and Sec. [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all processes.~~

==The `datatype` argument of [[versions/v21/API/MPI_REDUCE|MPI_REDUCE]] must be compatible with==

==`op`.==

==Predefined operators work only with the MPI types listed in Section [[coll-predefined-op]] and Section [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all processes.==

In this case, each argument that the reduce operation is applied to is one element described by such a datatype, which may contain several basic values. This is further explained in Section [[versions/v21/sections/coll#User-Defined ==Reduction== Operations|User-Defined ==Reduction== Operations]] .

==The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at the root. In such case, the input data is taken at the root from the receive buffer, where it will be replaced by the output data.==

==If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value MPI_PROC_NULL in `root`. Only send buffer arguments are significant in group B and only receive buffer arguments are significant at the root.==

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

~~`MPI_REDUCE` combines the elements provided in the input buffer of each process in the group, using the operation `op`, and returns the combined value in the output buffer of the process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all processes provide input buffers and output buffers of the same length, with elements of the same type. Each process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is MPI_MAX and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then $`recvbuf(1) =  global \max ( sendbuf(1))`$ and $`recvbuf(2) =  global \max (  sendbuf(2))`$.~~

~~Section [[coll-predefined-op]] , lists the set of predefined operations provided by MPI. That section also enumerates the datatypes each operation can be applied to. In addition, users may define their own operations that can be overloaded to operate on several datatypes, either basic or derived. This is further explained in Section [[versions/v22/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .~~

==`MPI_REDUCE` combines the elements provided in the input buffer of each process in the group, using the operation `op`, and returns the combined value in the output buffer of the process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all processes provide input buffers and output buffers of the same length, with elements of the same type. Each process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is `MPI_MAX` and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then $`recvbuf(1) =  global \max ( sendbuf(1))`$ and $`recvbuf(2) =  global \max (  sendbuf(2))`$.==

==Section [[coll-predefined-op]] , lists the set of predefined operations provided by MPI. That section also enumerates==

==the datatypes to which each operation can be applied.==

==In addition, users may define their own operations that can be overloaded to operate on several datatypes, either basic or derived. This is further explained in Section [[versions/v22/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .==

==> [!note] Advice to users==

==> Some applications may not be able to ignore the non-associative nature of floating-point operations or may use user-defined operations (see Section [[versions/v22/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] ) that require a special reduction order and cannot be treated as associative. Such applications should enforce the order of evaluation explicitly. For example, in the case of operations that require a strict left-to-right (or right-to-left) evaluation order, this could be done by gathering all operands at a single process (e.g., with [[versions/v22/API/MPI_GATHER|MPI_GATHER]] ), applying the reduction operation in the desired order (e.g., with [[versions/v22/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] ), and if needed, broadcast or scatter the result to the other processes (e.g., with [[versions/v22/API/MPI_BCAST|MPI_BCAST]] ).==

> Users should make no assumptions about how [[versions/v22/API/MPI_REDUCE|MPI_REDUCE]] is implemented. ~~Safest~~ ==It== is ==safest== to ensure that the same function is passed to [[versions/v22/API/MPI_REDUCE|MPI_REDUCE]] by each process.

The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at the root. In such ==a== case, the input data is taken at the root from the receive buffer, where it will be replaced by the output data.

If `comm` is an intercommunicator, then the call involves all processes in the intercommunicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in `root`. Only send buffer arguments are significant in group B and only receive buffer arguments are significant at the root.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~If `comm` is an intracommunicator,~~

~~`MPI_REDUCE` combines the elements provided in the input buffer of each process in the group, using the operation `op`, and returns the combined value in the output buffer of the process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all processes provide input buffers and output buffers of the same length, with elements of the same type. Each process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is `MPI_MAX` and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then $`recvbuf(1) =  global \max ( sendbuf(1))`$ and $`recvbuf(2) =  global \max (  sendbuf(2))`$.~~

~~Section [[coll-predefined-op]] , lists the set of predefined operations provided by MPI. That section also enumerates~~

~~the datatypes to which each operation can be applied.~~

==If `comm` is an intracommunicator, `MPI_REDUCE` combines the elements provided in the input buffer of each process in the group, using the operation `op`, and returns the combined value in the output buffer of the process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all processes provide input buffers of the same length, with elements of the same type as the output buffer at the root. Each process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is `MPI_MAX` and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then $`recvbuf(1) =  global \max ( sendbuf(1))`$ and $`recvbuf(2) =  global \max (  sendbuf(2))`$.==

==Section [[coll-predefined-op]] , lists the set of predefined operations provided by MPI. That section also enumerates the datatypes to which each operation can be applied.==

> It is strongly recommended that [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] be implemented so that the same result be obtained whenever the function is applied on the same arguments, appearing in the same order. Note that this may prevent optimizations that take advantage of the physical location of ~~processors.~~ ==ranks.==

~~`op`.~~

~~Predefined operators work only with the MPI types listed in Section [[coll-predefined-op]] and Section [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all processes.~~

==`op`. Predefined operators work only with the MPI types listed in Section [[coll-predefined-op]] and Section [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all processes.==

~~User-defined operators may operate on general, derived datatypes.~~

~~In this case, each argument that the reduce operation is applied to is one element described by such a datatype, which may contain several basic values. This is further explained in Section [[versions/v30/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .~~

==User-defined operators may operate on general, derived datatypes. In this case, each argument that the reduce operation is applied to is one element described by such a datatype, which may contain several basic values. This is further explained in Section [[versions/v30/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

If `comm` is an intracommunicator, ~~`MPI_REDUCE`~~ ==[[versions/v31/API/MPI_REDUCE|MPI_REDUCE]]== combines the elements provided in the input buffer of each process in the group, using the operation `op`, and returns the combined value in the output buffer of the process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all processes provide input buffers of the same length, with elements of the same type as the output buffer at the root. Each process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is `MPI_MAX` and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then ~~$`recvbuf(1)~~ ==$`\texttt{recvbuf(1)} = global \max (\texttt{sendbuf(1)})`$ and $`\texttt{recvbuf(2)}== = global \max ( ~~sendbuf(1))`$ and $`recvbuf(2) = global \max ( sendbuf(2))`$.~~ ==\texttt{sendbuf(2)})`$.==

~~The `datatype` argument of [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] must be compatible with~~

~~`op`. Predefined operators work only with the MPI types listed in Section [[coll-predefined-op]] and Section [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all processes.~~

~~Note that it is possible for users to supply different user-defined operations to [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] in each process. MPI does not define which operations are used on which operands in this case.~~

~~User-defined operators may operate on general, derived datatypes. In this case, each argument that the reduce operation is applied to is one element described by such a datatype, which may contain several basic values. This is further explained in Section [[versions/v31/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .~~

==The `datatype` argument of [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] must be compatible with `op`. Predefined operators work only with the MPI types listed in Section [[coll-predefined-op]] and Section [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all processes.==

==Note that it is possible for users to supply different user-defined operations to [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] in each process. MPI does not define which operations are used on which operands in this case. User-defined operators may operate on general, derived datatypes. In this case, each argument that the reduce operation is applied to is one element described by such a datatype, which may contain several basic values. This is further explained in Section [[versions/v31/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] combines the elements provided in the input buffer of each process in the group, using the operation `op`, and returns the combined value in the output buffer of the process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all processes provide input buffers of the same length, with elements of the same type as the output buffer at the root. Each process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is `MPI_MAX` and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then $`\texttt{recvbuf(1)} = global \max (\texttt{sendbuf(1)})`$ and $`\texttt{recvbuf(2)} = global \max ( \texttt{sendbuf(2)})`$.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at the root. In such a case, the input data is taken at the root from the receive buffer, where it will be replaced by the output data.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the call involves all processes in the ~~intercommunicator,~~ ==inter-communicator,== but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Only send buffer arguments are significant in group B and only receive buffer arguments are significant at the root.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

If `comm` is an intra-communicator, [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] combines the elements provided in the input buffer of each ==MPI== process in the group, using the operation `op`, and returns the combined value in the output buffer of the ==MPI== process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all ==MPI== processes provide input buffers of the same length, with elements of the same type as the output buffer at the root. Each ==MPI== process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is `MPI_MAX` and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then $`\texttt{recvbuf(1)} = global \max (\texttt{sendbuf(1)})`$ and $`\texttt{recvbuf(2)} = global \max ( \texttt{sendbuf(2)})`$.

The operation `op` is always assumed to be associative. All predefined operations are also assumed to be commutative. Users may define operations that are assumed to be associative, but not commutative. The “canonical” evaluation order of a reduction is determined by the ranks of the ==MPI== processes in the group. However, the implementation can take advantage of associativity, or associativity and commutativity in order to change the order of evaluation. This may change the result of the reduction for operations that are not strictly associative and commutative, such as floating point addition.

> Some applications may not be able to ignore the ~~non-associative~~ ==nonassociative== nature of floating-point operations or may use user-defined operations (see Section [[versions/v41/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] ) that require a special reduction order and cannot be treated as associative. Such applications should enforce the order of evaluation explicitly. For example, in the case of operations that require a strict left-to-right (or right-to-left) evaluation order, this could be done by gathering all operands at a single ==MPI== process (e.g., with [[versions/v41/API/MPI_GATHER|MPI_GATHER]] ), applying the reduction operation in the desired order (e.g., with [[versions/v41/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] ), and if needed, broadcast or scatter the result to the other ==MPI== processes (e.g., with [[versions/v41/API/MPI_BCAST|MPI_BCAST]] ).

The `datatype` argument of [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] must be compatible with `op`. Predefined operators work only with the MPI types listed in Section [[coll-predefined-op]] and Section [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all ==MPI== processes.

Note that it is possible for users to supply different user-defined operations to [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] in each ==MPI== process. MPI does not define which operations are used on which operands in this case. User-defined operators may operate on general, derived datatypes. In this case, each argument that the reduce operation is applied to is one element described by such a datatype, which may contain several basic values. This is further explained in Section [[versions/v41/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .

> Users should make no assumptions about how [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] is implemented. It is safest to ensure that the same function is passed to [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] by each ==MPI== process.

If `comm` is an inter-communicator, then the call involves all ==MPI== processes in the inter-communicator, but with one group (group A) defining the ~~root process.~~ ==root.== All ==MPI== processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other ==MPI== processes in group A pass the value `MPI_PROC_NULL` in `root`. Only send buffer arguments are significant in group B and only receive buffer arguments are significant at the root.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Reduce]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Reduce]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Reduce]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Reduce]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Reduce]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Reduce]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Reduce]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Reduce]]
