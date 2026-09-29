---
title: "Datatypes"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Datatypes

Chapter **binding** · in [[versions/v21/sections/binding#Datatypes|MPI-2.1]], [[versions/v22/sections/binding#Datatypes|MPI-2.2]], [[versions/v30/sections/binding#Datatypes|MPI-3.0]], [[versions/v31/sections/binding#Datatypes|MPI-3.1]], [[versions/v40/sections/binding#Datatypes|MPI-4.0]], [[versions/v41/sections/binding#Datatypes|MPI-4.1]], [[versions/v50/sections/binding#Datatypes|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The function [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] returns the same value in all languages. Note that we do not require that the constant ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== have the same value in all languages (see [[versions/v22/sections/binding#Constants|Constants]] , page [[versions/v22/sections/binding#Constants|Constants]] ).

> The following implementation can be used: MPI addresses, as returned by [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] , will have the same value in all languages. > > One obvious choice is that MPI addresses be identical to regular addresses. The address is stored in the datatype, when datatypes with absolute addresses are constructed. When a send or receive operation is performed, then addresses stored in a datatype are interpreted as displacements that are all augmented by a base address. This base address is (the address of) `buf`, or zero, if `buf = MPI_BOTTOM`. Thus, if ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== is zero then a send or receive call with `buf = MPI_BOTTOM` is implemented exactly as a call with a regular buffer argument: in both cases the base address is `buf`. On the other hand, if ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== is not zero, then the implementation has to be slightly different. A test is performed to check whether `buf = MPI_BOTTOM`. If true, then the base address is zero, otherwise it is `buf`. > > In particular, if ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== does not have the same value in Fortran and C/C++, then an additional test for `buf = MPI_BOTTOM` is needed in at least one of the languages. > > It may be desirable to use a value other than zero for ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== even in C/C++, so as to distinguish it from a NULL pointer. > > If ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== = c then one can still avoid the test > > `buf = MPI_BOTTOM`, by using the displacement from ~~MPI_BOTTOM,~~ ==`MPI_BOTTOM`,== i.e., the regular address - c, as the MPI address returned by [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and stored in absolute datatypes.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~Datatypes encode the same information in all languages. E.g., a datatype accessor like [[versions/v30/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] will return the same information in all languages.~~

~~If a datatype defined in one language is used for a communication call in another language, then the message sent will be identical to the message that would be sent from the first language: the same communication buffer is accessed, and the same representation conversion is performed, if needed.~~

~~All predefined~~

~~datatypes can be used in datatype constructors in any language. If a datatype is committed, it can be used for communication in any language.~~

==Datatypes encode the same information in all languages. E.g., a datatype accessor like [[versions/v30/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] will return the same information in all languages. If a datatype defined in one language is used for a communication call in another language, then the message sent will be identical to the message that would be sent from the first language: the same communication buffer is accessed, and the same representation conversion is performed, if needed. All predefined datatypes can be used in datatype constructors in any language. If a datatype is committed, it can be used for communication in any language.==

! FORTRAN CODE REAL ==::== R(5) INTEGER ==::== TYPE, IERR, AOBLEN(1), AOTYPE(1) INTEGER (KIND=MPI_ADDRESS_KIND) ==::== AODISP(1)

> The following implementation can be used: MPI addresses, as returned by [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] , will have the same value in all languages. ~~> >~~ One obvious choice is that MPI addresses be identical to regular addresses. The address is stored in the datatype, when datatypes with absolute addresses are constructed. When a send or receive operation is performed, then addresses stored in a datatype are interpreted as displacements that are all augmented by a base address. This base address is (the address of) `buf`, or zero, if `buf = MPI_BOTTOM`. Thus, if `MPI_BOTTOM` is zero then a send or receive call with `buf = MPI_BOTTOM` is implemented exactly as a call with a regular buffer argument: in both cases the base address is `buf`. On the other hand, if `MPI_BOTTOM` is not zero, then the implementation has to be slightly different. A test is performed to check whether `buf = MPI_BOTTOM`. If true, then the base address is zero, otherwise it is `buf`. ~~> >~~ In particular, if `MPI_BOTTOM` does not have the same value in Fortran and ~~C/C++,~~ ==C,== then an additional test for `buf = MPI_BOTTOM` is needed in at least one of the languages. > > It may be desirable to use a value other than zero for `MPI_BOTTOM` even in ~~C/C++,~~ ==C,== so as to distinguish it from a NULL pointer. > > If `MPI_BOTTOM` = c then one can still avoid the test > > `buf = MPI_BOTTOM`, by using the displacement from `MPI_BOTTOM`, i.e., the regular address - c, as the MPI address returned by [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and stored in absolute datatypes.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The function [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] returns the same value in all languages. Note that we do not require that the constant `MPI_BOTTOM` have the same value in all languages (see [[versions/v31/sections/binding#Constants|Constants]] ~~, page [[versions/v31/sections/binding#Constants|Constants]]~~ ).

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

! FORTRAN CODE REAL :: R(5) INTEGER :: TYPE, IERR, AOBLEN(1), AOTYPE(1) ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== :: AODISP(1)

! create an absolute datatype for array R AOBLEN(1) = 5 CALL ~~MPI_GET_ADDRESS( R,~~ ==MPI_GET_ADDRESS(R,== AODISP(1), IERR) AOTYPE(1) = MPI_REAL CALL MPI_TYPE_CREATE_STRUCT(1, ~~AOBLEN,AODISP,AOTYPE,~~ ==AOBLEN, AODISP, AOTYPE,== TYPE, IERR) CALL C_ROUTINE(TYPE)

> The following implementation can be used: MPI addresses, as returned by [[versions/v40/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] , will have the same value in all languages. One obvious choice is that MPI addresses be identical to regular addresses. The address is stored in the datatype, when datatypes with absolute addresses are constructed. When a send or receive operation is performed, then addresses stored in a datatype are interpreted as displacements that are all augmented by a base address. This base address is (the address of) `buf`, or zero, if ~~`buf = MPI_BOTTOM`.~~ ==`buf``=``MPI_BOTTOM`.== Thus, if `MPI_BOTTOM` is zero then a send or receive call with ~~`buf = MPI_BOTTOM`~~ ==`buf``=``MPI_BOTTOM`== is implemented exactly as a call with a regular buffer argument: in both cases the base address is `buf`. On the other hand, if `MPI_BOTTOM` is not zero, then the implementation has to be slightly different. A test is performed to check whether ~~`buf = MPI_BOTTOM`.~~ ==`buf``=``MPI_BOTTOM`.== If true, then the base address is zero, otherwise it is `buf`. In particular, if `MPI_BOTTOM` does not have the same value in Fortran and C, then an additional test for ~~`buf = MPI_BOTTOM`~~ ==`buf``=``MPI_BOTTOM`== is needed in at least one of the languages. > > It may be desirable to use a value other than zero for `MPI_BOTTOM` even in C, so as to distinguish it from a NULL pointer. ~~> >~~ If `MPI_BOTTOM` = c then one can still avoid the test ~~> > `buf = MPI_BOTTOM`,~~ ==`buf``=``MPI_BOTTOM`,== by using the displacement from `MPI_BOTTOM`, i.e., the regular address - c, as the MPI address returned by [[versions/v40/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and stored in absolute datatypes.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    ! FORTRAN CODE     REAL :: R(5)     INTEGER :: TYPE, IERR, AOBLEN(1), AOTYPE(1)     INTEGER(KIND=MPI_ADDRESS_KIND) :: AODISP(1)~~

~~    ! create an absolute datatype for array R     AOBLEN(1) = 5     CALL MPI_GET_ADDRESS(R, AODISP(1), IERR)     AOTYPE(1) = MPI_REAL     CALL MPI_TYPE_CREATE_STRUCT(1, AOBLEN, AODISP, AOTYPE, TYPE, IERR)     CALL C_ROUTINE(TYPE)~~

~~    /* C code */~~

~~    void C_ROUTINE(MPI_Fint *ftype)     {        int count = 5;        int lens[2] = {1,1};        MPI_Aint displs[2];        MPI_Datatype types[2], newtype;~~

~~       /* create an absolute datatype for buffer that consists   */        /*  of count, followed by R(5)                            */~~

~~       MPI_Get_address(&count, &displs[0]);        displs[1] = 0;        types[0] = MPI_INT;        types[1] = MPI_Type_f2c(*ftype);        MPI_Type_create_struct(2, lens, displs, types, &newtype);        MPI_Type_commit(&newtype);~~

~~       MPI_Send(MPI_BOTTOM, 1, newtype, 1, 0, MPI_COMM_WORLD);        /* the message sent contains an int count of 5, followed  */        /* by the 5 REAL entries of the Fortran array R.          */     }~~

==Absolute addresses and the conversion of datatype handles in a mixed Fortran/C program.==

==(code block added)==
``` [MPI]Fortran
! FORTRAN CODE
REAL :: R(5)
INTEGER :: DTYPE, IERR, AOBLEN(1), AOTYPE(1)
INTEGER(KIND=MPI_ADDRESS_KIND) :: AODISP(1)

! create an absolute datatype for array R
AOBLEN(1) = 5
CALL MPI_GET_ADDRESS(R, AODISP(1), IERR)
AOTYPE(1) = MPI_REAL
CALL MPI_TYPE_CREATE_STRUCT(1, AOBLEN, AODISP, AOTYPE, DTYPE, IERR)
CALL C_ROUTINE(DTYPE)
```

==(code block added)==
``` [MPI]C
/* C code */

void C_ROUTINE(MPI_Fint *ftype)
{
   int count = 5;
   int lens[2] = {1,1};
   MPI_Aint displs[2];
   MPI_Datatype types[2], newtype;

   /* create an absolute datatype for buffer that consists   */
   /*  of count, followed by R(5)                            */

   MPI_Get_address(&count, &displs[0]);
   displs[1] = 0;
   types[0] = MPI_INT;
   types[1] = MPI_Type_f2c(*ftype);
   MPI_Type_create_struct(2, lens, displs, types, &newtype);
   MPI_Type_commit(&newtype);

   MPI_Send(MPI_BOTTOM, 1, newtype, 1, 0, MPI_COMM_WORLD);
   /* the message sent contains an int count of 5, followed  */
   /* by the 5 REAL entries of the Fortran array R.          */
}
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

> The following implementation can be used: MPI addresses, as returned by [[versions/v50/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] , will have the same value in all languages. One obvious choice is that MPI addresses be identical to regular addresses. The address is stored in the datatype, when datatypes with absolute addresses are constructed. When a send or receive operation is performed, then addresses stored in a datatype are interpreted as displacements that are all augmented by a base address. This base address is (the address of) `buf`, or zero, if `buf``=``MPI_BOTTOM`. Thus, if `MPI_BOTTOM` is zero then a send or receive call with `buf``=``MPI_BOTTOM` is implemented exactly as a call with a regular buffer argument: in both cases the base address is `buf`. On the other hand, if `MPI_BOTTOM` is not zero, then the implementation has to be slightly different. A test is performed to check whether `buf``=``MPI_BOTTOM`. If true, then the base address is zero, otherwise it is `buf`. In particular, if `MPI_BOTTOM` does not have the same value in Fortran and C, then an additional test for `buf``=``MPI_BOTTOM` is needed in at least one of the languages. > > It may be desirable to use a value other than zero for `MPI_BOTTOM` even in C, so as to distinguish it from a NULL pointer. If `MPI_BOTTOM` = c then one can still avoid the test `buf``=``MPI_BOTTOM`, by using the displacement from `MPI_BOTTOM`, i.e., the regular address ~~-~~ ==$`-`$== c, as the MPI address returned by [[versions/v50/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and stored in absolute datatypes.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Datatypes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Datatypes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Datatypes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Datatypes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Datatypes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Datatypes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Datatypes]]
