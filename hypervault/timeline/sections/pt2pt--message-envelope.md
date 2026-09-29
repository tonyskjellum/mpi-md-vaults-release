---
title: "Message Envelope"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Message Envelope

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Message envelope|MPI-1.3]], [[versions/v21/sections/pt2pt#Message Envelope|MPI-2.1]], [[versions/v22/sections/pt2pt#Message Envelope|MPI-2.2]], [[versions/v30/sections/pt2pt#Message Envelope|MPI-3.0]], [[versions/v31/sections/pt2pt#Message Envelope|MPI-3.1]], [[versions/v40/sections/pt2pt#Message Envelope|MPI-4.0]], [[versions/v41/sections/pt2pt#Message Envelope|MPI-4.1]], [[versions/v50/sections/pt2pt#Message Envelope|MPI-5.0]]

Heading by release: MPI-1.3: “Message envelope”; MPI-2.1: “Message Envelope”; MPI-2.2: “Message Envelope”; MPI-3.0: “Message Envelope”; MPI-3.1: “Message Envelope”; MPI-4.0: “Message Envelope”; MPI-4.1: “Message Envelope”; MPI-5.0: “Message Envelope”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

The `comm` argument specifies the **communicator** that is used for the send operation. Communicators are explained in Chapter [[versions/v21/sections/context#Groups, Contexts, ==Communicators,== and ~~Communicators|Groups,~~ ==Caching|Groups,== Contexts, ==Communicators,== and ~~Communicators]]~~ ==Caching]]== ; below is a brief summary of their usage.

The communicator also specifies the set of processes that share this communication context. This **process group** is ordered and processes are identified by their rank within this group. Thus, the range of valid values for `dest` is <span class="sans-serif">0, ... , n-1</span>, where <span class="sans-serif">n</span> is the number of processes in the group. (If the communicator is an inter-communicator, then destinations are identified by their rank in the remote group. See Chapter [[versions/v21/sections/context#Groups, Contexts, ==Communicators,== and ~~Communicators|Groups,~~ ==Caching|Groups,== Contexts, ==Communicators,== and ~~Communicators]]~~ ==Caching]]== .)

> Users that are comfortable with the notion of a flat name space for processes, and a single communication context, as offered by most existing communication libraries, need only use the predefined variable MPI_COMM_WORLD as the `comm` argument. This will allow communication with all the processes available at initialization time. > > Users may define new communicators, as explained in Chapter [[versions/v21/sections/context#Groups, Contexts, ==Communicators,== and ~~Communicators|Groups,~~ ==Caching|Groups,== Contexts, ==Communicators,== and ~~Communicators]]~~ ==Caching]]== . Communicators provide an important encapsulation mechanism for libraries and modules. They allow modules to have their own disjoint communication universe and their own process numbering scheme.

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

The integer-valued message tag is specified by the `tag` argument. This integer can be used by the program to distinguish different types of messages. The range of valid tag values is <span class="sans-serif">0,...,UB</span>, where the value of <span class="sans-serif">UB</span> is implementation dependent. It can be found by querying the value of the attribute ~~MPI_TAG_UB,~~ ==`MPI_TAG_UB`,== as described in Chapter [[versions/v22/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] . MPI requires that <span class="sans-serif">UB</span> be no less than 32767.

A predefined communicator ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== is provided by MPI. It allows communication with all processes that are accessible after MPI initialization and processes are identified by their rank in the group of ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.==

> Users that are comfortable with the notion of a flat name space for processes, and a single communication context, as offered by most existing communication libraries, need only use the predefined variable ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== as the `comm` argument. This will allow communication with all the processes available at initialization time. > > Users may define new communicators, as explained in Chapter [[versions/v22/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . Communicators provide an important encapsulation mechanism for libraries and modules. They allow modules to have their own disjoint communication universe and their own process numbering scheme.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

A communicator specifies the communication context for a communication operation. Each communication context provides a separate “communication ~~universe:”~~ ==universe”:== messages are always received within the context they were sent, and messages sent in different contexts do not interfere.

The communicator also specifies the set of processes that share this communication context. This **process group** is ordered and processes are identified by their rank within this group. Thus, the range of valid values for `dest` is <span class="sans-serif">0, ~~... , n-1</span>,~~ ==..., n-1</span>$`\cup`${`MPI_PROC_NULL`},== where <span class="sans-serif">n</span> is the number of processes in the group. (If the communicator is an inter-communicator, then destinations are identified by their rank in the remote group. See Chapter [[versions/v30/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .)

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

The integer-valued message tag is specified by the `tag` argument. This integer can be used by the program to distinguish different types of messages. The range of valid tag values is ~~<span class="sans-serif">0,...,UB</span>,~~ ==$`0,...,\texttt{UB}`$,== where the value of ~~<span class="sans-serif">UB</span>~~ ==`UB`== is implementation dependent. It can be found by querying the value of the attribute `MPI_TAG_UB`, as described in Chapter [[versions/v31/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] . MPI requires that ~~<span class="sans-serif">UB</span>~~ ==`UB`== be no less than 32767.

The communicator also specifies the set of processes that share this communication context. This **process group** is ordered and processes are identified by their rank within this group. Thus, the range of valid values for `dest` is ~~<span class="sans-serif">0,~~ ==$`0,== ..., ~~n-1</span>$`\cup`${`MPI_PROC_NULL`},~~ ==n-1 \cup \{\texttt{MPI_PROC_NULL}\}`$,== where ~~<span class="sans-serif">n</span>~~ ==$`n`$== is the number of processes in the group. (If the communicator is an inter-communicator, then destinations are identified by their rank in the remote group. See Chapter [[versions/v31/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .)

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

The ~~message source~~ ==*message source*== is implicitly determined by the identity of the message sender. The other fields are specified by arguments in the send ~~operation.~~ ==procedure.==

The ~~message destination~~ ==*message destination*== is specified by the `dest` argument.

The integer-valued ~~message tag~~ ==*message tag*== is specified by the `tag` argument. This integer can be used by the program to distinguish different types of messages. The range of valid tag values is $`0,...,\texttt{UB}`$, where the value of `UB` is implementation dependent. It can be found by querying the value of the attribute `MPI_TAG_UB`, as described in Chapter [[versions/v40/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] . MPI requires that `UB` be no less than 32767.

The `comm` argument specifies the ~~**communicator**~~ ==*communicator*== that is used for the send operation. Communicators are explained in Chapter [[versions/v40/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] ; below is a brief summary of their usage.

The communicator also specifies the set of processes that share this communication context. This ~~**process group**~~ ==*process group*== is ordered and processes are identified by their rank within this group. Thus, the range of valid values for `dest` is $`0, ..., n-1 \cup \{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of processes in the group. (If the communicator is an inter-communicator, then destinations are identified by their rank in the remote group. See Chapter [[versions/v40/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .)

~~A~~ ==When using the World Model (see Section [[versions/v40/sections/dynamic#The World Model|The World Model]] ), a== predefined communicator `MPI_COMM_WORLD` is provided by MPI. It allows communication with all processes that are accessible after MPI initialization and processes are identified by their rank in the group of `MPI_COMM_WORLD`.

> Users that are comfortable with the notion of a flat name space for processes, and a single communication context, as offered by most existing communication libraries, need only use ==the World Model for MPI initialization, and== the predefined variable `MPI_COMM_WORLD` as the `comm` argument. This will allow communication with all the processes available at initialization time. > > Users may define new communicators, as explained in Chapter [[versions/v40/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . Communicators provide an important encapsulation mechanism for libraries and modules. They allow modules to have their own disjoint communication universe and their own process numbering scheme.

> The ~~message envelope~~ ==*message envelope*== would normally be encoded by a fixed-length message header. However, the actual encoding is implementation dependent. Some of the information (e.g., source or destination) may be implicit, and need not be explicitly carried by messages. Also, processes may be identified by relative ranks, or absolute ids, etc.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

~~source\ destination\ tag\ communicator~~ ==**source**\ **destination**\ **tag**\ **communicator**==

~~The communicator also specifies the set of processes that share this communication context. This *process group* is ordered and processes are identified by their rank within this group. Thus, the range of valid values for `dest` is $`0, ..., n-1 \cup \{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of processes in the group. (If the communicator is an inter-communicator, then destinations are identified by their rank in the remote group. See Chapter [[versions/v41/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .)~~

~~When using the World Model (see Section [[versions/v41/sections/dynamic#The World Model|The World Model]] ), a predefined communicator `MPI_COMM_WORLD` is provided by MPI. It allows communication with all processes that are accessible after MPI initialization and processes are identified by their rank in the group of `MPI_COMM_WORLD`.~~

==The communicator also specifies the group of MPI processes that share this communication context. This MPI *process group* is ordered and MPI processes are identified by their rank within this group. Thus, the range of valid values for `dest` is $`0, ..., n-1 \cup \{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of MPI processes in the group. (If the communicator is an inter-communicator, then destinations are identified by their rank in the remote group. See Chapter [[versions/v41/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .)==

==An MPI process may have a different rank in each group in which it is a member.==

==When using the World Model (see Section [[versions/v41/sections/dynamic#The World Model|The World Model]] ), a predefined communicator `MPI_COMM_WORLD` is provided by MPI. It allows communication with all MPI processes that are accessible after MPI initialization and MPI processes are identified by their rank in the group of `MPI_COMM_WORLD`.==

> Users that are comfortable with the notion of a flat name space for ==MPI== processes, and a single communication context, as offered by most existing communication libraries, need only use the World Model for MPI initialization, and the predefined variable `MPI_COMM_WORLD` as the `comm` argument. This will allow communication with all the ==MPI== processes available at initialization time. > > Users may define new communicators, as explained in Chapter [[versions/v41/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . Communicators provide an important encapsulation mechanism for libraries and modules. They allow modules to have their own disjoint communication universe and their own ==MPI== process numbering scheme.

> The *message envelope* would normally be encoded by a fixed-length message header. However, the actual encoding is implementation dependent. Some of the information (e.g., source or destination) may be implicit, and need not be explicitly carried by messages. Also, ==MPI== processes may be identified by relative ranks, or absolute ids, etc.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Message envelope]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Message Envelope]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Message Envelope]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Message Envelope]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Message Envelope]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Message Envelope]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Message Envelope]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Message Envelope]]
