---
title: "Blocking Receive"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Blocking Receive

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Blocking receive|MPI-1.3]], [[versions/v21/sections/pt2pt#Blocking Receive|MPI-2.1]], [[versions/v22/sections/pt2pt#Blocking Receive|MPI-2.2]], [[versions/v30/sections/pt2pt#Blocking Receive|MPI-3.0]], [[versions/v31/sections/pt2pt#Blocking Receive|MPI-3.1]], [[versions/v40/sections/pt2pt#Blocking Receive|MPI-4.0]], [[versions/v41/sections/pt2pt#Blocking Receive|MPI-4.1]], [[versions/v50/sections/pt2pt#Blocking Receive|MPI-5.0]]

Heading by release: MPI-1.3: “Blocking receive”; MPI-2.1: “Blocking Receive”; MPI-2.2: “Blocking Receive”; MPI-3.0: “Blocking Receive”; MPI-3.1: “Blocking Receive”; MPI-4.0: “Blocking Receive”; MPI-4.1: “Blocking Receive”; MPI-5.0: “Blocking Receive”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

The blocking semantics of this call are described in ~~Sec.~~ ==Section== [[versions/v21/sections/pt2pt#Communication Modes|Communication Modes]] .

~~The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard MPI_ANY_SOURCE value for `source`, and/or a wildcard MPI_ANY_TAG value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless source= MPI_ANY_SOURCE in the pattern, and has a matching tag unless tag= MPI_ANY_TAG in the pattern.~~

==The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard MPI_ANY_SOURCE value for `source`, and/or a wildcard MPI_ANY_TAG value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless==

==source=MPI_ANY_SOURCE==

==in the pattern, and has a matching tag unless==

==tag=MPI_ANY_TAG==

==in the pattern.==

Source = destination is allowed, that is, a process can send a message to itself. (However, it is unsafe to do so with the blocking send and receive operations described above, since this may lead to deadlock. See ~~Sec.~~ ==Section== [[versions/v21/sections/pt2pt#Semantics of ~~point-to-point communication|Semantics~~ ==Point-to-Point Communication|Semantics== of ~~point-to-point communication]]~~ ==Point-to-Point Communication]]== .)

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard ~~MPI_ANY_SOURCE~~ ==`MPI_ANY_SOURCE`== value for `source`, and/or a wildcard ~~MPI_ANY_TAG~~ ==`MPI_ANY_TAG`== value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless

~~source=MPI_ANY_SOURCE~~ ==source=`MPI_ANY_SOURCE`==

~~tag=MPI_ANY_TAG~~ ==tag=`MPI_ANY_TAG`==

The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from ~~MPI_ANY_SOURCE,~~ ==`MPI_ANY_SOURCE`,== is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is ~~{0,...,n-1}$`\cup`$ {MPI_ANY_SOURCE},~~ =={<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`},== where <span class="sans-serif">n</span> is the number of processes in this group.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~source=`MPI_ANY_SOURCE`~~

~~in the pattern, and has a matching tag unless~~

~~tag=`MPI_ANY_TAG`~~

~~in the pattern.~~

~~The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`}, where <span class="sans-serif">n</span> is the number of processes in this group.~~

==source=`MPI_ANY_SOURCE` in the pattern, and has a matching tag unless==

==tag=`MPI_ANY_TAG` in the pattern.==

==The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`},$`\cup`${`MPI_PROC_NULL`}, where <span class="sans-serif">n</span> is the number of processes in this group.==

==The use of dest or source=`MPI_PROC_NULL` to define a “dummy” destination or source in any send or receive call is described in Section [[versions/v30/sections/pt2pt#Null Processes|Null Processes]] on page [[versions/v30/sections/pt2pt#Null Processes|Null Processes]] .==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard `MPI_ANY_SOURCE` value for `source`, and/or a wildcard `MPI_ANY_TAG` value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless~~

~~source=`MPI_ANY_SOURCE` in the pattern, and has a matching tag unless~~

~~tag=`MPI_ANY_TAG` in the pattern.~~

~~The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {<span class="sans-serif">0,...,n-1</span>}$`\cup`${`MPI_ANY_SOURCE`},$`\cup`${`MPI_PROC_NULL`}, where <span class="sans-serif">n</span> is the number of processes in this group.~~

==The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard `MPI_ANY_SOURCE` value for `source`, and/or a wildcard `MPI_ANY_TAG` value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless source=`MPI_ANY_SOURCE` in the pattern, and has a matching tag unless tag=`MPI_ANY_TAG` in the pattern.==

==The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {$`0,...,n-1\}\cup\{\texttt{MPI_ANY_SOURCE}\}\cup\{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of processes in this group.==

The use of dest or source=`MPI_PROC_NULL` to define a “dummy” destination or source in any send or receive call is described in ~~Section [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] on page~~ [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] .

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

The syntax of the ~~blocking receive operation~~ ==**blocking receive** procedure== is given below.

> Even though no specific behavior is mandated by MPI for ~~erroneous programs,~~ ==*erroneous programs*,== the recommended handling of overflow situations is to return in `status` information about the source and tag of the incoming message. The receive ~~operation~~ ==procedure== will return an error code. A quality implementation will also ensure that no memory that is outside the receive buffer will ever be overwritten. > > In the case of a message shorter than the receive buffer, MPI is quite strict in that it allows no modification of the other locations. A more lenient statement would allow for some optimizations but this is not allowed. The implementation must be ready to end a copy into the receiver memory exactly at the end of the receive buffer, even if it is an odd address.

The selection of a message by a receive operation is governed by the value of the ~~message envelope.~~ ==*message envelope*.== A message can be received by a receive operation if its ~~envelope~~ ==*envelope*== matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a ~~wildcard~~ ==**wildcard**== `MPI_ANY_SOURCE` value for `source`, and/or a wildcard `MPI_ANY_TAG` value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless ~~source=`MPI_ANY_SOURCE`~~ ==`source``=``MPI_ANY_SOURCE`== in the pattern, and has a matching tag unless ~~tag=`MPI_ANY_TAG`~~ ==`tag``=``MPI_ANY_TAG`== in the pattern.

The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the process group associated with that same communicator (remote process group, for ~~intercommunicators).~~ ==inter-communicators).== Thus, the range of valid values for the `source` argument is {$`0,...,n-1\}\cup\{\texttt{MPI_ANY_SOURCE}\}\cup\{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of processes in this group.

Source = destination is allowed, that is, a process can send a message to itself. ~~(However,~~ ==However,== it is unsafe to do so with the blocking send and receive operations described above, since this may lead to deadlock. See Section [[versions/v40/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] ~~.)~~ ==.==

The use of ~~dest~~ ==`dest``=``MPI_PROC_NULL`== or ~~source=`MPI_PROC_NULL`~~ ==`source``=``MPI_PROC_NULL`== to define a “dummy” destination or source in any send or receive call is described in [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] .

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

> Even though no specific behavior is mandated by MPI for *erroneous programs*, the recommended handling of overflow situations is to return in `status` information about the source and tag of the incoming message. The receive procedure will return an error code. ~~A quality implementation~~ ==High-quality implementations== will also ensure that no memory that is outside the receive buffer will ever be overwritten. > > In the case of a message shorter than the receive buffer, MPI is quite strict in that it allows no modification of the other locations. A more lenient statement would allow for some optimizations but this is not allowed. The implementation must be ready to end a copy into the receiver memory exactly at the end of the receive buffer, even if it is an odd address.

The selection of a message by a receive operation is governed by the value of the *message envelope*. A message can be received by a receive operation if its *envelope* matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a **wildcard** `MPI_ANY_SOURCE` value for `source`, and/or a wildcard `MPI_ANY_TAG` value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving ==MPI== process, has a matching communicator, has matching source unless `source``=``MPI_ANY_SOURCE` in the pattern, and has a matching tag unless `tag``=``MPI_ANY_TAG` in the pattern.

The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from `MPI_ANY_SOURCE`, is specified as a rank within the ==MPI== process group associated with that same communicator (remote ==MPI== process group, for inter-communicators). Thus, the range of valid values for the `source` argument is {$`0,...,n-1\}\cup\{\texttt{MPI_ANY_SOURCE}\}\cup\{\texttt{MPI_PROC_NULL}\}`$, where $`n`$ is the number of ==MPI== processes in this group.

Source = destination is allowed, that is, ~~a~~ ==an MPI== process can send a message to itself. However, it is unsafe to do so with the blocking send and receive operations described above, since this may lead to deadlock. See Section [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] .

The use of `dest``=``MPI_PROC_NULL` or `source``=``MPI_PROC_NULL` to define a “dummy” destination or source in any send or receive call is described in [[versions/v41/sections/pt2pt#Null ==MPI== Processes|Null ==MPI== Processes]] .

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Blocking receive]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Blocking Receive]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Blocking Receive]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Blocking Receive]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Blocking Receive]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Blocking Receive]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Blocking Receive]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Blocking Receive]]
