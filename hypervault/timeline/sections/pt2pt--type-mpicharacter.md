---
title: "Type `MPI_CHARACTER`"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Type `MPI_CHARACTER`

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Type MPI_CHARACTER|MPI-1.3]], [[versions/v21/sections/pt2pt#Type MPI_CHARACTER|MPI-2.1]], [[versions/v22/sections/pt2pt#Type `MPI_CHARACTER`|MPI-2.2]], [[versions/v30/sections/pt2pt#Type `MPI_CHARACTER`|MPI-3.0]], [[versions/v31/sections/pt2pt#Type `MPI_CHARACTER`|MPI-3.1]], [[versions/v40/sections/pt2pt#Type `MPI_CHARACTER`|MPI-4.0]], [[versions/v41/sections/pt2pt#Type `MPI_CHARACTER`|MPI-4.1]], [[versions/v50/sections/pt2pt#Type `MPI_CHARACTER`|MPI-5.0]]

Heading by release: MPI-1.3: “Type MPI_CHARACTER”; MPI-2.1: “Type MPI_CHARACTER”; MPI-2.2: “Type `MPI_CHARACTER`”; MPI-3.0: “Type `MPI_CHARACTER`”; MPI-3.1: “Type `MPI_CHARACTER`”; MPI-4.0: “Type `MPI_CHARACTER`”; MPI-4.1: “Type `MPI_CHARACTER`”; MPI-5.0: “Type `MPI_CHARACTER`”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

CALL MPI_COMM_RANK(comm, rank, ierr) ~~IF(rank.EQ.0)~~ ==IF (rank.EQ.0)== THEN CALL MPI_SEND(a, 5, MPI_CHARACTER, 1, tag, comm, ierr) ELSE ==IF (rank.EQ.1) THEN== CALL MPI_RECV(b(6:10), 5, MPI_CHARACTER, 0, tag, comm, status, ierr) END IF

> The alternative choice would be for `MPI_CHARACTER` to match a character of arbitrary length. This runs into problems. > > A Fortran character variable is a constant length string, with no special termination symbol. There is no fixed convention on how to represent characters, and how to store their length. Some compilers pass a character argument to a routine as a pair of arguments, one holding the address of the string and the other holding the length of string. Consider the case of an MPI communication call that is passed a communication buffer with type defined by a derived datatype (Section ~~[[versions/v21/sections/pt2pt#Derived datatypes|Derived datatypes]]~~ ==[[versions/v21/sections/datatypes#Derived Datatypes|Derived Datatypes]]== ). If this communicator buffer contains variables of type `CHARACTER` then the information on their length will not be passed to the MPI routine. > > This problem forces us to provide explicit information on character length with the MPI call. One could add a length parameter to the type `MPI_CHARACTER`, but this does not add much convenience and the same functionality can be achieved by defining a suitable derived datatype.

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

The type `MPI_CHARACTER` matches one character of a Fortran variable of type `CHARACTER`, rather then the entire character string stored in the variable. Fortran variables of type ~~CHARACTER~~ ==`CHARACTER`== or substrings are transferred as if they were arrays of characters. This is illustrated in the example below.

Transfer of Fortran ~~CHARACTERs.~~ ==`CHARACTER`s.==

The last five characters of string ~~b~~ ==`b`== at process 1 are replaced by the first five characters of string ~~a~~ ==`a`== at process 0.

> Some compilers pass Fortran ~~CHARACTER~~ ==`CHARACTER`== arguments as a structure with a length and a pointer to the actual string. In such an environment, the MPI call needs to dereference the pointer in order to reach the string.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

The type `MPI_CHARACTER` matches one character of a Fortran variable of type `CHARACTER`, rather ~~then~~ ==than== the entire character string stored in the variable. Fortran variables of type `CHARACTER` or substrings are transferred as if they were arrays of characters. This is illustrated in the example below.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Transfer of Fortran `CHARACTER`s.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(a, 5, MPI_CHARACTER, 1, tag, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_RECV(b(6:10), 5, MPI_CHARACTER, 0, tag, comm, status, ierr) END IF

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    CHARACTER*10 a     CHARACTER*10 b~~

~~    CALL MPI_COMM_RANK(comm, rank, ierr)     IF (rank .EQ. 0) THEN        CALL MPI_SEND(a, 5, MPI_CHARACTER, 1, tag, comm, ierr)     ELSE IF (rank .EQ. 1) THEN        CALL MPI_RECV(b(6:10), 5, MPI_CHARACTER, 0, tag, comm, status, ierr)     END IF~~

~~The last five characters of string `b` at process 1 are replaced by the first five characters of string `a` at process 0.~~

==(code block added)==
``` [MPI]Fortran
CHARACTER*10 a
CHARACTER*10 b

CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .EQ. 0) THEN
   CALL MPI_SEND(a, 5, MPI_CHARACTER, 1, tag, comm, ierr)
ELSE IF (rank .EQ. 1) THEN
   CALL MPI_RECV(b(6:10), 5, MPI_CHARACTER, 0, tag, comm, status, ierr)
END IF
```

==The last five characters of string `b` at the MPI process with `rank = 1` are replaced by the first five characters of string `a` at the MPI process with `rank = 0`.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Type MPI_CHARACTER]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Type MPI_CHARACTER]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Type `MPI_CHARACTER`]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Type `MPI_CHARACTER`]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Type `MPI_CHARACTER`]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Type `MPI_CHARACTER`]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Type `MPI_CHARACTER`]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Type `MPI_CHARACTER`]]
