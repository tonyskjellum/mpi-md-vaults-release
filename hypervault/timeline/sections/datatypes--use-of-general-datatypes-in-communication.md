---
title: "Use of General Datatypes in Communication"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Use of General Datatypes in Communication

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Use of General Datatypes in Communication|MPI-2.1]], [[versions/v22/sections/datatypes#Use of General Datatypes in Communication|MPI-2.2]], [[versions/v30/sections/datatypes#Use of General Datatypes in Communication|MPI-3.0]], [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|MPI-3.1]], [[versions/v40/sections/datatypes#Use of General Datatypes in Communication|MPI-4.0]], [[versions/v41/sections/datatypes#Use of General Datatypes in Communication|MPI-4.1]], [[versions/v50/sections/datatypes#Use of General Datatypes in Communication|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

and extent $`extent`$. (Empty entries of “pseudo-type” ~~MPI_UB~~ ==`MPI_UB`== and ~~MPI_LB~~ ==`MPI_LB`== are not listed in the type map, but they affect the value of $`extent`$.) The send operation sends $`n \cdot count`$ entries, where entry $`i \cdot n + j`$ is at location $`addr_{i,j} = \textsf{buf} + extent \cdot i + disp_j`$ and has type $`type_j`$, for $`i = 0 ,..., \textsf{count}-1`$ and $`j = 0 ,..., n-1`$. These entries need not be contiguous, nor distinct; their order can be arbitrary.

with extent $`extent`$. (Again, empty entries of “pseudo-type” ~~MPI_UB~~ ==`MPI_UB`== and ~~MPI_LB~~ ==`MPI_LB`== are not listed in the type map, but they affect the value of $`extent`$.) This receive operation receives $`n \cdot count`$ entries, where entry $`i \cdot n + j`$ is at location $`\textsf{buf} + extent \cdot i + disp_j`$ and has type $`type_j`$. If the incoming message consists of $`k`$ elements, then we must have $`k \le n \cdot count`$; the $`i \cdot n + j`$-th element of the message should have a type that matches $`type_j`$.

`MPI_GET_ELEMENTS`) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then `MPI_GET_COUNT` returns the value ~~MPI_UNDEFINED.~~ ==`MPI_UNDEFINED`.==

### MPI-2.2 → MPI-3.0  (8 changed paragraphs)

MPI_TYPE_CONTIGUOUS(count, datatype, newtype) MPI_TYPE_COMMIT(newtype) MPI_SEND(buf, 1, newtype, dest, tag, ~~comm).~~ ==comm) MPI_TYPE_FREE(newtype).==

and extent $`extent`$. ~~(Empty entries of “pseudo-type” `MPI_UB`~~ ==(Explicit lower bound== and ~~`MPI_LB`~~ ==upper bound markers== are not listed in the type map, but they affect the value of $`extent`$.) The send operation sends $`n \cdot count`$ entries, where entry $`i \cdot n + j`$ is at location $`addr_{i,j} = \textsf{buf} + extent \cdot i + disp_j`$ and has type $`type_j`$, for $`i = 0 ,..., \textsf{count}-1`$ and $`j = 0 ,..., n-1`$. These entries need not be contiguous, nor distinct; their order can be arbitrary.

with extent $`extent`$. (Again, ~~empty entries of “pseudo-type” `MPI_UB`~~ ==explicit lower bound== and ~~`MPI_LB`~~ ==upper bound markers== are not listed in the type map, but they affect the value of $`extent`$.) This receive operation receives $`n \cdot count`$ entries, where entry $`i \cdot n + j`$ is at location $`\textsf{buf} + extent \cdot i + disp_j`$ and has type $`type_j`$. If the incoming message consists of $`k`$ elements, then we must have $`k \le n \cdot count`$; the $`i \cdot n + j`$-th element of the message should have a type that matches $`type_j`$.

... CALL ~~MPI_TYPE_CONTIGUOUS( 2,~~ ==MPI_TYPE_CONTIGUOUS(2,== MPI_REAL, type2, ...) CALL ~~MPI_TYPE_CONTIGUOUS( 4,~~ ==MPI_TYPE_CONTIGUOUS(4,== MPI_REAL, type4, ...) CALL ~~MPI_TYPE_CONTIGUOUS( 2,~~ ==MPI_TYPE_CONTIGUOUS(2,== type2, type22, ...) ... CALL ~~MPI_SEND( a,~~ ==MPI_SEND(a,== 4, MPI_REAL, ...) CALL ~~MPI_SEND( a,~~ ==MPI_SEND(a,== 2, type2, ...) CALL ~~MPI_SEND( a,~~ ==MPI_SEND(a,== 1, type22, ...) CALL ~~MPI_SEND( a,~~ ==MPI_SEND(a,== 1, type4, ...) ... CALL ~~MPI_RECV( a,~~ ==MPI_RECV(a,== 4, MPI_REAL, ...) CALL ~~MPI_RECV( a,~~ ==MPI_RECV(a,== 2, type2, ...) CALL ~~MPI_RECV( a,~~ ==MPI_RECV(a,== 1, type22, ...) CALL ~~MPI_RECV( a,~~ ==MPI_RECV(a,== 1, type4, ...)

The received message need not fill all the receive buffer, nor does it need to fill a number of locations which is a multiple of $`n`$. Any number, $`k`$, of basic elements can be received, where $`0 \le k \le \textsf{count} \cdot n`$. The number of basic elements received can be retrieved from `status` using the query ~~function~~ ==functions== [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ==or [[versions/v30/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]== .

~~The previously defined function, `MPI_GET_COUNT` (Section [[versions/v30/sections/pt2pt#Return Status|Return Status]] ), has a different behavior.~~

~~It returns the number of “top-level entries” received, i.e. the number of “copies” of type `datatype`.~~

~~In the previous example, `MPI_GET_COUNT` may return any integer value $`k`$, where $`0 \le k \le \textsf{count}`$. If `MPI_GET_COUNT` returns $`k`$, then the number of basic elements received (and the value returned by~~

~~`MPI_GET_ELEMENTS`) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then `MPI_GET_COUNT` returns the value `MPI_UNDEFINED`.~~

~~The `datatype` argument should match the argument provided by the receive call that set the `status` variable.~~

==![[versions/v30/API/MPI_GET_ELEMENTS_X]]==

==The `datatype` argument should match the argument provided by the receive call that set the `status` variable. For both functions, if the OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.==

==The previously defined function `MPI_GET_COUNT` (Section [[versions/v30/sections/pt2pt#Return Status|Return Status]] ), has a different behavior. It returns the number of “top-level entries” received, i.e. the number of “copies” of type `datatype`. In the previous example, `MPI_GET_COUNT` may return any integer value $`k`$, where $`0 \le k \le \textsf{count}`$. If `MPI_GET_COUNT` returns $`k`$, then the number of basic elements received (and the value returned by==

==`MPI_GET_ELEMENTS` or [[versions/v30/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] ) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then `MPI_GET_COUNT` sets the value of `count` to `MPI_UNDEFINED`.==

The ~~function~~ ==functions== `MPI_GET_ELEMENTS` ==and [[versions/v30/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]== can also be used after a probe to find the number of elements in the probed message. Note that the ~~two~~ functions `MPI_GET_COUNT` ==, `MPI_GET_ELEMENTS` ,== and ~~`MPI_GET_ELEMENTS`~~ ==`MPI_GET_ELEMENTS_X`== return the same values when they are used with basic ~~datatypes.~~ ==datatypes as long as the limits of their respective `count` arguments are not exceeded.==

> The extension given to the definition of `MPI_GET_COUNT` seems natural: one would expect this function to return the value of the `count` argument, when the receive buffer is filled. Sometimes `datatype` represents a basic unit of data one wants to transfer, for example, a record in an array of records (structures). One should be able to find out how many components were received without bothering to divide by the number of elements in each component. However, on other occasions, `datatype` is used to define a complex layout of data in the receiver memory, and does not represent a basic unit of data for transfers. In such cases, one needs to use the function ~~`MPI_GET_ELEMENTS`.~~ ==`MPI_GET_ELEMENTS` or [[versions/v30/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] .==

### MPI-3.0 → MPI-3.1  (8 changed paragraphs)

Handles to derived datatypes can be passed to a communication call wherever a datatype argument is required. A call of the form [[versions/v31/API/MPI_SEND|MPI_SEND]] , where ~~$`count~~ ==$`\texttt{count}== > 1`$, is interpreted as if the call was passed a new datatype which is the concatenation of `count` copies of `datatype`. Thus, [[versions/v31/API/MPI_SEND|MPI_SEND]] is equivalent to,

and extent $`extent`$. (Explicit lower bound and upper bound markers are not listed in the type map, but they affect the value of $`extent`$.) The send operation sends $`n \cdot ~~count`$~~ ==\texttt{count}`$== entries, where entry $`i \cdot n + j`$ is at location $`addr_{i,j} = ~~\textsf{buf}~~ ==\texttt{buf}== + extent \cdot i + disp_j`$ and has type $`type_j`$, for $`i = 0 ,..., ~~\textsf{count}-1`$~~ ==\texttt{count}-1`$== and $`j = 0 ,..., n-1`$. These entries need not be contiguous, nor distinct; their order can be arbitrary.

The variable stored at address $`addr_{i,j}`$ in the calling program should be of a type that matches $`type_j`$, where type matching is defined as in Section [[versions/v31/sections/pt2pt#Type Matching Rules|Type Matching Rules]] . The message sent contains $`n \cdot ~~count`$~~ ==\texttt{count}`$== entries, where entry $`i \cdot n +j`$ has type $`type_j`$.

with extent $`extent`$. (Again, explicit lower bound and upper bound markers are not listed in the type map, but they affect the value of $`extent`$.) This receive operation receives $`n \cdot ~~count`$~~ ==\texttt{count}`$== entries, where entry $`i \cdot n + j`$ is at location ~~$`\textsf{buf}~~ ==$`\texttt{buf}== + extent \cdot i + disp_j`$ and has type $`type_j`$. If the incoming message consists of $`k`$ elements, then we must have $`k \le n \cdot ~~count`$;~~ ==\texttt{count}`$;== the $`i \cdot n + j`$-th element of the message should have a type that matches $`type_j`$.

~~Type matching~~ ==**Type matching**== is defined according to the type signature of the corresponding datatypes, that is, the sequence of basic type components. Type matching does not depend on some aspects of the datatype definition, such as the displacements (layout in memory) or the intermediate types used.

This example shows that type matching is defined in terms of the basic types that a derived type consists of.

The received message need not fill all the receive buffer, nor does it need to fill a number of locations which is a multiple of $`n`$. Any number, $`k`$, of basic elements can be received, where $`0 \le k \le ~~\textsf{count}~~ ==\texttt{count}== \cdot n`$. The number of basic elements received can be retrieved from `status` using the query functions [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] or [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] .

~~The previously defined function `MPI_GET_COUNT` (Section [[versions/v31/sections/pt2pt#Return Status|Return Status]] ), has a different behavior. It returns the number of “top-level entries” received, i.e. the number of “copies” of type `datatype`. In the previous example, `MPI_GET_COUNT` may return any integer value $`k`$, where $`0 \le k \le \textsf{count}`$. If `MPI_GET_COUNT` returns $`k`$, then the number of basic elements received (and the value returned by~~

~~`MPI_GET_ELEMENTS` or [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] ) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then `MPI_GET_COUNT` sets the value of `count` to `MPI_UNDEFINED`.~~

~~ Usage of `MPI_GET_COUNT` and `MPI_GET_ELEMENTS`.~~

==The previously defined function [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] (Section [[versions/v31/sections/pt2pt#Return Status|Return Status]] ), has a different behavior. It returns the number of “top-level entries” received, i.e. the number of “copies” of type `datatype`. In the previous example, [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] may return any integer value $`k`$, where $`0 \le k \le \texttt{count}`$. If [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] returns $`k`$, then the number of basic elements received (and the value returned by [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] or [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] ) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] sets the value of `count` to `MPI_UNDEFINED`.==

==Usage of [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] .==

The functions ~~`MPI_GET_ELEMENTS`~~ ==[[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]]== and [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] can also be used after a probe to find the number of elements in the probed message. Note that the ~~functions `MPI_GET_COUNT`~~ ==[[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]]== , ~~`MPI_GET_ELEMENTS`~~ ==[[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]]== , and ~~`MPI_GET_ELEMENTS_X`~~ ==[[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]== return the same values when they are used with basic datatypes as long as the limits of their respective `count` arguments are not exceeded.

> The extension given to the definition of ~~`MPI_GET_COUNT`~~ ==[[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]]== seems natural: one would expect this function to return the value of the `count` argument, when the receive buffer is filled. Sometimes `datatype` represents a basic unit of data one wants to transfer, for example, a record in an array of records (structures). One should be able to find out how many components were received without bothering to divide by the number of elements in each component. However, on other occasions, `datatype` is used to define a complex layout of data in the receiver memory, and does not represent a basic unit of data for transfers. In such cases, one needs to use the function ~~`MPI_GET_ELEMENTS`~~ ==[[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]]== or [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] .

> The definition implies that a receive cannot change the value of storage outside the entries defined to compose the communication buffer. In particular, the definition implies that padding space in a structure should not be modified when such a structure is copied from one process to another. This would prevent the obvious optimization of copying the structure, together with the padding, as one contiguous block. The implementation is free to do this optimization when it does not impact the outcome of the computation. ~~> >~~ The user can “force” this optimization by explicitly including padding as part of the message.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

A datatype may specify overlapping entries. The use of such a datatype in ==any communication in association with== a ~~receive~~ ==buffer updated by the== operation is erroneous. (This is erroneous even if the actual message received is short enough not to write any entry more than once.)

... CALL MPI_TYPE_CONTIGUOUS(2, MPI_REAL, Type2, ierr) CALL MPI_TYPE_COMMIT(Type2, ierr) ... CALL MPI_COMM_RANK(comm, rank, ierr) IF (rank.EQ.0) THEN CALL MPI_SEND(a, 2, MPI_REAL, 1, 0, comm, ierr) CALL MPI_SEND(a, 3, MPI_REAL, 1, 0, comm, ierr) ELSE IF (rank.EQ.1) THEN CALL MPI_RECV(a, 2, Type2, 0, 0, comm, stat, ierr) CALL MPI_GET_COUNT(stat, Type2, i, ierr) ! returns i=1 CALL MPI_GET_ELEMENTS(stat, Type2, i, ierr) ! returns i=2 CALL MPI_RECV(a, 2, Type2, 0, 0, comm, stat, ierr) CALL MPI_GET_COUNT(stat, Type2, i, ierr) ! returns i=MPI_UNDEFINED CALL MPI_GET_ELEMENTS(stat, Type2, i, ierr) ! returns i=3 END IF

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

~~Handles to derived datatypes can be passed to a communication call wherever a datatype argument is required. A call of the form [[versions/v41/API/MPI_SEND|MPI_SEND]] , where $`\texttt{count} > 1`$, is interpreted as if the call was passed a new datatype which is the concatenation of `count` copies of `datatype`. Thus, [[versions/v41/API/MPI_SEND|MPI_SEND]] is equivalent to,~~

~~    MPI_TYPE_CONTIGUOUS(count, datatype, newtype)     MPI_TYPE_COMMIT(newtype)     MPI_SEND(buf, 1, newtype, dest, tag, comm)     MPI_TYPE_FREE(newtype).~~

~~Similar statements apply to all other communication functions that have a `count` and `datatype` argument.~~

==Handles to derived datatypes can be passed to a communication call wherever a datatype argument is required. A call of the form [[versions/v41/API/MPI_SEND|MPI_SEND]] , where $`\texttt{count} > 1`$, is interpreted as if the call was passed a new datatype that is the concatenation of `count` copies of `datatype`. Thus, [[versions/v41/API/MPI_SEND|MPI_SEND]] is equivalent to,==

==(code block added)==
``` [MPI]Fortran
MPI_TYPE_CONTIGUOUS(count, datatype, newtype)
MPI_TYPE_COMMIT(newtype)
MPI_SEND(buf, 1, newtype, dest, tag, comm)
MPI_TYPE_FREE(newtype).
```

==Similar statements apply to all other communication procedures that have a `count` and `datatype` argument.==

~~    ...     CALL MPI_TYPE_CONTIGUOUS(2, MPI_REAL, type2, ...)     CALL MPI_TYPE_CONTIGUOUS(4, MPI_REAL, type4, ...)     CALL MPI_TYPE_CONTIGUOUS(2, type2, type22, ...)     ...     CALL MPI_SEND(a, 4, MPI_REAL, ...)     CALL MPI_SEND(a, 2, type2, ...)     CALL MPI_SEND(a, 1, type22, ...)     CALL MPI_SEND(a, 1, type4, ...)     ...     CALL MPI_RECV(a, 4, MPI_REAL, ...)     CALL MPI_RECV(a, 2, type2, ...)     CALL MPI_RECV(a, 1, type22, ...)     CALL MPI_RECV(a, 1, type4, ...)~~

==(code block added)==
``` [MPI]Fortran
...
CALL MPI_TYPE_CONTIGUOUS(2, MPI_REAL, type2, ...)
CALL MPI_TYPE_CONTIGUOUS(4, MPI_REAL, type4, ...)
CALL MPI_TYPE_CONTIGUOUS(2, type2, type22, ...)
...
CALL MPI_SEND(a, 4, MPI_REAL, ...)
CALL MPI_SEND(a, 2, type2, ...)
CALL MPI_SEND(a, 1, type22, ...)
CALL MPI_SEND(a, 1, type4, ...)
...
CALL MPI_RECV(a, 4, MPI_REAL, ...)
CALL MPI_RECV(a, 2, type2, ...)
CALL MPI_RECV(a, 1, type22, ...)
CALL MPI_RECV(a, 1, type4, ...)
```

The received message need not fill all the receive buffer, nor does it need to fill a number of locations ~~which~~ ==that== is a multiple of $`n`$. Any number, $`k`$, of basic elements can be received, where $`0 \le k \le \texttt{count} \cdot n`$. The number of basic elements received can be retrieved from `status` using the query ~~functions~~ ==procedure== [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~or [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~ .

~~![[versions/v41/API/MPI_GET_ELEMENTS_X]]~~

~~The `datatype` argument should match the argument provided by the receive call that set the `status` variable. For both functions, if the OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.~~

~~The previously defined function [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] (Section [[versions/v41/sections/pt2pt#Return Status|Return Status]] ), has a different behavior. It returns the number of “top-level entries” received, i.e. the number of “copies” of type `datatype`. In the previous example, [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] may return any integer value $`k`$, where $`0 \le k \le \texttt{count}`$. If [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] returns $`k`$, then the number of basic elements received (and the value returned by [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] or [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] ) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] sets the value of `count` to `MPI_UNDEFINED`.~~

==The `datatype` argument should match the argument provided by the receive call that set the `status` variable. For both procedures, if the OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.==

==The previously defined procedure [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] (Section [[versions/v41/sections/pt2pt#Return Status|Return Status]] ), has a different behavior. It returns the number of “top-level entries” received, i.e., the number of “copies” of type `datatype`. In the previous example, [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] may return any integer value $`k`$, where $`0 \le k \le \texttt{count}`$. If [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] returns $`k`$, then the number of basic elements received (and the value returned by [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] sets the value of `count` to `MPI_UNDEFINED`.==

==[language={[MPI]Fortran},basicstyle=]== ... CALL MPI_TYPE_CONTIGUOUS(2, MPI_REAL, Type2, ierr) CALL MPI_TYPE_COMMIT(Type2, ierr) ... CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(a, 2, MPI_REAL, 1, 0, comm, ierr) CALL MPI_SEND(a, 3, MPI_REAL, 1, 0, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(a, 2, Type2, 0, 0, comm, stat, ierr) CALL MPI_GET_COUNT(stat, Type2, i, ierr) ! returns i=1 CALL MPI_GET_ELEMENTS(stat, Type2, i, ierr) ! returns i=2 CALL MPI_RECV(a, 2, Type2, 0, 0, comm, stat, ierr) CALL MPI_GET_COUNT(stat, Type2, i, ierr) ! returns i=MPI_UNDEFINED CALL MPI_GET_ELEMENTS(stat, Type2, i, ierr) ! returns i=3 END IF

The ~~functions~~ ==procedure== [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~and [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~ can also be used after a probe to find the number of elements in the probed message. Note that the [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] ~~,~~ ==and== [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~, and [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~ return the same values when they are used with basic datatypes as long as the limits of their respective `count` arguments are not exceeded.

> The extension given to the definition of [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] seems natural: one would expect this ~~function~~ ==procedure== to return the value of the `count` argument, when the receive buffer is filled. Sometimes `datatype` represents a basic unit of data one wants to transfer, for example, a record in an array of records (structures). One should be able to find out how many components were received without bothering to divide by the number of elements in each component. However, on other occasions, `datatype` is used to define a complex layout of data in the receiver memory, and does not represent a basic unit of data for transfers. In such cases, one needs to use the ~~function~~ ==procedure== [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~or [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~ .

### MPI-4.1 → MPI-5.0  (4 changed paragraphs)

Handles to derived datatypes can be passed to a communication call wherever a datatype argument is required. A call of the form [[versions/v50/API/MPI_SEND|MPI_SEND]] ~~,~~ ==`(buf, count, datatype, ...)`,== where $`\texttt{count} > 1`$, is interpreted as if the call was passed a new datatype that is the concatenation of `count` copies of `datatype`. Thus, [[versions/v50/API/MPI_SEND|MPI_SEND]] ==`(buf, count, datatype, dest, tag, comm)`== is equivalent to,

Suppose that a send operation [[versions/v50/API/MPI_SEND|MPI_SEND]] ==`(buf, count, datatype, dest, tag, comm)`== is executed, where `datatype` has type map, ``` math \{(type_0, disp_0),...,(type_{n-1}, disp_{n-1})\}, ```

Similarly, suppose that a receive operation [[versions/v50/API/MPI_RECV|MPI_RECV]] ==`(buf, count, datatype, source, tag, comm, status)`== is executed, where `datatype` has type map, ``` math \{(type_0, disp_0) ,...,(type_{n-1}, disp_{n-1}) \}, ```

Suppose that [[versions/v50/API/MPI_RECV|MPI_RECV]] ==`(buf, count, datatype, dest, tag, comm, status)`== is executed, where `datatype` has type map, ``` math \{(type_0, disp_0) ,...,(type_{n-1}, disp_{n-1}) \}. ```

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Use of General Datatypes in Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Use of General Datatypes in Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Use of General Datatypes in Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Use of General Datatypes in Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Use of General Datatypes in Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Use of General Datatypes in Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Use of General Datatypes in Communication]]
