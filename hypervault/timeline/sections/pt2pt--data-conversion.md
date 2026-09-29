---
title: "Data Conversion"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Data Conversion

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Data conversion|MPI-1.3]], [[versions/v21/sections/pt2pt#Data Conversion|MPI-2.1]], [[versions/v22/sections/pt2pt#Data Conversion|MPI-2.2]], [[versions/v30/sections/pt2pt#Data Conversion|MPI-3.0]], [[versions/v31/sections/pt2pt#Data Conversion|MPI-3.1]], [[versions/v40/sections/pt2pt#Data Conversion|MPI-4.0]], [[versions/v41/sections/pt2pt#Data Conversion|MPI-4.1]], [[versions/v50/sections/pt2pt#Data Conversion|MPI-5.0]]

Heading by release: MPI-1.3: “Data conversion”; MPI-2.1: “Data Conversion”; MPI-2.2: “Data Conversion”; MPI-3.0: “Data Conversion”; MPI-3.1: “Data Conversion”; MPI-4.0: “Data Conversion”; MPI-4.1: “Data Conversion”; MPI-5.0: “Data Conversion”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~MPI does not require support for inter-language communication. The behavior of a program is undefined if messages are sent by a C process and received by a Fortran process, or vice-versa.~~

~~> [!tip] Rationale~~

~~> MPI does not handle inter-language communication because there are no agreed standards for the correspondence between C types and Fortran types. Therefore, MPI programs that mix languages would not port.~~

~~> [!warning] Advice to implementors~~

~~> MPI implementors may want to support inter-language communication by allowing Fortran programs to use “C MPI types,” such as MPI_INT, MPI_CHAR, etc., and allowing C programs to use Fortran types.~~

==MPI requires support for inter-language communication, i.e., if messages are sent by a C or C++ process and received by a Fortran process, or vice-versa. The behavior is defined in Section [[versions/v21/sections/binding#Language Interoperability|Language Interoperability]] on page [[versions/v21/sections/binding#Language Interoperability|Language Interoperability]] .==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

The type matching rules imply that MPI communication never entails type conversion. On the other hand, MPI requires that a representation conversion be performed when a typed value is transferred across environments that use different representations for the datatype of this value. MPI does not specify rules for representation conversion. Such conversion is expected to preserve integer, logical ~~or~~ ==and== character values, and to convert a floating point value to the nearest value that can be represented on the target system.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

Consider the three examples, [[pt2pt-exA]] – [[pt2pt-exC]] . The first program is correct, assuming that ~~<span class="sans-serif">a</span>~~ ==`a`== and ~~<span class="sans-serif">b</span>~~ ==`b`== are `REAL` arrays of size $`\ge 10`$. If the sender and receiver execute in different environments, then the ten real values that are fetched from the send buffer will be converted to the representation for reals on the receiver site before they are stored in the receive buffer. While the number of real elements fetched from the send buffer equal the number of real elements stored in the receive buffer, the number of bytes stored need not equal the number of bytes loaded. For example, the sender may use a four byte representation and the receiver an eight byte representation for reals.

The third program is correct. The exact same sequence of forty bytes that were loaded from the send buffer will be stored in the receive buffer, even if sender and receiver run in a different environment. The message sent has exactly the same length (in bytes) and the same binary representation as the message received. If ~~<span class="sans-serif">a</span>~~ ==`a`== and ~~<span class="sans-serif">b</span>~~ ==`b`== are of different types, or if they are of the same type but different data representations are used, then the bits stored in the receive buffer may encode values that are different from the values they encoded in the send buffer.

MPI requires support for inter-language communication, i.e., if messages are sent by a C or C++ process and received by a Fortran process, or vice-versa. The behavior is defined in ~~Section [[versions/v31/sections/binding#Language Interoperability|Language Interoperability]] on page~~ [[versions/v31/sections/binding#Language Interoperability|Language Interoperability]] .

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

The second program is ~~erroneous,~~ ==*erroneous*,== and its behavior is undefined.

Data representation conversion also applies to the ~~envelope~~ ==*envelope*== of a message: source, destination and tag are all integers that may need to be converted.

MPI requires support for inter-language communication, ~~i.e.,~~ ==e.g.,== if messages are sent ~~by a~~ ==using an MPI procedure from the MPI== C ~~or C++ process~~ ==language interface== and received ~~by a~~ ==using an MPI procedure from one of the MPI== Fortran ~~process, or vice-versa.~~ ==language interfaces.== The behavior is defined in [[versions/v40/sections/binding#Language Interoperability|Language Interoperability]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

No conversion need occur when an MPI program executes in a homogeneous system, where all ==MPI== processes run in the same environment.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Data conversion]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Data Conversion]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Data Conversion]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Data Conversion]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Data Conversion]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Data Conversion]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Data Conversion]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Data Conversion]]
