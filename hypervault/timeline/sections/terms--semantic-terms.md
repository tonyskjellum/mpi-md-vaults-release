---
title: "Semantic Terms"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Semantic Terms

Chapter **terms** · in [[versions/v13/sections/terms#Semantic Terms|MPI-1.3]], [[versions/v20/sections/terms#Semantic Terms|MPI-2.0]], [[versions/v21/sections/terms#Semantic Terms|MPI-2.1]], [[versions/v22/sections/terms#Semantic Terms|MPI-2.2]], [[versions/v30/sections/terms#Semantic Terms|MPI-3.0]], [[versions/v31/sections/terms#Semantic Terms|MPI-3.1]], [[versions/v40/sections/terms#Semantic Terms|MPI-4.0]], [[versions/v41/sections/terms#Semantic Terms|MPI-4.1]], [[versions/v50/sections/terms#Semantic Terms|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~When discussing MPI procedures the following semantic terms are used. The first two are usually applied to communication operations.~~

~~**nonblocking**   If the procedure may return before the operation completes, and before the user is allowed to re-use resources (such as buffers) specified in the call.~~

~~**blocking**   If return from the procedure indicates the user is allowed to re-use resources specified in the call.~~

~~**local**   If completion of the procedure depends only on the local executing process. Such an operation does not require communication with another user process.~~

~~**non-local**   If completion of the operation may require the execution of some MPI procedure on another process. Such an operation may require communication occurring with another user process.~~

~~**collective**   If all processes in a process group need to invoke the procedure.~~

==When discussing MPI procedures the following semantic terms are used.==

==**nonblocking**   A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[versions/v21/API/MPI_ISEND|MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e. a call to [[versions/v21/API/MPI_TEST|MPI_TEST]] will return `flag` = true. A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = true. This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is==

==**freed**, and becomes **inactive** if it was persistent.==

==A **communication completes** when all participating operations complete.==

==**blocking**   A procedure is blocking if return from the procedure indicates the user is allowed to reuse resources specified in the call.==

==**local**   A procedure is local if completion of the procedure depends only on the local executing process.==

==**non-local**   A procedure is non-local if completion of the operation may require the execution of some MPI procedure on another process. Such an operation may require communication occurring with another user process.==

==**collective**   A procedure is collective if all processes in a process group need to invoke the procedure. A collective call may or may not be synchronizing.==

==Collective calls over the same communicator==

==must be executed in the same order by all members of the process group.==

==**predefined**   A predefined datatype is a datatype with a predefined (constant) name (such as MPI_INT, MPI_FLOAT_INT, or MPI_UB) or a datatype constructed with [[versions/v21/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] , [[versions/v21/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] , or [[versions/v21/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] . The former are **named** whereas the latter are **unnamed**.==

==**derived**   A derived datatype is any datatype that is not predefined.==

==**portable**   A datatype is portable, if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v21/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v21/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v21/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] ,==

==[[versions/v21/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] ,==

==[[versions/v21/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v21/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v21/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v21/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v21/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v21/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.==

==**equivalent**   Two datatypes are equivalent if they appear to have been created with the same sequence of calls (and arguments) and thus have the same typemap. Two equivalent datatypes do not necessarily have the same cached attributes or the same names.==

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~**nonblocking**   A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[versions/v21/API/MPI_ISEND|MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e. a call to [[versions/v21/API/MPI_TEST|MPI_TEST]] will return `flag` = true. A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = true. This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is **freed**. A **communication completes** when all participating operations complete.~~

==**nonblocking**   A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[versions/v21/API/MPI_ISEND|MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e. a call to [[versions/v21/API/MPI_TEST|MPI_TEST]] will return `flag` = true. A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = true. This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is==

==**freed**, and becomes **inactive** if it was persistent.==

==A **communication completes** when all participating operations complete.==

~~**portable**   A datatype is portable, if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v21/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v21/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v21/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] , [[MPI_TYPE_INDEXED_BLOCK]] , [[versions/v21/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v21/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v21/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[MPI_TYPE_CREATE_HINDEXED, MPI_TYPE_CREATE_HVECTOR]] or [[versions/v21/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.~~

==**portable**   A datatype is portable, if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v21/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v21/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v21/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] ,==

==[[versions/v21/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] ,==

==[[versions/v21/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v21/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v21/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v21/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v21/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v21/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

**nonblocking** A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[versions/v22/API/MPI_ISEND|MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e. a call to [[versions/v22/API/MPI_TEST|MPI_TEST]] will return `flag` = ~~true.~~ ==`true`.== A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = ~~true.~~ ==`true`.== This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is

**predefined** A predefined datatype is a datatype with a predefined (constant) name (such as ~~MPI_INT, MPI_FLOAT_INT,~~ ==`MPI_INT`, `MPI_FLOAT_INT`,== or ~~MPI_UB)~~ ==`MPI_UB`)== or a datatype constructed with [[versions/v22/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] , [[versions/v22/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] , or [[versions/v22/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] . The former are **named** whereas the latter are **unnamed**.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~**nonblocking**   A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[versions/v30/API/MPI_ISEND|MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e. a call to [[versions/v30/API/MPI_TEST|MPI_TEST]] will return `flag` = `true`. A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = `true`. This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is~~

~~**freed**, and becomes **inactive** if it was persistent.~~

~~A **communication completes** when all participating operations complete.~~

==**nonblocking**   A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[versions/v30/API/MPI_ISEND|MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e., a call to [[versions/v30/API/MPI_TEST|MPI_TEST]] will return `flag` = `true`. A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = `true`. This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is==

==**freed**, and becomes **inactive** if it was persistent. A **communication completes** when all participating operations complete.==

~~**collective**   A procedure is collective if all processes in a process group need to invoke the procedure. A collective call may or may not be synchronizing.~~

~~Collective calls over the same communicator~~

~~must be executed in the same order by all members of the process group.~~

~~**predefined**   A predefined datatype is a datatype with a predefined (constant) name (such as `MPI_INT`, `MPI_FLOAT_INT`, or `MPI_UB`) or a datatype constructed with [[versions/v30/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] , [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] , or [[versions/v30/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] . The former are **named** whereas the latter are **unnamed**.~~

==**collective**   A procedure is collective if all processes in a process group need to invoke the procedure. A collective call may or may not be synchronizing. Collective calls over the same communicator must be executed in the same order by all members of the process group.==

==**predefined**   A predefined datatype is a datatype with a predefined (constant) name (such as `MPI_INT`, `MPI_FLOAT_INT`, or `MPI_PACKED`) or a datatype constructed with [[versions/v30/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] , [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] , or [[versions/v30/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] . The former are **named** whereas the latter are **unnamed**.==

~~**portable**   A datatype is portable, if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v30/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v30/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v30/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] ,~~

~~[[versions/v30/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] ,~~

~~[[versions/v30/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v30/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v30/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.~~

==**portable**   A datatype is portable if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v30/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v30/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v30/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] ,==

==[[versions/v30/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] , [[versions/v30/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v30/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v30/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] , [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~**nonblocking**   A procedure is nonblocking if the procedure may return before the operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. A nonblocking request is **started** by the call that initiates it, e.g., [[versions/v31/API/MPI_ISEND|MPI_ISEND]] . The word complete is used with respect to operations, requests, and communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated; i.e., a call to [[versions/v31/API/MPI_TEST|MPI_TEST]] will return `flag` = `true`. A **request is completed** by a call to wait, which returns, or a test or get status call which returns `flag` = `true`. This completing call has two effects: the status is extracted from the request; in the case of test and wait, if the request was nonpersistent, it is~~

~~**freed**, and becomes **inactive** if it was persistent. A **communication completes** when all participating operations complete.~~

==**nonblocking**   A procedure is nonblocking if it may return before the associated operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. The word complete is used with respect to operations and any associated requests and/or communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated.==

~~**portable**   A datatype is portable if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v31/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v31/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] ,~~

~~[[versions/v31/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] , [[versions/v31/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v31/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v31/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] , [[versions/v31/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.~~

==**portable**   A datatype is portable if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v31/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v31/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] , [[versions/v31/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] , [[versions/v31/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v31/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v31/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] , [[versions/v31/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~When discussing MPI procedures the following semantic terms are used.~~

~~**nonblocking**   A procedure is nonblocking if it may return before the associated operation completes, and before the user is allowed to reuse resources (such as buffers) specified in the call. The word complete is used with respect to operations and any associated requests and/or communications. An **operation completes** when the user is allowed to reuse resources, and any output buffers have been updated.~~

~~**blocking**   A procedure is blocking if return from the procedure indicates the user is allowed to reuse resources specified in the call.~~

~~**local**   A procedure is local if completion of the procedure depends only on the local executing process.~~

~~**non-local**   A procedure is non-local if completion of the operation may require the execution of some MPI procedure on another process. Such an operation may require communication occurring with another user process.~~

~~**collective**   A procedure is collective if all processes in a process group need to invoke the procedure. A collective call may or may not be synchronizing. Collective calls over the same communicator must be executed in the same order by all members of the process group.~~

~~**predefined**   A predefined datatype is a datatype with a predefined (constant) name (such as `MPI_INT`, `MPI_FLOAT_INT`, or `MPI_PACKED`) or a datatype constructed with [[versions/v40/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] , [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] , or [[versions/v40/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] . The former are **named** whereas the latter are **unnamed**.~~

~~**derived**   A derived datatype is any datatype that is not predefined.~~

~~**portable**   A datatype is portable if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v40/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v40/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v40/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] , [[versions/v40/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] , [[versions/v40/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v40/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v40/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v40/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v40/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] , [[versions/v40/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v40/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.~~

~~**equivalent**   Two datatypes are equivalent if they appear to have been created with the same sequence of calls (and arguments) and thus have the same typemap. Two equivalent datatypes do not necessarily have the same cached attributes or the same names.~~

==When discussing MPI procedures the following semantic terms are used. The term **message data buffer** refers to the send/receive buffer used in a communication procedure. The term **file data buffer** refers to the data buffers used by MPI I/O procedures. In this section we use the term **data buffer** and depending on the MPI procedure it will refer to message data buffer or file data buffer.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

When discussing MPI procedures the following semantic terms are used. The term **message data buffer** refers to the send/receive buffer used in a communication procedure. The term **file data buffer** refers to the data buffers used by MPI I/O procedures. In this section we use the term **data buffer** and depending on the MPI procedure it will refer to message data buffer or file data buffer. ==shows how the terms defined in this section apply to all operation-related MPI procedures.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Semantic Terms]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Semantic Terms]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Semantic Terms]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Semantic Terms]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Semantic Terms]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Semantic Terms]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Semantic Terms]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Semantic Terms]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Semantic Terms]]
