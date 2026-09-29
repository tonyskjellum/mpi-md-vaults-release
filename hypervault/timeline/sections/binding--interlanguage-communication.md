---
title: "Interlanguage Communication"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Interlanguage Communication

Chapter **binding** · in [[versions/v21/sections/binding#Interlanguage Communication|MPI-2.1]], [[versions/v22/sections/binding#Interlanguage Communication|MPI-2.2]], [[versions/v30/sections/binding#Interlanguage Communication|MPI-3.0]], [[versions/v31/sections/binding#Interlanguage Communication|MPI-3.1]], [[versions/v40/sections/binding#Interlanguage Communication|MPI-4.0]], [[versions/v41/sections/binding#Interlanguage Communication|MPI-4.1]], [[versions/v50/sections/binding#Interlanguage Communication|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The type matching rules for communications in MPI are not changed: the datatype specification for each item sent should match, in type signature, the datatype specification used to receive this item (unless one of the types is ~~MPI_PACKED).~~ ==`MPI_PACKED`).== Also, the type of a message item should match the type declaration for the corresponding communication buffer location, unless the type is ~~MPI_BYTE~~ ==`MPI_BYTE`== or ~~MPI_PACKED.~~ ==`MPI_PACKED`.== Interlanguage communication is allowed if it complies with these rules.

MPI implementors may weaken these type matching rules, and allow messages to be sent with Fortran types and received with C types, and vice versa, when those types match. I.e., if the Fortran type `INTEGER` is identical to the C type `int`, then an MPI implementation may allow data to be sent with datatype ~~MPI_INTEGER~~ ==`MPI_INTEGER`== and be received with datatype ~~MPI_INT.~~ ==`MPI_INT`.== However, such code is not portable.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

The type matching rules for ~~communications~~ ==communication== in MPI are not changed: the datatype specification for each item sent should match, in type signature, the datatype specification used to receive this item (unless one of the types is `MPI_PACKED`). Also, the type of a message item should match the type declaration for the corresponding communication buffer location, unless the type is `MPI_BYTE` or `MPI_PACKED`. Interlanguage communication is allowed if it complies with these rules.

! FORTRAN CODE ==SUBROUTINE MYEXAMPLE() USE mpi_f08== REAL ==::== R(5) INTEGER ~~TYPE,~~ ==::== IERR, MYRANK, ~~AOBLEN(1),~~ ==AOBLEN(1) TYPE(MPI_Datatype) :: TYPE,== AOTYPE(1) INTEGER (KIND=MPI_ADDRESS_KIND) ==::== AODISP(1)

CALL MPI_COMM_RANK( MPI_COMM_WORLD, MYRANK, IERR) IF (MYRANK.EQ.0) THEN CALL MPI_SEND( MPI_BOTTOM, 1, TYPE, 1, 0, MPI_COMM_WORLD, IERR) ELSE CALL C_ROUTINE(TYPE) END IF ==END SUBROUTINE==

~~[^1]: Technically, the Fortran standards are worded to allow non-contiguous storage of any array data.~~

~~[^2]: To keep the definition of ‘simple’ simple, we have chosen to require all but one of the section subscripts to be without bounds. A colon without bounds makes it obvious both to the compiler and to the reader that the whole of the dimension is selected. It would have been possible to allow cases where the whole dimension is selected with one or two bounds, but this means for the reader that the array declaration or most recent allocation has to be consulted and for the compiler that a run-time check may be required.~~

==[^1]: Technically, the Fortran standard is worded to allow non-contiguous storage of any array data, unless the dummy argument has the `CONTIGUOUS` attribute.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

CALL MPI_COMM_RANK( MPI_COMM_WORLD, MYRANK, IERR) IF (MYRANK.EQ.0) THEN CALL MPI_SEND( MPI_BOTTOM, 1, TYPE, 1, 0, MPI_COMM_WORLD, IERR) ELSE CALL ~~C_ROUTINE(TYPE)~~ ==C_ROUTINE(TYPE%MPI_VAL)== END IF END SUBROUTINE

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

! FORTRAN CODE SUBROUTINE MYEXAMPLE() USE mpi_f08 REAL :: R(5) INTEGER :: IERR, MYRANK, AOBLEN(1) TYPE(MPI_Datatype) :: TYPE, AOTYPE(1) ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== :: AODISP(1)

! create an absolute datatype for array R AOBLEN(1) = 5 CALL ~~MPI_GET_ADDRESS( R,~~ ==MPI_GET_ADDRESS(R,== AODISP(1), IERR) AOTYPE(1) = MPI_REAL CALL MPI_TYPE_CREATE_STRUCT(1, ~~AOBLEN,AODISP,AOTYPE,~~ ==AOBLEN, AODISP, AOTYPE,== TYPE, IERR) CALL MPI_TYPE_COMMIT(TYPE, IERR)

CALL ~~MPI_COMM_RANK( MPI_COMM_WORLD,~~ ==MPI_COMM_RANK(MPI_COMM_WORLD,== MYRANK, IERR) IF (MYRANK.EQ.0) THEN CALL ~~MPI_SEND( MPI_BOTTOM,~~ ==MPI_SEND(MPI_BOTTOM,== 1, TYPE, 1, 0, MPI_COMM_WORLD, IERR) ELSE CALL C_ROUTINE(TYPE%MPI_VAL) END IF END SUBROUTINE

~~MPI_Recv( MPI_BOTTOM,~~ ==MPI_Recv(MPI_BOTTOM,== 1, type, 0, 0, MPI_COMM_WORLD, &status); }

[^1]: Technically, the Fortran standard is worded to allow ~~non-contiguous~~ ==noncontiguous== storage of any array data, unless the dummy argument has the `CONTIGUOUS` attribute.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    ! FORTRAN CODE     SUBROUTINE MYEXAMPLE()     USE mpi_f08     REAL :: R(5)     INTEGER :: IERR, MYRANK, AOBLEN(1)     TYPE(MPI_Datatype) :: TYPE, AOTYPE(1)     INTEGER(KIND=MPI_ADDRESS_KIND) :: AODISP(1)~~

~~    ! create an absolute datatype for array R     AOBLEN(1) = 5     CALL MPI_GET_ADDRESS(R, AODISP(1), IERR)     AOTYPE(1) = MPI_REAL     CALL MPI_TYPE_CREATE_STRUCT(1, AOBLEN, AODISP, AOTYPE, TYPE, IERR)     CALL MPI_TYPE_COMMIT(TYPE, IERR)~~

~~    CALL MPI_COMM_RANK(MPI_COMM_WORLD, MYRANK, IERR)     IF (MYRANK.EQ.0) THEN        CALL MPI_SEND(MPI_BOTTOM, 1, TYPE, 1, 0, MPI_COMM_WORLD, IERR)     ELSE        CALL C_ROUTINE(TYPE%MPI_VAL)     END IF     END SUBROUTINE~~

~~    /* C code */~~

~~    void C_ROUTINE(MPI_Fint *fhandle)     {        MPI_Datatype type;        MPI_Status status;~~

~~       type = MPI_Type_f2c(*fhandle);~~

~~       MPI_Recv(MPI_BOTTOM, 1, type, 0, 0, MPI_COMM_WORLD, &status);     }~~

==(code block added)==
``` [MPI08]Fortran
! FORTRAN CODE
SUBROUTINE MYEXAMPLE()
USE mpi_f08
REAL :: R(5)
INTEGER :: IERR, MYRANK, AOBLEN(1)
TYPE(MPI_Datatype) :: DTYPE, AOTYPE(1)
INTEGER(KIND=MPI_ADDRESS_KIND) :: AODISP(1)

! create an absolute datatype for array R
AOBLEN(1) = 5
CALL MPI_GET_ADDRESS(R, AODISP(1), IERR)
AOTYPE(1) = MPI_REAL
CALL MPI_TYPE_CREATE_STRUCT(1, AOBLEN, AODISP, AOTYPE, DTYPE, IERR)
CALL MPI_TYPE_COMMIT(DTYPE, IERR)

CALL MPI_COMM_RANK(MPI_COMM_WORLD, MYRANK, IERR)
IF (MYRANK .EQ. 0) THEN
   CALL MPI_SEND(MPI_BOTTOM, 1, DTYPE, 1, 0, MPI_COMM_WORLD, IERR)
ELSE
   CALL C_ROUTINE(DTYPE%MPI_VAL)
END IF
END SUBROUTINE
```

==(code block added)==
``` [MPI]C
/* C code */

void C_ROUTINE(MPI_Fint *fhandle)
{
   MPI_Datatype type;
   MPI_Status status;

   type = MPI_Type_f2c(*fhandle);

   MPI_Recv(MPI_BOTTOM, 1, type, 0, 0, MPI_COMM_WORLD, &status);
}
```

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Interlanguage Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Interlanguage Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Interlanguage Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Interlanguage Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Interlanguage Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Interlanguage Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Interlanguage Communication]]
