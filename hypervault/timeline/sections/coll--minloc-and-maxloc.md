---
title: "MINLOC and MAXLOC"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# MINLOC and MAXLOC

Chapter **coll** · in [[versions/v13/sections/coll#MINLOC and MAXLOC|MPI-1.3]], [[versions/v21/sections/coll#MINLOC and MAXLOC|MPI-2.1]], [[versions/v22/sections/coll#MINLOC and MAXLOC|MPI-2.2]], [[versions/v30/sections/coll#MINLOC and MAXLOC|MPI-3.0]], [[versions/v31/sections/coll#MINLOC and MAXLOC|MPI-3.1]], [[versions/v40/sections/coll#MINLOC and MAXLOC|MPI-4.0]], [[versions/v41/sections/coll#MINLOC and MAXLOC|MPI-4.1]], [[versions/v50/sections/coll#MINLOC and MAXLOC|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (5 changed paragraphs)

The datatype MPI_2REAL is *as if* defined by the following (see Section ~~[[versions/v21/sections/pt2pt#Derived datatypes|Derived datatypes]]~~ ==[[versions/v21/sections/datatypes#Derived Datatypes|Derived Datatypes]]== ).

==The following examples use intracommunicators.==

~~MPI_Comm_rank(MPI_COMM_WORLD,~~ ==MPI_Comm_rank(comm,== &myrank); for (i=0; i<30; ++i) { in[i].val = ain[i]; in[i].rank = myrank; } MPI_Reduce( in, out, 30, MPI_DOUBLE_INT, MPI_MAXLOC, root, comm ); /* At this point, the answer resides on process root */ if (myrank == root) { /* read ranks out */ for (i=0; i<30; ++i) { aout[i] = out[i].val; ind[i] = out[i].rank; } }

DOUBLE PRECISION ain(30), aout(30) INTEGER ~~ind(30);~~ ==ind(30)== DOUBLE PRECISION in(2,30), out(2,30) INTEGER i, myrank, root, ~~ierr;~~ ==ierr==

~~MPI_COMM_RANK(MPI_COMM_WORLD, myrank);~~ ==CALL MPI_COMM_RANK(comm, myrank, ierr)== DO I=1, 30 in(1,i) = ain(i) in(2,i) = myrank ! myrank is coerced to a double END DO

==CALL== MPI_REDUCE( in, out, 30, MPI_2DOUBLE_PRECISION, MPI_MAXLOC, root, comm, ierr ~~);~~ ==)== ! At this point, the answer resides on process root

/* global minloc */ ~~MPI_Comm_rank(MPI_COMM_WORLD,~~ ==MPI_Comm_rank(comm,== &myrank); in.index = myrank*LEN + in.index; MPI_Reduce( in, out, 1, MPI_FLOAT_INT, MPI_MINLOC, root, comm ); /* At this point, the answer resides on process root */ if (myrank == root) { /* read answer out */ minval = out.value; minrank = out.index / LEN; minindex = out.index % LEN; }

### MPI-2.1 → MPI-2.2  (8 changed paragraphs)

The operator ~~MPI_MINLOC~~ ==`MPI_MINLOC`== is used to compute a global minimum and also an index attached to the minimum value. ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== similarly computes a global maximum and index. One application of these is to compute a global minimum (maximum) and the rank of the process containing this value.

The operation that defines ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== is:

~~MPI_MINLOC~~ ==`MPI_MINLOC`== is defined similarly:

Both operations are associative and commutative. Note that if ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== is applied to reduce a sequence of pairs $`(u_0, 0), (u_1, 1) , ..., (u_{n-1} , n-1)`$, then the value returned is $`(u , r)`$, where $`u = \max_i u_i`$ and $`r`$ is the index of the first global maximum in the sequence. Thus, if each process supplies a value and its rank within the group, then a reduce operation with `op` = ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== will return the maximum value and the rank of the first process with that value. Similarly, ~~MPI_MINLOC~~ ==`MPI_MINLOC`== can be used to return a minimum and its index. More generally, ~~MPI_MINLOC~~ ==`MPI_MINLOC`== computes a *lexicographic minimum*, where elements are ordered according to the first component of each pair, and ties are resolved according to the second component.

In order to use ~~MPI_MINLOC~~ ==`MPI_MINLOC`== and ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== in a reduce operation, one must provide a `datatype` argument that represents a pair (value and index). MPI provides

nine such predefined datatypes. The operations ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== and ~~MPI_MINLOC~~ ==`MPI_MINLOC`== can be used with each of the following datatypes.

The datatype ~~MPI_2REAL~~ ==`MPI_2REAL`== is *as if* defined by the following (see Section [[versions/v22/sections/datatypes#Derived Datatypes|Derived Datatypes]] ).

Similar statements apply for ~~MPI_2INTEGER, MPI_2DOUBLE_PRECISION,~~ ==`MPI_2INTEGER`, `MPI_2DOUBLE_PRECISION`,== and ~~MPI_2INT.~~ ==`MPI_2INT`.==

The datatype ~~MPI_FLOAT_INT~~ ==`MPI_FLOAT_INT`== is *as if* defined by the following sequence of instructions.

type[0] = MPI_FLOAT type[1] = MPI_INT disp[0] = 0 disp[1] = sizeof(float) block[0] = 1 block[1] = 1 ~~MPI_TYPE_STRUCT(2,~~ ==MPI_TYPE_CREATE_STRUCT(2,== block, disp, type, MPI_FLOAT_INT)

Similar statements apply for ~~MPI_LONG_INT~~ ==`MPI_LONG_INT`== and ~~MPI_DOUBLE_INT.~~ ==`MPI_DOUBLE_INT`.==

/* global minloc */ MPI_Comm_rank(comm, &myrank); in.index = myrank*LEN + in.index; MPI_Reduce( ~~in, out,~~ ==&in, &out,== 1, MPI_FLOAT_INT, MPI_MINLOC, root, comm ); /* At this point, the answer resides on process root */ if (myrank == root) { /* read answer out */ minval = out.value; minrank = out.index / LEN; minindex = out.index % LEN; }

> The definition of ~~MPI_MINLOC~~ ==`MPI_MINLOC`== and ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== given here has the advantage that it does not require any special-case handling of these two operations: they are handled like any other reduce operation. A programmer can provide his or her own definition of ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== and ~~MPI_MINLOC,~~ ==`MPI_MINLOC`,== if so desired. The disadvantage is that values and indices have to be first interleaved, and that indices and values have to be coerced to the same type, in Fortran.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~In order to use `MPI_MINLOC` and `MPI_MAXLOC` in a reduce operation, one must provide a `datatype` argument that represents a pair (value and index). MPI provides~~

~~nine such predefined datatypes. The operations `MPI_MAXLOC` and `MPI_MINLOC` can be used with each of the following datatypes.~~

==In order to use `MPI_MINLOC` and `MPI_MAXLOC` in a reduce operation, one must provide a `datatype` argument that represents a pair (value and index). MPI provides nine such predefined datatypes. The operations `MPI_MAXLOC` and `MPI_MINLOC` can be used with each of the following datatypes.==

MPI_Comm_rank(comm, &myrank); for (i=0; i<30; ++i) { in[i].val = ain[i]; in[i].rank = myrank; } ~~MPI_Reduce( in,~~ ==MPI_Reduce(in,== out, 30, MPI_DOUBLE_INT, MPI_MAXLOC, root, ~~comm );~~ ==comm);== /* At this point, the answer resides on process root */ if (myrank == root) { /* read ranks out */ for (i=0; i<30; ++i) { aout[i] = out[i].val; ind[i] = out[i].rank; } }

CALL ~~MPI_REDUCE( in,~~ ==MPI_REDUCE(in,== out, 30, MPI_2DOUBLE_PRECISION, MPI_MAXLOC, root, comm, ~~ierr )~~ ==ierr)== ! At this point, the answer resides on process root

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

Each process has an array of 30 `double`s, in C. For each of the 30 locations, compute the value and rank of the process containing the largest value.

Same example, in Fortran.

Each process has a non-empty array of values. Find the minimum global value, the rank of the process that holds it and its index on this process.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

~~MPI_TYPE_CONTIGUOUS(2,~~ ==MPI_Type_contiguous(2,== MPI_REAL, ~~MPI_2REAL)~~ ==MPI_2REAL);==

The datatype ~~`MPI_FLOAT_INT`~~ ==`MPI_SHORT_INT`== is *as if* defined by the following sequence of instructions.

==struct mystruct { short val; int rank; };== type[0] = ~~MPI_FLOAT~~ ==MPI_SHORT;== type[1] = ~~MPI_INT~~ ==MPI_INT;== disp[0] = ~~0~~ ==0;== disp[1] = ~~sizeof(float)~~ ==offsetof(struct mystruct, rank);== block[0] = ~~1~~ ==1;== block[1] = ~~1 MPI_TYPE_CREATE_STRUCT(2,~~ ==1; MPI_Type_create_struct(2,== block, disp, type, ~~MPI_FLOAT_INT)~~ ==MPI_SHORT_INT);==

Similar statements apply for ==`MPI_FLOAT_INT`,== `MPI_LONG_INT` and `MPI_DOUBLE_INT`.

The following examples use ~~intracommunicators.~~ ==intra-communicators.==

... ! each process has an array of 30 double: ain(30)

DOUBLE PRECISION ain(30), aout(30) INTEGER ind(30) DOUBLE PRECISION in(2,30), out(2,30) INTEGER i, myrank, root, ierr

CALL MPI_COMM_RANK(comm, myrank, ierr) DO ~~I=1, 30~~ ==i=1,30== in(1,i) = ain(i) in(2,i) = myrank ! myrank is coerced to a double END DO

CALL MPI_REDUCE(in, out, 30, MPI_2DOUBLE_PRECISION, MPI_MAXLOC, ~~root,~~ ==root,&== comm, ierr) ! At this point, the answer resides on process root

IF (myrank .EQ. root) THEN ! read ranks out DO ~~I= 1, 30~~ ==i=1,30== aout(i) = out(1,i) ind(i) = out(2,i) ! rank is coerced back to an integer END DO END IF

/* global minloc */ MPI_Comm_rank(comm, &myrank); in.index = myrank*LEN + in.index; ~~MPI_Reduce( &in,~~ ==MPI_Reduce(&in,== &out, 1, MPI_FLOAT_INT, MPI_MINLOC, root, ~~comm );~~ ==comm);== /* At this point, the answer resides on process root */ if (myrank == root) { /* read answer out */ minval = out.value; minrank = out.index / LEN; minindex = out.index % LEN; }

> The definition of `MPI_MINLOC` and `MPI_MAXLOC` given here has the advantage that it does not require any special-case handling of these two operations: they are handled like any other reduce operation. ~~A~~ ==By assigning a value other than `myrank` to the `in.index` field, a== programmer can provide ~~his or her own~~ ==a different== definition of `MPI_MAXLOC` and `MPI_MINLOC`, if so desired. The disadvantage is that values and indices have to be first interleaved, and that indices and values have to be coerced to the same type, in Fortran.

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

The operator `MPI_MINLOC` is used to compute a global minimum and also an index attached to the minimum value. `MPI_MAXLOC` similarly computes a global maximum and index. One application of these is to compute a global minimum (maximum) and the rank of the ==MPI== process containing this value.

Both operations are associative and commutative. Note that if `MPI_MAXLOC` is applied to reduce a sequence of pairs $`(u_0, 0), (u_1, 1) , ..., (u_{n-1} , n-1)`$, then the value returned is $`(u , r)`$, where $`u = \max_i u_i`$ and $`r`$ is the index of the first global maximum in the sequence. Thus, if each ==MPI== process supplies a value and its rank within the group, then a reduce operation with `op` = `MPI_MAXLOC` will return the maximum value and the rank of the first ==MPI== process with that value. Similarly, `MPI_MINLOC` can be used to return a minimum and its index. More generally, `MPI_MINLOC` computes a *lexicographic minimum*, where elements are ordered according to the first component of each pair, and ties are resolved according to the second component.

The reduce operation is defined to operate on arguments that consist of a pair: value and index. For both Fortran and C, types are provided to describe the pair. The potentially mixed-type nature of such arguments is a problem in ==older versions of== Fortran. The problem is ~~circumvented, for Fortran,~~ ==circumvented there== by having the MPI-provided type consist of a pair of the same type as value, and coercing the index to this type also. In C, the MPI-provided pair type has distinct types and the index is an ==integer type. For named predefined pair types in C the index is of type== `int`. ==For unnamed predefined pair types, other integer types are allowed as index instead. To use pair types with distinct value and index in Fortran, these types need to be defined using `BIND(C)` and be equivalent to the corresponding C struct.==

In order to use `MPI_MINLOC` and `MPI_MAXLOC` in a reduce operation, one must provide a `datatype` argument that represents a pair (value and index). MPI provides nine such ==named== predefined ~~datatypes.~~ ==datatypes as well as the function [[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI_TYPE_GET_VALUE_INDEX]] to query named and unnamed predefined types using value type and index type.== The operations `MPI_MAXLOC` and `MPI_MINLOC` can be used with each of the following ==named== datatypes.

~~    struct mystruct {         short val;         int rank;     };     type[0] = MPI_SHORT;     type[1] = MPI_INT;     disp[0] = 0;     disp[1] = offsetof(struct mystruct, rank);     block[0] = 1;     block[1] = 1;     MPI_Type_create_struct(2, block, disp, type, MPI_SHORT_INT);~~

==(code block added)==
``` [MPI]C
struct mystruct {
    short val;
    int rank;
};
type[0] = MPI_SHORT;
type[1] = MPI_INT;
disp[0] = 0;
disp[1] = offsetof(struct mystruct, rank);
block[0] = 1;
block[1] = 1;
MPI_Type_create_struct(2, block, disp, type, &MPI_SHORT_INT);
MPI_Type_commit(&MPI_SHORT_INT);
```

==![[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX]]==

==[[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI_TYPE_GET_VALUE_INDEX]] returns a handle to a predefined datatype suitable for the use with `MPI_MINLOC` and `MPI_MAXLOC` if such a predefined type exists. If the provided combination of `value_type` and `index_type` does not match a predefined pair datatype (named or unnamed), the function will set `pair_type` to `MPI_DATATYPE_NULL` and return `MPI_SUCCESS`. The returned type is not a duplicate. This type cannot be freed. Types supported by the underlying compiler for which the operators `MPI_MIN` and `MPI_MAX` are defined in Section [[coll-predefined-op]] are acceptable value types. Integer types supported by the underlying compiler are acceptable index types.==

==> [!note] Advice to users==

==> Note that a named type handle returned by [[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI_TYPE_GET_VALUE_INDEX]] will yield the combiner value `MPI_COMBINER_NAMED` when queried with [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] to ensure backward compatibility to existing behavior, whereas all unnamed type handles returned by [[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI_TYPE_GET_VALUE_INDEX]] will yield the combiner value `MPI_COMBINER_VALUE_INDEX` when queried with [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] . There is no observable difference between the named constant value used via its symbol name or via [[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI_TYPE_GET_VALUE_INDEX]] . Code evaluating the combiner of type handles returned from [[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI_TYPE_GET_VALUE_INDEX]] must therefore handle both `MPI_COMBINER_NAMED` and `MPI_COMBINER_VALUE_INDEX`.==

==An unnamed predefined value-index type is retrieved for use with the corresponding C struct. If the requested value-index pair does not exist as a predefined type `MPI_DATATYPE_NULL` is returned.==

==(code block added)==
``` [MPI]C
struct mystruct {
        double val;
        uint64_t index;
    };

    MPI_Datatype dtype;
    MPI_Type_get_value_index(MPI_DOUBLE, MPI_UINT64_T, &dtype);

    if (dtype == MPI_DATATYPE_NULL) {
        // Handling for unsupported value-index type
    }
```

==> [!note] Advice to users==

==> Implementations may apply certain optimizations to operations on compound types with equally sized value and index types. Such optimizations may not be applicable to operations on compound types where value and index type are of different size.==

~~Each process has an array of 30 `double`s, in C. For each of the 30 locations, compute the value and rank of the process containing the largest value.~~

~~        ...         /* each process has an array of 30 double: ain[30]          */         double ain[30], aout[30];         int  ind[30];         struct {             double val;             int   rank;         } in[30], out[30];         int i, myrank, root;~~

~~        MPI_Comm_rank(comm, &myrank);         for (i=0; i<30; ++i) {             in[i].val = ain[i];             in[i].rank = myrank;         }         MPI_Reduce(in, out, 30, MPI_DOUBLE_INT, MPI_MAXLOC, root, comm);         /* At this point, the answer resides on process root          */         if (myrank == root) {             /* read ranks out              */             for (i=0; i<30; ++i) {                 aout[i] = out[i].val;                 ind[i] = out[i].rank;             }         }~~

==Each MPI process has an array of 30 `double`s, in C. For each of the 30 locations, compute the value and rank of the MPI process containing the largest value.==

==(code block added)==
``` [MPI]C
...
/* each MPI process has an array of 30 double: ain[30]
 */
double ain[30], aout[30];
int  ind[30];
struct {
    double val;
    int   rank;
} in[30], out[30];
int i, myrank, root;

MPI_Comm_rank(comm, &myrank);
for (i=0; i<30; ++i) {
    in[i].val = ain[i];
    in[i].rank = myrank;
}
MPI_Reduce(in, out, 30, MPI_DOUBLE_INT, MPI_MAXLOC, root, comm);
/* At this point, the answer resides on root MPI process
 */
if (myrank == root) {
    /* read ranks out
     */
    for (i=0; i<30; ++i) {
        aout[i] = out[i].val;
        ind[i] = out[i].rank;
    }
}
```

~~    ...     ! each process has an array of 30 double: ain(30)~~

~~    DOUBLE PRECISION ain(30), aout(30)     INTEGER ind(30)     DOUBLE PRECISION in(2,30), out(2,30)     INTEGER i, myrank, root, ierr~~

~~    CALL MPI_COMM_RANK(comm, myrank, ierr)     DO i=1,30        in(1,i) = ain(i)        in(2,i) = myrank    ! myrank is coerced to a double     END DO~~

~~    CALL MPI_REDUCE(in, out, 30, MPI_2DOUBLE_PRECISION, MPI_MAXLOC, root,&                     comm, ierr)     ! At this point, the answer resides on process root~~

~~    IF (myrank .EQ. root) THEN        ! read ranks out        DO i=1,30           aout(i) = out(1,i)           ind(i) = out(2,i)  ! rank is coerced back to an integer        END DO     END IF~~

~~Each process has a non-empty array of values. Find the minimum global value, the rank of the process that holds it and its index on this process.~~

~~    #define  LEN   1000~~

~~    float val[LEN];        /* local array of values */     int count;             /* local number of values */     int myrank, minrank, minindex;     float minval;~~

~~    struct {         float value;         int   index;     } in, out;~~

~~        /* local minloc */     in.value = val[0];     in.index = 0;     for (i=1; i < count; i++)         if (in.value > val[i]) {             in.value = val[i];             in.index = i;         }~~

~~        /* global minloc */     MPI_Comm_rank(comm, &myrank);     in.index = myrank*LEN + in.index;     MPI_Reduce(&in, &out, 1, MPI_FLOAT_INT, MPI_MINLOC, root, comm);         /* At this point, the answer resides on process root          */     if (myrank == root) {         /* read answer out          */         minval = out.value;         minrank = out.index / LEN;         minindex = out.index % LEN;     }~~

==(code block added)==
``` [MPInoinout]Fortran
...
! each process has an array of 30 double: ain(30)

DOUBLE PRECISION ain(30), aout(30)
INTEGER ind(30)
DOUBLE PRECISION in(2,30), out(2,30)
INTEGER i, myrank, root, ierr

CALL MPI_COMM_RANK(comm, myrank, ierr)
DO i=1,30
   in(1,i) = ain(i)
   in(2,i) = myrank    ! myrank is coerced to a double
END DO

CALL MPI_REDUCE(in, out, 30, MPI_2DOUBLE_PRECISION, MPI_MAXLOC, root,&
                comm, ierr)
! At this point, the answer resides on root MPI process

IF (myrank .EQ. root) THEN
   ! read ranks out
   DO i=1,30
      aout(i) = out(1,i)
      ind(i) = out(2,i)  ! rank is coerced back to an integer
   END DO
END IF
```

==Each MPI process has a nonempty array of values. Find the minimum global value, the rank of the MPI process that holds it and its index on this MPI process.==

==(code block added)==
``` [MPI]C
#define  LEN   1000

float val[LEN];        /* local array of values */
int count;             /* local number of values */
int myrank, minrank, minindex;
float minval;

struct {
    float value;
    int   index;
} in, out;

/* local minloc */
in.value = val[0];
in.index = 0;
for (i=1; i < count; i++) {
    if (in.value > val[i]) {
        in.value = val[i];
        in.index = i;
    }
}
/* global minloc */
MPI_Comm_rank(comm, &myrank);
in.index = myrank*LEN + in.index;
MPI_Reduce(&in, &out, 1, MPI_FLOAT_INT, MPI_MINLOC, root, comm);

/* At this point, the answer resides on the root */
if (myrank == root) {
    /* read answer out */
    minval = out.value;
    minrank = out.index / LEN;
    minindex = out.index % LEN;
}
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~    MPI_Type_contiguous(2, MPI_REAL, MPI_2REAL);~~

==(code block added)==
``` [MPI]Fortran
call MPI_Type_contiguous(2, MPI_REAL, MPI_2REAL, ierror)
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#MINLOC and MAXLOC]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#MINLOC and MAXLOC]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#MINLOC and MAXLOC]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#MINLOC and MAXLOC]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#MINLOC and MAXLOC]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#MINLOC and MAXLOC]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#MINLOC and MAXLOC]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#MINLOC and MAXLOC]]
