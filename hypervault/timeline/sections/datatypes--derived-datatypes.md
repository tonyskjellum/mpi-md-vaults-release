---
title: "Derived Datatypes"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Derived Datatypes

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Derived Datatypes|MPI-2.1]], [[versions/v22/sections/datatypes#Derived Datatypes|MPI-2.2]], [[versions/v30/sections/datatypes#Derived Datatypes|MPI-3.0]], [[versions/v31/sections/datatypes#Derived Datatypes|MPI-3.1]], [[versions/v40/sections/datatypes#Derived Datatypes|MPI-4.0]], [[versions/v41/sections/datatypes#Derived Datatypes|MPI-4.1]], [[versions/v50/sections/datatypes#Derived Datatypes|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

Most datatype constructors have replication count or block length arguments. Allowed values are ~~nonnegative~~ ==non-negative== integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.

a multiple of $`k_i`$, then $`\epsilon`$ is the least ~~nonnegative~~ ==non-negative== increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$. The complete definition of **extent** is given on page [[versions/v22/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] .

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~Up to here, all point to point communication have involved only~~

~~buffers containing a sequence of identical basic datatypes.~~

==Up to here, all point to point communications have involved only buffers containing a sequence of identical basic datatypes.==

The general mechanisms provided here allow one to transfer directly, without copying, objects of various ~~shape~~ ==shapes== and ~~size.~~ ==sizes.== It is not assumed that the MPI library is cognizant of the objects declared in the host language. Thus, if one wants to transfer a structure, or an array section, it will be necessary to provide in MPI a definition of a communication buffer that mimics the definition of the structure or array section in question. These facilities can be used by library designers to define communication functions that can transfer objects defined in the host language — by decoding their definitions as available in a symbol table or a dope vector. Such higher-level communication functions are not part of MPI.

be the associated type signature. This type map, together with a base address *buf*, specifies a communication buffer: the communication buffer that consists of $`n`$ entries, where the $`i`$-th entry is at address ~~$`buf~~ ==$`\mathit{buf}== + disp_i`$ and has type $`type_i`$. A message assembled from such a communication buffer will consist of $`n`$ values, of the types defined by $`Typesig`$.

~~then~~

~~(code block removed)~~
``` math
\begin{eqnarray}
lb(Typemap) & = & \min_j disp_j ,  \\
ub(Typemap) & = & \max_j (disp_j + sizeof(type_j)) + \epsilon ,  and
 \ extent(Typemap) & = & ub(Typemap) -lb(Typemap).
\end{eqnarray}
```

~~If $`type_i`$ requires alignment to a byte address that~~

~~is~~

~~a multiple of $`k_i`$, then $`\epsilon`$ is the least non-negative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$. The complete definition of **extent** is given on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] .~~

==then ``` math \begin{eqnarray} lb(Typemap) & = & \min_j disp_j ,  \\ ub(Typemap) & = & \max_j (disp_j + \mathit{sizeof}(type_j)) + \epsilon ,  and  \ extent(Typemap) & = & ub(Typemap) - lb(Typemap). \end{eqnarray} ```==

==If $`type_j`$ requires alignment to a byte address that==

==is a multiple of $`k_j`$, then $`\epsilon`$ is the least non-negative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_j k_j`$.==

==In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_j`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`.==

==The complete definition of **extent** is given in Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] .==

> The definition of extent is motivated by the assumption that the amount of padding added at the end of each structure in an array of structures is the least needed to fulfill alignment constraints. More explicit control of the extent is provided in Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] . Such explicit control is needed in cases where the assumption does not hold, for example, where union types are used. ==> > In Fortran, structures can be expressed with several language features, e.g., common blocks, `SEQUENCE` derived types, or `BIND(C)` derived types. The compiler may use different alignments, and therefore, it is recommended to use [[versions/v30/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] for arrays of structures if an alignment may cause an alignment-gap at the end of a structure as described in Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and in Section [[versions/v30/sections/binding#Fortran Derived Types|Fortran Derived Types]] on page [[versions/v30/sections/binding#Fortran Derived Types|Fortran Derived Types]] .==

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~Up to here, all point to point communications have involved only buffers containing a sequence of identical basic datatypes.~~

~~This is too constraining on two accounts. One often wants to pass messages that contain values with different datatypes (e.g., an integer count, followed by a sequence of real numbers); and one often wants to send noncontiguous data (e.g., a sub-block of a matrix). One solution is to pack noncontiguous data into a contiguous buffer at the sender site and unpack it~~

~~at the receiver site. This has the disadvantage of requiring additional memory-to-memory copy operations at both sites, even when the communication subsystem has scatter-gather capabilities. Instead, MPI provides mechanisms to specify more general, mixed, and noncontiguous communication buffers. It is up to the implementation to decide whether data should be first packed in a contiguous buffer before being transmitted, or whether it can be collected directly from where it resides.~~

==Up to here, all point to point communications have involved only buffers containing a sequence of identical basic datatypes. This is too constraining on two accounts. One often wants to pass messages that contain values with different datatypes (e.g., an integer count, followed by a sequence of real numbers); and one often wants to send noncontiguous data (e.g., a sub-block of a matrix). One solution is to pack noncontiguous data into a contiguous buffer at the sender site and unpack it at the receiver site. This has the disadvantage of requiring additional memory-to-memory copy operations at both sites, even when the communication subsystem has scatter-gather capabilities. Instead, MPI provides mechanisms to specify more general, mixed, and noncontiguous communication buffers. It is up to the implementation to decide whether data should be first packed in a contiguous buffer before being transmitted, or whether it can be collected directly from where it resides.==

Let ``` math Typemap = \{ (type_0,disp_0), ~~...,~~ ==... ,== (type_{n-1}, disp_{n-1}) \} , ```

be the associated type signature. This type map, together with a base address ~~*buf*,~~ ==`buf`,== specifies a communication buffer: the communication buffer that consists of $`n`$ entries, where the $`i`$-th entry is at address ~~$`\mathit{buf}~~ ==$`\texttt{buf}== + disp_i`$ and has type $`type_i`$. A message assembled from such a communication buffer will consist of $`n`$ values, of the types defined by $`Typesig`$.

~~We can use a handle to a general datatype as an argument in a send or receive operation, instead of a basic datatype argument. The operation `MPI_SEND(buf, 1, datatype,...)` will use the send buffer defined by the base address `buf` and the general datatype associated with `datatype`; it will generate a message with the type signature determined by the `datatype` argument. `MPI_RECV(buf, 1, datatype,...)` will use the receive buffer defined by the base address `buf` and the general datatype associated with `datatype`.~~

~~General datatypes can be used in all send and receive operations. We discuss, in Section [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , the case where the second argument `count` has value $`> 1`$.~~

~~The basic datatypes presented in Section [[versions/v31/sections/pt2pt#Message Data|Message Data]] are particular cases of a general datatype, and are predefined. Thus, `MPI_INT` is a predefined handle to a datatype with type map $`\{ (\textsf{int}, 0) \}`$, with one entry of type <span class="sans-serif">int</span> and displacement zero. The other basic datatypes are similar.~~

~~The **extent** of a datatype is defined to be the span from the first byte to the last byte occupied by entries in this datatype, rounded up to satisfy alignment requirements. That is, if ``` math Typemap = \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} , ```~~

~~then ``` math \begin{eqnarray} lb(Typemap) & = & \min_j disp_j ,  \\ ub(Typemap) & = & \max_j (disp_j + \mathit{sizeof}(type_j)) + \epsilon ,  and  \ extent(Typemap) & = & ub(Typemap) - lb(Typemap). \end{eqnarray} ```~~

~~If $`type_j`$ requires alignment to a byte address that~~

~~is a multiple of $`k_j`$, then $`\epsilon`$ is the least non-negative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_j k_j`$.~~

~~In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_j`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`.~~

~~The complete definition of **extent** is given in Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] .~~

~~ Assume that $`Type = \{ (\textsf{double},0), (\textsf{char}, 8) \}`$ (a <span class="sans-serif">double</span> at displacement zero, followed by a <span class="sans-serif">char</span> at displacement eight). Assume, furthermore, that doubles have to be strictly aligned at addresses that are multiples of eight. Then, the extent of this datatype is 16 (9 rounded to the next multiple of 8). A datatype that consists of a character immediately followed by a double will also have an extent of 16.~~

==We can use a handle to a general datatype as an argument in a send or receive operation, instead of a basic datatype argument. The operation [[versions/v31/API/MPI_SEND|MPI_SEND]] will use the send buffer defined by the base address `buf` and the general datatype associated with `datatype`; it will generate a message with the type signature determined by the `datatype` argument. [[versions/v31/API/MPI_RECV|MPI_RECV]] will use the receive buffer defined by the base address `buf` and the general datatype associated with `datatype`.==

==General datatypes can be used in all send and receive operations. We discuss, in [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , the case where the second argument `count` has value $`> 1`$.==

==The basic datatypes presented in Section [[versions/v31/sections/pt2pt#Message Data|Message Data]] are particular cases of a general datatype, and are predefined. Thus, `MPI_INT` is a predefined handle to a datatype with type map $`\{ (\texttt{int}, 0) \}`$, with one entry of type `int` and displacement zero. The other basic datatypes are similar.==

==The **extent** of a datatype is defined to be the span from the first byte to the last byte occupied by entries in this datatype, rounded up to satisfy alignment requirements. That is, if ``` math Typemap = \{ (type_0,disp_0), ... , (type_{n-1}, disp_{n-1}) \} , ```==

==then ``` math \begin{eqnarray} lb(Typemap) & = & \min_j disp_j ,  \\ ub(Typemap) & = & \max_j (disp_j + \texttt{sizeof}(type_j)) + \epsilon ,  and  \ extent(Typemap) & = & ub(Typemap) - lb(Typemap).  \end{eqnarray} ```==

==If $`type_j`$ requires alignment to a byte address that is a multiple of $`k_j`$, then $`\epsilon`$ is the least non-negative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_j k_j`$. In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_j`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`. The complete definition of **extent** is given by Equation [[soft-lb-ub-definition]] [[versions/v31/sections/datatypes#Derived Datatypes|Derived Datatypes]] .==

==Assume that $`Type = \{ (\texttt{double},0), (\texttt{char}, 8) \}`$ (a `double` at displacement zero, followed by a `char` at displacement eight). Assume, furthermore, that doubles have to be strictly aligned at addresses that are multiples of eight. Then, the extent of this datatype is 16 (9 rounded to the next multiple of 8). A datatype that consists of a character immediately followed by a double will also have an extent of 16.==

> The definition of extent is motivated by the assumption that the amount of padding added at the end of each structure in an array of structures is the least needed to fulfill alignment constraints. More explicit control of the extent is provided in Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] . Such explicit control is needed in cases where the assumption does not hold, for example, where union types are used. ~~> >~~ In Fortran, structures can be expressed with several language features, e.g., common blocks, `SEQUENCE` derived types, or `BIND(C)` derived types. The compiler may use different alignments, and therefore, it is recommended to use [[versions/v31/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] for arrays of structures if an alignment may cause an alignment-gap at the end of a structure as described in ~~Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page~~ [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and in ~~Section [[versions/v31/sections/binding#Fortran Derived Types|Fortran Derived Types]] on page~~ [[versions/v31/sections/binding#Fortran Derived Types|Fortran Derived Types]] .

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Up to here, all ~~point to point~~ ==point-to-point== communications have involved only buffers containing a sequence of identical basic datatypes. This is too constraining on two accounts. One often wants to pass messages that contain values with different datatypes (e.g., an integer count, followed by a sequence of real numbers); and one often wants to send noncontiguous data (e.g., a sub-block of a matrix). One solution is to pack noncontiguous data into a contiguous buffer at the sender site and unpack it at the receiver site. This has the disadvantage of requiring additional memory-to-memory copy operations at both sites, even when the communication subsystem has scatter-gather capabilities. Instead, MPI provides mechanisms to specify more general, mixed, and noncontiguous communication buffers. It is up to the implementation to decide whether data should be first packed in a contiguous buffer before being transmitted, or whether it can be collected directly from where it resides.

The general mechanisms provided here allow one to transfer directly, without copying, objects of various shapes and sizes. It is not assumed that the MPI library is cognizant of the objects declared in the host language. Thus, if one wants to transfer a structure, or an array section, it will be necessary to provide in MPI a definition of a communication buffer that mimics the definition of the structure or array section in question. These facilities can be used by library designers to define communication functions that can transfer objects defined in the host ~~language — by~~ ==language—by== decoding their definitions as available in a symbol table or a dope vector. Such higher-level communication functions are not part of MPI.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

- A sequence of basic ~~datatypes~~ ==datatypes.==

- A sequence of integer (byte) ~~displacements~~ ==displacements.==

Most datatype constructors have replication count or block length arguments. Allowed values are ~~non-negative~~ ==nonnegative== integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.

If $`type_j`$ requires alignment to a byte address that is a multiple of $`k_j`$, then $`\epsilon`$ is the least ~~non-negative~~ ==nonnegative== increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_j k_j`$. In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_j`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`. The complete definition of **extent** is given by Equation [[soft-lb-ub-definition]] [[versions/v41/sections/datatypes#Derived Datatypes|Derived Datatypes]] .

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~Up to here, all point-to-point~~ ==Point-to-point== communications ~~have involved only~~ ==on== buffers containing a sequence of identical basic ~~datatypes. This~~ ==datatypes== is ~~too constraining on two accounts.~~ ==constraining.== One often wants to pass messages that contain values with different datatypes (e.g., an integer count, followed by a sequence of real numbers); and one often wants to send noncontiguous data (e.g., a sub-block of a matrix). One solution is to pack noncontiguous data into a contiguous buffer at the sender site and unpack it at the receiver site. This has the disadvantage of requiring additional memory-to-memory copy operations at both sites, even when the communication subsystem has scatter-gather capabilities. Instead, MPI provides mechanisms to specify more general, mixed, and noncontiguous communication buffers. It is up to the implementation to decide whether data should be first packed in a contiguous buffer before being transmitted, or whether it can be collected directly from where it resides.

We can use a handle to a general datatype as an argument in a send or receive operation, instead of a basic datatype argument. The operation [[versions/v50/API/MPI_SEND|MPI_SEND]] ==`(buf, 1, datatype,`$`...`$`)`== will use the send buffer defined by the base address `buf` and the general datatype associated with `datatype`; it will generate a message with the type signature determined by the `datatype` argument. [[versions/v50/API/MPI_RECV|MPI_RECV]] ==`(buf, 1, datatype,`$`...`$`)`== will use the receive buffer defined by the base address `buf` and the general datatype associated with `datatype`.

If $`type_j`$ requires alignment to a byte address that is a multiple of $`k_j`$, then $`\epsilon`$ is the least nonnegative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_j k_j`$. In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_j`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`. The complete definition of **extent** is given by Equation [[soft-lb-ub-definition]] ~~[[versions/v50/sections/datatypes#Derived Datatypes|Derived Datatypes]]~~ .

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Derived Datatypes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Derived Datatypes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Derived Datatypes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Derived Datatypes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Derived Datatypes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Derived Datatypes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Derived Datatypes]]
