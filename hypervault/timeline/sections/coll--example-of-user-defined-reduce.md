---
title: "Example of User-Defined Reduce"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Example of User-Defined Reduce

Chapter **coll** · in [[versions/v13/sections/coll#Example of User-defined Reduce|MPI-1.3]], [[versions/v21/sections/coll#Example of User-defined Reduce|MPI-2.1]], [[versions/v22/sections/coll#Example of User-defined Reduce|MPI-2.2]], [[versions/v30/sections/coll#Example of User-defined Reduce|MPI-3.0]], [[versions/v31/sections/coll#Example of User-defined Reduce|MPI-3.1]], [[versions/v40/sections/coll#Example of User-Defined Reduce|MPI-4.0]], [[versions/v41/sections/coll#Example of User-Defined Reduce|MPI-4.1]], [[versions/v50/sections/coll#Example of User-Defined Reduce|MPI-5.0]]

Heading by release: MPI-1.3: “Example of User-defined Reduce”; MPI-2.1: “Example of User-defined Reduce”; MPI-2.2: “Example of User-defined Reduce”; MPI-3.0: “Example of User-defined Reduce”; MPI-3.1: “Example of User-defined Reduce”; MPI-4.0: “Example of User-Defined Reduce”; MPI-4.1: “Example of User-Defined Reduce”; MPI-5.0: “Example of User-Defined Reduce”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

==The example in this section uses an intracommunicator.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

/* explain to MPI how type Complex is defined */ MPI_Type_contiguous( 2, MPI_DOUBLE, &ctype ); MPI_Type_commit( &ctype ); /* create the complex-product user-op */ MPI_Op_create( myProd, ~~True,~~ ==1,== &myOp );

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~It is time for an example of user-defined reduction.~~

~~The example in this section uses an intracommunicator.~~

==It is time for an example of user-defined reduction. The example in this section uses an intracommunicator.==

/* the user-defined function */ void ~~myProd( Complex *in, Complex *inout,~~ ==myProd(void *inP, void *inoutP,== int *len, MPI_Datatype ~~*dptr )~~ ==*dptr)== { int i; Complex c; ==Complex *in = (Complex *)inP, *inout = (Complex *)inoutP;==

/* explain to MPI how type Complex is defined */ ~~MPI_Type_contiguous( 2,~~ ==MPI_Type_contiguous(2,== MPI_DOUBLE, ~~&ctype ); MPI_Type_commit( &ctype );~~ ==&ctype); MPI_Type_commit(&ctype);== /* create the complex-product user-op */ MPI_Op_create( myProd, 1, &myOp );

~~MPI_Reduce( a,~~ ==MPI_Reduce(a,== answer, 100, ctype, myOp, root, ~~comm );~~ ==comm);==

== How to use the `mpi_f08` interface of the Fortran `MPI_User_function`.==

==      subroutine my_user_function( invec, inoutvec, len, type )   bind(c)         use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer         use mpi_f08         type(c_ptr), value :: invec, inoutvec         integer :: len         type(MPI_Datatype) :: type         real, pointer :: invec_r(:), inoutvec_r(:)         if (type%MPI_VAL == MPI_REAL%MPI_VAL) then            call c_f_pointer(invec, invec_r, (/ len /) )            call c_f_pointer(inoutvec, inoutvec_r, (/ len /) )            inoutvec_r = invec_r + inoutvec_r         end if       end subroutine==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

Compute the product of an array of complex numbers, in C.

How to use the `mpi_f08` interface of the Fortran `MPI_User_function`.

subroutine my_user_function( invec, inoutvec, len, type ) ~~bind(c)~~ use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer use mpi_f08 type(c_ptr), value :: invec, inoutvec integer :: len type(MPI_Datatype) :: type real, pointer :: invec_r(:), inoutvec_r(:) if (type%MPI_VAL == MPI_REAL%MPI_VAL) then call c_f_pointer(invec, invec_r, (/ len /) ) call c_f_pointer(inoutvec, inoutvec_r, (/ len /) ) inoutvec_r = invec_r + inoutvec_r end if end subroutine

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

It is time for an example of user-defined reduction. The example in this section uses an ~~intracommunicator.~~ ==intra-communicator.==

/* explain to MPI how type Complex is defined */ MPI_Type_contiguous(2, MPI_DOUBLE, &ctype); MPI_Type_commit(&ctype); /* create the complex-product user-op */ ~~MPI_Op_create( myProd,~~ ==MPI_Op_create(myProd,== 1, ~~&myOp );~~ ==&myOp);==

subroutine ~~my_user_function( invec,~~ ==my_user_function(invec,== inoutvec, len, ~~type )~~ ==type) bind(c)== use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer use mpi_f08 type(c_ptr), value :: invec, inoutvec integer :: len type(MPI_Datatype) :: type real, pointer :: invec_r(:), inoutvec_r(:) if (type%MPI_VAL == MPI_REAL%MPI_VAL) then call c_f_pointer(invec, invec_r, (/ len ~~/) )~~ ==/))== call c_f_pointer(inoutvec, inoutvec_r, (/ len ~~/) )~~ ==/))== inoutvec_r = invec_r + inoutvec_r end if end subroutine

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

~~It is time for an example of user-defined reduction.~~ The example in this section uses an intra-communicator.

~~    typedef struct {         double real,imag;     } Complex;~~

~~    /* the user-defined function      */     void myProd(void *inP, void *inoutP, int *len, MPI_Datatype *dptr)     {         int i;         Complex c;         Complex *in = (Complex *)inP, *inout = (Complex *)inoutP;~~

~~        for (i=0; i< *len; ++i) {             c.real = inout->real*in->real -                        inout->imag*in->imag;             c.imag = inout->real*in->imag +                        inout->imag*in->real;             *inout = c;             in++; inout++;         }     }~~

~~    /* and, to call it...      */     ...~~

~~        /* each process has an array of 100 Complexes          */         Complex a[100], answer[100];         MPI_Op myOp;         MPI_Datatype ctype;~~

~~        /* explain to MPI how type Complex is defined          */         MPI_Type_contiguous(2, MPI_DOUBLE, &ctype);         MPI_Type_commit(&ctype);         /* create the complex-product user-op          */         MPI_Op_create(myProd, 1, &myOp);~~

~~        MPI_Reduce(a, answer, 100, ctype, myOp, root, comm);~~

~~        /* At this point, the answer, which consists of 100 Complexes,          * resides on process root          */~~

==(code block added)==
``` [MPI]C
typedef struct {
    double real,imag;
} Complex;

/* the user-defined function
 */
void myProd(void *inP, void *inoutP, int *len, MPI_Datatype *dptr)
{
    int i;
    Complex c;
    Complex *in = (Complex *)inP, *inout = (Complex *)inoutP;

    for (i=0; i< *len; ++i) {
        c.real = inout->real*in->real -
                   inout->imag*in->imag;
        c.imag = inout->real*in->imag +
                   inout->imag*in->real;
        *inout = c;
        in++; inout++;
    }
}

/* and, to call it...
 */
...

    /* each MPI process has an array of 100 Complexes
     */
    Complex a[100], answer[100];
    MPI_Op myOp;
    MPI_Datatype ctype;

    /* explain to MPI how type Complex is defined
     */
    MPI_Type_contiguous(2, MPI_DOUBLE, &ctype);
    MPI_Type_commit(&ctype);
    /* create the complex-product user-op
     */
    MPI_Op_create(myProd, 1, &myOp);

    MPI_Reduce(a, answer, 100, ctype, myOp, root, comm);

    /* At this point, the answer, which consists of 100 Complexes,
     * resides on root MPI process
     */
```

~~    subroutine my_user_function(invec, inoutvec, len, type)   bind(c)        use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer        use mpi_f08        type(c_ptr), value :: invec, inoutvec        integer :: len        type(MPI_Datatype) :: type        real, pointer :: invec_r(:), inoutvec_r(:)        if (type%MPI_VAL == MPI_REAL%MPI_VAL) then           call c_f_pointer(invec, invec_r, (/ len /))           call c_f_pointer(inoutvec, inoutvec_r, (/ len /))           inoutvec_r = invec_r + inoutvec_r        end if     end subroutine~~

==(code block added)==
``` [MPI08]Fortran
subroutine my_user_function(invec, inoutvec, len, dtype)   bind(c)
   use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer
   use mpi_f08
   type(c_ptr), value :: invec, inoutvec
   integer :: len
   type(MPI_Datatype) :: dtype
   real, pointer :: invec_r(:), inoutvec_r(:)
   if (dtype == MPI_REAL) then
      call c_f_pointer(invec, invec_r, (/ len /))
      call c_f_pointer(inoutvec, inoutvec_r, (/ len /))
      inoutvec_r = invec_r + inoutvec_r
   end if
end subroutine
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Example of User-defined Reduce]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Example of User-defined Reduce]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Example of User-defined Reduce]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Example of User-defined Reduce]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Example of User-defined Reduce]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Example of User-Defined Reduce]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Example of User-Defined Reduce]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Example of User-Defined Reduce]]
