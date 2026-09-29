---
title: "Model Implementation of Buffered Mode"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Model Implementation of Buffered Mode

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Model implementation of buffered mode|MPI-1.3]], [[versions/v21/sections/pt2pt#Model Implementation of Buffered Mode|MPI-2.1]], [[versions/v22/sections/pt2pt#Model Implementation of Buffered Mode|MPI-2.2]], [[versions/v30/sections/pt2pt#Model Implementation of Buffered Mode|MPI-3.0]], [[versions/v31/sections/pt2pt#Model Implementation of Buffered Mode|MPI-3.1]], [[versions/v40/sections/pt2pt#Model Implementation of Buffered Mode|MPI-4.0]], [[versions/v41/sections/pt2pt#Model Implementation of Buffered Mode|MPI-4.1]], [[versions/v50/sections/pt2pt#Model Implementation of Buffered Mode|MPI-5.0]]

Heading by release: MPI-1.3: “Model implementation of buffered mode”; MPI-2.1: “Model Implementation of Buffered Mode”; MPI-2.2: “Model Implementation of Buffered Mode”; MPI-3.0: “Model Implementation of Buffered Mode”; MPI-3.1: “Model Implementation of Buffered Mode”; MPI-4.0: “Model Implementation of Buffered Mode”; MPI-4.1: “Model Implementation of Buffered Mode”; MPI-5.0: “Model Implementation of Buffered Mode”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

The model implementation uses the packing and unpacking functions described in Section ~~[[versions/v21/sections/pt2pt#Pack~~ ==[[datatypes#Pack== and ~~unpack|Pack~~ ==Unpack|Pack== and ~~unpack]]~~ ==Unpack]]== and the nonblocking communication functions described in Section [[versions/v21/sections/pt2pt#Nonblocking ~~communication|Nonblocking communication]]~~ ==Communication|Nonblocking Communication]]== .

An upper bound on <span class="sans-serif">n</span> can be computed as follows: A call to the function [[versions/v21/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] , with the `count, datatype` and `comm` arguments used in the [[versions/v21/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section ~~[[versions/v21/sections/pt2pt#Pack~~ ==[[datatypes#Pack== and ~~unpack|Pack~~ ==Unpack|Pack== and ~~unpack]]~~ ==Unpack]]== ). The MPI constant MPI_BSEND_OVERHEAD provides an upper bound on the additional space consumed by the entry (e.g., for pointers or envelope information).

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

An upper bound on <span class="sans-serif">n</span> can be computed as follows: A call to the function [[versions/v22/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] , with the ~~`count, datatype`~~ ==`count`, `datatype`== and `comm` arguments used in the [[versions/v22/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[versions/v22/sections/datatypes#Pack and Unpack|Pack and Unpack]] ). The MPI constant ~~MPI_BSEND_OVERHEAD~~ ==`MPI_BSEND_OVERHEAD`== provides an upper bound on the additional space consumed by the entry (e.g., for pointers or envelope information).

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~- Compute the number, <span class="sans-serif">n</span>, of bytes needed to store an entry for the new message.~~

~~  An upper bound on <span class="sans-serif">n</span> can be computed as follows: A call to the function [[versions/v30/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] , with the `count`, `datatype` and `comm` arguments used in the [[versions/v30/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[versions/v30/sections/datatypes#Pack and Unpack|Pack and Unpack]] ). The MPI constant `MPI_BSEND_OVERHEAD` provides an upper bound on the additional space consumed by the entry (e.g., for pointers or envelope information).~~

==- Compute the number, <span class="sans-serif">n</span>, of bytes needed to store an entry for the new message. An upper bound on <span class="sans-serif">n</span> can be computed as follows: A call to the function [[versions/v30/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] , with the `count`, `datatype` and `comm` arguments used in the [[versions/v30/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[versions/v30/sections/datatypes#Pack and Unpack|Pack and Unpack]] ). The MPI constant `MPI_BSEND_OVERHEAD` provides an upper bound on the additional space consumed by the entry (e.g., for pointers or envelope information).==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

- Compute the number, ~~<span class="sans-serif">n</span>,~~ ==$`n`$,== of bytes needed to store an entry for the new message. An upper bound on ~~<span class="sans-serif">n</span>~~ ==$`n`$== can be computed as follows: A call to the function [[versions/v31/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] , with the `count`, `datatype` and `comm` arguments used in the [[versions/v31/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[versions/v31/sections/datatypes#Pack and Unpack|Pack and Unpack]] ). The MPI constant `MPI_BSEND_OVERHEAD` provides an upper bound on the additional space consumed by the entry (e.g., for pointers or envelope information).

- Find the next contiguous empty space of ~~<span class="sans-serif">n</span>~~ ==$`n`$== bytes in buffer (space following queue tail, or space at start of buffer if queue tail is too close to end of buffer). If space is not found then raise buffer overflow error.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

- Compute the number, $`n`$, of bytes needed to store an entry for the new message. An upper bound on $`n`$ can be computed as follows: A call to the function [[versions/v40/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] , with the `count`, `datatype` and `comm` arguments used in the [[versions/v40/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[versions/v40/sections/datatypes#Pack and Unpack|Pack and Unpack]] ). The MPI constant `MPI_BSEND_OVERHEAD` provides an upper bound on the additional space consumed by the entry (e.g., for pointers or ~~envelope~~ ==*envelope*== information).

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

The model implementation uses the packing and unpacking ~~functions~~ ==procedures== described in Section [[versions/v41/sections/datatypes#Pack and Unpack|Pack and Unpack]] and the nonblocking communication ~~functions~~ ==procedures== described in Section [[versions/v41/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] .

A buffered send call results in the execution of the following ~~code.~~ ==algorithm:==

- Traverse sequentially the PME queue from head towards the tail, deleting all entries for ~~communications~~ ==communication operations== that have completed, up to the first entry with an uncompleted request; update queue head to point to that entry.

- Compute the ~~number,~~ ==number of bytes,== $`n`$, ~~of bytes~~ needed to store an entry for the new message. An upper bound on $`n`$ can be computed as follows: A call to the function [[versions/v41/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] , with the `count`, `datatype` and `comm` arguments used in the [[versions/v41/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[versions/v41/sections/datatypes#Pack and Unpack|Pack and Unpack]] ). The MPI constant `MPI_BSEND_OVERHEAD` provides an upper bound on the additional space consumed by the entry (e.g., for pointers or *envelope* information).

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

- Compute the number of bytes, $`n`$, needed to store an entry for the new message. An upper bound on $`n`$ can be computed as follows: A call to the function [[versions/v50/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] ~~,~~ ==`(count, datatype, comm, size)`,== with the `count`, `datatype` and `comm` arguments used in the [[versions/v50/API/MPI_BSEND|MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[versions/v50/sections/datatypes#Pack and Unpack|Pack and Unpack]] ). The MPI constant `MPI_BSEND_OVERHEAD` provides an upper bound on the additional space consumed by the entry (e.g., for pointers or *envelope* information).

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Model implementation of buffered mode]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Model Implementation of Buffered Mode]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Model Implementation of Buffered Mode]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Model Implementation of Buffered Mode]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Model Implementation of Buffered Mode]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Model Implementation of Buffered Mode]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Model Implementation of Buffered Mode]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Model Implementation of Buffered Mode]]
