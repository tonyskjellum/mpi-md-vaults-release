---
title: "Decoding a Datatype"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Decoding a Datatype

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Decoding a Datatype|MPI-2.1]], [[versions/v22/sections/datatypes#Decoding a Datatype|MPI-2.2]], [[versions/v30/sections/datatypes#Decoding a Datatype|MPI-3.0]], [[versions/v31/sections/datatypes#Decoding a Datatype|MPI-3.1]], [[versions/v40/sections/datatypes#Decoding a Datatype|MPI-4.0]], [[versions/v41/sections/datatypes#Decoding a Datatype|MPI-4.1]], [[versions/v50/sections/datatypes#Decoding a Datatype|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (17 changed paragraphs)

If `combiner` is ~~MPI_COMBINER_NAMED~~ ==`MPI_COMBINER_NAMED`== then `datatype` is a named predefined datatype.

calls with address arguments, we sometimes need to differentiate whether the call used an integer or an address size argument. For example, there are two combiners for hvector: ~~MPI_COMBINER_HVECTOR_INTEGER~~ ==`MPI_COMBINER_HVECTOR_INTEGER`== and ~~MPI_COMBINER_HVECTOR.~~ ==`MPI_COMBINER_HVECTOR`.== The former is used if it was the MPI-1 call from Fortran, and the latter is used if it was the MPI-1 call from C or C++. However, on systems where ~~MPI_ADDRESS_KIND~~ ==`MPI_ADDRESS_KIND`== = ~~MPI_INTEGER_KIND~~ ==`MPI_INTEGER_KIND`== (i.e., where integer arguments and address size arguments are the same), the combiner ~~MPI_COMBINER_HVECTOR~~ ==`MPI_COMBINER_HVECTOR`== may be returned for a datatype constructed by a call to [[versions/v22/API/MPI_TYPE_HVECTOR|MPI_TYPE_HVECTOR]] from Fortran. Similarly, ~~MPI_COMBINER_HINDEXED~~ ==`MPI_COMBINER_HINDEXED`== may be returned for a datatype constructed by a call to [[versions/v22/API/MPI_TYPE_HINDEXED|MPI_TYPE_HINDEXED]] from Fortran, and ~~MPI_COMBINER_STRUCT~~ ==`MPI_COMBINER_STRUCT`== may be returned for a datatype constructed by a call to [[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] from Fortran. On such systems, one need not differentiate constructors that take address size arguments from constructors that take integer arguments, since these are the same. The

PARAMETER (LARGE = 1000) INTEGER TYPE, NI, NA, ND, COMBINER, I(LARGE), D(LARGE), IERROR INTEGER(KIND=MPI_ADDRESS_KIND) A(LARGE) ! CONSTRUCT DATATYPE TYPE (NOT SHOWN) CALL MPI_TYPE_GET_ENVELOPE(TYPE, NI, NA, ND, COMBINER, IERROR) IF ((NI .GT. LARGE) .OR. (NA .GT. LARGE) .OR. (ND .GT. LARGE)) THEN WRITE (*, *) "NI, NA, OR ND = ", NI, NA, ND, & " RETURNED BY MPI_TYPE_GET_ENVELOPE IS LARGER THAN LARGE = ", LARGE CALL MPI_ABORT(MPI_COMM_WORLD, ~~99)~~ ==99, IERROR)== ENDIF CALL MPI_TYPE_GET_CONTENTS(TYPE, NI, NA, ND, I, A, D, IERROR)

If combiner is ~~MPI_COMBINER_NAMED~~ ==`MPI_COMBINER_NAMED`== then it is erroneous to call [[versions/v22/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] .

If combiner is ~~MPI_COMBINER_DUP~~ ==`MPI_COMBINER_DUP`== then

If combiner is ~~MPI_COMBINER_CONTIGUOUS~~ ==`MPI_COMBINER_CONTIGUOUS`== then

If combiner is ~~MPI_COMBINER_VECTOR~~ ==`MPI_COMBINER_VECTOR`== then

If combiner is ~~MPI_COMBINER_HVECTOR_INTEGER~~ ==`MPI_COMBINER_HVECTOR_INTEGER`== or ~~MPI_COMBINER_HVECTOR~~ ==`MPI_COMBINER_HVECTOR`== then

If combiner is ~~MPI_COMBINER_INDEXED~~ ==`MPI_COMBINER_INDEXED`== then

If combiner is ~~MPI_COMBINER_HINDEXED_INTEGER~~ ==`MPI_COMBINER_HINDEXED_INTEGER`== or ~~MPI_COMBINER_HINDEXED~~ ==`MPI_COMBINER_HINDEXED`== then

If combiner is ~~MPI_COMBINER_INDEXED_BLOCK~~ ==`MPI_COMBINER_INDEXED_BLOCK`== then

If combiner is ~~MPI_COMBINER_STRUCT_INTEGER~~ ==`MPI_COMBINER_STRUCT_INTEGER`== or ~~MPI_COMBINER_STRUCT~~ ==`MPI_COMBINER_STRUCT`== then

If combiner is ~~MPI_COMBINER_SUBARRAY~~ ==`MPI_COMBINER_SUBARRAY`== then

If combiner is ~~MPI_COMBINER_DARRAY~~ ==`MPI_COMBINER_DARRAY`== then

If combiner is ~~MPI_COMBINER_F90_REAL~~ ==`MPI_COMBINER_F90_REAL`== then

If combiner is ~~MPI_COMBINER_F90_COMPLEX~~ ==`MPI_COMBINER_F90_COMPLEX`== then

If combiner is ~~MPI_COMBINER_F90_INTEGER~~ ==`MPI_COMBINER_F90_INTEGER`== then

If combiner is ~~MPI_COMBINER_RESIZED~~ ==`MPI_COMBINER_RESIZED`== then

### MPI-2.2 → MPI-3.0  (24 changed paragraphs)

~~MPI~~

~~datatype objects~~

~~allow users to specify an arbitrary layout of data in memory.~~

==MPI datatype objects allow users to specify an arbitrary layout of data in memory.==

~~where accessing the layout information in opaque datatype objects would be useful.~~

~~The opaque datatype object has found a number of uses outside MPI. Furthermore, a number of tools wish to display internal information about a datatype. To achieve this, datatype decoding functions are provided.~~

==where accessing the layout information in opaque datatype objects would be useful. The opaque datatype object has found a number of uses outside MPI. Furthermore, a number of tools wish to display internal information about a datatype. To achieve this, datatype decoding functions are provided.==

~~For the given `datatype`, [[versions/v30/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns information on the number and type of input arguments used in the call that created the `datatype`. The number-of-arguments values returned can be used to provide sufficiently large arrays in the decoding routine [[versions/v30/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] . This call and the meaning of the~~

~~returned values is described below. The `combiner` reflects~~

~~the MPI datatype constructor call that was used in creating `datatype`.~~

==For the given `datatype`, [[versions/v30/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns information on the number and type of input arguments used in the call that created the `datatype`. The number-of-arguments values returned can be used to provide sufficiently large arrays in the decoding routine [[versions/v30/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] . This call and the meaning of the returned values is described below. The `combiner` reflects the MPI datatype constructor call that was used in creating `datatype`.==

~~> By requiring that the `combiner` reflect the constructor used in the creation of the `datatype`, the decoded information can be used to effectively recreate the calling sequence used in the original creation. One call is effectively the same as another when the information obtained from [[versions/v30/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] may be used with either to produce the same outcome. C calls `MPI_Type_hindexed` and `MPI_Type_create_hindexed` are always effectively the same while the Fortran call `MPI_TYPE_HINDEXED` will be different than either of these in some MPI implementations. > > This is the most useful information and > > was felt to be reasonable even though it constrains implementations to remember the original constructor sequence even if the internal representation is different. > > The decoded information keeps track of datatype duplications. This is important as one needs to distinguish between a predefined datatype and a dup of a predefined datatype. The former is a constant object that cannot be freed, while the latter is a derived datatype that can be freed.~~

~~The list below has the values that can be returned in `combiner` on the left and the call associated with them on the right.~~

~~a named predefined datatype~~

~~[[versions/v30/API/MPI_TYPE_DUP|MPI_TYPE_DUP]]~~

~~[[versions/v30/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]]~~

~~[[versions/v30/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]]~~

~~[[versions/v22/API/MPI_TYPE_HVECTOR|MPI_TYPE_HVECTOR]] from Fortran~~

~~[[versions/v22/API/MPI_TYPE_HVECTOR|MPI_TYPE_HVECTOR]] from C or C++~~

~~and in some case Fortran~~

~~or [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]]~~

~~[[versions/v30/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]]~~

~~[[versions/v22/API/MPI_TYPE_HINDEXED|MPI_TYPE_HINDEXED]] from Fortran~~

~~[[versions/v22/API/MPI_TYPE_HINDEXED|MPI_TYPE_HINDEXED]] from C or C++~~

~~and in some case Fortran~~

~~or [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]]~~

~~[[versions/v30/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]]~~

~~[[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] from Fortran~~

~~[[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] from C or C++~~

~~and in some case Fortran~~

~~or [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]]~~

~~[[versions/v30/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]]~~

~~[[versions/v30/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]]~~

~~[[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]]~~

~~[[versions/v30/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]]~~

~~[[versions/v30/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]]~~

~~[[versions/v30/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]]~~

==> By requiring that the `combiner` reflect the constructor used in the creation of the `datatype`, the decoded information can be used to effectively recreate the calling sequence used in the original creation. > > This is the most useful information and was felt to be reasonable even though it constrains implementations to remember the original constructor sequence even if the internal representation is different. > > The decoded information keeps track of datatype duplications. This is important as one needs to distinguish between a predefined datatype and a dup of a predefined datatype. The former is a constant object that cannot be freed, while the latter is a derived datatype that can be freed.==

==The list in Table [[versions/v30/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] has the values that can be returned in `combiner` on the left and the call associated with them on the right.==

==|                               |                                          | |:------------------------------|:-----------------------------------------| | `MPI_COMBINER_NAMED`          | a named predefined datatype              | | `MPI_COMBINER_DUP`            |  [[versions/v30/API/MPI_TYPE_DUP|MPI_TYPE_DUP]]                    | | `MPI_COMBINER_CONTIGUOUS`     |  [[versions/v30/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]]             | | `MPI_COMBINER_VECTOR`         |  [[versions/v30/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]]                 | | `MPI_COMBINER_HVECTOR`        |  [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]]         | | `MPI_COMBINER_INDEXED`        |  [[versions/v30/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]]                | | `MPI_COMBINER_HINDEXED`       |  [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]]        | | `MPI_COMBINER_INDEXED_BLOCK`  |  [[versions/v30/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]]   | | `MPI_COMBINER_HINDEXED_BLOCK` |  [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]]  | | `MPI_COMBINER_STRUCT`         |  [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]]          | | `MPI_COMBINER_SUBARRAY`       |  [[versions/v30/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]]        | | `MPI_COMBINER_DARRAY`         |  [[versions/v30/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]]          | | `MPI_COMBINER_F90_REAL`       |  [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]]        | | `MPI_COMBINER_F90_COMPLEX`    |  [[versions/v30/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]]     | | `MPI_COMBINER_F90_INTEGER`    |  [[versions/v30/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]]     | | `MPI_COMBINER_RESIZED`        |  [[versions/v30/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]]         |==

==`combiner` values returned from [[versions/v30/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]]==

~~For~~

~~deprecated~~

~~calls with address arguments, we sometimes need to differentiate whether the call used an integer or an address size argument. For example, there are two combiners for hvector: `MPI_COMBINER_HVECTOR_INTEGER` and `MPI_COMBINER_HVECTOR`. The former is used if it was the MPI-1 call from Fortran, and the latter is used if it was the MPI-1 call from C or C++. However, on systems where `MPI_ADDRESS_KIND` = `MPI_INTEGER_KIND` (i.e., where integer arguments and address size arguments are the same), the combiner `MPI_COMBINER_HVECTOR` may be returned for a datatype constructed by a call to [[versions/v22/API/MPI_TYPE_HVECTOR|MPI_TYPE_HVECTOR]] from Fortran. Similarly, `MPI_COMBINER_HINDEXED` may be returned for a datatype constructed by a call to [[versions/v22/API/MPI_TYPE_HINDEXED|MPI_TYPE_HINDEXED]] from Fortran, and `MPI_COMBINER_STRUCT` may be returned for a datatype constructed by a call to [[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] from Fortran. On such systems, one need not differentiate constructors that take address size arguments from constructors that take integer arguments, since these are the same. The~~

~~preferred~~

~~calls all use address sized arguments~~

~~so two combiners are not required for them.~~

~~> [!tip] Rationale~~

~~> For recreating the original call, it is important to know if address information may have been truncated. The > > deprecated > > calls from Fortran for a few routines could be subject to truncation in the case where the default `INTEGER` size is smaller than the size of an address.~~

~~The actual arguments used in the creation call for a `datatype` can be obtained from the call:~~

==The actual arguments used in the creation call for a `datatype` can be obtained using [[versions/v30/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] .==

> The arguments `max_integers`, `max_addresses`, and `max_datatypes` allow for error checking in the ~~> >~~ call.

> The datatypes returned in `array_of_datatypes` must appear to the user as if each is an equivalent copy of the datatype used in the type constructor call. ~~> >~~ Whether this is done by creating a new datatype or via another mechanism such as a reference count mechanism is up to the implementation as long as the semantics are preserved.

~~In the~~

~~deprecated~~

~~datatype constructor calls, the address arguments in Fortran are of type `INTEGER`. In the~~

~~preferred~~

~~calls, the address arguments are of type `INTEGER(KIND=MPI_ADDRESS_KIND)`. The call [[versions/v30/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] returns all addresses in an argument of type `INTEGER(KIND=MPI_ADDRESS_KIND)`. This is true even if the~~

~~deprecated~~

~~calls were used. Thus, the location of values returned can be thought of as being returned by the C bindings. It can also be determined by examining the~~

~~preferred~~

~~calls for datatype constructors for the~~

~~deprecated~~

~~calls that involve addresses.~~

==In the deprecated datatype constructor calls, the address arguments in Fortran are of type `INTEGER`. In the preferred calls, the address arguments are of type `INTEGER(KIND=MPI_ADDRESS_KIND)`. The call [[versions/v30/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] returns all addresses in an argument of type `INTEGER(KIND=MPI_ADDRESS_KIND)`. This is true even if the deprecated calls were used. Thus, the location of values returned can be thought of as being returned by the C bindings. It can also be determined by examining the preferred calls for datatype constructors for the deprecated calls that involve addresses.==

PARAMETER (LARGE = 1000) INTEGER TYPE, NI, NA, ND, COMBINER, I(LARGE), D(LARGE), IERROR ~~INTEGER(KIND=MPI_ADDRESS_KIND)~~ ==INTEGER (KIND=MPI_ADDRESS_KIND)== A(LARGE) ! CONSTRUCT DATATYPE TYPE (NOT SHOWN) CALL MPI_TYPE_GET_ENVELOPE(TYPE, NI, NA, ND, COMBINER, IERROR) IF ((NI .GT. LARGE) .OR. (NA .GT. LARGE) .OR. (ND .GT. LARGE)) THEN WRITE (*, *) "NI, NA, OR ND = ", NI, NA, ND, & " RETURNED BY MPI_TYPE_GET_ENVELOPE IS LARGER THAN LARGE = ", LARGE CALL MPI_ABORT(MPI_COMM_WORLD, 99, IERROR) ENDIF CALL MPI_TYPE_GET_CONTENTS(TYPE, NI, NA, ND, I, A, D, IERROR)

~~    #define LARGE 1000     int ni, na, nd, combiner, i[LARGE];     MPI_Aint a[LARGE];     MPI_Datatype type, d[LARGE];     /* construct datatype type (not shown) */     MPI_Type_get_envelope(type, &ni, &na, &nd, &combiner);     if ((ni > LARGE) || (na > LARGE) || (nd > LARGE)) {       fprintf(stderr, "ni, na, or nd = %d %d %d returned by ", ni, na, nd);       fprintf(stderr, "MPI_Type_get_envelope is larger than LARGE = %d\n",                LARGE);       MPI_Abort(MPI_COMM_WORLD, 99);     };     MPI_Type_get_contents(type, ni, na, nd, i, a, d);~~

~~The C++ code is in analogy to the C code above with the same values returned.~~

~~In the descriptions that follow, the lower case name~~

~~of arguments~~

~~is used.~~

==    #define LARGE 1000     int ni, na, nd, combiner, i[LARGE];     MPI_Aint a[LARGE];     MPI_Datatype type, d[LARGE];     /* construct datatype type (not shown) */     MPI_Type_get_envelope(type, &ni, &na, &nd, &combiner);     if ((ni > LARGE) || (na > LARGE) || (nd > LARGE)) {         fprintf(stderr, "ni, na, or nd = %d %d %d returned by ", ni, na, nd);         fprintf(stderr, "MPI_Type_get_envelope is larger than LARGE = %d\n",                  LARGE);         MPI_Abort(MPI_COMM_WORLD, 99);     };     MPI_Type_get_contents(type, ni, na, nd, i, a, d);==

==In the descriptions that follow, the lower case name of arguments is used.==

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | oldtype | d\[0\] | D(1) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | count | i\[0\] | I(1) | | oldtype | d\[0\] | D(1) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | count | i\[0\] | I(1) | | blocklength | i\[1\] | I(2) | | stride | i\[2\] | I(3) | | oldtype | d\[0\] | D(1) |

If combiner is ~~`MPI_COMBINER_HVECTOR_INTEGER` or~~ `MPI_COMBINER_HVECTOR` then

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | count | i\[0\] | I(1) | | blocklength | i\[1\] | I(2) | | stride | a\[0\] | A(1) | | oldtype | d\[0\] | D(1) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | |:---|:--:|:--:| | count | i\[0\] | I(1) | | array_of_blocklengths | i\[1\] to i\[i\[0\]\] | I(2) to I(I(1)+1) | | array_of_displacements | i\[i\[0\]+1\] to i\[2\*i\[0\]\] | I(I(1)+2) to I(2\*I(1)+1) | | oldtype | d\[0\] | D(1) |

If combiner is ~~`MPI_COMBINER_HINDEXED_INTEGER` or~~ `MPI_COMBINER_HINDEXED` then

| Constructor argument | C ~~& C++ location~~ | Fortran location | |:-----------------------|:-----------------------:|:-----------------:| | count | i\[0\] | I(1) | | array_of_blocklengths | i\[1\] to i\[i\[0\]\] | I(2) to I(I(1)+1) | | array_of_displacements | a\[0\] to a\[i\[0\]-1\] | A(1) to A(I(1)) | | oldtype | d\[0\] | D(1) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | |:-----------------------|:-----------------------:|:-----------------:| | count | i\[0\] | I(1) | | blocklength | i\[1\] | I(2) | | array_of_displacements | i\[2\] to i\[i\[0\]+1\] | I(3) to I(I(1)+2) | | oldtype | d\[0\] | D(1) |

~~If combiner is `MPI_COMBINER_STRUCT_INTEGER` or `MPI_COMBINER_STRUCT` then~~

~~| Constructor argument   |    C & C++ location     | Fortran location  | |:-----------------------|:-----------------------:|:-----------------:| | count                  |         i\[0\]          |       I(1)        | | array_of_blocklengths  |  i\[1\] to i\[i\[0\]\]  | I(2) to I(I(1)+1) | | array_of_displacements | a\[0\] to a\[i\[0\]-1\] |  A(1) to A(I(1))  | | array_of_types         | d\[0\] to d\[i\[0\]-1\] |  D(1) to D(I(1))  |~~

==If combiner is `MPI_COMBINER_HINDEXED_BLOCK` then==

==| Constructor argument   |            C            | Fortran location | |:-----------------------|:-----------------------:|:----------------:| | count                  |         i\[0\]          |       I(1)       | | blocklength            |         i\[1\]          |       I(2)       | | array_of_displacements | a\[0\] to a\[i\[0\]-1\] | A(1) to A(I(1))  | | oldtype                |         d\[0\]          |       D(1)       |==

==and ni = 2, na = count, nd = 1.==

==If combiner is `MPI_COMBINER_STRUCT` then==

==| Constructor argument   |            C            | Fortran location  | |:-----------------------|:-----------------------:|:-----------------:| | count                  |         i\[0\]          |       I(1)        | | array_of_blocklengths  |  i\[1\] to i\[i\[0\]\]  | I(2) to I(I(1)+1) | | array_of_displacements | a\[0\] to a\[i\[0\]-1\] |  A(1) to A(I(1))  | | array_of_types         | d\[0\] to d\[i\[0\]-1\] |  D(1) to D(I(1))  |==

| Constructor argument | C ~~& C++ location~~ | Fortran location | |:---|:--:|:--:| | ndims | i\[0\] | I(1) | | array_of_sizes | i\[1\] to i\[i\[0\]\] | I(2) to I(I(1)+1) | | array_of_subsizes | i\[i\[0\]+1\] to i\[2\*i\[0\]\] | I(I(1)+2) to I(2\*I(1)+1) | | array_of_starts | i\[2\*i\[0\]+1\] to i\[3\*i\[0\]\] | I(2\*I(1)+2) to I(3\*I(1)+1) | | order | i\[3\*i\[0\]+1\] | I(3\*I(1)+2\] | | oldtype | d\[0\] | D(1) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | |:---|:--:|:--:| | size | i\[0\] | I(1) | | rank | i\[1\] | I(2) | | ndims | i\[2\] | I(3) | | array_of_gsizes | i\[3\] to i\[i\[2\]+2\] | I(4) to I(I(3)+3) | | array_of_distribs | i\[i\[2\]+3\] to i\[2\*i\[2\]+2\] | I(I(3)+4) to I(2\*I(3)+3) | | array_of_dargs | i\[2\*i\[2\]+3\] to i\[3\*i\[2\]+2\] | I(2\*I(3)+4) to I(3\*I(3)+3) | | array_of_psizes | i\[3\*i\[2\]+3\] to i\[4\*i\[2\]+2\] | I(3\*I(3)+4) to I(4\*I(3)+3) | | order | i\[4\*i\[2\]+3\] | I(4\*I(3)+4) | | oldtype | d\[0\] | D(1) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | p | i\[0\] | I(1) | | r | i\[1\] | I(2) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | p | i\[0\] | I(1) | | r | i\[1\] | I(2) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | r | i\[0\] | I(1) |

| Constructor argument | C ~~& C++ location~~ | Fortran location | ~~|:---------------------|:----------------:|:----------------:|~~ ==|:---------------------|:------:|:----------------:|== | lb | a\[0\] | A(1) | | extent | a\[1\] | A(2) | | oldtype | d\[0\] | D(1) |

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~MPI datatype objects allow users to specify an arbitrary layout of data in memory.~~

~~There are several cases~~

~~where accessing the layout information in opaque datatype objects would be useful. The opaque datatype object has found a number of uses outside MPI. Furthermore, a number of tools wish to display internal information about a datatype. To achieve this, datatype decoding functions are provided.~~

~~The two functions in this section are used together to decode datatypes to recreate the calling sequence used in their initial definition. These can be used to allow a user to determine the type map and type signature of a datatype.~~

==MPI datatype objects allow users to specify an arbitrary layout of data in memory. There are several cases where accessing the layout information in opaque datatype objects would be useful. The opaque datatype object has found a number of uses outside MPI. Furthermore, a number of tools wish to display internal information about a datatype. To achieve this, datatype decoding functions are provided. The two functions in this section are used together to decode datatypes to recreate the calling sequence used in their initial definition. These can be used to allow a user to determine the type map and type signature of a datatype.==

> By requiring that the `combiner` reflect the constructor used in the creation of the `datatype`, the decoded information can be used to effectively recreate the calling sequence used in the original creation. ~~> >~~ This is the most useful information and was felt to be reasonable even though it constrains implementations to remember the original constructor sequence even if the internal representation is different. > > The decoded information keeps track of datatype duplications. This is important as one needs to distinguish between a predefined datatype and a dup of a predefined datatype. The former is a constant object that cannot be freed, while the latter is a derived datatype that can be freed.

### MPI-3.1 → MPI-4.0  (21 changed paragraphs)

==If the [[versions/v40/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] variant without `num_large_counts` is invoked with a `datatype` that requires an output value of `num_large_counts` $`>0`$, then an error of class `MPI_ERR_TYPE` is raised.==

==> [!tip] Rationale==

==> The large count variant of this MPI procedure was added in MPI-4. It contains a new `num_large_counts` parameter. The other variant—the variant that existed before MPI-4—was not changed in order to preserve backwards compatibility.==

==[[versions/v40/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] and [[versions/v40/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] also support large count types in separate additional MPI procedures in C (suffixed with the “`_c`”) and interface polymorphism in Fortran when using `USE mpi_f08`.==

The values given for `max_integers`, `max_addresses`, ==`max_large_counts`,== and `max_datatypes` must be at least as large as the value returned in `num_integers`, `num_addresses`, ==`num_large_counts`,== and `num_datatypes`, respectively, in the call [[versions/v40/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] for the same `datatype` argument.

~~> The arguments `max_integers`, `max_addresses`, and `max_datatypes` allow for error checking in the call.~~

==> The arguments `max_integers`, `max_addresses`, `max_large_counts`, and `max_datatypes` allow for error checking in the call.==

==If the [[versions/v40/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] variant without `max_large_counts` is invoked with a `datatype` that requires $`>0`$ values in `array_of_large_counts`, then an error of class `MPI_ERR_TYPE` is raised.==

==> [!tip] Rationale==

==> The large count variant of this MPI procedure was added in MPI-4. It contains new `max_large_counts` and `array_of_large_counts` parameters. The other variant—the variant that existed before MPI-4—was not changed in order to preserve backwards compatibility.==

PARAMETER (LARGE = 1000) INTEGER TYPE, NI, NA, ND, COMBINER, I(LARGE), D(LARGE), IERROR ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== A(LARGE) ! CONSTRUCT DATATYPE TYPE (NOT SHOWN) CALL MPI_TYPE_GET_ENVELOPE(TYPE, NI, NA, ND, COMBINER, IERROR) IF ((NI .GT. LARGE) .OR. (NA .GT. LARGE) .OR. (ND .GT. LARGE)) THEN WRITE (*, *) "NI, NA, OR ND = ", NI, NA, ND, & " RETURNED BY MPI_TYPE_GET_ENVELOPE IS LARGER THAN LARGE = ", LARGE CALL MPI_ABORT(MPI_COMM_WORLD, 99, IERROR) ENDIF CALL MPI_TYPE_GET_CONTENTS(TYPE, NI, NA, ND, I, A, D, IERROR)

~~In~~ ==The following describes== the ~~descriptions that follow,~~ ==values of== the ==arguments for each combiner. The== lower case name of arguments is used. ==Also, the descriptions below refer to MPI datatypes created with procedures without large count arguments.==

~~If combiner is `MPI_COMBINER_NAMED` then~~ ==the `datatype` represent a predefined type and therefore== it is erroneous to call [[versions/v40/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] .

~~If combiner is `MPI_COMBINER_DUP` then~~ ==`ni = 0`, `na = 0`, `nd = 1`, and==

~~and ni = 0, na = 0, nd = 1.~~

~~If combiner is `MPI_COMBINER_CONTIGUOUS` then~~

==`ni = 1`, `na = 0`, `nd = 1`, and==

~~and ni = 1, na = 0, nd = 1.~~

~~If combiner is `MPI_COMBINER_VECTOR` then~~

==`ni = 3`, `na = 0`, `nd = 1`, and==

~~and ni = 3, na = 0, nd = 1.~~

~~If combiner is `MPI_COMBINER_HVECTOR` then~~

==`ni = 2`, `na = 1`, `nd = 1`, and==

~~and ni = 2, na = 1, nd = 1.~~

~~If combiner is `MPI_COMBINER_INDEXED` then~~

==`ni = 2*count+1`, `na = 0`, `nd = 1`, and==

~~and ni = 2\*count+1, na = 0, nd = 1.~~

~~If combiner is `MPI_COMBINER_HINDEXED` then~~

==`ni = count+1`, `na = count`, `nd = 1`, and==

~~and ni = count+1, na = count, nd = 1.~~

~~If combiner is `MPI_COMBINER_INDEXED_BLOCK` then~~

==`ni = count+2`, `na = 0`, `nd = 1`, and==

~~and ni = count+2, na = 0, nd = 1.~~

~~If combiner is `MPI_COMBINER_HINDEXED_BLOCK` then~~

==`ni = 2`, `na = count`, `nd = 1`, and==

~~and ni = 2, na = count, nd = 1.~~

~~If combiner is `MPI_COMBINER_STRUCT` then~~

==`ni = count+1`, `na = count`, `nd = count`, and==

~~and ni = count+1, na = count, nd = count.~~

~~If combiner is `MPI_COMBINER_SUBARRAY` then~~

==`ni = 3*ndims+2`, `na = 0`, `nd = 1`, and==

~~and ni = 3\*ndims+2, na = 0, nd = 1.~~

~~If combiner is `MPI_COMBINER_DARRAY` then~~

==`ni = 4*ndims+4`, `na = 0`, `nd = 1`, and==

~~and ni = 4\*ndims+4, na = 0, nd = 1.~~

~~If combiner is `MPI_COMBINER_F90_REAL` then~~

==`ni = 2`, `na = 0`, `nd = 0`, and==

~~and ni = 2, na = 0, nd = 0.~~

~~If combiner is `MPI_COMBINER_F90_COMPLEX` then~~

==`ni = 2`, `na = 0`, `nd = 0`, and==

~~and ni = 2, na = 0, nd = 0.~~

~~If combiner is `MPI_COMBINER_F90_INTEGER` then~~

==`ni = 1`, `na = 0`, `nd = 0`, and==

~~and ni = 1, na = 0, nd = 0.~~

~~If combiner is `MPI_COMBINER_RESIZED` then~~

==`ni = 0`, `na = 2`, `nd = 1`, and==

~~and ni = 0, na = 2, nd = 1.~~

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

MPI datatype objects allow users to specify an arbitrary layout of data in memory. There are several cases where accessing the layout information in opaque datatype objects would be useful. The opaque datatype object has found a number of uses outside MPI. Furthermore, a number of tools wish to display internal information about a datatype. To achieve this, datatype decoding ~~functions~~ ==procedures== are provided. The two ~~functions~~ ==procedures== in this section are used together to decode datatypes to recreate the calling sequence used in their initial definition. These can be used to allow a user to determine the type map and type signature of a datatype.

~~The list in Table [[versions/v41/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] has the values that can be returned in `combiner` on the left and the call associated with them on the right.~~

~~|                               |                                          | |:------------------------------|:-----------------------------------------| | `MPI_COMBINER_NAMED`          | a named predefined datatype              | | `MPI_COMBINER_DUP`            |  [[versions/v41/API/MPI_TYPE_DUP|MPI_TYPE_DUP]]                    | | `MPI_COMBINER_CONTIGUOUS`     |  [[versions/v41/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]]             | | `MPI_COMBINER_VECTOR`         |  [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]]                 | | `MPI_COMBINER_HVECTOR`        |  [[versions/v41/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]]         | | `MPI_COMBINER_INDEXED`        |  [[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]]                | | `MPI_COMBINER_HINDEXED`       |  [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]]        | | `MPI_COMBINER_INDEXED_BLOCK`  |  [[versions/v41/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]]   | | `MPI_COMBINER_HINDEXED_BLOCK` |  [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]]  | | `MPI_COMBINER_STRUCT`         |  [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]]          | | `MPI_COMBINER_SUBARRAY`       |  [[versions/v41/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]]        | | `MPI_COMBINER_DARRAY`         |  [[versions/v41/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]]          | | `MPI_COMBINER_F90_REAL`       |  [[versions/v41/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]]        | | `MPI_COMBINER_F90_COMPLEX`    |  [[versions/v41/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]]     | | `MPI_COMBINER_F90_INTEGER`    |  [[versions/v41/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]]     | | `MPI_COMBINER_RESIZED`        |  [[versions/v41/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]]         |~~

~~`combiner` values returned from [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]]~~

==The list of values that can be returned from [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] in `combiner` (on the left) and the call associated with them (on the right) are as follows:==

==a named predefined datatype==

==[[versions/v41/API/MPI_TYPE_DUP|MPI_TYPE_DUP]]==

==[[versions/v41/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]]==

==[[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]]==

==[[versions/v41/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]]==

==[[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]]==

==[[versions/v41/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]]==

==[[versions/v41/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]]==

==[[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]]==

==[[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]]==

==[[versions/v41/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]]==

==[[versions/v41/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]]==

==[[versions/v41/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]]==

==[[versions/v41/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]]==

==[[versions/v41/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]]==

==[[versions/v41/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]]==

==[[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI_TYPE_GET_VALUE_INDEX]]==

In the deprecated datatype constructor calls, the address arguments in Fortran are of type `INTEGER`. In the preferred calls, the address arguments are of type ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`.~~ ==`ADDRESS`.== The call [[versions/v41/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] returns all addresses in an argument of type ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`.~~ ==`ADDRESS`.== This is true even if the deprecated calls were used. Thus, the location of values returned can be thought of as being returned by the C bindings. It can also be determined by examining the preferred calls for datatype constructors for the deprecated calls that involve addresses.

~~> By having all address arguments returned in the `array_of_addresses` argument, the result from a C and Fortran decoding of a `datatype` gives the result in the same argument. It is assumed that an integer of type `INTEGER(KIND=MPI_ADDRESS_KIND)` will be at least as large as the `INTEGER` argument used in datatype construction with the old MPI-1 calls so no loss of information will occur.~~

~~The following defines what values are placed in each entry of the returned arrays depending on the datatype constructor used for `datatype`. It also specifies the size of the arrays needed which is the values returned by [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] . In Fortran, the following calls were made:~~

~~    PARAMETER (LARGE = 1000)     INTEGER TYPE, NI, NA, ND, COMBINER, I(LARGE), D(LARGE), IERROR     INTEGER(KIND=MPI_ADDRESS_KIND) A(LARGE)     ! CONSTRUCT DATATYPE TYPE (NOT SHOWN)     CALL MPI_TYPE_GET_ENVELOPE(TYPE, NI, NA, ND, COMBINER, IERROR)     IF ((NI .GT. LARGE) .OR. (NA .GT. LARGE) .OR. (ND .GT. LARGE)) THEN        WRITE (*, *) "NI, NA, OR ND = ", NI, NA, ND, &        " RETURNED BY MPI_TYPE_GET_ENVELOPE IS LARGER THAN LARGE = ", LARGE        CALL MPI_ABORT(MPI_COMM_WORLD, 99, IERROR)     ENDIF     CALL MPI_TYPE_GET_CONTENTS(TYPE, NI, NA, ND, I, A, D, IERROR)~~

==> By having all address arguments returned in the `array_of_addresses` argument, the result from a C and Fortran decoding of a `datatype` gives the result in the same argument. It is assumed that an integer of type `ADDRESS` will be at least as large as the `INTEGER` argument used in datatype construction with the old MPI-1 calls so no loss of information will occur.==

==The following defines what values are placed in each entry of the returned arrays depending on the datatype constructor used for `datatype`. It also specifies the size of the arrays needed, which is the values returned by [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] . In Fortran, the following calls were made:==

==(code block added)==
``` [MPI]Fortran
PARAMETER (LARGE = 1000)
INTEGER DTYPE, NI, NA, ND, COMBINER, I(LARGE), D(LARGE), IERROR
INTEGER(KIND=MPI_ADDRESS_KIND) A(LARGE)
! CONSTRUCT DATATYPE DTYPE (NOT SHOWN)
CALL MPI_TYPE_GET_ENVELOPE(DTYPE, NI, NA, ND, COMBINER, IERROR)
IF ((NI .GT. LARGE) .OR. (NA .GT. LARGE) .OR. (ND .GT. LARGE)) THEN
   WRITE (*, *) "NI, NA, OR ND = ", NI, NA, ND, &
   " RETURNED BY MPI_TYPE_GET_ENVELOPE IS LARGER THAN LARGE = ", LARGE
   CALL MPI_ABORT(MPI_COMM_WORLD, 99, IERROR)
ENDIF
CALL MPI_TYPE_GET_CONTENTS(DTYPE, NI, NA, ND, I, A, D, IERROR)
```

~~    #define LARGE 1000     int ni, na, nd, combiner, i[LARGE];     MPI_Aint a[LARGE];     MPI_Datatype type, d[LARGE];     /* construct datatype type (not shown) */     MPI_Type_get_envelope(type, &ni, &na, &nd, &combiner);     if ((ni > LARGE) || (na > LARGE) || (nd > LARGE)) {         fprintf(stderr, "ni, na, or nd = %d %d %d returned by ", ni, na, nd);         fprintf(stderr, "MPI_Type_get_envelope is larger than LARGE = %d\n",                  LARGE);         MPI_Abort(MPI_COMM_WORLD, 99);     };     MPI_Type_get_contents(type, ni, na, nd, i, a, d);~~

~~The following describes the values of the arguments for each combiner. The lower case name of arguments is used. Also, the descriptions below refer to MPI datatypes created with procedures without large count arguments.~~

==(code block added)==
``` [MPI]C
#define LARGE 1000
int ni, na, nd, combiner, i[LARGE];
MPI_Aint a[LARGE];
MPI_Datatype dtype, d[LARGE];
/* construct datatype dtype (not shown) */
MPI_Type_get_envelope(dtype, &ni, &na, &nd, &combiner);
if ((ni > LARGE) || (na > LARGE) || (nd > LARGE)) {
   fprintf(stderr, "ni, na, or nd = %d %d %d returned by ", ni, na, nd);
   fprintf(stderr, "MPI_Type_get_envelope is larger than LARGE = %d\n",
           LARGE);
   MPI_Abort(MPI_COMM_WORLD, 99);
}
MPI_Type_get_contents(dtype, ni, na, nd, i, a, d);
```

==The following describes the values of the arguments for each combiner. The lower case name of arguments is used. Also, the descriptions below refer to MPI datatypes created by procedures without large count arguments.==

==`ni = 0`, `na = 0`, `nd = 2`, and==

==| Constructor argument |   C    | Fortran location | |:---------------------|:------:|:----------------:| | value_type           | d\[0\] |       D(1)       | | index_type           | d\[1\] |       D(2)       |==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

the `datatype` ~~represent~~ ==represents== a predefined type and therefore it is erroneous to call [[versions/v50/API/MPI_TYPE_GET_CONTENTS|MPI_TYPE_GET_CONTENTS]] .

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Decoding a Datatype]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Decoding a Datatype]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Decoding a Datatype]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Decoding a Datatype]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Decoding a Datatype]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Decoding a Datatype]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Decoding a Datatype]]
