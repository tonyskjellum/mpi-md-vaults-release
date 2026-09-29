---
title: "Type Matching Rules"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Type Matching Rules

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Type matching rules|MPI-1.3]], [[versions/v21/sections/pt2pt#Type Matching Rules|MPI-2.1]], [[versions/v22/sections/pt2pt#Type Matching Rules|MPI-2.2]], [[versions/v30/sections/pt2pt#Type Matching Rules|MPI-3.0]], [[versions/v31/sections/pt2pt#Type Matching Rules|MPI-3.1]], [[versions/v40/sections/pt2pt#Type Matching Rules|MPI-4.0]], [[versions/v41/sections/pt2pt#Type Matching Rules|MPI-4.1]], [[versions/v50/sections/pt2pt#Type Matching Rules|MPI-5.0]]

Heading by release: MPI-1.3: “Type matching rules”; MPI-2.1: “Type Matching Rules”; MPI-2.2: “Type Matching Rules”; MPI-3.0: “Type Matching Rules”; MPI-3.1: “Type Matching Rules”; MPI-4.0: “Type Matching Rules”; MPI-4.1: “Type Matching Rules”; MPI-5.0: “Type Matching Rules”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

The types of a send and receive match (phase two) if both operations use identical names. That is, `MPI_INTEGER` matches `MPI_INTEGER`, `MPI_REAL` matches `MPI_REAL`, and so on. There is one exception to this rule, discussed in ~~Sec. [[versions/v21/sections/pt2pt#Pack~~ ==Section [[datatypes#Pack== and ~~unpack|Pack~~ ==Unpack|Pack== and ~~unpack]]~~ ==Unpack]]== , the type `MPI_PACKED` can match any other type.

The type of a variable in a host program matches the type specified in the communication operation if the datatype name used by that operation corresponds to the basic type of the host program variable. For example, an entry with type name `MPI_INTEGER` matches a Fortran variable of type `INTEGER`. A table giving this correspondence for Fortran and C appears in ~~Sec.~~ ==Section== [[versions/v21/sections/pt2pt#Message ~~data|Message data]]~~ ==Data|Message Data]]== . There are two exceptions to this last rule: an entry with type name `MPI_BYTE` or `MPI_PACKED` can be used to match any byte of storage (on a byte-addressable machine), irrespective of the datatype of the variable that contains this byte. The type `MPI_PACKED` is used to send data that has been explicitly packed, or receive data that will be explicitly unpacked, see Section ~~[[versions/v21/sections/pt2pt#Pack~~ ==[[datatypes#Pack== and ~~unpack|Pack~~ ==Unpack|Pack== and ~~unpack]]~~ ==Unpack]]== . The type `MPI_BYTE` allows one to transfer the binary value of a byte in memory unchanged.

CALL MPI_COMM_RANK(comm, rank, ierr) ~~IF(rank.EQ.0)~~ ==IF (rank.EQ.0)== THEN CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr) ELSE ==IF (rank.EQ.1) THEN== CALL MPI_RECV(b(1), 15, MPI_REAL, 0, tag, comm, status, ierr) END IF

CALL MPI_COMM_RANK(comm, rank, ierr) ~~IF(rank.EQ.0)~~ ==IF (rank.EQ.0)== THEN CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr) ELSE ==IF (rank.EQ.1) THEN== CALL MPI_RECV(b(1), 40, MPI_BYTE, 0, tag, comm, status, ierr) END IF

CALL MPI_COMM_RANK(comm, rank, ierr) ~~IF(rank.EQ.0)~~ ==IF (rank.EQ.0)== THEN CALL MPI_SEND(a(1), 40, MPI_BYTE, 1, tag, comm, ierr) ELSE ==IF (rank.EQ.1) THEN== CALL MPI_RECV(b(1), 60, MPI_BYTE, 0, tag, comm, status, ierr) END IF

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

> If a buffer of type ~~MPI_BYTE~~ ==`MPI_BYTE`== is passed as an argument to [[versions/v22/API/MPI_SEND|MPI_SEND]] , then MPI will send the data stored at contiguous locations, starting from the address indicated by the `buf` argument. This may have unexpected results when the data layout is not as a casual user would expect it to be. For example, some Fortran compilers implement variables of type ~~CHARACTER~~ ==`CHARACTER`== as a structure that contains the character length and a pointer to the actual string. In such an environment, sending and receiving a Fortran ~~CHARACTER~~ ==`CHARACTER`== variable using the ~~MPI_BYTE~~ ==`MPI_BYTE`== type will not have the anticipated result of transferring the character string. For this reason, the user is advised to use typed communications whenever possible.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

The types of a send and receive match (phase two) if both operations use identical names. That is, `MPI_INTEGER` matches `MPI_INTEGER`, `MPI_REAL` matches `MPI_REAL`, and so on. There is one exception to this rule, discussed in Section [[versions/v30/sections/datatypes#Pack and Unpack|Pack and Unpack]] ~~,~~ ==:== the type `MPI_PACKED` can match any other type.

This code is correct, irrespective of the type and size of <span class="sans-serif">a</span> and <span class="sans-serif">b</span> (unless this results in an out of ~~bound~~ ==bounds== memory access).

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

Sender and receiver specify matching types.

This code is correct if both ~~<span class="sans-serif">a</span>~~ ==`a`== and ~~<span class="sans-serif">b</span>~~ ==`b`== are real arrays of size $`\ge 10`$. (In Fortran, it might be correct to use this code even if ~~<span class="sans-serif">a</span>~~ ==`a`== or ~~<span class="sans-serif">b</span>~~ ==`b`== have size $`< 10`$: e.g., when ~~<span class="sans-serif">a(1)</span>~~ ==`a(1)`== can be equivalenced to an array with ten reals.)

Sender and receiver do not specify matching types.

Sender and receiver specify communication of untyped values.

This code is correct, irrespective of the type and size of ~~<span class="sans-serif">a</span>~~ ==`a`== and ~~<span class="sans-serif">b</span>~~ ==`b`== (unless this results in an out of bounds memory access).

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

~~Type matching~~ ==**Type matching**== has to be observed at each of these three phases: The type of each variable in the sender buffer has to match the type specified for that entry by the send operation; the type specified by the send operation has to match the type specified by the receive operation; and the type of each variable in the receive buffer has to match the type specified for that entry by the receive operation. A program that fails to observe these three rules is ~~erroneous.~~ ==*erroneous*.==

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(b(1), 15, MPI_REAL, 0, tag, comm, status, ierr) END IF

==! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------== CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(b(1), 40, MPI_BYTE, 0, tag, comm, status, ierr) END IF

This code is ~~erroneous,~~ ==*erroneous*,== since sender and receiver do not provide matching datatype arguments.

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(a(1), 40, MPI_BYTE, 1, tag, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(b(1), 60, MPI_BYTE, 0, tag, comm, status, ierr) END IF

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

~~    CALL MPI_COMM_RANK(comm, rank, ierr)     IF (rank .EQ. 0) THEN        CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr)     ELSE IF (rank .EQ. 1) THEN        CALL MPI_RECV(b(1), 15, MPI_REAL, 0, tag, comm, status, ierr)     END IF~~

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(b(1), 15, MPI_REAL, 0, tag, comm, status, ierr)
END IF
```

~~    ! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------     CALL MPI_COMM_RANK(comm, rank, ierr)     IF (rank .EQ. 0) THEN        CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr)     ELSE IF (rank .EQ. 1) THEN        CALL MPI_RECV(b(1), 40, MPI_BYTE, 0, tag, comm, status, ierr)     END IF~~

==(code block added)==
``` [MPI]Fortran
! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(b(1), 40, MPI_BYTE, 0, tag, comm, status, ierr)
END IF
```

~~    CALL MPI_COMM_RANK(comm, rank, ierr)     IF (rank .EQ. 0) THEN        CALL MPI_SEND(a(1), 40, MPI_BYTE, 1, tag, comm, ierr)     ELSE IF (rank .EQ. 1) THEN        CALL MPI_RECV(b(1), 60, MPI_BYTE, 0, tag, comm, status, ierr)     END IF~~

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_SEND(a(1), 40, MPI_BYTE, 1, tag, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(b(1), 60, MPI_BYTE, 0, tag, comm, status, ierr)
END IF
```

> If a buffer of type `MPI_BYTE` is passed as an argument to [[versions/v41/API/MPI_SEND|MPI_SEND]] , then MPI will send the data stored at contiguous locations, starting from the address indicated by the `buf` argument. This may have unexpected results when the data layout is not as a casual user would expect it to be. For example, some Fortran compilers implement variables of type `CHARACTER` as a structure that contains the character length and a pointer to the actual string. In such an environment, sending and receiving a Fortran `CHARACTER` variable using the `MPI_BYTE` type will not have the anticipated result of transferring the character string. For this reason, the user is advised to use typed ~~communications~~ ==communication operations== whenever possible.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Type matching rules]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Type Matching Rules]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Type Matching Rules]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Type Matching Rules]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Type Matching Rules]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Type Matching Rules]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Type Matching Rules]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Type Matching Rules]]
