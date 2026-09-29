# MPI-1 C++ Language Binding



## C++ Classes



The following are the classes provided with the C++ MPI-1 language bindings:

    namespace MPI {
      class Comm                             {...};
      class Intracomm : public Comm          {...};
      class Graphcomm : public Intracomm     {...};
      class Cartcomm  : public Intracomm     {...};
      class Intercomm : public Comm          {...};
      class Datatype                         {...};
      class Errhandler                       {...};
      class Exception                        {...};
      class Group                            {...};
      class Op                               {...};
      class Request                          {...};
      class Prequest  : public Request       {...};
      class Status                           {...};
    };

Note that several MPI-1 functions, constants, and typedefs have been deprecated and therefore do not have corresponding C++ bindings. All deprecated names have corresponding new names in MPI-2 (albeit probably with different semantics). See the table in Section [[terms#Deprecated Names and Functions|Deprecated Names and Functions]] for a list of the deprecated names and their corresponding new names. The bindings for the new names are listed in Annex [[appLang#Language Binding|Language Binding]] .

## Defined Constants



These are required constants, defined in the file `mpi.h`. For brevity, the types of the constants are defined below are defined in the comments.

    // return codes
    // Type: const int (or unnamed enum)
    MPI::SUCCESS           
    MPI::ERR_BUFFER       
    MPI::ERR_COUNT        
    MPI::ERR_TYPE         
    MPI::ERR_TAG          
    MPI::ERR_COMM         
    MPI::ERR_RANK         
    MPI::ERR_REQUEST      
    MPI::ERR_ROOT         
    MPI::ERR_GROUP        
    MPI::ERR_OP           
    MPI::ERR_TOPOLOGY     
    MPI::ERR_DIMS         
    MPI::ERR_ARG          
    MPI::ERR_UNKNOWN      
    MPI::ERR_TRUNCATE     
    MPI::ERR_OTHER        
    MPI::ERR_INTERN
    MPI::ERR_PENDING
    MPI::ERR_IN_STATUS
    MPI::ERR_LASTCODE     

    // assorted constants 
    // Type: const void *
    MPI::BOTTOM
    // Type: const int (or unnamed enum)
    MPI::PROC_NULL
    MPI::ANY_SOURCE
    MPI::ANY_TAG
    MPI::UNDEFINED
    MPI::BSEND_OVERHEAD
    MPI::KEYVAL_INVALID

    // Error-handling specifiers 
    // Type: MPI::Errhandler (see below)
    MPI::ERRORS_ARE_FATAL
    MPI::ERRORS_RETURN
    MPI::ERRORS_THROW_EXCEPTIONS

    // Maximum sizes for strings 
    // Type: const int 
    MPI::MAX_PROCESSOR_NAME
    MPI::MAX_ERROR_STRING

    // elementary datatypes (C / C++)
    // Type: const MPI::Datatype
    MPI::CHAR
    MPI::SHORT
    MPI::INT         
    MPI::LONG        
    MPI::SIGNED_CHAR
    MPI::UNSIGNED_CHAR
    MPI::UNSIGNED_SHORT
    MPI::UNSIGNED
    MPI::UNSIGNED_LONG
    MPI::FLOAT       
    MPI::DOUBLE      
    MPI::LONG_DOUBLE
    MPI::BYTE        
    MPI::PACKED

    // elementary datatypes (Fortran)
    // Type: const MPI::Datatype
    MPI::INTEGER
    MPI::REAL
    MPI::DOUBLE_PRECISION
    MPI::F_COMPLEX
    MPI::F_DOUBLE_COMPLEX
    MPI::LOGICAL
    MPI::CHARACTER

    // datatypes for reduction functions (C / C++)
    // Type: const MPI::Datatype 
    MPI::FLOAT_INT
    MPI::DOUBLE_INT
    MPI::LONG_INT
    MPI::TWOINT
    MPI::SHORT_INT
    MPI::LONG_DOUBLE_INT

    // datatype for reduction functions (Fortran)
    // Type const MPI::Datatype
    MPI::TWOREAL
    MPI::TWODOUBLE_PRECISION
    MPI::TWOINTEGER

    // optional datatypes (Fortran)
    // Type: const MPI::Datatype
    MPI::INTEGER1
    MPI::INTEGER2
    MPI::INTEGER4
    MPI::REAL2
    MPI::REAL4
    MPI::REAL8

    // optional datatypes (C / C++)
    // Type: const MPI::Datatype

    MPI::LONG_LONG
    MPI::UNSIGNED_LONG_LONG

    // special datatypes for construction derived datatypes
    // Type: const MPI::Datatype 
    MPI::UB
    MPI::LB

    // C++ datatypes
    // Type: const MPI::Datatype
    MPI::BOOL
    MPI::COMPLEX
    MPI::DOUBLE_COMPLEX
    MPI::LONG_DOUBLE_COMPLEX

    // reserved communicators
    // Type: MPI::Intracomm 
    MPI::COMM_WORLD
    MPI::COMM_SELF

    // results of communicator and group comparisons
    // Type: const int (or unnamed enum) 
    MPI::IDENT
    MPI::CONGRUENT
    MPI::SIMILAR
    MPI::UNEQUAL

    // environmental inquiry keys
    // Type: const int (or unnamed enum)
    MPI::TAG_UB
    MPI::IO
    MPI::HOST
    MPI::WTIME_IS_GLOBAL

    // collective operations 
    // Type: const MPI::Op 
    MPI::MAX
    MPI::MIN
    MPI::SUM
    MPI::PROD
    MPI::MAXLOC
    MPI::MINLOC
    MPI::BAND
    MPI::BOR
    MPI::BXOR
    MPI::LAND
    MPI::LOR
    MPI::LXOR

    // Null handles 
    // Type: const MPI::Group 
    MPI::GROUP_NULL

// Type: See Section [[c++comm-class]] regarding the MPI::Comm class hierarchy and\
// the specific type of MPI::COMM_NULL.

    MPI::COMM_NULL
    // Type: const MPI::Datatype 
    MPI::DATATYPE_NULL   
    // Type: const MPI::Request 
    MPI::REQUEST_NULL
    // Type: const MPI::Op 
    MPI::OP_NULL
    // Type: MPI::Errhandler
    MPI::ERRHANDLER_NULL

    // Empty group
    // Type: const MPI::Group 
    MPI::GROUP_EMPTY
      
    // Topologies
    // Type: const int (or unnamed enum) 
    MPI::GRAPH
    MPI::CART

    // Predefined functions
    // Type: MPI::Copy_function
    MPI::NULL_COPY_FN
    MPI::DUP_FN
    // Type: MPI::Delete_function
    MPI::NULL_DELETE_FN

## Typedefs

The following are defined C++ types, also included in the file `mpi.h`.

    // Typedef
    MPI::Aint

The rest of this annex uses the `namespace` notation because all the functions listed below are prototypes. The `namespace` notation is not used previously because the lists of constants and types above are not actual declarations.

    // prototypes for user-defined functions 
    namespace MPI {
      typedef void User_function(const void *invec, void* inoutvec, int len, 
                                 const Datatype& datatype);
    };

## C++ Bindings for Point-to-Point Communication

Except where specifically noted, all non-`static` member functions in this annex are `virtual`. For brevity, the keyword `virtual` is omitted.

    namespace MPI {

    };

## C++ Bindings for Collective Communication

    namespace MPI {

    };

## C++ Bindings for Groups, Contexts, and Communicators

For both syntactic and semantic reasons, the `Dup()` functions listed below are not virtual. Syntactically, they must each have a different return type.

`Dup()` and `Clone` are discussed in Section [[c++comm-class]] , page [[c++comm-class]] .

    namespace MPI {

    };

## C++ Bindings for Process Topologies

    namespace MPI {

    };

## C++ Bindings for Environmental Inquiry

    namespace MPI {

    };

## C++ Bindings for Profiling

    namespace MPI {

    };

## C++ Bindings for Status Access

    namespace MPI {

    };

## C++ Bindings for New 1.2 Functions



    namespace MPI {

    };

## C++ Bindings for Exceptions

    namespace MPI {

    };

## C++ Bindings on all MPI Classes

The C++ language requires all classes to have four special functions: a default constructor, a copy constructor, a destructor, and an assignment operator. The bindings for these functions are listed below; their semantics are discussed in Section [[binding#Semantics|Semantics]] .

The two constructors are *not* `virtual`.

The bindings prototype functions using the type `<CLASS>` rather than listing each function for every MPI class; the token `<CLASS>` can be replaced with valid MPI-2 class names, such as `Group`, `Datatype`, etc., except when noted.

In addition, bindings are provided for comparison and inter-language operability from Sections [[binding#Comparison|Comparison]] and [[binding#Mixed-Language Operability|Mixed-Language Operability]] .

### Construction / Destruction

    namespace MPI {

    };

### Copy / Assignment

    namespace MPI {

    };

### Comparison

Since `Status` instances are not handles to underlying MPI objects, the `operator==()` and `operator!=()` functions are not defined on the `Status` class.

    namespace MPI {

    };

### Inter-language Operability

Since there are no C++ `MPI::STATUS_IGNORE` and `MPI::STATUSES_IGNORE` objects, the results of promoting the C or Fortran handles ( [[MPI_STATUS_IGNORE]] and [[MPI_STATUSES_IGNORE]] ) to C++ is undefined.

    namespace MPI {

    };

### Function Name Cross Reference



Since some of the C++ bindings have slightly different names than their C and Fortran counterparts, this section maps each language neutral MPI-1 name to its corresponding C++ binding.

For brevity, the “`MPI::`” prefix is assumed for all C++ class names.

Where MPI-1 names have been deprecated, the $`<`$none$`>`$ keyword is used in the “Member name” column to indicate that this function is supported with a new name (see Annex [[appLang#Language Binding|Language Binding]] ).

Where non-void values are listed in the “Return value” column, the given name is that of the corresponding parameter in the language neutral specification.

llll MPI Function & C++ class & Member name & Return value   <span class="sans-serif">MPI_ABORT</span> & `Comm` & `Abort` & void\
<span class="sans-serif">MPI_ADDRESS</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_ALLGATHERV</span> & `Intracomm` & `Allgatherv` & void\
<span class="sans-serif">MPI_ALLGATHER</span> & `Intracomm` & `Allgather` & void\
<span class="sans-serif">MPI_ALLREDUCE</span> & `Intracomm` & `Allreduce` & void\
<span class="sans-serif">MPI_ALLTOALLV</span> & `Intracomm` & `Alltoallv` & void\
<span class="sans-serif">MPI_ALLTOALL</span> & `Intracomm` & `Alltoall` & void\
<span class="sans-serif">MPI_ATTR_DELETE</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_ATTR_GET</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_ATTR_PUT</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_BARRIER</span> & `Intracomm` & `Barrier` & void\
<span class="sans-serif">MPI_BCAST</span> & `Intracomm` & `Bcast` & void\
<span class="sans-serif">MPI_BSEND_INIT</span> & `Comm` & `Bsend_init` & `Prequest request`\
<span class="sans-serif">MPI_BSEND</span> & `Comm` & `Bsend` & void  <span class="sans-serif">MPI_BUFFER_ATTACH</span> & & `Attach_buffer` & void  <span class="sans-serif">MPI_BUFFER_DETACH</span> & & `Detach_buffer` & `void* buffer`\
<span class="sans-serif">MPI_CANCEL</span> & `Request` & `Cancel` & void\
<span class="sans-serif">MPI_CARTDIM_GET</span> & `Cartcomm` & `Get_dim` & `int ndims`\
<span class="sans-serif">MPI_CART_COORDS</span> & `Cartcomm` & `Get_coords` & void\
<span class="sans-serif">MPI_CART_CREATE</span> & `Intracomm` & `Create_cart` & `Cartcomm newcomm`\
<span class="sans-serif">MPI_CART_GET</span> & `Cartcomm` & `Get_topo` & void\
<span class="sans-serif">MPI_CART_MAP</span> & `Cartcomm` & `Map` & `int newrank`\
<span class="sans-serif">MPI_CART_RANK</span> & `Cartcomm` & `Get_rank` & `int rank`\
<span class="sans-serif">MPI_CART_SHIFT</span> & `Cartcomm` & `Shift` & void\
<span class="sans-serif">MPI_CART_SUB</span> & `Cartcomm` & `Sub` & `Cartcomm newcomm`\
<span class="sans-serif">MPI_COMM_COMPARE</span> & `Comm` & `static Compare` & `int result`\
<span class="sans-serif">MPI_COMM_CREATE</span> & `Intracomm` & `Create` & `Intracomm newcomm`\
<span class="sans-serif">MPI_COMM_DUP</span> & `Intracomm` & `Dup` & `Intracomm newcomm`\
& `Cartcomm` & `Dup` & `Cartcomm newcomm`\
& `Graphcomm` & `Dup` & `Graphcomm newcomm`\
& `Intercomm` & `Dup` & `Intercomm newcomm`\
& `Comm` & `Clone` & `Comm& newcomm`\
& `Intracomm` & `Clone` & `Intracomm& newcomm`\
& `Cartcomm` & `Clone` & `Cartcomm& newcomm`\
& `Graphcomm` & `Clone` & `Graphcomm& newcomm`\
& `Intercomm` & `Clone` & `Intercomm& newcomm`\
<span class="sans-serif">MPI_COMM_FREE</span> & `Comm` & `Free` & void\
<span class="sans-serif">MPI_COMM_GROUP</span> & `Comm` & `Get_group` & `Group group`\
<span class="sans-serif">MPI_COMM_RANK</span> & `Comm` & `Get_rank` & `int rank`\
<span class="sans-serif">MPI_COMM_REMOTE_GROUP</span> & `Intercomm` & `Get_remote_group` & `Group group`\
<span class="sans-serif">MPI_COMM_REMOTE_SIZE</span> & `Intercomm` & `Get_remote_size` & `int size`\
<span class="sans-serif">MPI_COMM_SIZE</span> & `Comm` & `Get_size` & `int size`\
<span class="sans-serif">MPI_COMM_SPLIT</span> & `Intracomm` & `Split` & `Intracomm newcomm`\
<span class="sans-serif">MPI_COMM_TEST_INTER</span> & `Comm` & `Is_inter` & `bool flag`\
<span class="sans-serif">MPI_DIMS_CREATE</span> & & `Compute_dims` & void\

llll MPI Function & C++ class & Member name & Return value   <span class="sans-serif">MPI_ERRHANDLER_CREATE</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_ERRHANDLER_FREE</span> & `Errhandler` & `Free` & void\
<span class="sans-serif">MPI_ERRHANDLER_GET</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_ERRHANDLER_SET</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_ERROR_CLASS</span> & & `Get_error_class` & `int errorclass`\
<span class="sans-serif">MPI_ERROR_STRING</span> & & `Get_error_string` & void\
<span class="sans-serif">MPI_FINALIZE</span> & & `Finalize` & void\
<span class="sans-serif">MPI_GATHERV</span> & `Intracomm` & `Gatherv` & void\
<span class="sans-serif">MPI_GATHER</span> & `Intracomm` & `Gather` & void\
<span class="sans-serif">MPI_GET_COUNT</span> & `Status` & `Get_count` & `int count`\
<span class="sans-serif">MPI_GET_ELEMENTS</span> & `Status` & `Get_elements` & `int count`\
<span class="sans-serif">MPI_GET_PROCESSOR_NAME</span> & & `Get_processor_name` & void\
<span class="sans-serif">MPI_GRAPHDIMS_GET</span> & `Graphcomm` & `Get_dims` & void\
<span class="sans-serif">MPI_GRAPH_CREATE</span> & `Intracomm` & `Create_graph` & `Graphcomm newcomm`\
<span class="sans-serif">MPI_GRAPH_GET</span> & `Graphcomm` & `Get_topo` & void\
<span class="sans-serif">MPI_GRAPH_MAP</span> & `Graphcomm` & `Map` & `int newrank`\
<span class="sans-serif">MPI_GRAPH_NEIGHBORS_COUNT</span> & `Graphcomm` & `Get_neighbors_count` & `int nneighbors`\
<span class="sans-serif">MPI_GRAPH_NEIGHBORS</span> & `Graphcomm` & `Get_neighbors` & void\
<span class="sans-serif">MPI_GROUP_COMPARE</span> & `Group` & `static Compare` & `int result`\
<span class="sans-serif">MPI_GROUP_DIFFERENCE</span> & `Group` & `static Difference` & `Group newgroup`\
<span class="sans-serif">MPI_GROUP_EXCL</span> & `Group` & `Excl` & `Group newgroup`\
<span class="sans-serif">MPI_GROUP_FREE</span> & `Group` & `Free` & void\
<span class="sans-serif">MPI_GROUP_INCL</span> & `Group` & `Incl` & `Group newgroup`\
<span class="sans-serif">MPI_GROUP_INTERSECTION</span> & `Group` & `static Intersect` & `Group newgroup`\
<span class="sans-serif">MPI_GROUP_RANGE_EXCL</span> & `Group` & `Range_excl` & `Group newgroup`\
<span class="sans-serif">MPI_GROUP_RANGE_INCL</span> & `Group` & `Range_incl` & `Group newgroup`\
<span class="sans-serif">MPI_GROUP_RANK</span> & `Group` & `Get_rank` & `int rank`\
<span class="sans-serif">MPI_GROUP_SIZE</span> & `Group` & `Get_size` & `int size`\
<span class="sans-serif">MPI_GROUP_TRANSLATE_RANKS</span> & `Group` & `static Translate_ranks` & void\
<span class="sans-serif">MPI_GROUP_UNION</span> & `Group` & `static Union` & `Group newgroup`\
<span class="sans-serif">MPI_IBSEND</span> & `Comm` & `Ibsend` & `Request request`\
<span class="sans-serif">MPI_INITIALIZED</span> & & `Is_initialized` & `bool flag`\
<span class="sans-serif">MPI_INIT</span> & & `Init` & void\
<span class="sans-serif">MPI_INTERCOMM_CREATE</span> & `Intracomm` & `Create_intercomm`& `Intercomm newcomm`\
<span class="sans-serif">MPI_INTERCOMM_MERGE</span> & `Intercomm` & `Merge` & `Intracomm newcomm`\
<span class="sans-serif">MPI_IPROBE</span> & `Comm` & `Iprobe` & `bool flag`\
<span class="sans-serif">MPI_IRECV</span> & `Comm` & `Irecv` & `Request request`\
<span class="sans-serif">MPI_IRSEND</span> & `Comm` & `Irsend` & `Request request`\
<span class="sans-serif">MPI_ISEND</span> & `Comm` & `Isend` & `Request request`\
<span class="sans-serif">MPI_ISSEND</span> & `Comm` & `Issend` & `Request request`\
<span class="sans-serif">MPI_KEYVAL_CREATE</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_KEYVAL_FREE</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_OP_CREATE</span> & `Op` & `Init` & void\
<span class="sans-serif">MPI_OP_FREE</span> & `Op` & `Free` & void\
<span class="sans-serif">MPI_PACK_SIZE</span> & `Datatype` & `Pack_size` & `int size`\
<span class="sans-serif">MPI_PACK</span> & `Datatype` & `Pack` & void\

llll MPI Function & C++ class & Member name & Return value   <span class="sans-serif">MPI_PCONTROL</span> & & `Pcontrol` & void\
<span class="sans-serif">MPI_PROBE</span> & `Comm` & `Probe` & void\
<span class="sans-serif">MPI_RECV_INIT</span> & `Comm` & `Recv_init` & `Prequest request`\
<span class="sans-serif">MPI_RECV</span> & `Comm` & `Recv` & void\
<span class="sans-serif">MPI_REDUCE_SCATTER</span> & `Intracomm` & `Reduce_scatter` & void\
<span class="sans-serif">MPI_REDUCE</span> & `Intracomm` & `Reduce` & void\
<span class="sans-serif">MPI_REQUEST_FREE</span> & `Request` & `Free` & void\
<span class="sans-serif">MPI_RSEND_INIT</span> & `Comm` & `Rsend_init` & `Prequest request`\
<span class="sans-serif">MPI_RSEND</span> & `Comm` & `Rsend` & void  <span class="sans-serif">MPI_SCAN</span> & `Intracomm` & `Scan` & void\
<span class="sans-serif">MPI_SCATTERV</span> & `Intracomm` & `Scatterv` & void\
<span class="sans-serif">MPI_SCATTER</span> & `Intracomm` & `Scatter` & void\
<span class="sans-serif">MPI_SENDRECV_REPLACE</span> & `Comm` & `Sendrecv_replace` & void\
<span class="sans-serif">MPI_SENDRECV</span> & `Comm` & `Sendrecv` & void\
<span class="sans-serif">MPI_SEND_INIT</span> & `Comm` & `Send_init` & `Prequest request`\
<span class="sans-serif">MPI_SEND</span> & `Comm` & `Send` & void\
<span class="sans-serif">MPI_SSEND_INIT</span> & `Comm` & `Ssend_init` & `Prequest request`\
<span class="sans-serif">MPI_SSEND</span> & `Comm` & `Ssend` & void  <span class="sans-serif">MPI_STARTALL</span> & `Prequest` & `static Startall` & void\
<span class="sans-serif">MPI_START</span> & `Prequest` & `Start` & void\
<span class="sans-serif">MPI_TESTALL</span> & `Request` & `static Testall` & `bool flag`\
<span class="sans-serif">MPI_TESTANY</span> & `Request` & `static Testany` & `bool flag`\
<span class="sans-serif">MPI_TESTSOME</span> & `Request` & `static Testsome` & `int outcount`\
<span class="sans-serif">MPI_TEST_CANCELLED</span> & `Status` & `Is_cancelled` & `bool flag`\
<span class="sans-serif">MPI_TEST</span> & `Request` & `Test` & `bool flag`\
<span class="sans-serif">MPI_TOPO_TEST</span> & `Comm` & `Get_topo` & `int status`\
<span class="sans-serif">MPI_TYPE_COMMIT</span> & `Datatype` & `Commit` & `void`\
<span class="sans-serif">MPI_TYPE_CONTIGUOUS</span> & `Datatype` & `Create_contiguous` & `Datatype`\
<span class="sans-serif">MPI_TYPE_EXTENT</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_TYPE_FREE</span> & `Datatype` & `Free` & `void`\
<span class="sans-serif">MPI_TYPE_HINDEXED</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_TYPE_HVECTOR</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_TYPE_INDEXED</span> & `Datatype` & `Create_indexed` & `Datatype`\
<span class="sans-serif">MPI_TYPE_LB</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_TYPE_SIZE</span> & `Datatype` & `Get_size` & `int`\
<span class="sans-serif">MPI_TYPE_STRUCT</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_TYPE_UB</span> & & $`<`$none$`>`$ &\
<span class="sans-serif">MPI_TYPE_VECTOR</span> & `Datatype` & `Create_vector` & `Datatype`\
<span class="sans-serif">MPI_UNPACK</span> & `Datatype` & `Unpack` & void\
<span class="sans-serif">MPI_WAITALL</span> & `Request` & `static Waitall` & void\
<span class="sans-serif">MPI_WAITANY</span> & `Request` & `static Waitany` & `int index`\
<span class="sans-serif">MPI_WAITSOME</span> & `Request` & `static Waitsome` & `int outcount`\
<span class="sans-serif">MPI_WAIT</span> & `Request` & `Wait` & void\
<span class="sans-serif">MPI_WTICK</span> & & `Wtick` & `double wtick`\
<span class="sans-serif">MPI_WTIME</span> & & `Wtime` & `double wtime`\

