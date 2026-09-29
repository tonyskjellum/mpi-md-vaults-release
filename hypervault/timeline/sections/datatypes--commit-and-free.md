---
title: "Commit and Free"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Commit and Free

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Commit and Free|MPI-2.1]], [[versions/v22/sections/datatypes#Commit and Free|MPI-2.2]], [[versions/v30/sections/datatypes#Commit and Free|MPI-3.0]], [[versions/v31/sections/datatypes#Commit and Free|MPI-3.1]], [[versions/v40/sections/datatypes#Commit and Free|MPI-4.0]], [[versions/v41/sections/datatypes#Commit and Free|MPI-4.1]], [[versions/v50/sections/datatypes#Commit and Free|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

Marks the datatype object associated with `datatype` for deallocation and sets `datatype` to ~~MPI_DATATYPE_NULL.~~ ==`MPI_DATATYPE_NULL`.== Any communication that is currently using this datatype will complete

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~As an argument in datatype constructors, uncommitted and also committed datatypes can be used.~~

~~There is no need to commit basic datatypes. They are “pre-committed.”~~

==As an argument in datatype constructors, uncommitted and also committed datatypes can be used. There is no need to commit basic datatypes. They are “pre-committed.”==

~~> The system may “compile” at commit time an internal representation for the datatype that facilitates communication, e.g. change from a compacted representation to a flat representation of the datatype, and select the most convenient transfer mechanism.~~

~~[[versions/v30/API/MPI_TYPE_COMMIT|MPI_TYPE_COMMIT]]~~

~~will accept a committed datatype; in this case, it is equivalent to a no-op.~~

==> The system may “compile” at commit time an internal representation for the datatype that facilitates communication, e.g., change from a compacted representation to a flat representation of the datatype, and select the most convenient transfer mechanism.==

==[[versions/v30/API/MPI_TYPE_COMMIT|MPI_TYPE_COMMIT]] will accept a committed datatype; in this case, it is equivalent to a no-op.==

~~Marks the datatype object associated with `datatype` for deallocation and sets `datatype` to `MPI_DATATYPE_NULL`. Any communication that is currently using this datatype will complete~~

~~normally.~~

==Marks the datatype object associated with `datatype` for deallocation and sets `datatype` to `MPI_DATATYPE_NULL`. Any communication that is currently using this datatype will complete normally.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~A datatype object has to be **committed** before it can be used in a communication.~~

~~As an argument in datatype constructors, uncommitted and also committed datatypes can be used. There is no need to commit basic datatypes. They are “pre-committed.”~~

==A datatype object has to be **committed** before it can be used in a communication. As an argument in datatype constructors, uncommitted and also committed datatypes can be used. There is no need to commit basic datatypes. They are “pre-committed.”==

The following code fragment gives examples of using ~~`MPI_TYPE_COMMIT`.~~ ==[[versions/v31/API/MPI_TYPE_COMMIT|MPI_TYPE_COMMIT]] .==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> The implementation may keep a reference count of active communications that use the datatype, in order to decide when to free it. Also, one may implement constructors of derived datatypes so that they keep pointers to their datatype arguments, rather ~~then~~ ==than== copying them. In this case, one needs to keep track of active datatype definition references in order to know when a datatype object can be freed.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

> The system may “compile” at commit time an internal representation for the datatype that facilitates communication, e.g., change from a compacted representation to a flat representation of the datatype, and select the most convenient transfer mechanism. ==> > The optimizations chosen during [[versions/v41/API/MPI_TYPE_COMMIT|MPI_TYPE_COMMIT]] may no longer be optimal if a session (or the World Model) is initialized or finalized.==

~~    INTEGER type1, type2     CALL MPI_TYPE_CONTIGUOUS(5, MPI_REAL, type1, ierr)                   ! new type object created     CALL MPI_TYPE_COMMIT(type1, ierr)                   ! now type1 can be used for communication     type2 = type1                   ! type2 can be used for communication                   ! (it is a handle to same object as type1)     CALL MPI_TYPE_VECTOR(3, 5, 4, MPI_REAL, type1, ierr)                   ! new uncommitted type object created     CALL MPI_TYPE_COMMIT(type1, ierr)                   ! now type1 can be used anew for communication~~

==(code block added)==
``` [MPI]Fortran
INTEGER type1, type2
CALL MPI_TYPE_CONTIGUOUS(5, MPI_REAL, type1, ierr)
              ! new type object created
CALL MPI_TYPE_COMMIT(type1, ierr)
              ! now type1 can be used for communication
type2 = type1
              ! type2 can be used for communication
              ! (it is a handle to same object as type1)
CALL MPI_TYPE_VECTOR(3, 5, 4, MPI_REAL, type1, ierr)
              ! new uncommitted type object created
CALL MPI_TYPE_COMMIT(type1, ierr)
              ! now type1 can be used anew for communication
```

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Commit and Free]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Commit and Free]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Commit and Free]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Commit and Free]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Commit and Free]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Commit and Free]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Commit and Free]]
