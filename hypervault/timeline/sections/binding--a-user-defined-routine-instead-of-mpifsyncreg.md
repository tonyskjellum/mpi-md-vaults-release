---
title: "A User Defined Routine Instead of MPI_F_SYNC_REG"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# A User Defined Routine Instead of MPI_F_SYNC_REG

Chapter **binding** · in [[versions/v30/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG|MPI-3.0]], [[versions/v31/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG|MPI-3.1]], [[versions/v40/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG|MPI-4.0]], [[versions/v41/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG|MPI-4.1]], [[versions/v50/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG|MPI-5.0]]

Heading by release: MPI-3.0: “A User Defined Routine Instead of MPI_F_SYNC_REG”; MPI-3.1: “A User Defined Routine Instead of MPI_F_SYNC_REG”; MPI-4.0: “A User Defined Routine Instead of MPI_F_SYNC_REG”; MPI-4.1: “A User Defined Routine Instead of MPI_F_SYNC_REG”; MPI-5.0: “A User Defined Routine Instead of MPI_F_SYNC_REG”

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Such a user-defined routine was introduced in MPI-2.0 and is still included here to document such usage in existing application programs although new applications should prefer [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] or one of the other possibilities. In an existing application, calls to such a user-written routine should be substituted by a call to [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] because the user-written routine may not be implemented in accordance with the rules specified in ~~Section [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page~~ [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Note that if the ~~intent~~ ==`INTENT`== is declared in an explicit interface for the external subroutine, it must be `OUT` or `INOUT`. The subroutine itself may have an empty body, but the compiler does not know this and has to assume that the buffer may be altered. For example, a call to [[versions/v40/API/MPI_RECV|MPI_RECV]] with `MPI_BOTTOM` as buffer might be replaced by

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~            subroutine DD(buf)               integer buf             end~~

==(code block added)==
``` fortran
subroutine DD(buf)
  integer buf
end
```

~~            call DD(buf)             call MPI_RECV(MPI_BOTTOM,...)             call DD(buf)~~

==(code block added)==
``` [MPI]Fortran
call DD(buf)
call MPI_RECV(MPI_BOTTOM,...)
call DD(buf)
```

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#A User Defined Routine Instead of MPI_F_SYNC_REG]]
