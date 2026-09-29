# Point-to-Point Communication



## Introduction



Sending and receiving of messages by processes is the basic MPI communication mechanism. The basic point-to-point communication operations are **send** and **receive**. Their use is illustrated in the example below.

    #include "mpi.h"
    main( argc, argv )
    int argc;
    char **argv;
    {
        char message[20];
        int myrank;
        MPI_Status status;
        MPI_Init( &argc, &argv );
        MPI_Comm_rank( MPI_COMM_WORLD, &myrank );
        if (myrank == 0)    /* code for process zero */
        {
            strcpy(message,"Hello, there");
            MPI_Send(message, strlen(message)+1, MPI_CHAR, 1, 99, MPI_COMM_WORLD);
        }
        else                /* code for process one */
        {
            MPI_Recv(message, 20, MPI_CHAR, 0, 99, MPI_COMM_WORLD, &status);
            printf("received :%s:\n", message);
        }
        MPI_Finalize();
    }

In this example, process zero (<span class="sans-serif">myrank = 0</span>) sends a message to process one using the **send** operation [[MPI_SEND]] . The operation specifies a **send buffer** in the sender memory from which the message data is taken. In the example above, the send buffer consists of the storage containing the variable <span class="sans-serif">message</span> in the memory of process zero. The location, size and type of the send buffer are specified by the first three parameters of the send operation. The message sent will contain the 13 characters of this variable. In addition, the send operation associates an **envelope** with the message. This envelope specifies the message destination and contains distinguishing information that can be used by the **receive** operation to select a particular message. The last three parameters of the send operation specify the envelope for the message sent.

Process one (<span class="sans-serif">myrank = 1</span>) receives this message with the **receive** operation [[MPI_RECV]] . The message to be received is selected according to the value of its envelope, and the message data is stored into the **receive buffer**. In the example above, the receive buffer consists of the storage containing the string <span class="sans-serif">message</span> in the memory of process one. The first three parameters of the receive operation specify the location, size and type of the receive buffer. The next three parameters are used for selecting the incoming message. The last parameter is used to return information on the message just received.

The next sections describe the blocking send and receive operations. We discuss send, receive, blocking communication semantics, type matching requirements, type conversion in heterogeneous environments, and more general communication modes. Nonblocking communication is addressed next, followed by channel-like constructs and send-receive operations. We then consider general datatypes that allow one to transfer efficiently heterogeneous and noncontiguous data. We conclude with the description of calls for explicit packing and unpacking of messages.

## Blocking Send and Receive Operations



### Blocking send



The syntax of the blocking send operation is given below.

![[API/MPI_SEND]]

The blocking semantics of this call are described in Sec. [[pt2pt#Communication Modes|Communication Modes]] .

### Message data



The send buffer specified by the `MPI_SEND` operation consists of `count` successive entries of the type indicated by `datatype`, starting with the entry at address `buf`. Note that we specify the message length in terms of number of *elements*, not number of *bytes*. The former is machine independent and closer to the application level.

The data part of the message consists of a sequence of `count` values, each of the type indicated by `datatype`. `count` may be zero, in which case the data part of the message is empty. The basic datatypes that can be specified for message data values correspond to the basic datatypes of the host language. Possible values of this argument for Fortran and the corresponding Fortran types are listed below.

| MPI datatype           | Fortran datatype   |
|:-----------------------|:-------------------|
| `MPI_INTEGER`          | `INTEGER`          |
| `MPI_REAL`             | `REAL`             |
| `MPI_DOUBLE_PRECISION` | `DOUBLE PRECISION` |
| `MPI_COMPLEX`          | `COMPLEX`          |
| `MPI_LOGICAL`          | `LOGICAL`          |
| `MPI_CHARACTER`        | `CHARACTER(1)`     |
| `MPI_BYTE`             |                    |
| `MPI_PACKED`           |                    |

Possible values for this argument for C and the corresponding C types are listed below.

| MPI datatype         | C datatype           |
|:---------------------|:---------------------|
| `MPI_CHAR`           | `signed char`        |
| `MPI_SHORT`          | `signed short int`   |
| `MPI_INT`            | `signed int`         |
| `MPI_LONG`           | `signed long int`    |
| `MPI_UNSIGNED_CHAR`  | `unsigned char`      |
| `MPI_UNSIGNED_SHORT` | `unsigned short int` |
| `MPI_UNSIGNED`       | `unsigned int`       |
| `MPI_UNSIGNED_LONG`  | `unsigned long int`  |
| `MPI_FLOAT`          | `float`              |
| `MPI_DOUBLE`         | `double`             |
| `MPI_LONG_DOUBLE`    | `long double`        |
| `MPI_BYTE`           |                      |
| `MPI_PACKED`         |                      |

The datatypes `MPI_BYTE` and `MPI_PACKED` do not correspond to a Fortran or C datatype. A value of type `MPI_BYTE` consists of a byte (8 binary digits). A byte is uninterpreted and is different from a character. Different machines may have different representations for characters, or may use more than one byte to represent characters. On the other hand, a byte has the same binary value on all machines. The use of the type `MPI_PACKED` is explained in Section [[pt2pt#Pack and unpack|Pack and unpack]] .

MPI requires support of the datatypes listed above, which match the basic datatypes of Fortran 77 and ANSI C. Additional MPI datatypes should be provided if the host language has additional data types: `MPI_LONG_LONG_INT`,

for C integers declared to be of type <span class="sans-serif">long long</span>; `MPI_DOUBLE_COMPLEX` for double precision complex in

Fortran declared to be of type `DOUBLE COMPLEX`;

`MPI_REAL2`, `MPI_REAL4` and `MPI_REAL8` for Fortran reals, declared to be of type `REAL*2`, `REAL*4` and `REAL*8`, respectively; `MPI_INTEGER1` `MPI_INTEGER2` and `MPI_INTEGER4` for Fortran integers, declared to be of type `INTEGER*1`, `INTEGER*2` and `INTEGER*4`, respectively; etc.

> [!tip] Rationale

> One goal of the design is to allow for MPI to be implemented as a library, with no need for additional preprocessing or compilation. Thus, one cannot assume that a communication call has information on the datatype of variables in the communication buffer; this information must be supplied by an explicit argument. The need for such datatype information will become clear in Section [[pt2pt#Data conversion|Data conversion]] .

### Message envelope



In addition to the data part, messages carry information that can be used to distinguish messages and selectively receive them. This information consists of a fixed number of fields, which we collectively call the **message envelope**. These fields are

source\
destination\
tag\
communicator

The message source is implicitly determined by the identity of the message sender. The other fields are specified by arguments in the send operation.

The message destination is specified by the `dest` argument.

The integer-valued message tag is specified by the `tag` argument. This integer can be used by the program to distinguish different types of messages. The range of valid tag values is <span class="sans-serif">0,...,UB</span>, where the value of <span class="sans-serif">UB</span> is implementation dependent. It can be found by querying the value of the attribute MPI_TAG_UB, as described in Chapter [[inquiry#MPI Environmental Management|MPI Environmental Management]] . MPI requires that <span class="sans-serif">UB</span> be no less than 32767.

The `comm` argument specifies the **communicator** that is used for the send operation. Communicators are explained in Chapter [[context#Groups, Contexts, and Communicators|Groups, Contexts, and Communicators]] ; below is a brief summary of their usage.

A communicator specifies the communication context for a communication operation. Each communication context provides a separate “communication universe:” messages are always received within the context they were sent, and messages sent in different contexts do not interfere.

The communicator also specifies the set of processes that share this communication context. This **process group** is ordered and processes are identified by their rank within this group. Thus, the range of valid values for `dest` is <span class="sans-serif">0, ... , n-1</span>, where <span class="sans-serif">n</span> is the number of processes in the group. (If the communicator is an inter-communicator, then destinations are identified by their rank in the remote group. See Chapter [[context#Groups, Contexts, and Communicators|Groups, Contexts, and Communicators]] .)

A predefined communicator MPI_COMM_WORLD is provided by MPI. It allows communication with all processes that are accessible after MPI initialization and processes are identified by their rank in the group of MPI_COMM_WORLD.

> [!note] Advice to users

> Users that are comfortable with the notion of a flat name space for processes, and a single communication context, as offered by most existing communication libraries, need only use the predefined variable MPI_COMM_WORLD as the `comm` argument. This will allow communication with all the processes available at initialization time.
>
> Users may define new communicators, as explained in Chapter [[context#Groups, Contexts, and Communicators|Groups, Contexts, and Communicators]] . Communicators provide an important encapsulation mechanism for libraries and modules. They allow modules to have their own disjoint communication universe and their own process numbering scheme.

> [!warning] Advice to implementors

> The message envelope would normally be encoded by a fixed-length message header. However, the actual encoding is implementation dependent. Some of the information (e.g., source or destination) may be implicit, and need not be explicitly carried by messages. Also, processes may be identified by relative ranks, or absolute ids, etc.

### Blocking receive



The syntax of the blocking receive operation is given below.

![[API/MPI_RECV]]

The blocking semantics of this call are described in Sec. [[pt2pt#Communication Modes|Communication Modes]] .

The receive buffer consists of the storage containing `count` consecutive elements of the type specified by `datatype`, starting at address `buf`. The length of the received message must be less than or equal to the length of the receive buffer. An overflow error occurs if all incoming data does not fit, without truncation, into the receive buffer.

If a message that is shorter than the receive buffer arrives, then only those locations corresponding to the (shorter) message are modified.

> [!note] Advice to users

> The [[MPI_PROBE]] function described in Section [[pt2pt#Probe and Cancel|Probe and Cancel]] can be used to receive messages of unknown length.

> [!warning] Advice to implementors

> Even though no specific behavior is mandated by MPI for erroneous programs, the recommended handling of overflow situations is to return in `status` information about the source and tag of the incoming message. The receive operation will return an error code. A quality implementation will also ensure that no memory that is outside the receive buffer will ever be overwritten.
>
> In the case of a message shorter than the receive buffer, MPI is quite strict in that it allows no modification of the other locations. A more lenient statement would allow for some optimizations but this is not allowed. The implementation must be ready to end a copy into the receiver memory exactly at the end of the receive buffer, even if it is an odd address.

The selection of a message by a receive operation is governed by the value of the message envelope. A message can be received by a receive operation if its envelope matches the `source`, `tag` and `comm` values specified by the receive operation. The receiver may specify a wildcard MPI_ANY_SOURCE value for `source`, and/or a wildcard MPI_ANY_TAG value for `tag`, indicating that any source and/or tag are acceptable. It cannot specify a wildcard value for `comm`. Thus, a message can be received by a receive operation only if it is addressed to the receiving process, has a matching communicator, has matching source unless source= MPI_ANY_SOURCE in the pattern, and has a matching tag unless tag= MPI_ANY_TAG in the pattern.

The message tag is specified by the `tag` argument of the receive operation. The argument `source`, if different from MPI_ANY_SOURCE, is specified as a rank within the process group associated with that same communicator (remote process group, for intercommunicators). Thus, the range of valid values for the `source` argument is {0,...,n-1}$`\cup`$ {MPI_ANY_SOURCE}, where <span class="sans-serif">n</span> is the number of processes in this group.

Note the asymmetry between send and receive operations: A receive operation may accept messages from an arbitrary sender, on the other hand, a send operation must specify a unique receiver. This matches a “push” communication mechanism, where data transfer is effected by the sender (rather than a “pull” mechanism, where data transfer is effected by the receiver).

Source = destination is allowed, that is, a process can send a message to itself. (However, it is unsafe to do so with the blocking send and receive operations described above, since this may lead to deadlock. See Sec. [[pt2pt#Semantics of point-to-point communication|Semantics of point-to-point communication]] .)

> [!warning] Advice to implementors

> Message context and other communicator information can be implemented as an additional tag field. It differs from the regular message tag in that wild card matching is not allowed on this field, and that value setting for this field is controlled by communicator manipulation functions.

### Return status



The source or tag of a received message may not be known if wildcard values were used in the receive operation.

Also, if multiple requests are completed by a single MPI function (see Section [[pt2pt#Multiple Completions|Multiple Completions]] ), a distinct error code may need to be returned for each request. The information is returned by the `status` argument of [[MPI_RECV]] . The type of `status` is MPI-defined. Status variables need to be explicitly allocated by the user, that is, they are not system objects.

In C, `status` is a structure that contains three fields named MPI_SOURCE, MPI_TAG, and MPI_ERROR; the structure may contain additional fields. Thus, `status.MPI_SOURCE`, `status.MPI_TAG` and `status.MPI_ERROR` contain the source, tag, and error code, respectively, of the received message.

In Fortran, `status` is an array of `INTEGER`s of size MPI_STATUS_SIZE. The constants MPI_SOURCE, MPI_TAG and MPI_ERROR are the indices of the entries that store the source, tag and error fields. Thus, `status(MPI_SOURCE)`, `status(MPI_TAG)` and `status(MPI_ERROR)` contain, respectively, the source, tag and error code of the received message.

In general, message passing calls do not modify the value of the error code field of status variables. This field may be updated only by the functions in Section [[pt2pt#Multiple Completions|Multiple Completions]] which return multiple statuses. The field is updated if and only if such function returns with an error code of MPI_ERR_IN_STATUS.

> [!tip] Rationale

> The error field in status is not needed for calls that return only one status, such as `MPI_WAIT`, since that would only duplicate the information returned by the function itself. The current design avoids the additional overhead of setting it, in such cases. The field is needed for calls that return multiple statuses, since each request may have had a different failure.

The status argument also returns information on the length of the message received. However, this information is not directly available as a field of the status variable and a call to [[MPI_GET_COUNT]] is required to “decode” this information.

![[API/MPI_GET_COUNT]]

Returns the number of entries received. (Again, we count *entries*, each of type *datatype*, not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable. (We shall later see, in Section [[pt2pt#Use of general datatypes in communication|Use of general datatypes in communication]] , that [[MPI_GET_COUNT]] may return, in certain situations, the value MPI_UNDEFINED.)

> [!tip] Rationale

> Some message passing libraries use `INOUT` `count`, `tag` and `source` arguments, thus using them both to specify the selection criteria for incoming messages and return the actual envelope values of the received message. The use of a separate status argument prevents errors that are often attached with `INOUT` argument (e.g., using the MPI_ANY_TAG constant as the tag in a receive). Some libraries use calls that refer implicitly to the “last message received.” This is not thread safe.
>
> The `datatype` argument is passed to `MPI_GET_COUNT` so as to improve performance. A message might be received without counting the number of elements it contains, and the count value is often not needed. Also, this allows the same function to be used after a call to
>
> `MPI_PROBE` or `MPI_IPROBE`. With a status from `MPI_PROBE` or `MPI_IPROBE`, the same datatypes are allowed as in a call to `MPI_RECV` to receive this message.

> [!note] Advice to users

> The buffer size required for the receive can be affected by data conversions and by the stride of the receive datatype. In most cases, the safest approach is to use the same datatype with `MPI_GET_COUNT` and the receive.

All send and receive operations use the `buf`, `count`,`datatype`, `source`, `dest`, `tag`, `comm` and `status` arguments in the same way as the blocking `MPI_SEND` and `MPI_RECV` operations described in this section.

## Data type matching and data conversion

### Type matching rules



One can think of message transfer as consisting of the following three phases.

1.  Data is pulled out of the send buffer and a message is assembled.

2.  A message is transferred from sender to receiver.

3.  Data is pulled from the incoming message and disassembled into the receive buffer.

Type matching has to be observed at each of these three phases: The type of each variable in the sender buffer has to match the type specified for that entry by the send operation; the type specified by the send operation has to match the type specified by the receive operation; and the type of each variable in the receive buffer has to match the type specified for that entry by the receive operation. A program that fails to observe these three rules is erroneous.

To define type matching more precisely, we need to deal with two issues: matching of types of the host language with types specified in communication operations; and matching of types at sender and receiver.

The types of a send and receive match (phase two) if both operations use identical names. That is, `MPI_INTEGER` matches `MPI_INTEGER`, `MPI_REAL` matches `MPI_REAL`, and so on. There is one exception to this rule, discussed in Sec. [[pt2pt#Pack and unpack|Pack and unpack]] , the type `MPI_PACKED` can match any other type.

The type of a variable in a host program matches the type specified in the communication operation if the datatype name used by that operation corresponds to the basic type of the host program variable. For example, an entry with type name `MPI_INTEGER` matches a Fortran variable of type `INTEGER`. A table giving this correspondence for Fortran and C appears in Sec. [[pt2pt#Message data|Message data]] . There are two exceptions to this last rule: an entry with type name `MPI_BYTE` or `MPI_PACKED` can be used to match any byte of storage (on a byte-addressable machine), irrespective of the datatype of the variable that contains this byte. The type `MPI_PACKED` is used to send data that has been explicitly packed, or receive data that will be explicitly unpacked, see Section [[pt2pt#Pack and unpack|Pack and unpack]] . The type `MPI_BYTE` allows one to transfer the binary value of a byte in memory unchanged.

To summarize, the type matching rules fall into the three categories below.

- Communication of typed values (e.g., with datatype different from `MPI_BYTE`), where the datatypes of the corresponding entries in the sender program, in the send call, in the receive call and in the receiver program must all match.

- Communication of untyped values (e.g., of datatype `MPI_BYTE`), where both sender and receiver use the datatype `MPI_BYTE`. In this case, there are no requirements on the types of the corresponding entries in the sender and the receiver programs, nor is it required that they be the same.

- Communication involving packed data, where `MPI_PACKED` is used.

The following examples illustrate the first two cases.

 Sender and receiver specify matching types.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank.EQ.0) THEN
        CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr)
    ELSE
        CALL MPI_RECV(b(1), 15, MPI_REAL, 0, tag, comm, status, ierr)
    END IF

This code is correct if both <span class="sans-serif">a</span> and <span class="sans-serif">b</span> are real arrays of size $`\ge 10`$. (In Fortran, it might be correct to use this code even if <span class="sans-serif">a</span> or <span class="sans-serif">b</span> have size $`< 10`$: e.g., when <span class="sans-serif">a(1)</span> can be equivalenced to an array with ten reals.)

 Sender and receiver do not specify matching types.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank.EQ.0) THEN
        CALL MPI_SEND(a(1), 10, MPI_REAL, 1, tag, comm, ierr)
    ELSE
        CALL MPI_RECV(b(1), 40, MPI_BYTE, 0, tag, comm, status, ierr)
    END IF

This code is erroneous, since sender and receiver do not provide matching datatype arguments.

 Sender and receiver specify communication of untyped values.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank.EQ.0) THEN
        CALL MPI_SEND(a(1), 40, MPI_BYTE, 1, tag, comm, ierr)
    ELSE
        CALL MPI_RECV(b(1), 60, MPI_BYTE, 0, tag, comm, status, ierr)
    END IF

This code is correct, irrespective of the type and size of <span class="sans-serif">a</span> and <span class="sans-serif">b</span> (unless this results in an out of bound memory access).

> [!note] Advice to users

> If a buffer of type MPI_BYTE is passed as an argument to [[MPI_SEND]] , then MPI will send the data stored at contiguous locations, starting from the address indicated by the `buf` argument. This may have unexpected results when the data layout is not as a casual user would expect it to be. For example, some Fortran compilers implement variables of type CHARACTER as a structure that contains the character length and a pointer to the actual string. In such an environment, sending and receiving a Fortran CHARACTER variable using the MPI_BYTE type will not have the anticipated result of transferring the character string. For this reason, the user is advised to use typed communications whenever possible.

#### Type MPI_CHARACTER

The type `MPI_CHARACTER` matches one character of a Fortran variable of type `CHARACTER`, rather then the entire character string stored in the variable. Fortran variables of type CHARACTER or substrings are transferred as if they were arrays of characters. This is illustrated in the example below.

 Transfer of Fortran CHARACTERs.

    CHARACTER*10 a
    CHARACTER*10 b

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank.EQ.0) THEN
        CALL MPI_SEND(a, 5, MPI_CHARACTER, 1, tag, comm, ierr)
    ELSE
        CALL MPI_RECV(b(6:10), 5, MPI_CHARACTER, 0, tag, comm, status, ierr)
    END IF

The last five characters of string b at process 1 are replaced by the first five characters of string a at process 0.

> [!tip] Rationale

> The alternative choice would be for `MPI_CHARACTER` to match a character of arbitrary length. This runs into problems.
>
> A Fortran character variable is a constant length string, with no special termination symbol. There is no fixed convention on how to represent characters, and how to store their length. Some compilers pass a character argument to a routine as a pair of arguments, one holding the address of the string and the other holding the length of string. Consider the case of an MPI communication call that is passed a communication buffer with type defined by a derived datatype (Section [[pt2pt#Derived datatypes|Derived datatypes]] ). If this communicator buffer contains variables of type `CHARACTER` then the information on their length will not be passed to the MPI routine.
>
> This problem forces us to provide explicit information on character length with the MPI call. One could add a length parameter to the type `MPI_CHARACTER`, but this does not add much convenience and the same functionality can be achieved by defining a suitable derived datatype.

> [!warning] Advice to implementors

> Some compilers pass Fortran CHARACTER arguments as a structure with a length and a pointer to the actual string. In such an environment, the MPI call needs to dereference the pointer in order to reach the string.

### Data conversion



One of the goals of MPI is to support parallel computations across heterogeneous environments. Communication in a heterogeneous environment may require data conversions. We use the following terminology.

type conversion  
changes the datatype of a value, e.g., by rounding a `REAL` to an `INTEGER`.

representation conversion  
changes the binary representation of a value, e.g., from Hex floating point to IEEE floating point.

The type matching rules imply that MPI communication never entails type conversion. On the other hand, MPI requires that a representation conversion be performed when a typed value is transferred across environments that use different representations for the datatype of this value. MPI does not specify rules for representation conversion. Such conversion is expected to preserve integer, logical or character values, and to convert a floating point value to the nearest value that can be represented on the target system.

Overflow and underflow exceptions may occur during floating point conversions. Conversion of integers or characters may also lead to exceptions when a value that can be represented in one system cannot be represented in the other system. An exception occurring during representation conversion results in a failure of the communication. An error occurs either in the send operation, or the receive operation, or both.

If a value sent in a message is untyped (i.e., of type `MPI_BYTE`), then the binary representation of the byte stored at the receiver is identical to the binary representation of the byte loaded at the sender. This holds true, whether sender and receiver run in the same or in distinct environments. No representation conversion is required. (Note that representation conversion may occur when values of type `MPI_CHARACTER` or `MPI_CHAR` are transferred, for example, from an EBCDIC encoding to an ASCII encoding.)

No conversion need occur when an MPI program executes in a homogeneous system, where all processes run in the same environment.

Consider the three examples, [[pt2pt-exA]] – [[pt2pt-exC]] . The first program is correct, assuming that <span class="sans-serif">a</span> and <span class="sans-serif">b</span> are `REAL` arrays of size $`\ge 10`$. If the sender and receiver execute in different environments, then the ten real values that are fetched from the send buffer will be converted to the representation for reals on the receiver site before they are stored in the receive buffer. While the number of real elements fetched from the send buffer equal the number of real elements stored in the receive buffer, the number of bytes stored need not equal the number of bytes loaded. For example, the sender may use a four byte representation and the receiver an eight byte representation for reals.

The second program is erroneous, and its behavior is undefined.

The third program is correct. The exact same sequence of forty bytes that were loaded from the send buffer will be stored in the receive buffer, even if sender and receiver run in a different environment. The message sent has exactly the same length (in bytes) and the same binary representation as the message received. If <span class="sans-serif">a</span> and <span class="sans-serif">b</span> are of different types, or if they are of the same type but different data representations are used, then the bits stored in the receive buffer may encode values that are different from the values they encoded in the send buffer.

Data representation conversion also applies to the envelope of a message: source, destination and tag are all integers that may need to be converted.

> [!warning] Advice to implementors

> The current definition does not require messages to carry data type information. Both sender and receiver provide complete data type information. In a heterogeneous environment, one can either use a machine independent encoding such as XDR, or have the receiver convert from the sender representation to its own, or even have the sender do the conversion.
>
> Additional type information might be added to messages in order to allow the system to detect mismatches between datatype at sender and receiver. This might be particularly useful in a slower but safer debug mode.

MPI does not require support for inter-language communication. The behavior of a program is undefined if messages are sent by a C process and received by a Fortran process, or vice-versa.

> [!tip] Rationale

> MPI does not handle inter-language communication because there are no agreed standards for the correspondence between C types and Fortran types. Therefore, MPI programs that mix languages would not port.

> [!warning] Advice to implementors

> MPI implementors may want to support inter-language communication by allowing Fortran programs to use “C MPI types,” such as MPI_INT, MPI_CHAR, etc., and allowing C programs to use Fortran types.

## Communication Modes

 The send call described in Section [[pt2pt#Blocking send|Blocking send]] is **blocking**: it does not return until the message data and envelope have been safely stored away so that the sender is free to access and overwrite the send buffer. The message might be copied directly into the matching receive buffer, or it might be copied into a temporary system buffer.

Message buffering decouples the send and receive operations. A blocking send can complete as soon as the message was buffered, even if no matching receive has been executed by the receiver. On the other hand, message buffering can be expensive, as it entails additional memory-to-memory copying, and it requires the allocation of memory for buffering. MPI offers the choice of several communication modes that allow one to control the choice of the communication protocol.

The send call described in Section [[pt2pt#Blocking send|Blocking send]] used the **standard** communication mode. In this mode, it is up to MPI to decide whether outgoing messages will be buffered. MPI may buffer outgoing messages. In such a case, the send call may complete before a matching receive is invoked. On the other hand, buffer space may be unavailable, or MPI may choose not to buffer outgoing messages, for performance reasons. In this case, the send call will not complete until a matching receive has been posted, and the data has been moved to the receiver.

Thus, a send in standard mode can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. The standard mode send is **non-local**: successful completion of the send operation may depend on the occurrence of a matching receive.

> [!tip] Rationale

> The reluctance of MPI to mandate whether standard sends are buffering or not stems from the desire to achieve portable programs. Since any system will run out of buffer resources as message sizes are increased, and some implementations may want to provide little buffering, MPI takes the position that correct (and therefore, portable) programs do not rely on system buffering in standard mode. Buffering may improve the performance of a correct program, but it doesn’t affect the result of the program. If the user wishes to guarantee a certain amount of buffering, the user-provided buffer system of Sec. [[pt2pt#Buffer allocation and usage|Buffer allocation and usage]] should be used, along with the buffered-mode send.

There are three additional communication modes.

A **buffered** mode send operation can be started whether or not a matching receive has been posted. It may complete before a matching receive is posted. However, unlike the standard send, this operation is **local**, and its completion does not depend on the occurrence of a matching receive. Thus, if a send is executed and no matching receive is posted, then MPI must buffer the outgoing message, so as to allow the send call to complete. An error will occur if there is insufficient buffer space. The amount of available buffer space is controlled by the user — see Section [[pt2pt#Buffer allocation and usage|Buffer allocation and usage]] . Buffer allocation by the user may be required for the buffered mode to be effective.

A send that uses the **synchronous** mode can be started whether or not a matching receive was posted. However, the send will complete successfully only if a matching receive is posted, and the receive operation has started to receive the message sent by the synchronous send. Thus, the completion of a synchronous send not only indicates that the send buffer can be reused, but also indicates that the receiver has reached a certain point in its execution, namely that it has started executing the matching receive. If both sends and receives are blocking operations then the use of the synchronous mode provides synchronous communication semantics: a communication does not complete at either end before both processes rendezvous at the communication. A send executed in this mode is **non-local**.

A send that uses the **ready** communication mode may be started *only* if the matching receive is already posted. Otherwise, the operation is erroneous and its outcome is undefined. On some systems, this allows the removal of a hand-shake operation that is otherwise required and results in improved performance. The completion of the send operation does not depend on the status of a matching receive, and merely indicates that the send buffer can be reused. A send operation that uses the ready mode has the same semantics as a standard send operation, or a synchronous send operation; it is merely that the sender provides additional information to the system (namely that a matching receive is already posted), that can save some overhead. In a correct program, therefore, a ready send could be replaced by a standard send with no effect on the behavior of the program other than performance.

Three additional send functions are provided for the three additional communication modes. The communication mode is indicated by a one letter prefix: <span class="sans-serif">B</span> for buffered, <span class="sans-serif">S</span> for synchronous, and <span class="sans-serif">R</span> for ready.

![[API/MPI_BSEND]]

Send in buffered mode.

![[API/MPI_SSEND]]

Send in synchronous mode.

![[API/MPI_RSEND]]

Send in ready mode.

There is only one receive operation, which can match any of the send modes. The receive operation described in the last section is **blocking**: it returns only after the receive buffer contains the newly received message. A receive can complete before the matching send has completed (of course, it can complete only after the matching send has started).

In a multi-threaded implementation of MPI, the system may de-schedule a thread that is blocked on a send or receive operation, and schedule another thread for execution in the same address space. In such a case it is the user’s responsibility not to access or modify a communication buffer until the communication completes. Otherwise, the outcome of the computation is undefined.

> [!tip] Rationale

> We prohibit read accesses to a send buffer while it is being used, even though the send operation is not supposed to alter the content of this buffer. This may seem more stringent than necessary, but the additional restriction causes little loss of functionality and allows better performance on some systems — consider the case where data transfer is done by a DMA engine that is not cache-coherent with the main processor.

> [!warning] Advice to implementors

> Since a synchronous send cannot complete before a matching receive is posted, one will not normally buffer messages sent by such an operation.
>
> It is recommended to choose buffering over blocking the sender, whenever possible, for standard sends. The programmer can signal his or her preference for blocking the sender until a matching receive occurs by using the synchronous send mode.
>
> A possible communication protocol for the various communication modes is outlined below.
>
> <span class="sans-serif">ready send</span>: The message is sent as soon as possible.
>
> <span class="sans-serif">synchronous send:</span> The sender sends a request-to-send message. The receiver stores this request. When a matching receive is posted, the receiver sends back a permission-to-send message, and the sender now sends the message.
>
> <span class="sans-serif">standard send:</span> First protocol may be used for short messages, and second protocol for long messages.
>
> <span class="sans-serif">buffered send:</span> The sender copies the message into a buffer and then sends it with a nonblocking send (using the same protocol as for standard send).
>
> Additional control messages might be needed for flow control and error recovery. Of course, there are many other possible protocols.
>
> Ready send can be implemented as a standard send. In this case there will be no performance advantage (or disadvantage) for the use of ready send.
>
> A standard send can be implemented as a synchronous send. In such a case, no data buffering is needed. However, many (most?) users expect some buffering.
>
> In a multi-threaded environment, the execution of a blocking communication should block only the executing thread, allowing the thread scheduler to de-schedule this thread and schedule another thread for execution.

## Semantics of point-to-point communication



A valid MPI implementation guarantees certain general properties of point-to-point communication, which are described in this section.

##### Order

Messages are *non-overtaking*: If a sender sends two messages in succession to the same destination, and both match the same receive, then this operation cannot receive the second message if the first one is still pending. If a receiver posts two receives in succession, and both match the same message, then the second receive operation cannot be satisfied by this message, if the first one is still pending. This requirement facilitates matching of sends to receives. It guarantees that message-passing code is deterministic, if processes are single-threaded and the wildcard MPI_ANY_SOURCE is not used in receives. (Some of the calls described later, such as [[MPI_CANCEL]] or [[MPI_WAITANY]] , are additional sources of nondeterminism.)

If a process has a single thread of execution, then any two communications executed by this process are ordered. On the other hand, if the process is multi-threaded, then the semantics of thread execution may not define a relative order between two send operations executed by two distinct threads. The operations are logically concurrent, even if one physically precedes the other. In such a case, the two messages sent can be received in any order. Similarly, if two receive operations that are logically concurrent receive two successively sent messages, then the two messages can match the two receives in either order.

 An example of non-overtaking messages.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (rank.EQ.0) THEN
        CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag, comm, ierr)
        CALL MPI_BSEND(buf2, count, MPI_REAL, 1, tag, comm, ierr)
    ELSE    ! rank.EQ.1
        CALL MPI_RECV(buf1, count, MPI_REAL, 0, MPI_ANY_TAG, comm, status, ierr)
        CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag, comm, status, ierr)
    END IF

The message sent by the first send must be received by the first receive, and the message sent by the second send must be received by the second receive.

##### Progress

If a pair of matching send and receives have been initiated on two processes, then at least one of these two operations will complete, independently of other actions in the system: the send operation will complete, unless the receive is satisfied by another message, and completes; the receive operation will complete, unless the message sent is consumed by another matching receive that was posted at the same destination process.

 An example of two, intertwined matching pairs.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (rank.EQ.0) THEN
        CALL MPI_BSEND(buf1, count, MPI_REAL, 1, tag1, comm, ierr)
        CALL MPI_SSEND(buf2, count, MPI_REAL, 1, tag2, comm, ierr)
    ELSE    ! rank.EQ.1
        CALL MPI_RECV(buf1, count, MPI_REAL, 0, tag2, comm, status, ierr)
        CALL MPI_RECV(buf2, count, MPI_REAL, 0, tag1, comm, status, ierr)
    END IF

Both processes invoke their first communication call. Since the first send of process zero uses the buffered mode, it must complete, irrespective of the state of process one. Since no matching receive is posted, the message will be copied into buffer space. (If insufficient buffer space is available, then the program will fail.) The second send is then invoked. At that point, a matching pair of send and receive operation is enabled, and both operations must complete. Process one next invokes its second receive call, which will be satisfied by the buffered message. Note that process one received the messages in the reverse order they were sent.

##### Fairness

MPI makes no guarantee of *fairness* in the handling of communication. Suppose that a send is posted. Then it is possible that the destination process repeatedly posts a receive that matches this send, yet the message is never received, because it is each time overtaken by another message, sent from another source. Similarly, suppose that a receive was posted by a multi-threaded process. Then it is possible that messages that match this receive are repeatedly received, yet the receive is never satisfied, because it is overtaken by other receives posted at this node (by other executing threads). It is the programmer’s responsibility to prevent starvation in such situations.

##### Resource limitations

Any pending communication operation consumes system resources that are limited. Errors may occur when lack of resources prevent the execution of an MPI call. A quality implementation will use a (small) fixed amount of resources for each pending send in the ready or synchronous mode and for each pending receive. However, buffer space may be consumed to store messages sent in standard mode, and must be consumed to store messages sent in buffered mode, when no matching receive is available. The amount of space available for buffering will be much smaller than program data memory on many systems. Then, it will be easy to write programs that overrun available buffer space.

MPI allows the user to provide buffer memory for messages sent in the buffered mode. Furthermore, MPI specifies a detailed operational model for the use of this buffer. An MPI implementation is required to do no worse than implied by this model. This allows users to avoid buffer overflows when they use buffered sends. Buffer allocation and use is described in Section [[pt2pt#Buffer allocation and usage|Buffer allocation and usage]] .

A buffered send operation that cannot complete because of a lack of buffer space is erroneous. When such a situation is detected, an error is signalled that may cause the program to terminate abnormally. On the other hand, a standard send operation that cannot complete because of lack of buffer space will merely block, waiting for buffer space to become available or for a matching receive to be posted. This behavior is preferable in many situations. Consider a situation where a producer repeatedly produces new values and sends them to a consumer. Assume that the producer produces new values faster than the consumer can consume them. If buffered sends are used, then a buffer overflow will result. Additional synchronization has to be added to the program so as to prevent this from occurring. If standard sends are used, then the producer will be automatically throttled, as its send operations will block when buffer space is unavailable.

In some situations, a lack of buffer space leads to deadlock situations. This is illustrated by the examples below.

 An exchange of messages.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (rank.EQ.0) THEN
        CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr)
        CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr)
    ELSE    ! rank.EQ.1
        CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr)
        CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr)
    END IF

This program will succeed even if no buffer space for data is available. The standard send operation can be replaced, in this example, with a synchronous send.

 An attempt to exchange messages.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (rank.EQ.0) THEN
        CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr)
        CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr)
    ELSE    ! rank.EQ.1
        CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr)
        CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr)
    END IF

The receive operation of the first process must complete before its send, and can complete only if the matching send of the second processor is executed. The receive operation of the second process must complete before its send and can complete only if the matching send of the first process is executed. This program will always deadlock. The same holds for any other send mode.

 An exchange that relies on buffering.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (rank.EQ.0) THEN
        CALL MPI_SEND(sendbuf, count, MPI_REAL, 1, tag, comm, ierr)
        CALL MPI_RECV(recvbuf, count, MPI_REAL, 1, tag, comm, status, ierr)
    ELSE    ! rank.EQ.1
        CALL MPI_SEND(sendbuf, count, MPI_REAL, 0, tag, comm, ierr)
        CALL MPI_RECV(recvbuf, count, MPI_REAL, 0, tag, comm, status, ierr)
    END IF

The message sent by each process has to be copied out before the send operation returns and the receive operation starts. For the program to complete, it is necessary that at least one of the two messages sent be buffered. Thus, this program can succeed only if the communication system can buffer at least `count` words of data.

> [!note] Advice to users

> When standard send operations are used, then a deadlock situation may occur where both processes are blocked because buffer space is not available. The same will certainly happen, if the synchronous mode is used. If the buffered mode is used, and not enough buffer space is available, then the program will not complete either. However, rather than a deadlock situation, we shall have a buffer overflow error.
>
> A program is “safe” if no message buffering is required for the program to complete. One can replace all sends in such program with synchronous sends, and the program will still run correctly. This conservative programming style provides the best portability, since program completion does not depend on the amount of buffer space available or in the communication protocol used.
>
> Many programmers prefer to have more leeway and be able to use the “unsafe” programming style shown in example [[pt2pt-exI]] . In such cases, the use of standard sends is likely to provide the best compromise between performance and robustness: quality implementations will provide sufficient buffering so that “common practice” programs will not deadlock. The buffered send mode can be used for programs that require more buffering, or in situations where the programmer wants more control. This mode might also be used for debugging purposes, as buffer overflow conditions are easier to diagnose than deadlock conditions.
>
> Nonblocking message-passing operations, as described in Section [[pt2pt#Nonblocking communication|Nonblocking communication]] , can be used to avoid the need for buffering outgoing messages. This prevents deadlocks due to lack of buffer space, and improves performance, by allowing overlap of computation and communication, and avoiding the overheads of allocating buffers and copying messages into buffers.

## Buffer allocation and usage



A user may specify a buffer to be used for buffering messages sent in buffered mode. Buffering is done by the sender.

![[API/MPI_BUFFER_ATTACH]]

Provides to MPI a buffer in the user’s memory to be used for buffering outgoing messages. The buffer is used only by messages sent in buffered mode. Only one buffer can be attached to a process at a time.

![[API/MPI_BUFFER_DETACH]]

Detach the buffer currently associated with MPI. The call returns the address and the size of the detached buffer. This operation will block until all messages currently in the buffer have been transmitted. Upon return of this function, the user may reuse or deallocate the space taken by the buffer.

Z Calls to attach and detach buffers.

    #define BUFFSIZE 10000
    int size
    char *buff;
    MPI_Buffer_attach( malloc(BUFFSIZE), BUFFSIZE);
    /* a buffer of 10000 bytes can now be used by MPI_Bsend */
    MPI_Buffer_detach( &buff, &size);
    /* Buffer size reduced to zero */
    MPI_Buffer_attach( buff, size);
    /* Buffer of 10000 bytes available again */

> [!note] Advice to users

> Even though the C functions `MPI_Buffer_attach` and `MPI_Buffer_detach` both have a first argument of type void\*, these arguments are used differently: A pointer to the buffer is passed to `MPI_Buffer_attach`; the address of the pointer is passed to `MPI_Buffer_detach`, so that this call can return the pointer value.

> [!tip] Rationale

> Both arguments are defined to be of type void\* (rather than void\* and void\*\*, respectively), so as to avoid complex type casts. E.g., in the last example, `&buff`, which is of type char\*\*, can be passed as argument to [[MPI_Buffer_detach]] without type casting. If the formal parameter had type void\*\* then we would need a type cast before and after the call.

The statements made in this section describe the behavior of MPI for buffered-mode sends. When no buffer is currently associated, MPI behaves as if a zero-sized buffer is associated with the process.

MPI must provide as much buffering for outgoing messages *as if* outgoing message data were buffered by the sending process, in the specified buffer space, using a circular, contiguous-space allocation policy. We outline below a model implementation that defines this policy. MPI may provide more buffering, and may use a better buffer allocation algorithm than described below. On the other hand, MPI may signal an error whenever the simple buffering allocator described below would run out of space. In particular, if no buffer is explicitly associated with the process, then any buffered send may cause an error.

MPI does not provide mechanisms for querying or controlling buffering done by standard mode sends. It is expected that vendors will provide such information for their implementations.

> [!tip] Rationale

> There is a wide spectrum of possible implementations of buffered communication: buffering can be done at sender, at receiver, or both; buffers can be dedicated to one sender-receiver pair, or be shared by all communications; buffering can be done in real or in virtual memory; it can use dedicated memory, or memory shared by other processes; buffer space may be allocated statically or be changed dynamically; etc. It does not seem feasible to provide a portable mechanism for querying or controlling buffering that would be compatible with all these choices, yet provide meaningful information.

### Model implementation of buffered mode



The model implementation uses the packing and unpacking functions described in Section [[pt2pt#Pack and unpack|Pack and unpack]] and the nonblocking communication functions described in Section [[pt2pt#Nonblocking communication|Nonblocking communication]] .

We assume that a circular queue of pending message entries (PME) is maintained. Each entry contains a communication request handle that identifies a pending nonblocking send, a pointer to the next entry and the packed message data. The entries are stored in successive locations in the buffer. Free space is available between the queue tail and the queue head.

A buffered send call results in the execution of the following code.

- Traverse sequentially the PME queue from head towards the tail, deleting all entries for communications that have completed, up to the first entry with an uncompleted request; update queue head to point to that entry.

- Compute the number, <span class="sans-serif">n</span>, of bytes needed to store an entry for the new message.

  An upper bound on <span class="sans-serif">n</span> can be computed as follows: A call to the function [[MPI_PACK_SIZE]] , with the `count, datatype` and `comm` arguments used in the [[MPI_BSEND]] call, returns an upper bound on the amount of space needed to buffer the message data (see Section [[pt2pt#Pack and unpack|Pack and unpack]] ). The MPI constant MPI_BSEND_OVERHEAD provides an upper bound on the additional space consumed by the entry (e.g., for pointers or envelope information).

- Find the next contiguous empty space of <span class="sans-serif">n</span> bytes in buffer (space following queue tail, or space at start of buffer if queue tail is too close to end of buffer). If space is not found then raise buffer overflow error.

- Append to end of PME queue in contiguous space the new entry that contains request handle, next pointer and packed message data; [[MPI_PACK]] is used to pack data.

- Post nonblocking send (standard mode) for packed data.

- Return

## Nonblocking communication



One can improve performance on many systems by overlapping communication and computation. This is especially true on systems where communication can be executed autonomously by an intelligent communication controller. Light-weight threads are one mechanism for achieving such overlap. An alternative mechanism that often leads to better performance is to use **nonblocking communication**. A nonblocking **send start** call initiates the send operation, but does not complete it. The send start call will return before the message was copied out of the send buffer. A separate **send complete** call is needed to complete the communication, i.e., to verify that the data has been copied out of the send buffer. With suitable hardware, the transfer of data out of the sender memory may proceed concurrently with computations done at the sender after the send was initiated and before it completed. Similarly, a nonblocking **receive start call** initiates the receive operation, but does not complete it. The call will return before a message is stored into the receive buffer. A separate **receive complete** call is needed to complete the receive operation and verify that the data has been received into the receive buffer. With suitable hardware, the transfer of data into the receiver memory may proceed concurrently with computations done after the receive was initiated and before it completed. The use of nonblocking receives may also avoid system buffering and memory-to-memory copying, as information is provided early on the location of the receive buffer.

Nonblocking send start calls can use the same four modes as blocking sends: <span class="sans-serif">standard</span>, <span class="sans-serif">buffered</span>, <span class="sans-serif">synchronous</span> and <span class="sans-serif">ready</span>. These carry the same meaning. Sends of all modes, <span class="sans-serif">ready</span> excepted, can be started whether a matching receive has been posted or not; a nonblocking <span class="sans-serif">ready</span> send can be started only if a matching receive is posted. In all cases, the send start call is local: it returns immediately, irrespective of the status of other processes. If the call causes some system resource to be exhausted, then it will fail and return an error code. Quality implementations of MPI should ensure that this happens only in “pathological” cases. That is, an MPI implementation should be able to support a large number of pending nonblocking operations.

The send-complete call returns when data has been copied out of the send buffer. It may carry additional meaning, depending on the send mode.

If the send mode is <span class="sans-serif">synchronous</span>, then the send can complete only if a matching receive has started. That is, a receive has been posted, and has been matched with the send. In this case, the send-complete call is non-local. Note that a synchronous, nonblocking send may complete, if matched by a nonblocking receive, before the receive complete call occurs. (It can complete as soon as the sender “knows” the transfer will complete, but before the receiver “knows” the transfer will complete.)

If the send mode is <span class="sans-serif">buffered</span> then the message must be buffered if there is no pending receive. In this case, the send-complete call is local, and must succeed irrespective of the status of a matching receive.

If the send mode is <span class="sans-serif">standard</span> then the send-complete call may return before a matching receive occurred, if the message is buffered. On the other hand, the send-complete may not complete until a matching receive occurred, and the message was copied into the receive buffer.

Nonblocking sends can be matched with blocking receives, and vice-versa.

> [!note] Advice to users

> The completion of a send operation may be delayed, for standard mode, and must be delayed, for synchronous mode, until a matching receive is posted. The use of nonblocking sends in these two cases allows the sender to proceed ahead of the receiver, so that the computation is more tolerant of fluctuations in the speeds of the two processes.
>
> Nonblocking sends in the buffered and ready modes have a more limited impact. A nonblocking send will return as soon as possible, whereas a blocking send will return after the data has been copied out of the sender memory. The use of nonblocking sends is advantageous in these cases only if data copying can be concurrent with computation.
>
> The message-passing model implies that communication is initiated by the sender. The communication will generally have lower overhead if a receive is already posted when the sender initiates the communication (data can be moved directly to the receive buffer, and there is no need to queue a pending send request). However, a receive operation can complete only after the matching send has occurred. The use of nonblocking receives allows one to achieve lower communication overheads without blocking the receiver while it waits for the send.

### Communication Objects



Nonblocking communications use opaque <span class="sans-serif">request</span> objects to identify communication operations and match the operation that initiates the communication with the operation that terminates it. These are system objects that are accessed via a handle. A request object identifies various properties of a communication operation, such as the send mode, the communication buffer that is associated with it, its context, the tag and destination arguments to be used for a send, or the tag and source arguments to be used for a receive. In addition, this object stores information about the status of the pending communication operation.

### Communication initiation



We use the same naming conventions as for blocking communication: a prefix of <span class="sans-serif">B</span>, <span class="sans-serif">S</span>, or <span class="sans-serif">R</span> is used for <span class="sans-serif">buffered</span>, <span class="sans-serif">synchronous</span> or <span class="sans-serif">ready</span> mode. In addition a prefix of <span class="sans-serif">I</span> (for <span class="sans-serif">immediate</span>) indicates that the call is nonblocking.

![[API/MPI_ISEND]]

Start a standard mode, nonblocking send.

![[API/MPI_IBSEND]]

Start a buffered mode, nonblocking send.

![[API/MPI_ISSEND]]

Start a synchronous mode, nonblocking send.

![[API/MPI_IRSEND]]

Start a ready mode nonblocking send.

![[API/MPI_IRECV]]

Start a nonblocking receive.

These calls allocate a communication request object and associate it with the request handle (the argument `request`). The request can be used later to query the status of the communication or wait for its completion.

A nonblocking send call indicates that the system may start copying data out of the send buffer. The sender should not access any part of the send buffer after a nonblocking send operation is called, until the send completes.

A nonblocking receive call indicates that the system may start writing data into the receive buffer. The receiver should not access any part of the receive buffer after a nonblocking receive operation is called, until the receive completes.

> [!note] Advice to users

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with
>
> Register Optimization” in Section 10.2.2 of the MPI-2 Standard, pages 286 and 289.

### Communication Completion



The functions `MPI_WAIT` and `MPI_TEST` are used to complete a nonblocking communication. The completion of a send operation indicates that the sender is now free to update the locations in the send buffer (the send operation itself leaves the content of the send buffer unchanged). It does not indicate that the message has been received, rather, it may have been buffered by the communication subsystem. However, if a <span class="sans-serif">synchronous</span> mode send was used, the completion of the send operation indicates that a matching receive was initiated, and that the message will eventually be received by this matching receive.

The completion of a receive operation indicates that the receive buffer contains the received message, the receiver is now free to access it, and that the status object is set. It does not indicate that the matching send operation has completed (but indicates, of course, that the send was initiated).

We shall use the following terminology: A **null** handle is a handle with value MPI_REQUEST_NULL. A persistent request and the handle to it are **inactive** if the request is not associated with any ongoing communication (see Section [[pt2pt#Persistent communication requests|Persistent communication requests]] ). A handle is **active** if it is neither null nor inactive.

An **empty** status is a status which is set to return `tag = MPI_ANY_TAG`, `source = MPI_ANY_SOURCE`, `error = MPI_SUCCESS`, and is also internally configured so that calls to [[MPI_GET_COUNT]] and [[MPI_GET_ELEMENTS]] return `count = 0` and [[MPI_TEST_CANCELLED]] returns false.

We set a status variable to empty when the value returned by it is not significant. Status is set in this way so as to prevent errors due to accesses of stale information.

The fields in a `status` object returned by a call to [[MPI_WAIT]] , [[MPI_TEST]] , or any of the other derived functions ( MPI\_{TEST,WAIT}{ALL,SOME,ANY}), where the `request` corresponds to a send call, are undefined, with two exceptions: The error status field will contain valid information if the wait or test call returned with MPI_ERR_IN_STATUS; and the returned status can be queried by the call [[MPI_TEST_CANCELLED]] .

Error codes belonging to the error class MPI_ERR_IN_STATUS should be returned only by the MPI completion functions that take arrays of `MPI_STATUS`. For the functions (MPI_TEST, MPI_TESTANY, MPI_WAIT, MPI_WAITANY) that return a single `MPI_STATUS` value, the normal MPI error return process should be used (not the MPI_ERROR field in the `MPI_STATUS` argument).

![[API/MPI_WAIT]]

A call to `MPI_WAIT` returns when the operation identified by `request` is complete. If the communication object associated with this request was created by a nonblocking send or receive call, then the object is deallocated by the call to `MPI_WAIT` and the request handle is set to MPI_REQUEST_NULL. [[MPI_WAIT]] is a non-local operation.

The call returns, in `status`, information on the completed operation. The content of the status object for a receive operation can be accessed as described in section [[pt2pt#Return status|Return status]] . The status object for a send operation may be queried by a call to [[MPI_TEST_CANCELLED]] (see Section [[pt2pt#Probe and Cancel|Probe and Cancel]] ).

One is allowed to call [[MPI_WAIT]] with a null or inactive `request` argument. In this case the operation returns immediately with empty `status`.

> [!note] Advice to users

> Successful return of `MPI_WAIT` after a `MPI_IBSEND` implies that the user send buffer can be reused — i.e., data has been sent out or copied into a buffer attached with `MPI_BUFFER_ATTACH`. Note that, at this point, we can no longer cancel the send (see Sec. [[pt2pt#Probe and Cancel|Probe and Cancel]] ). If a matching receive is never posted, then the buffer cannot be freed. This runs somewhat counter to the stated goal of `MPI_CANCEL` (always being able to free program space that was committed to the communication subsystem).

> [!warning] Advice to implementors

> In a multi-threaded environment, a call to `MPI_WAIT` should block only the calling thread, allowing the thread scheduler to schedule another thread for execution.

![[API/MPI_TEST]]

A call to `MPI_TEST` returns `flag = true` if the operation identified by `request` is complete. In such a case, the status object is set to contain information on the completed operation; if the communication object was created by a nonblocking send or receive, then it is deallocated and the request handle is set to MPI_REQUEST_NULL. The call returns `flag = false`, otherwise. In this case, the value of the status object is undefined. `MPI_TEST` is a local operation.

The return status object for a receive operation carries information that can be accessed as described in section [[pt2pt#Return status|Return status]] . The status object for a send operation carries information that can be accessed by a call to [[MPI_TEST_CANCELLED]] (see Section [[pt2pt#Probe and Cancel|Probe and Cancel]] ).

One is allowed to call [[MPI_TEST]] with a null or inactive `request` argument. In such a case the operation returns with `flag = true` and empty `status`.

The functions `MPI_WAIT` and `MPI_TEST` can be used to complete both sends and receives.

> [!note] Advice to users

> The use of the nonblocking `MPI_TEST` call allows the user to schedule alternative activities within a single thread of execution. An event-driven thread scheduler can be emulated with periodic calls to [[MPI_TEST]] .

> [!tip] Rationale

> The function [[MPI_TEST]] returns with `flag = true` exactly in those situations where the function [[MPI_WAIT]] returns; both functions return in such case the same value in `status`. Thus, a blocking Wait can be easily replaced by a nonblocking Test.

 Simple usage of nonblocking operations and `MPI_WAIT`.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank.EQ.0) THEN
        CALL MPI_ISEND(a(1), 10, MPI_REAL, 1, tag, comm, request, ierr)
        **** do some computation to mask latency ****
        CALL MPI_WAIT(request, status, ierr)
    ELSE
        CALL MPI_IRECV(a(1), 15, MPI_REAL, 0, tag, comm, request, ierr)
        **** do some computation to mask latency ****
        CALL MPI_WAIT(request, status, ierr)
    END IF

A request object can be deallocated without waiting for the associated communication to complete, by using the following operation.

![[API/MPI_REQUEST_FREE]]

Mark the request object for deallocation and set `request` to MPI_REQUEST_NULL. An ongoing communication that is associated with the request will be allowed to complete. The request will be deallocated only after its completion.

> [!tip] Rationale

> The [[MPI_REQUEST_FREE]] mechanism is provided for reasons of performance and convenience on the sending side.

> [!note] Advice to users

> Once a request is freed by a call to [[MPI_REQUEST_FREE]] , it is not possible to check for the successful completion of the associated communication with calls to [[MPI_WAIT]] or [[MPI_TEST]] . Also, if an error occurs subsequently during the communication, an error code cannot be returned to the user — such an error must be treated as fatal. Questions arise as to how one knows when the operations have completed when using [[MPI_REQUEST_FREE]] . Depending on the program logic, there may be other ways in which the program knows that certain operations have completed and this makes usage of [[MPI_REQUEST_FREE]] practical. For example, an active send request could be freed when the logic of the program is such that the receiver sends a reply to the message sent — the arrival of the reply informs the sender that the send has completed and the send buffer can be reused. An active receive request should never be freed as the receiver will have no way to verify that the receive has completed and the receive buffer can be reused.

 An example using [[MPI_REQUEST_FREE]] .

    CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
    IF(rank.EQ.0) THEN
        DO i=1, n
          CALL MPI_ISEND(outval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr)
          CALL MPI_REQUEST_FREE(req, ierr)
          CALL MPI_IRECV(inval, 1, MPI_REAL, 1, 0, MPI_COMM_WORLD, req, ierr)
          CALL MPI_WAIT(req, status, ierr)
        END DO
    ELSE    ! rank.EQ.1
        CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr)
        CALL MPI_WAIT(req, status, ierr)
        DO I=1, n-1
           CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr)
           CALL MPI_REQUEST_FREE(req, ierr)
           CALL MPI_IRECV(inval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr)
           CALL MPI_WAIT(req, status, ierr)
        END DO
        CALL MPI_ISEND(outval, 1, MPI_REAL, 0, 0, MPI_COMM_WORLD, req, ierr)
        CALL MPI_WAIT(req, status, ierr)
    END IF

### Semantics of Nonblocking Communications

The semantics of nonblocking communication is defined by suitably extending the definitions in Section [[pt2pt#Semantics of point-to-point communication|Semantics of point-to-point communication]] .

##### Order

Nonblocking communication operations are ordered according to the execution order of the calls that initiate the communication. The non-overtaking requirement of Section [[pt2pt#Semantics of point-to-point communication|Semantics of point-to-point communication]] is extended to nonblocking communication, with this definition of order being used.

 Message ordering for nonblocking operations.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (RANK.EQ.0) THEN
          CALL MPI_ISEND(a, 1, MPI_REAL, 1, 0, comm, r1, ierr)
          CALL MPI_ISEND(b, 1, MPI_REAL, 1, 0, comm, r2, ierr)
    ELSE    ! rank.EQ.1
          CALL MPI_IRECV(a, 1, MPI_REAL, 0, MPI_ANY_TAG, comm, r1, ierr)
          CALL MPI_IRECV(b, 1, MPI_REAL, 0, 0, comm, r2, ierr)
    END IF
    CALL MPI_WAIT(r1, status, ierr)
    CALL MPI_WAIT(r2, status, ierr)

The first send of process zero will match the first receive of process one, even if both messages are sent before process one executes either receive.

##### Progress

A call to `MPI_WAIT` that completes a receive will eventually terminate and return if a matching send has been started, unless the send is satisfied by another receive. In particular, if the matching send is nonblocking, then the receive should complete even if no call is executed by the sender to complete the send. Similarly, a call to `MPI_WAIT` that completes a send will eventually return if a matching receive has been started, unless the receive is satisfied by another send, and even if no call is executed to complete the receive.

 An illustration of progress semantics.

    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (RANK.EQ.0) THEN
          CALL MPI_SSEND(a, 1, MPI_REAL, 1, 0, comm, ierr)
          CALL MPI_SEND(b, 1, MPI_REAL, 1, 1, comm, ierr)
    ELSE    ! rank.EQ.1
          CALL MPI_IRECV(a, 1, MPI_REAL, 0, 0, comm, r, ierr)
          CALL MPI_RECV(b, 1, MPI_REAL, 0, 1, comm, ierr)
          CALL MPI_WAIT(r, status, ierr)
    END IF

This code should not deadlock in a correct MPI implementation. The first synchronous send of process zero must complete after process one posts the matching (nonblocking) receive even if process one has not yet reached the completing wait call. Thus, process zero will continue and execute the second send, allowing process one to complete execution.

If an `MPI_TEST` that completes a receive is repeatedly called with the same arguments, and a matching send has been started, then the call will eventually return `flag = true`, unless the send is satisfied by another receive. If an `MPI_TEST` that completes a send is repeatedly called with the same arguments, and a matching receive has been started, then the call will eventually return `flag = true`, unless the receive is satisfied by another send.

### Multiple Completions



It is convenient to be able to wait for the completion of any, some, or all the operations in a list, rather than having to wait for a specific message. A call to `MPI_WAITANY` or `MPI_TESTANY` can be used to wait for the completion of one out of several operations. A call to `MPI_WAITALL` or `MPI_TESTALL` can be used to wait for all pending operations in a list. A call to [[MPI_WAITSOME]] or [[MPI_TESTSOME]] can be used to complete all enabled operations in a list.

![[API/MPI_WAITANY]]

Blocks until one of the operations associated with the active requests in the array has completed. If more then one operation is enabled and can terminate, one is arbitrarily chosen. Returns in `index` the index of that request in the array and returns in `status` the status of the completing communication. (The array is indexed from zero in C, and from one in Fortran.) If the request was allocated by a nonblocking communication operation, then it is deallocated and the request handle is set to MPI_REQUEST_NULL.

The `array_of_requests` list may contain null or inactive handles. If the list contains no active handles (list has length zero or all entries are null or inactive), then the call returns immediately with `index = MPI_UNDEFINED`, and a empty `status`.

The execution of `MPI_WAITANY(count, array_of_requests, index, status)` has the same effect as the execution of `MPI_WAIT(&array_of_requests[i], status)`, where `i` is the value returned by `index` (unless the value of `index` is MPI_UNDEFINED). [[MPI_WAITANY]] with an array containing one active entry is equivalent to [[MPI_WAIT]] .

![[API/MPI_TESTANY]]

Tests for completion of either one or none of the operations associated with active handles. In the former case, it returns <span class="sans-serif">flag = true</span>, returns in <span class="sans-serif">index</span> the index of this request in the array, and returns in <span class="sans-serif">status</span> the status of that operation; if the request was allocated by a nonblocking communication call then the request is deallocated and the handle is set to MPI_REQUEST_NULL. (The array is indexed from zero in C, and from one in Fortran.) In the latter case (no operation completed), it returns <span class="sans-serif">flag = false</span>, returns a value of MPI_UNDEFINED in `index` and `status` is undefined.

The array may contain null or inactive handles. If the array contains no active handles then the call returns immediately with <span class="sans-serif">flag = true</span>, `index` = MPI_UNDEFINED, and an empty `status`.

If the array of requests contains active handles then

the execution of `MPI_TESTANY(count, array_of_requests, index, status)` has the same effect as the execution of `MPI_TEST( &array_of_requests[i], flag, status)`, for <span class="sans-serif">i=0, 1 ,..., count-1</span>, in some arbitrary order, until one call returns <span class="sans-serif">flag = true</span>, or all fail. In the former case, <span class="sans-serif">index</span> is set to the last value of <span class="sans-serif">i</span>, and in the latter case, it is set to MPI_UNDEFINED. [[MPI_TESTANY]] with an array containing one active entry is equivalent to [[MPI_TEST]] .

> [!tip] Rationale

> The function [[MPI_TESTANY]] returns with `flag = true` exactly in those situations where the function [[MPI_WAITANY]] returns; both functions return in that case the same values in the remaining parameters. Thus, a blocking [[MPI_WAITANY]] can be easily replaced by a nonblocking [[MPI_TESTANY]] . The same relation holds for the other pairs of Wait and Test functions defined in this section.

![[API/MPI_WAITALL]]

Blocks until all communication operations associated with active handles in the list complete, and return the status of all these operations (this includes the case where no handle in the list is active). Both arrays have the same number of valid entries. The `i`-th entry in `array_of_statuses` is set to the return status of the `i`-th operation. Requests that were created by nonblocking communication operations are deallocated and the corresponding handles in the array are set to MPI_REQUEST_NULL.

The list may contain null or inactive handles. The call sets to empty the status of each such entry.

The error-free execution of `MPI_WAITALL(count, array_of_requests, array_of_statuses)` has the same effect as the execution of

`MPI_WAIT(&array_of_request[i], &array_of_statuses[i])`, for <span class="sans-serif">i=0 ,..., count-1</span>, in some arbitrary order. [[MPI_WAITALL]] with an array of length one is equivalent to [[MPI_WAIT]] .

When one or more of the communications completed by a call to `MPI_WAITALL` fail, it is desireable to return specific information on each communication. The function `MPI_WAITALL` will return in such case the error code MPI_ERR_IN_STATUS and will set the error field of each status to a specific error code. This code will be MPI_SUCCESS, if the specific communication completed; it will be another specific error code, if it failed; or it can be MPI_ERR_PENDING if it has neither failed nor completed. The function `MPI_WAITALL` will return `MPI_SUCCESS` if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

> [!tip] Rationale

> This design streamlines error handling in the application. The application code need only test the (single) function result to determine if an error has occurred. It needs to check each individual status only when an error occurred.

![[API/MPI_TESTALL]]

Returns `flag = true` if all communications associated with active handles in the array have completed (this includes the case where no handle in the list is active). In this case, each status entry that corresponds to an active handle request is set to the status of the corresponding communication; if the request was allocated by a nonblocking communication call then it is deallocated, and the handle is set to MPI_REQUEST_NULL.

Each status entry that corresponds to a null or inactive handle is set to empty.

Otherwise, `flag = false` is returned, no request is modified and the values of the status entries are undefined. This is a local operation.

Errors that occurred during the execution of [[MPI_TESTALL]] are handled as errors in [[MPI_WAITALL]] .

![[API/MPI_WAITSOME]]

Waits until at least one of the operations associated with active handles in the list have completed. Returns in `outcount` the number of requests from the list `array_of_requests` that have completed. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array `array_of_status` the status for these completed operations. If a request that completed was allocated by a nonblocking communication call, then it is deallocated, and the associated handle is set to MPI_REQUEST_NULL.

If the list contains no active handles, then the call returns immediately with `outcount = MPI_UNDEFINED`.

When one or more of the communications completed by [[MPI_WAITSOME]] fails, then it is desirable to return specific information on each communication. The arguments `outcount`, `array_of_indices` and `array_of_statuses` will be adjusted to indicate completion of all communications that have succeeded or failed. The call will return the error code MPI_ERR_IN_STATUS and the error field of each status returned will be set to indicate success or to indicate the specific error that occurred. The call will return MPI_SUCCESS if no request resulted in an error, and will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

![[API/MPI_TESTSOME]]

Behaves like [[MPI_WAITSOME]] , except that it returns immediately. If no operation has completed it returns `outcount = 0`.

If there is no active handle in the list it returns `outcount = MPI_UNDEFINED`.

[[MPI_TESTSOME]] is a local operation, which returns immediately, whereas [[MPI_WAITSOME]] will block until a communication completes, if it was passed a list that contains at least one active handle. Both calls fulfill a <span class="sans-serif">fairness</span> requirement: If a request for a receive repeatedly appears in a list of requests passed to [[MPI_WAITSOME]] or [[MPI_TESTSOME]] , and a matching send has been posted, then the receive will eventually succeed, unless the send is satisfied by another receive; and similarly for send requests.

Errors that occur during the execution of [[MPI_TESTSOME]] are handled as for [[MPI_WAITSOME]] .

> [!note] Advice to users

> The use of [[MPI_TESTSOME]] is likely to be more efficient than the use of [[MPI_TESTANY]] . The former returns information on all completed communications, with the latter, a new call is required for each communication that completes.
>
> A server with multiple clients can use [[MPI_WAITSOME]] so as not to starve any client. Clients send messages to the server with service requests. The server calls [[MPI_WAITSOME]] with one receive request for each client, and then handles all receives that completed. If a call to [[MPI_WAITANY]] is used instead, then one client could starve while requests from another client always sneak in first.

> [!warning] Advice to implementors

> [[MPI_TESTSOME]] should complete as many pending communications as possible.

 Client-server code (starvation can occur).

    CALL MPI_COMM_SIZE(comm, size, ierr)
    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank .GT. 0) THEN         ! client code
        DO WHILE(.TRUE.)
           CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr)
           CALL MPI_WAIT(request, status, ierr)
        END DO
    ELSE         ! rank=0 -- server code
           DO i=1, size-1
              CALL MPI_IRECV(a(1,i), n, MPI_REAL, i tag,
                       comm, request_list(i), ierr)
           END DO
           DO WHILE(.TRUE.)
              CALL MPI_WAITANY(size-1, request_list, index, status, ierr)
              CALL DO_SERVICE(a(1,index))  ! handle one message
              CALL MPI_IRECV(a(1, index), n, MPI_REAL, index, tag,
                        comm, request_list(index), ierr)
           END DO
    END IF



 Same code, using [[MPI_WAITSOME]] .

    CALL MPI_COMM_SIZE(comm, size, ierr)
    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank .GT. 0) THEN         ! client code
        DO WHILE(.TRUE.)
           CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr)
           CALL MPI_WAIT(request, status, ierr)
        END DO
    ELSE         ! rank=0 -- server code
        DO i=1, size-1
           CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag,
                          comm, requests(i), ierr)
        END DO
        DO WHILE(.TRUE.)
           CALL MPI_WAITSOME(size, request_list, numdone,
                            indices, statuses, ierr)
           DO i=1, numdone
              CALL DO_SERVICE(a(1, indices(i)))
              CALL MPI_IRECV(a(1, indices(i)), n, MPI_REAL, 0, tag,
                           comm, requests(indices(i)), ierr)
           END DO
        END DO
    END IF

## Probe and Cancel



The `MPI_PROBE` and `MPI_IPROBE` operations allow incoming messages to be checked for, without actually receiving them. The user can then decide how to receive them, based on the information returned by the probe (basically, the information returned by `status`). In particular, the user may allocate memory for the receive buffer, according to the length of the probed message.

The `MPI_CANCEL` operation allows pending communications to be canceled. This is required for cleanup. Posting a send or a receive ties up user resources (send or receive buffers), and a cancel may be needed to free these resources gracefully.

![[API/MPI_IPROBE]]

`MPI_IPROBE(source, tag, comm, flag, status)` returns `flag = true` if there is a message that can be received and that matches the pattern specified by the arguments `source`, `tag`, and `comm`. The call matches the same message that would have been received by a call to [[MPI_RECV]] executed at the same point in the program, and returns in `status` the same value that would have been returned by `MPI_RECV()`. Otherwise, the call returns `flag = false`, and leaves `status` undefined.

If `MPI_IPROBE` returns `flag = true`, then the content of the status object can be subsequently accessed as described in section [[pt2pt#Return status|Return status]] to find the source, tag and length of the probed message.

A subsequent receive executed with the same communicator, and the source and tag returned in status by [[MPI_IPROBE]] will receive the message that was matched by the probe, if no other intervening receive occurs after the probe, and the send is not successfully cancelled before the receive.

If the receiving process is multi-threaded, it is the user’s responsibility to ensure that the last condition holds.

The `source` argument of [[MPI_PROBE]] can be MPI_ANY_SOURCE, and the `tag` argument can be MPI_ANY_TAG, so that one can probe for messages from an arbitrary source and/or with an arbitrary tag. However, a specific communication context must be provided with the `comm` argument.

It is not necessary to receive a message immediately after it has been probed for, and the same message may be probed for several times before it is received.

![[API/MPI_PROBE]]

`MPI_PROBE` behaves like `MPI_IPROBE` except that it is a blocking call that returns only after a matching message has been found.

The MPI implementation of [[MPI_PROBE]] and [[MPI_IPROBE]] needs to guarantee progress: if a call to [[MPI_PROBE]] has been issued by a process, and a send that matches the probe has been initiated by some process, then the call to [[MPI_PROBE]] will return, unless the message is received by another concurrent receive operation (that is executed by another thread at the probing process). Similarly, if a process busy waits with [[MPI_IPROBE]] and a matching message has been issued, then the call to [[MPI_IPROBE]] will eventually return <span class="sans-serif">flag = true</span> unless the message is received by another concurrent receive operation.

 Use blocking probe to wait for an incoming message.

           CALL MPI_COMM_RANK(comm, rank, ierr)
           IF (rank.EQ.0) THEN
                CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)
           ELSE IF(rank.EQ.1) THEN
                CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)
           ELSE   ! rank.EQ.2
               DO i=1, 2
                  CALL MPI_PROBE(MPI_ANY_SOURCE, 0,
                                  comm, status, ierr)
                  IF (status(MPI_SOURCE) .EQ. 0) THEN
    100                CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr)
                  ELSE
    200                CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr)
                  END IF
               END DO
           END IF

Each message is received with the right type.

 A similar program to the previous example, but now it has a problem.

           CALL MPI_COMM_RANK(comm, rank, ierr)
           IF (rank.EQ.0) THEN
                CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)
           ELSE IF(rank.EQ.1) THEN
                CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)
           ELSE
               DO i=1, 2
                  CALL MPI_PROBE(MPI_ANY_SOURCE, 0,
                                  comm, status, ierr)
                  IF (status(MPI_SOURCE) .EQ. 0) THEN
    100                CALL MPI_RECV(i, 1, MPI_INTEGER, MPI_ANY_SOURCE,
                                     0, comm, status, ierr)
                  ELSE
    200                CALL MPI_RECV(x, 1, MPI_REAL, MPI_ANY_SOURCE,
                                     0, comm, status, ierr)
                  END IF
               END DO
           END IF

We slightly modified example [[pt2pt-exP]] , using MPI_ANY_SOURCE as the `source` argument in the two receive calls in statements labeled 100 and 200. The program is now incorrect: the receive operation may receive a message that is distinct from the message probed by the preceding call to [[MPI_PROBE]] .

> [!warning] Advice to implementors

> A call to [[MPI_PROBE]] will match the message that would have been received by a call to [[MPI_RECV]] executed at the same point. Suppose that this message has source <span class="sans-serif">s</span>, tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span>. If the tag argument in the probe call has value MPI_ANY_TAG then the message probed will be the earliest pending message from source <span class="sans-serif">s</span> with communicator <span class="sans-serif">c</span> and any tag; in any case, the message probed will be the earliest pending message from source <span class="sans-serif">s</span> with tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span> (this is the message that would have been received, so as to preserve message order). This message continues as the earliest pending message from source <span class="sans-serif">s</span> with tag <span class="sans-serif">t</span> and communicator <span class="sans-serif">c</span>, until it is received. A receive operation subsequent to the probe that uses the same communicator as the probe and uses the tag and source values returned by the probe, must receive this message, unless it has already been received by another receive operation.

![[API/MPI_CANCEL]]

A call to `MPI_CANCEL` marks for cancellation a pending, nonblocking communication operation (send or receive). The cancel call is local. It returns immediately, possibly before the communication is actually canceled. It is still necessary to complete a communication that has been marked for cancellation, using a call to `MPI_REQUEST_FREE`, `MPI_WAIT` or `MPI_TEST` (or any of the derived operations).

If a communication is marked for cancellation, then a `MPI_WAIT` call for that communication is guaranteed to return, irrespective of the activities of other processes (i.e., `MPI_WAIT` behaves as a local function); similarly if `MPI_TEST` is repeatedly called in a busy wait loop for a canceled communication, then [[MPI_TEST]] will eventually be successful.

[[MPI_CANCEL]] can be used to cancel a communication that uses a persistent request (see Sec. [[pt2pt#Persistent communication requests|Persistent communication requests]] ), in the same way it is used for nonpersistent requests. A successful cancellation cancels the active communication, but not the request itself. After the call to [[MPI_CANCEL]] and the subsequent call to [[MPI_WAIT]] or [[MPI_TEST]] , the request becomes inactive and can be activated for a new communication.

The successful cancellation of a buffered send frees the buffer space occupied by the pending message.

Either the cancellation succeeds, or the communication succeeds, but not both. If a send is marked for cancellation, then it must be the case that either the send completes normally, in which case the message sent was received at the destination process, or that the send is successfully canceled, in which case no part of the message was received at the destination. Then, any matching receive has to be satisfied by another send. If a receive is marked for cancellation, then it must be the case that either the receive completes normally, or that the receive is successfully canceled, in which case no part of the receive buffer is altered. Then, any matching send has to be satisfied by another receive.

If the operation has been canceled, then information to that effect will be returned in the status argument of the operation that completes the communication.

![[API/MPI_TEST_CANCELLED]]

Returns `flag = true` if the communication associated with the status object was canceled successfully. In such a case, all other fields of `status` (such as `count` or `tag`) are undefined. Returns `flag = false`, otherwise. If a receive operation might be canceled then one should call `MPI_TEST_CANCELLED` first, to check whether the operation was canceled, before checking on the other fields of the return status.

> [!note] Advice to users

> Cancel can be an expensive operation that should be used only exceptionally.

> [!warning] Advice to implementors

> If a send operation uses an “eager” protocol (data is transferred to the receiver before a matching receive is posted), then the cancellation of this send may require communication with the intended receiver in order to free allocated buffers. On some systems this may require an interrupt to the intended receiver. Note that, while communication may be needed to implement [[MPI_CANCEL]] , this is still a local operation, since its completion does not depend on the code executed by other processes. If processing is required on another process, this should be transparent to the application (hence the need for an interrupt and an interrupt handler).

## Persistent communication requests



Often a communication with the same argument list is repeatedly executed within the inner loop of a parallel computation. In such a situation, it may be possible to optimize the communication by binding the list of communication arguments to a **persistent** communication request once and, then, repeatedly using the request to initiate and complete messages. The persistent request thus created can be thought of as a communication port or a “half-channel.” It does not provide the full functionality of a conventional channel, since there is no binding of the send port to the receive port. This construct allows reduction of the overhead for communication between the process and communication controller, but not of the overhead for communication between one communication controller and another. It is not necessary that messages sent with a persistent request be received by a receive operation using a persistent request, or vice versa.

A persistent communication request is created using one of the four following calls. These calls involve no communication.

![[API/MPI_SEND_INIT]]

Creates a persistent communication request for a standard mode send operation, and binds to it all the arguments of a send operation.

![[API/MPI_BSEND_INIT]]

Creates a persistent communication request for a buffered mode send.

![[API/MPI_SSEND_INIT]]

Creates a persistent communication object for a synchronous mode send operation.

![[API/MPI_RSEND_INIT]]

Creates a persistent communication object for a ready mode send operation.

![[API/MPI_RECV_INIT]]

Creates a persistent communication request for a receive operation. The argument `buf` is marked as `OUT` because the user gives permission to write on the receive buffer by passing the argument to `MPI_RECV_INIT`.

A persistent communication request is inactive after it was created — no active communication is attached to the request.

A communication (send or receive) that uses a persistent request is initiated by the function [[MPI_START]] .

![[API/MPI_START]]

The argument, `request`, is a handle returned by one of the previous five calls. The associated request should be inactive. The request becomes active once the call is made.

If the request is for a send with ready mode, then a matching receive should be posted before the call is made. The communication buffer should not be accessed after the call, and until the operation completes.

The call is local, with similar semantics to the nonblocking communication operations described in section [[pt2pt#Nonblocking communication|Nonblocking communication]] . That is, a call to `MPI_START` with a request created by [[MPI_SEND_INIT]] starts a communication in the same manner as a call to [[MPI_ISEND]] ; a call to `MPI_START` with a request created by [[MPI_BSEND_INIT]] starts a communication in the same manner as a call to [[MPI_IBSEND]] ; and so on.

![[API/MPI_STARTALL]]

Start all communications associated with requests in `array_of_requests`. A call to

`MPI_STARTALL(count, array_of_requests)` has the same effect as calls to `MPI_START` `(&array_of_requests[i])`, executed for <span class="sans-serif">i=0 ,..., count-1</span>, in some arbitrary order.

A communication started with a call to [[MPI_START]] or [[MPI_STARTALL]] is completed by a call to [[MPI_WAIT]] , [[MPI_TEST]] , or one of the derived functions described in section [[pt2pt#Multiple Completions|Multiple Completions]] . The request becomes inactive after successful completion of such call. The request is not deallocated and it can be activated anew by an [[MPI_START]] or [[MPI_STARTALL]] call.

A persistent request is deallocated by a call to [[MPI_REQUEST_FREE]] (Section [[pt2pt#Communication Completion|Communication Completion]] ).

The call to [[MPI_REQUEST_FREE]] can occur at any point in the program after the persistent request was created. However, the request will be deallocated only after it becomes inactive. Active receive requests should not be freed. Otherwise, it will not be possible to check that the receive has completed. It is preferable, in general, to free requests when they are inactive. If this rule is followed, then the functions described in this section will be invoked in a sequence of the form,

$`Create  (Start  Complete)^*  Free    ,`$

\
where $`*`$ indicates zero or more repetitions. If the same communication object is used in several concurrent threads, it is the user’s responsibility to coordinate calls so that the correct sequence is obeyed.

A send operation initiated with `MPI_START` can be matched with any receive operation and, likewise, a receive operation initiated with `MPI_START` can receive messages generated by any send operation.

> [!note] Advice to users

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with
>
> Register Optimization” in Section 10.2.2 of the MPI-2 Standard, pages 286 and 289.

## Send-receive



The **send-receive** operations combine in one call the sending of a message to one destination and the receiving of another message, from another process. The two (source and destination) are possibly the same. A send-receive operation is very useful for executing a shift operation across a chain of processes. If blocking sends and receives are used for such a shift, then one needs to order the sends and receives correctly (for example, even processes send, then receive, odd processes receive first, then send) so as to prevent cyclic dependencies that may lead to deadlock. When a send-receive operation is used, the communication subsystem takes care of these issues. The send-receive operation can be used in conjunction with the functions described in Chapter [[topol#Process Topologies|Process Topologies]] in order to perform shifts on various logical topologies. Also, a send-receive operation is useful for implementing remote procedure calls.

A message sent by a send-receive operation can be received by a regular receive operation or probed by a probe operation; a send-receive operation can receive a message sent by a regular send operation.

![[API/MPI_SENDRECV]]

Execute a blocking send and receive operation. Both send and receive use the same communicator, but possibly different tags. The send buffer and receive buffers must be disjoint, and may have different lengths and datatypes.

![[API/MPI_SENDRECV_REPLACE]]

Execute a blocking send and receive. The same buffer is used both for the send and for the receive, so that the message sent is replaced by the message received.

The semantics of a send-receive operation is what would be obtained if the caller forked two concurrent threads, one to execute the send, and one to execute the receive, followed by a join of these two threads.

> [!warning] Advice to implementors

> Additional intermediate buffering is needed for the “replace” variant.

## Null processes



In many instances, it is convenient to specify a “dummy” source or destination for communication. This simplifies the code that is needed for dealing with boundaries, for example, in the case of a non-circular shift done with calls to send-receive.

The special value MPI_PROC_NULL can be used instead of a rank wherever a source or a destination argument is required in a call. A communication with process MPI_PROC_NULL has no effect. A send to MPI_PROC_NULL succeeds and returns as soon as possible. A receive from MPI_PROC_NULL succeeds and returns as soon as possible with no modifications to the receive buffer. When a receive with `source` = MPI_PROC_NULL is executed then the status object returns `source` = MPI_PROC_NULL, `tag` = MPI_ANY_TAG and `count = 0`.

## Derived datatypes



Up to here, all point to point communication have involved only contiguous buffers containing a sequence of elements of the same type. This is too constraining on two accounts. One often wants to pass messages that contain values with different datatypes (e.g., an integer count, followed by a sequence of real numbers); and one often wants to send noncontiguous data (e.g., a sub-block of a matrix). One solution is to pack noncontiguous data into a contiguous buffer at the sender site and unpack it back at the receiver site. This has the disadvantage of requiring additional memory-to-memory copy operations at both sites, even when the communication subsystem has scatter-gather capabilities. Instead, MPI provides mechanisms to specify more general, mixed, and noncontiguous communication buffers. It is up to the implementation to decide whether data should be first packed in a contiguous buffer before being transmitted, or whether it can be collected directly from where it resides.

The general mechanisms provided here allow one to transfer directly, without copying, objects of various shape and size. It is not assumed that the MPI library is cognizant of the objects declared in the host language. Thus, if one wants to transfer a structure, or an array section, it will be necessary to provide in MPI a definition of a communication buffer that mimics the definition of the structure or array section in question. These facilities can be used by library designers to define communication functions that can transfer objects defined in the host language — by decoding their definitions as available in a symbol table or a dope vector. Such higher-level communication functions are not part of MPI.

More general communication buffers are specified by replacing the basic datatypes that have been used so far with derived datatypes that are constructed from basic datatypes using the constructors described in this section. These methods of constructing derived datatypes can be applied recursively.

A **general datatype** is an opaque object that specifies two things:

- A sequence of basic datatypes

- A sequence of integer (byte) displacements

The displacements are not required to be positive, distinct, or in increasing order. Therefore, the order of items need not coincide with their order in store, and an item may appear more than once. We call such a pair of sequences (or sequence of pairs) a **type map**. The sequence of basic datatypes (displacements ignored) is the **type signature** of the datatype.

Let
``` math
Typemap = \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} ,
```
be such a type map, where $`type_i`$ are basic types, and $`disp_i`$ are displacements. Let
``` math
Typesig = \{ type_0 , ... , type_{n-1} \}
```
be the associated type signature. This type map, together with a base address *buf*, specifies a communication buffer: the communication buffer that consists of $`n`$ entries, where the $`i`$-th entry is at address $`buf +
disp_i`$ and has type $`type_i`$. A message assembled from such a communication buffer will consist of $`n`$ values, of the types defined by $`Typesig`$.

We can use a handle to a general datatype as an argument in a send or receive operation, instead of a basic datatype argument. The operation `MPI_SEND(buf, 1, datatype,...)` will use the send buffer defined by the base address `buf` and the general datatype associated with `datatype`; it will generate a message with the type signature determined by the `datatype` argument. `MPI_RECV(buf, 1, datatype,...)` will use the receive buffer defined by the base address `buf` and the general datatype associated with `datatype`.

General datatypes can be used in all send and receive operations. We discuss, in Sec. [[pt2pt#Use of general datatypes in communication|Use of general datatypes in communication]] , the case where the second argument `count` has value $`> 1`$.

The basic datatypes presented in section [[pt2pt#Message data|Message data]] are particular cases of a general datatype, and are predefined. Thus, `MPI_INT` is a predefined handle to a datatype with type map $`\{ (\textsf{int}, 0) \}`$, with one entry of type <span class="sans-serif">int</span> and displacement zero. The other basic datatypes are similar.

The **extent** of a datatype is defined to be the span from the first byte to the last byte occupied by entries in this datatype, rounded up to satisfy alignment requirements. That is, if
``` math
Typemap = \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} ,
```
then

``` math
\begin{eqnarray}
lb(Typemap) & = & \min_j disp_j ,  \\
ub(Typemap) & = & \max_j (disp_j + sizeof(type_j)) + \epsilon ,  and
 \ extent(Typemap) & = & ub(Typemap) -lb(Typemap).
\end{eqnarray}
```
If $`type_i`$ requires alignment to a byte address that is is a multiple of $`k_i`$, then $`\epsilon`$ is the least nonnegative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$. The complete definition of **extent** is given on page [[pt2pt#Lower-bound and upper-bound markers|Lower-bound and upper-bound markers]] .

 Assume that $`Type = \{ (\textsf{double},0), (\textsf{char}, 8) \}`$ (a <span class="sans-serif">double</span> at displacement zero, followed by a <span class="sans-serif">char</span> at displacement eight). Assume, furthermore, that doubles have to be strictly aligned at addresses that are multiples of eight. Then, the extent of this datatype is 16 (9 rounded to the next multiple of 8). A datatype that consists of a character immediately followed by a double will also have an extent of 16.

> [!tip] Rationale

> The definition of extent is motivated by the assumption that the amount of padding added at the end of each structure in an array of structures is the least needed to fulfill alignment constraints. More explicit control of the extent is provided in section [[pt2pt#Lower-bound and upper-bound markers|Lower-bound and upper-bound markers]] . Such explicit control is needed in cases where the assumption does not hold, for example, where union types are used.

### Datatype constructors



##### Contiguous

The simplest datatype constructor is `MPI_TYPE_CONTIGUOUS` which allows replication of a datatype into contiguous locations.

![[API/MPI_TYPE_CONTIGUOUS]]

`newtype` is the datatype obtained by concatenating `count` copies of `oldtype`. Concatenation is defined using *extent* as the size of the concatenated copies.

 Let `oldtype` have type map $`\{ (\textsf{double}, 0), (\textsf{char}, 8) \} ,`$ with extent 16, and let $`\texttt{count} = 3`$. The type map of the datatype returned by `newtype` is
``` math
\{ (\textsf{double}, 0), (\textsf{char}, 8), (\textsf{double}, 16), (\textsf{char}, 24), (\textsf{double}, 32), (\textsf{char}, 40) \} ;
```
i.e., alternating <span class="sans-serif">double</span> and <span class="sans-serif">char</span> elements, with displacements $`0, 8, 16, 24, 32, 40`$.

In general, assume that the type map of `oldtype` is
``` math
\{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} ,
```
with extent $`ex`$. Then `newtype` has a type map with $`count \cdot n`$ entries defined by:
``` math
\{ (type_0, disp_0), ..., (type_{n-1}, disp_{n-1}), (type_0, disp_0
+ex), ... ,(type_{n-1}, disp_{n-1} + ex) ,
```
``` math
...,(type_0, disp_0 +ex \cdot(\textsf{count}-1) ), ... ,
(type_{n-1} , disp_{n-1} + ex \cdot (\textsf{count}-1)) \} .
```

##### Vector

The function [[MPI_TYPE_VECTOR]] is a more general constructor that allows replication of a datatype into locations that consist of equally spaced blocks. Each block is obtained by concatenating the same number of copies of the old datatype. The spacing between blocks is a multiple of the extent of the old datatype.

![[API/MPI_TYPE_VECTOR]]

 Assume, again, that `oldtype` has type map $`\{ (\textsf{double}, 0), (\textsf{char}, 8) \} ,`$ with extent 16. A call to [[MPI_TYPE_VECTOR]] will create the datatype with type map,
``` math
\{
(\textsf{double}, 0), (\textsf{char}, 8), (\textsf{double}, 16), (\textsf{char},
24), (\textsf{double}, 32), (\textsf{char}, 40),
```
``` math
(\textsf{double}, 64), (\textsf{char}, 72), (\textsf{double}, 80), (\textsf{char},
88), (\textsf{double}, 96), (\textsf{char}, 104)
\} .
```
That is, two blocks with three copies each of the old type, with a stride of 4 elements ($`4 \cdot 16`$ bytes) between the blocks.

 A call to [[MPI_TYPE_VECTOR]] will create the datatype,
``` math
\{
(\textsf{double}, 0), (\textsf{char}, 8), (\textsf{double}, -32), (\textsf{char},
-24), (\textsf{double}, -64), (\textsf{char}, -56)
\} .
```

In general, assume that `oldtype` has type map,
``` math
\{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} ,
```
with extent $`ex`$. Let <span class="sans-serif">bl</span> be the <span class="sans-serif">blocklength</span>. The newly created datatype has a type map with $`\textsf{count} \cdot \textsf{bl} \cdot n`$ entries:
``` math
\{
(type_0, disp_0), ... , (type_{n-1} , disp_{n-1}),
```
``` math
(type_0 ,disp_0 + ex) , ... ,
(type_{n-1} , disp_{n-1} + ex ), ...,
```
``` math
(type_0 , disp_0 + (\textsf{bl} -1) \cdot ex
) , ... , (type_{n-1} , disp_{n-1} + (\textsf{bl} -1) \cdot ex ) ,
```
``` math
(type_0 ,disp_0 + \textsf{stride} \cdot ex ) , ... ,
(type_{n-1} , disp_{n-1} + \textsf{stride} \cdot ex ), ... ,
```
``` math
(type_0 , disp_0 + (\textsf{stride} + \textsf{bl} -1) \cdot ex ) , ... ,

(type_{n-1}, disp_{n-1} + (\textsf{stride} + \textsf{bl} -1) \cdot
ex ) , ....,
```
``` math
(type_0 ,disp_0 + \textsf{stride} \cdot (\textsf{count}-1) \cdot ex ) , ... ,
```
``` math
(type_{n-1} , disp_{n-1} + \textsf{stride} \cdot (\textsf{count} -1) \cdot
ex )
, ... ,
```
``` math
(type_0 , disp_0 + (\textsf{stride} \cdot (\textsf{count} -1)
+ \textsf{bl} -1) \cdot ex ) , ... ,
```
``` math
(type_{n-1}, disp_{n-1} + (\textsf{stride} \cdot (\textsf{count} -1)
+ \textsf{bl} -1) \cdot ex )
\} .
```

A call to [[MPI_TYPE_CONTIGUOUS]] is equivalent to a call to [[MPI_TYPE_VECTOR]] , or to a call to [[MPI_TYPE_VECTOR]] , <span class="sans-serif">n</span> arbitrary.

##### Hvector

The function [[MPI_TYPE_HVECTOR]] is identical to [[MPI_TYPE_VECTOR]] , except that `stride` is given in bytes, rather than in elements. The use for both types of vector constructors is illustrated in Sec. [[pt2pt#Examples|Examples]] . (<span class="sans-serif">H</span> stands for “heterogeneous”).

![[API/MPI_TYPE_HVECTOR]]

Assume that `oldtype` has type map,
``` math
\{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} ,
```
with extent $`ex`$. Let <span class="sans-serif">bl</span> be the <span class="sans-serif">blocklength</span>. The newly created datatype has a type map with $`\textsf{count} \cdot \textsf{bl} \cdot n`$ entries:
``` math
\{
(type_0, disp_0), ... , (type_{n-1} , disp_{n-1}),
```
``` math
(type_0 ,disp_0 + ex) , ... ,
(type_{n-1} , disp_{n-1} + ex ), ...,
```
``` math
(type_0 , disp_0 + (\textsf{bl} -1) \cdot ex
) , ... , (type_{n-1} , disp_{n-1} + (\textsf{bl} -1) \cdot ex ) ,
```
``` math
(type_0 ,disp_0 + \textsf{stride}  ) , ... ,
(type_{n-1} , disp_{n-1} + \textsf{stride} ) , ... ,
```
``` math
(type_0 , disp_0 + \textsf{stride} + ( \textsf{bl} -1) \cdot ex
) , ... ,
```
``` math
(type_{n-1}, disp_{n-1} + \textsf{stride} + (\textsf{bl} -1) \cdot
ex ) ,
....,
```
``` math
(type_0 ,disp_0 + \textsf{stride} \cdot (\textsf{count}-1) ) , ... ,

(type_{n-1} , disp_{n-1} + \textsf{stride} \cdot (\textsf{count} -1)  )
, ... ,
```
``` math
(type_0 , disp_0 + \textsf{stride} \cdot (\textsf{count} -1)
+ (\textsf{bl} -1) \cdot ex ) , ... ,
```
``` math
(type_{n-1}, disp_{n-1} + \textsf{stride} \cdot (\textsf{count} -1)
+ (\textsf{bl} -1) \cdot ex )
\} .
```

##### Indexed

The function [[MPI_TYPE_INDEXED]] allows replication of an old datatype into a sequence of blocks (each block is a concatenation of the old datatype), where each block can contain a different number of copies and have a different displacement. All block displacements are multiples of the old type extent.

![[API/MPI_TYPE_INDEXED]]

 Let `oldtype` have type map $`\{ (\textsf{double}, 0), (\textsf{char}, 8) \} ,`$ with extent 16. Let <span class="sans-serif">B = (3, 1)</span> and let <span class="sans-serif">D = (4, 0)</span>. A call to [[MPI_TYPE_INDEXED]] returns a datatype with type map,
``` math
\{
(\textsf{double}, 64), (\textsf{char}, 72), (\textsf{double}, 80), (\textsf{char},
88), (\textsf{double}, 96), (\textsf{char}, 104),
```
``` math
(\textsf{double}, 0), (\textsf{char}, 8)
\} .
```
That is, three copies of the old type starting at displacement 64, and one copy starting at displacement 0.

In general, assume that `oldtype` has type map,
``` math
\{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} ,
```
with extent *ex*. Let `B` be the `array_of_blocklength` argument and `D` be the

`array_of_displacements` argument. The newly created datatype has $`n \cdot \sum_{i=0}^{\textsf{count}-1}
\texttt{B[i]}`$ entries:
``` math
\{
(type_0, disp_0 + \texttt{D[0]} \cdot ex ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{D[0]} \cdot ex ) , ... ,
```
``` math
(type_0 , disp_0 + (\texttt{D[0]} + \texttt{B[0]} -1) \cdot ex) ,...,
(type_{n-1} , disp_{n-1} + (\texttt{D[0]} +\texttt{B[0]} -1) \cdot ex ) ,
...,
```
``` math
(type_0, disp_0 + \texttt{D[count-1]} \cdot ex ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{D[count-1]} \cdot ex ) , ... ,
```
``` math
(type_0 , disp_0 + (\texttt{D[count-1]} + \texttt{B[count-1]} -1) \cdot ex)
,...,
```
``` math
(type_{n-1} , disp_{n-1} + (\texttt{D[count-1]} +\texttt{B[count-1]} -1)
\cdot ex )
\} .
```

A call to [[MPI_TYPE_VECTOR]] is equivalent to a call to [[MPI_TYPE_INDEXED]] where
``` math
\texttt{D[j]} = j \cdot \texttt{stride}, j=0 ,..., \textsf{count} -1 ,
```
and
``` math
\texttt{B[j]} = \texttt{blocklength}, j=0 ,..., \textsf{count} -1 .
```

##### Hindexed

The function [[MPI_TYPE_HINDEXED]] is identical to [[MPI_TYPE_INDEXED]] , except that block displacements in `array_of_displacements` are specified in bytes, rather than in multiples of the `oldtype` extent.

![[API/MPI_TYPE_HINDEXED]]

Assume that `oldtype` has type map,
``` math
\{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} ,
```
with extent $`ex`$. Let `B` be the `array_of_blocklength` argument and `D` be the

`array_of_displacements` argument. The newly created datatype has a type map with $`n \cdot \sum_{i=0}^{\textsf{count}-1}
\texttt{B[i]}`$ entries:
``` math
\{
(type_0, disp_0 + \texttt{D[0]}  ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{D[0]} ) , ... ,
```
``` math
(type_0 , disp_0 + \texttt{D[0]} +(\texttt{B[0]} -1) \cdot ex) ,...,
```
``` math
(type_{n-1} , disp_{n-1} + \texttt{D[0]} +(\texttt{B[0]} -1) \cdot ex ) ,
...,
```
``` math
(type_0, disp_0 + \texttt{D[count-1]} ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{D[count-1]} ) , ... ,
```
``` math
(type_0 , disp_0 + \texttt{D[count-1]} +(\texttt{B[count-1]} -1) \cdot ex)
,...,
```
``` math
(type_{n-1} , disp_{n-1} + \texttt{D[count-1]} +(\texttt{B[count-1]} -1)
\cdot ex )
\} .
```

##### Struct

<span class="sans-serif">MPI_TYPE_STRUCT</span> is the most general type constructor. It further generalizes the previous one in that it allows each block to consist of replications of different datatypes.

![[API/MPI_TYPE_STRUCT]]

 Let `type1` have type map,
``` math
\{ (\textsf{double}, 0), (\textsf{char}, 8) \} ,
```
with extent 16. Let <span class="sans-serif">B = (2, 1, 3)</span>, <span class="sans-serif">D = (0, 16, 26)</span>, and <span class="sans-serif">T = (MPI_FLOAT, type1, MPI_CHAR)</span>. Then a call to [[MPI_TYPE_STRUCT]] returns a datatype with type map,
``` math
\{
(\textsf{float}, 0), (\textsf{float}, 4), (\textsf{double}, 16), (\textsf{char},
24), (\textsf{char}, 26), (\textsf{char}, 27), (\textsf{char}, 28)
\} .
```
That is, two copies of `MPI_FLOAT` starting at 0, followed by one copy of `type1` starting at 16, followed by three copies of `MPI_CHAR`, starting at 26. (We assume that a float occupies four bytes.)

In general, let `T` be the `array_of_types` argument, where `T[i]` is a handle to,
``` math
typemap_i = \{ (type_0^i , disp_0^i ) , ... , (type_{n_{i}-1}^i ,
disp_{n_{i}-1}^i ) \} ,
```
with extent $`ex_i`$. Let `B` be the `array_of_blocklength` argument and `D` be the `array_of_displacements` argument. Let <span class="sans-serif">c</span> be the <span class="sans-serif">count</span> argument. Then the newly created datatype has a type map with $`\sum_{i=0}^{\textsf{c}-1}\texttt{B[i]} \cdot n_i`$ entries:
``` math
\{
(type_0^0 , disp_0^0 +\texttt{D[0]}) , ... , (type_{n_0}^0 , disp_{n_0}^0 +
\texttt{D[0]} ) ,
... ,
```
``` math
(type_0^0 , disp_0^0 + \texttt{D[0]} + (\texttt{B[0]}-1) \cdot ex_0 ) , ...
,
(type_{n_0}^0 , disp_{n_0}^0 + \texttt{D[0]} + (\texttt{B[0]-1)} \cdot
ex_0 )
, ... ,
```
``` math
(type_0^{\textsf{c}-1} , disp_0^{\textsf{c}-1} +\texttt{D[c-1]}) , ... ,
(type_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} ,
disp_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} + \texttt{D[c-1]} ) ,
... ,
```
``` math
(type_0^{\textsf{c}-1} , disp_0^{\textsf{c}-1} +
\texttt{D[c-1]} + (\texttt{B[c-1]}-1) \cdot ex_{\textsf{c}-1} ) ,
... ,
```
``` math
(type_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} ,
disp_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} + \texttt{D[c-1]} +
(\texttt{B[c-1]-1)} \cdot ex_{\textsf{c}-1} )
\} .
```

A call to [[MPI_TYPE_HINDEXED]] is equivalent to a call to [[MPI_TYPE_STRUCT]] , where each entry of `T` is equal to `oldtype`.

### Address and extent functions



The displacements in a general datatype are relative to some initial buffer address. **Absolute addresses** can be substituted for these displacements: we treat them as displacements relative to “address zero,” the start of the address space. This initial address zero is indicated by the constant MPI_BOTTOM. Thus, a datatype can specify the absolute address of the entries in the communication buffer, in which case the `buf` argument is passed the value MPI_BOTTOM.

The address of a location in memory can be found by invoking the function [[MPI_ADDRESS]] .

![[API/MPI_ADDRESS]]

Returns the (byte) address of `location`.

 Using `MPI_ADDRESS` for an array.

       REAL A(100,100)
       INTEGER I1, I2, DIFF
       CALL MPI_ADDRESS(A(1,1), I1, IERROR)
       CALL MPI_ADDRESS(A(10,10), I2, IERROR)
       DIFF = I2 - I1
    ! The value of DIFF is 909*sizeofreal; the values of I1 and I2 are
    ! implementation dependent.

> [!note] Advice to users

> C users may be tempted to avoid the usage of [[MPI_ADDRESS]] and rely on the availability of the address operator &. Note, however, that & *cast-expression* is a pointer, not an address. ANSI C does not require that the value of a pointer (or the pointer cast to int) be the absolute address of the object pointed at — although this is commonly the case. Furthermore, referencing may not have a unique definition on machines with a segmented address space. The use of [[MPI_ADDRESS]] to “reference” C variables guarantees portability to such machines as well.

> [!note] Advice to users

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with
>
> Register Optimization” in Section 10.2.2 of the MPI-2 Standard, pages 286 and 289.

The following auxiliary functions provide useful information on derived datatypes.

![[API/MPI_TYPE_EXTENT]]

Returns the extent of a datatype, where extent is as defined on page [[pt2pt#Lower-bound and upper-bound markers|Lower-bound and upper-bound markers]] .

![[API/MPI_TYPE_SIZE]]

`MPI_TYPE_SIZE` returns the total size, in bytes, of the entries in the type signature associated with `datatype`; i.e., the total size of the data in a message that would be created with this datatype. Entries that occur multiple times in the datatype are counted with their multiplicity.

> [!note] Advice to users

> The MPI-1 Standard specifies that the output argument of
>
> [[MPI_TYPE_SIZE]] in C is of type `int`. The MPI Forum considered proposals to change this and decided to reiterate the original decision.

### Lower-bound and upper-bound markers



It is often convenient to define explicitly the lower bound and upper bound of a type map, and override the definition given on page [[pt2pt#Lower-bound and upper-bound markers|Lower-bound and upper-bound markers]] . This allows one to define a datatype that has “holes” at its beginning or its end, or a datatype with entries that extend above the upper bound or below the lower bound. Examples of such usage are provided in Sec. [[pt2pt#Examples|Examples]] .

Also, the user may want to overide the alignment rules that are used to compute upper bounds and extents. E.g., a C compiler may allow the user to overide default alignment rules for some of the structures within a program. The user has to specify explicitly the bounds of the datatypes that match these structures.

To achieve this, we add two additional “pseudo-datatypes,” `MPI_LB` and `MPI_UB`, that can be used, respectively, to mark the lower bound or the upper bound of a datatype. These pseudo-datatypes occupy no space ($`extent(\texttt{MPI_LB}) = extent(\texttt{MPI_UB}) =0`$). They do not affect the size or count of a datatype, and do not affect the

content of a message created with this datatype. However, they do affect the definition of the extent of a datatype and, therefore, affect the outcome of a replication of this datatype by a datatype constructor.

 Let <span class="sans-serif">D = (-3, 0, 6)</span>; <span class="sans-serif">T = (MPI_LB, MPI_INT, MPI_UB)</span>, and <span class="sans-serif">B = (1, 1, 1)</span>. Then a call to [[MPI_TYPE_STRUCT]] creates a new datatype that has an extent of 9 (from -3 to 5, 5 included), and contains an integer at displacement 0. This is the datatype defined by the sequence {(lb, -3), (int, 0), (ub, 6)} . If this type is replicated twice by a call to [[MPI_TYPE_CONTIGUOUS]] then the newly created type can be described by the sequence {(lb, -3), (int, 0), (int,9), (ub, 15)} . (An entry of type <span class="sans-serif">ub</span> can be deleted if there is another entry of type <span class="sans-serif">ub</span> with a higher displacement; an entry of type <span class="sans-serif">lb</span> can be deleted if there is another entry of type <span class="sans-serif">lb</span> with a lower displacement.)

In general, if
``` math
Typemap = \{ (type_0 , disp_0 ) , ... , (type_{n-1} , disp_{n-1}) \} ,
```
then the **lower bound** of $`Typemap`$ is defined to be
``` math
lb(Typemap) = \left\{ \begin{array}{ll}
\min_j disp_j & if no entry has basic type \textsf{lb} \\
\min_j \{ disp_j  such that type_j = \textsf{lb} \} & otherwise
\end{array}
\right.
```

Similarly, the **upper bound** of $`Typemap`$ is defined to be

``` math
ub(Typemap) = \left\{ \begin{array}{ll}
\max_j disp_j + sizeof(type_j) + \epsilon & if no entry has basic type
\textsf{ub}
\ \max_j \{ disp_j  such that type_j = \textsf{ub} \} & otherwise
\end{array}
\right.
```

Then
``` math
extent(Typemap) = ub(Typemap) - lb(Typemap)
```

If $`type_i`$ requires alignment to a byte address that is a multiple of $`k_i`$, then $`\epsilon`$ is the least nonnegative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$.

The formal definitions given for the various datatype constructors apply now, with the amended definition of **extent**.

The two functions below can be used for finding the lower bound and the upper bound of a datatype.

![[API/MPI_TYPE_LB]]

![[API/MPI_TYPE_UB]]

### Commit and free



A datatype object has to be **committed** before it can be used in a communication. A committed datatype can still be used as a argument in datatype constructors. There is no need to commit basic datatypes. They are “pre-committed.”

![[API/MPI_TYPE_COMMIT]]

The commit operation commits the datatype, that is, the formal description of a communication buffer, not the content of that buffer. Thus, after a datatype has been committed, it can be repeatedly reused to communicate the changing content of a buffer or, indeed, the content of different buffers, with different starting addresses.

> [!warning] Advice to implementors

> The system may “compile” at commit time an internal representation for the datatype that facilitates communication, e.g. change from a compacted representation to a flat representation of the datatype, and select the most convenient transfer mechanism.

![[API/MPI_TYPE_FREE]]

Marks the datatype object associated with `datatype` for deallocation and sets `datatype` to MPI_DATATYPE_NULL. Any communication that is currently using this datatype will complete normally. Derived datatypes that were defined from the freed datatype are not affected.

 The following code fragment gives examples of using `MPI_TYPE_COMMIT`.

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

Freeing a datatype does not affect any other datatype that was built from the freed datatype. The system behaves as if input datatype arguments to derived datatype constructors are passed by value.

> [!warning] Advice to implementors

> The implementation may keep a reference count of active communications that use the datatype, in order to decide when to free it. Also, one may implement constructors of derived datatypes so that they keep pointers to their datatype arguments, rather then copying them. In this case, one needs to keep track of active datatype definition references in order to know when a datatype object can be freed.

### Use of general datatypes in communication



Handles to derived datatypes can be passed to a communication call wherever a datatype argument is required. A call of the form [[MPI_SEND]] , where $`count > 1`$, is interpreted as if the call was passed a new datatype which is the concatenation of `count` copies of `datatype`. Thus, [[MPI_SEND]] is equivalent to,

    MPI_TYPE_CONTIGUOUS(count, datatype, newtype)
    MPI_TYPE_COMMIT(newtype)
    MPI_SEND(buf, 1, newtype, dest, tag, comm).

Similar statements apply to all other communication functions that have a `count` and `datatype` argument.

Suppose that a send operation [[MPI_SEND]] is executed, where `datatype` has type map,
``` math
\{(type_0, disp_0),...,(type_{n-1}, disp_{n-1})\},
```
and extent $`extent`$. (Empty entries of “pseudo-type” MPI_UB and MPI_LB are not listed in the type map, but they affect the value of $`extent`$.) The send operation sends $`n \cdot  count`$ entries, where entry $`i
\cdot n + j`$ is at location $`addr_{i,j} = \textsf{buf} + extent \cdot i + disp_j`$ and has type $`type_j`$, for $`i = 0 ,..., \textsf{count}-1`$ and $`j = 0 ,..., n-1`$. These entries need not be contiguous, nor distinct; their order can be arbitrary.

The variable stored at address $`addr_{i,j}`$ in the calling program should be of a type that matches $`type_j`$, where type matching is defined as in section [[pt2pt#Type matching rules|Type matching rules]] . The message sent contains $`n \cdot  count`$ entries, where entry $`i \cdot n +j`$ has type $`type_j`$.

Similarly, suppose that a receive operation [[MPI_RECV]] is executed, where `datatype` has type map,
``` math
\{(type_0, disp_0) ,...,(type_{n-1}, disp_{n-1}) \},
```

with extent $`extent`$. (Again, empty entries of “pseudo-type” MPI_UB and MPI_LB are not listed in the type map, but they affect the value of $`extent`$.) This receive operation receives $`n \cdot  count`$ entries, where entry $`i \cdot n + j`$ is at location $`\textsf{buf} + extent \cdot i + disp_j`$ and has type $`type_j`$. If the incoming message consists of $`k`$ elements, then we must have $`k \le n \cdot  count`$; the $`i \cdot n +
j`$-th element of the message should have a type that matches $`type_j`$.

Type matching is defined according to the type signature of the corresponding datatypes, that is, the sequence of basic type components. Type matching does not depend on some aspects of the datatype definition, such as the displacements (layout in memory) or the intermediate types used.

 This example shows that type matching is defined in terms of the basic types that a derived type consists of.

    ...
    CALL MPI_TYPE_CONTIGUOUS( 2, MPI_REAL, type2, ...)
    CALL MPI_TYPE_CONTIGUOUS( 4, MPI_REAL, type4, ...)
    CALL MPI_TYPE_CONTIGUOUS( 2, type2, type22, ...)
    ...
    CALL MPI_SEND( a, 4, MPI_REAL, ...)
    CALL MPI_SEND( a, 2, type2, ...)
    CALL MPI_SEND( a, 1, type22, ...)
    CALL MPI_SEND( a, 1, type4, ...)
    ...
    CALL MPI_RECV( a, 4, MPI_REAL, ...)
    CALL MPI_RECV( a, 2, type2, ...)
    CALL MPI_RECV( a, 1, type22, ...)
    CALL MPI_RECV( a, 1, type4, ...)

Each of the sends matches any of the receives.

A datatype may specify overlapping entries. The use of such a datatype in a receive operation is erroneous. (This is erroneous even if the actual message received is short enough not to write any entry more than once.)

Suppose that [[MPI_RECV]] is executed, where `datatype` has type map,
``` math
\{(type_0, disp_0) ,...,(type_{n-1}, disp_{n-1}) \}.
```
The received message need not fill all the receive buffer, nor does it need to fill a number of locations which is a multiple of $`n`$. Any number, $`k`$, of basic elements can be received, where $`0 \le k \le \textsf{count} \cdot n`$. The number of basic elements received can be retrieved from `status` using the query function [[MPI_GET_ELEMENTS]] .

![[API/MPI_GET_ELEMENTS]]

The previously defined function, `MPI_GET_COUNT` (Sec. [[pt2pt#Return status|Return status]] ), has a different behavior.

It returns the number of “top-level entries” received, i.e. the number of “copies” of type `datatype`.

In the previous example, `MPI_GET_COUNT` may return any integer value $`k`$, where $`0 \le k \le \textsf{count}`$. If `MPI_GET_COUNT` returns $`k`$, then the number of basic elements received (and the value returned by `MPI_GET_ELEMENTS`) is $`n \cdot k`$. If the number of basic elements received is not a multiple of $`n`$, that is, if the receive operation has not received an integral number of `datatype` “copies,” then `MPI_GET_COUNT` returns the value MPI_UNDEFINED.

The `datatype` argument should match the argument provided by the receive call that set the `status` variable.

 Usage of `MPI_GET_COUNT` and `MPI_GET_ELEMENT`.

    ...
    CALL MPI_TYPE_CONTIGUOUS(2, MPI_REAL, Type2, ierr)
    CALL MPI_TYPE_COMMIT(Type2, ierr)
    ...
    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF(rank.EQ.0) THEN
          CALL MPI_SEND(a, 2, MPI_REAL, 1, 0, comm, ierr)
          CALL MPI_SEND(a, 3, MPI_REAL, 1, 0, comm, ierr)
    ELSE
          CALL MPI_RECV(a, 2, Type2, 0, 0, comm, stat, ierr)
          CALL MPI_GET_COUNT(stat, Type2, i, ierr)     ! returns i=1
          CALL MPI_GET_ELEMENTS(stat, Type2, i, ierr)  ! returns i=2
          CALL MPI_RECV(a, 2, Type2, 0, 0, comm, stat, ierr)
          CALL MPI_GET_COUNT(stat, Type2, i, ierr)     ! returns i=MPI_UNDEFINED
          CALL MPI_GET_ELEMENTS(stat, Type2, i, ierr)  ! returns i=3
    END IF

The function `MPI_GET_ELEMENTS` can also be used after a probe to find the number of elements in the probed message. Note that the two functions `MPI_GET_COUNT` and `MPI_GET_ELEMENTS` return the same values when they are used with basic datatypes.

> [!tip] Rationale

> The extension given to the definition of `MPI_GET_COUNT` seems natural: one would expect this function to return the value of the `count` argument, when the receive buffer is filled. Sometimes `datatype` represents a basic unit of data one wants to transfer, for example, a record in an array of records (structures). One should be able to find out how many components were received without bothering to divide by the number of elements in each component. However, on other occasions, `datatype` is used to define a complex layout of data in the receiver memory, and does not represent a basic unit of data for transfers. In such cases, one needs to use the function `MPI_GET_ELEMENTS`.

> [!warning] Advice to implementors

> The definition implies that a receive cannot change the value of storage outside the entries defined to compose the communication buffer. In particular, the definition implies that padding space in a structure should not be modified when such a structure is copied from one process to another. This would prevent the obvious optimization of copying the structure, together with the padding, as one contiguous block. The implementation is free to do this optimization when it does not impact the outcome of the computation.
>
> The user can “force” this optimization by explicitly including padding as part of the message.

### Correct use of addresses



Successively declared variables in C or Fortran are not necessarily stored at contiguous locations. Thus, care must be exercised that displacements do not cross from one variable to another. Also, in machines with a segmented address space, addresses are not unique and address arithmetic has some peculiar properties. Thus, the use of **addresses**, that is, displacements relative to the start address MPI_BOTTOM, has to be restricted.

Variables belong to the same **sequential storage** if they belong to the same array, to the same <span class="sans-serif">COMMON</span> block in Fortran, or to the same structure in C. Valid addresses are defined recursively as follows:

1.  The function [[MPI_ADDRESS]] returns a valid address, when passed as argument a variable of the calling program.

2.  The `buf` argument of a communication function evaluates to a valid address, when passed as argument a variable of the calling program.

3.  If `v` is a valid address, and `i` is an integer, then `v+i` is a valid address, provided `v` and `v+i` are in the same sequential storage.

4.  If `v` is a valid address then MPI_BOTTOM + v is a valid address.

A correct program uses only valid addresses to identify the locations of entries in communication buffers. Furthermore, if `u` and `v` are two valid addresses, then the (integer) difference `u - v` can be computed only if both `u` and <span class="sans-serif">v</span> are in the same sequential storage. No other arithmetic operations can be meaningfully executed on addresses.

The rules above impose no constraints on the use of derived datatypes, as long as they are used to define a communication buffer that is wholly contained within the same sequential storage. However, the construction of a communication buffer that contains variables that are not within the same sequential storage must obey certain restrictions. Basically, a communication buffer with variables that are not within the same sequential storage can be used only by specifying in the communication call `buf = MPI_BOTTOM`, `count = 1`, and using a `datatype` argument where all displacements are valid (absolute) addresses.

> [!note] Advice to users

> It is not expected that MPI implementations will be able to detect erroneous, “out of bound” displacements — unless those overflow the user address space — since the MPI call may not know the extent of the arrays and records in the host program.

> [!warning] Advice to implementors

> There is no need to distinguish (absolute) addresses and (relative) displacements on a machine with contiguous address space: MPI_BOTTOM is zero, and both addresses and displacements are integers. On machines where the distinction is required, addresses are recognized as expressions that involve MPI_BOTTOM.

Note that in Fortran, Fortran INTEGERs may be too small to contain an address (e.g., 32 bit INTEGERs on a machine with 64bit pointers). Because of this, in Fortran, implementations may restrict the use of absolute addresses to only part of the process memory, and restrict the use of relative displacements to subranges of the process memory where they are constrained by the size of Fortran INTEGERs.

### Examples



The following examples illustrate the use of derived datatypes.

 Send and receive a section of a 3D array.

          REAL a(100,100,100), e(9,9,9)
          INTEGER oneslice, twoslice, threeslice, sizeofreal, myrank, ierr
          INTEGER status(MPI_STATUS_SIZE)

    C      extract the section a(1:17:2, 3:11, 2:10)
    C      and store it in e(:,:,:).

          CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

          CALL MPI_TYPE_EXTENT( MPI_REAL, sizeofreal, ierr)

    C     create datatype for a 1D section
          CALL MPI_TYPE_VECTOR( 9, 1, 2, MPI_REAL, oneslice, ierr)

    C     create datatype for a 2D section
          CALL MPI_TYPE_HVECTOR(9, 1, 100*sizeofreal, oneslice, twoslice, ierr)

    C     create datatype for the entire section
          CALL MPI_TYPE_HVECTOR( 9, 1, 100*100*sizeofreal, twoslice,
                                 threeslice, ierr)

          CALL MPI_TYPE_COMMIT( threeslice, ierr)
          CALL MPI_SENDRECV(a(1,3,2), 1, threeslice, myrank, 0, e, 9*9*9,
                            MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

 Copy the (strictly) lower triangular part of a matrix.

          REAL a(100,100), b(100,100)
          INTEGER  disp(100), blocklen(100), ltype, myrank, ierr
          INTEGER status(MPI_STATUS_SIZE)

    C     copy lower triangular part of array a
    C     onto lower triangular part of array b

          CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

    C     compute start and size of each column
          DO i=1, 100
            disp(i) = 100*(i-1) + i
            block(i) = 100-i
          END DO

    C     create datatype for lower triangular part
          CALL MPI_TYPE_INDEXED( 100, block, disp, MPI_REAL, ltype, ierr)

          CALL MPI_TYPE_COMMIT(ltype, ierr)
          CALL MPI_SENDRECV( a, 1, ltype, myrank, 0, b, 1,
                        ltype, myrank, 0, MPI_COMM_WORLD, status, ierr)

 Transpose a matrix.

          REAL a(100,100), b(100,100)
          INTEGER row, xpose, sizeofreal, myrank, ierr
          INTEGER status(MPI_STATUS_SIZE)

    C     transpose matrix a onto b

          CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

          CALL MPI_TYPE_EXTENT( MPI_REAL, sizeofreal, ierr)

    C     create datatype for one row
          CALL MPI_TYPE_VECTOR( 100, 1, 100, MPI_REAL, row, ierr)

    C     create datatype for matrix in row-major order
          CALL MPI_TYPE_HVECTOR( 100, 1, sizeofreal, row, xpose, ierr)

          CALL MPI_TYPE_COMMIT( xpose, ierr)

    C     send matrix in row-major order and receive in column major order
          CALL MPI_SENDRECV( a, 1, xpose, myrank, 0, b, 100*100,
                    MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

 Another approach to the transpose problem:

          REAL a(100,100), b(100,100)
          INTEGER  disp(2), blocklen(2), type(2), row, row1, sizeofreal
          INTEGER  myrank, ierr
          INTEGER status(MPI_STATUS_SIZE)

          CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

    C     transpose matrix a onto b

          CALL MPI_TYPE_EXTENT( MPI_REAL, sizeofreal, ierr)

    C     create datatype for one row
          CALL MPI_TYPE_VECTOR( 100, 1, 100, MPI_REAL, row, ierr)

    C     create datatype for one row, with the extent of one real number
          disp(1) = 0
          disp(2) = sizeofreal
          type(1)  = row
          type(2)  = MPI_UB
          blocklen(1)  = 1
          blocklen(2)  = 1
          CALL MPI_TYPE_STRUCT( 2, blocklen, disp, type, row1, ierr)

          CALL MPI_TYPE_COMMIT( row1, ierr)

    C     send 100 rows and receive in column major order
          CALL MPI_SENDRECV( a, 100, row1, myrank, 0, b, 100*100,
                    MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

 We manipulate an array of structures.

    struct Partstruct
       {
       int    class;  /* particle class */
       double d[6];   /* particle coordinates */
       char   b[7];   /* some additional information */
       };

    struct Partstruct    particle[1000];

    int                  i, dest, rank;
    MPI_Comm     comm;

    /* build datatype describing structure */

    MPI_Datatype Particletype;
    MPI_Datatype type[3] = {MPI_INT, MPI_DOUBLE, MPI_CHAR};
    int          blocklen[3] = {1, 6, 7};
    MPI_Aint     disp[3];
    MPI_Aint     base;

    /* compute displacements of structure components */

    MPI_Address( particle, disp);
    MPI_Address( particle[0].d, disp+1);
    MPI_Address( particle[0].b, disp+2);
    base = disp[0];
    for (i=0; i <3; i++) disp[i] -= base;

    MPI_Type_struct( 3, blocklen, disp, type, &Particletype);

       /* If compiler does padding in mysterious ways,
       the following may be safer */

    MPI_Datatype type1[4] = {MPI_INT, MPI_DOUBLE, MPI_CHAR, MPI_UB};
    int          blocklen1[4] = {1, 6, 7, 1};
    MPI_Aint     disp1[4];

    /* compute displacements of structure components */

    MPI_Address( particle, disp1);
    MPI_Address( particle[0].d, disp1+1);
    MPI_Address( particle[0].b, disp1+2);
    MPI_Address( particle+1, disp1+3);
    base = disp1[0];
    for (i=0; i <4; i++) disp1[i] -= base;

    /* build datatype describing structure */

    MPI_Type_struct( 4, blocklen1, disp1, type1, &Particletype);

                  /* 4.1:
            send the entire array */

    MPI_Type_commit( &Particletype);
    MPI_Send( particle, 1000, Particletype, dest, tag, comm);

                  /* 4.2:
            send only the entries of class zero particles,
            preceded by the number of such entries */

    MPI_Datatype Zparticles;   /* datatype describing all particles
                                  with class zero (needs to be recomputed
                                  if classes change) */
    MPI_Datatype Ztype;

    MPI_Aint     zdisp[1000];
    int zblock[1000], j, k;
    int zzblock[2] = {1,1};
    MPI_Aint     zzdisp[2];
    MPI_Datatype zztype[2];

    /* compute displacements of class zero particles */
    j = 0;
    for(i=0; i < 1000; i++)
      if (particle[i].class==0)
         {
         zdisp[j] = i;
         zblock[j] = 1;
         j++;
         }

    /* create datatype for class zero particles  */
    MPI_Type_indexed( j, zblock, zdisp, Particletype, &Zparticles);

    /* prepend particle count */
    MPI_Address(&j, zzdisp);
    MPI_Address(particle, zzdisp+1);
    zztype[0] = MPI_INT;
    zztype[1] = Zparticles;
    MPI_Type_struct(2, zzblock, zzdisp, zztype, &Ztype);

    MPI_Type_commit( &Ztype);
    MPI_Send( MPI_BOTTOM, 1, Ztype, dest, tag, comm);

           /* A probably more efficient way of defining Zparticles */

    /* consecutive particles with index zero are handled as one block */
    j=0;
    for (i=0; i < 1000; i++)
      if (particle[i].index==0)
        {
        for (k=i+1; (k < 1000)&&(particle[k].index == 0) ; k++);
        zdisp[j] = i;
        zblock[j] = k-i;
        j++;
        i = k;
        }
    MPI_Type_indexed( j, zblock, zdisp, Particletype, &Zparticles);

                    /* 4.3:
              send the first two coordinates of all entries */

    MPI_Datatype Allpairs;      /* datatype for all pairs of coordinates */

    MPI_Aint sizeofentry;

    MPI_Type_extent( Particletype, &sizeofentry);

         /* sizeofentry can also be computed by subtracting the address
            of particle[0] from the address of particle[1] */

    MPI_Type_hvector( 1000, 2, sizeofentry, MPI_DOUBLE, &Allpairs);
    MPI_Type_commit( &Allpairs);
    MPI_Send( particle[0].d, 1, Allpairs, dest, tag, comm);

          /* an alternative solution to 4.3 */

    MPI_Datatype Onepair;   /* datatype for one pair of coordinates, with
                              the extent of one particle entry */
    MPI_Aint disp2[3];
    MPI_Datatype type2[3] = {MPI_LB, MPI_DOUBLE, MPI_UB};
    int blocklen2[3] = {1, 2, 1};

    MPI_Address( particle, disp2);
    MPI_Address( particle[0].d, disp2+1);
    MPI_Address( particle+1, disp2+2);
    base = disp2[0];
    for (i=0; i<2; i++) disp2[i] -= base;

    MPI_Type_struct( 3, blocklen2, disp2, type2, &Onepair);
    MPI_Type_commit( &Onepair);
    MPI_Send( particle[0].d, 1000, Onepair, dest, tag, comm);

 The same manipulations as in the previous example, but use absolute addresses in datatypes.

    struct Partstruct
       {
       int class;
       double d[6];
       char b[7];
       };

    struct Partstruct particle[1000];

               /* build datatype describing first array entry */

    MPI_Datatype Particletype;
    MPI_Datatype type[3] = {MPI_INT, MPI_DOUBLE, MPI_CHAR};
    int          block[3] = {1, 6, 7};
    MPI_Aint     disp[3];

    MPI_Address( particle, disp);
    MPI_Address( particle[0].d, disp+1);
    MPI_Address( particle[0].b, disp+2);
    MPI_Type_struct( 3, block, disp, type, &Particletype);

    /* Particletype describes first array entry -- using absolute
       addresses */

                      /* 5.1:
                send the entire array */

    MPI_Type_commit( &Particletype);
    MPI_Send( MPI_BOTTOM, 1000, Particletype, dest, tag, comm);

                     /* 5.2:
             send the entries of class zero,
             preceded by the number of such entries */

    MPI_Datatype Zparticles, Ztype;

    MPI_Aint zdisp[1000]
    int zblock[1000], i, j, k;
    int zzblock[2] = {1,1};
    MPI_Datatype zztype[2];
    MPI_Aint     zzdisp[2];

    j=0;
    for (i=0; i < 1000; i++)
      if (particle[i].index==0)
        {
        for (k=i+1; (k < 1000)&&(particle[k].index = 0) ; k++);
        zdisp[j] = i;
        zblock[j] = k-i;
        j++;
        i = k;
        }
    MPI_Type_indexed( j, zblock, zdisp, Particletype, &Zparticles);
    /* Zparticles describe particles with class zero, using
       their absolute addresses*/

    /* prepend particle count */
    MPI_Address(&j, zzdisp);
    zzdisp[1] = MPI_BOTTOM;
    zztype[0] = MPI_INT;
    zztype[1] = Zparticles;
    MPI_Type_struct(2, zzblock, zzdisp, zztype, &Ztype);

    MPI_Type_commit( &Ztype);
    MPI_Send( MPI_BOTTOM, 1, Ztype, dest, tag, comm);

 Handling of unions.

    union {
       int     ival;
       float   fval;
          } u[1000]

    int     utype;

    /* All entries of u have identical type; variable
       utype keeps track of their current type */

    MPI_Datatype   type[2];
    int            blocklen[2] = {1,1};
    MPI_Aint       disp[2];
    MPI_Datatype   mpi_utype[2];
    MPI_Aint       i,j;

    /* compute an MPI datatype for each possible union type;
       assume values are left-aligned in union storage. */

    MPI_Address( u, &i);
    MPI_Address( u+1, &j);
    disp[0] = 0; disp[1] = j-i;
    type[1] = MPI_UB;

    type[0] = MPI_INT;
    MPI_Type_struct(2, blocklen, disp, type, &mpi_utype[0]);

    type[0] = MPI_FLOAT;
    MPI_Type_struct(2, blocklen, disp, type, &mpi_utype[1]);

    for(i=0; i<2; i++) MPI_Type_commit(&mpi_utype[i]);

    /* actual communication */

    MPI_Send(u, 1000, mpi_utype[utype], dest, tag, comm);

## Pack and unpack



Some existing communication libraries provide pack/unpack functions for sending noncontiguous data. In these, the user explicitly packs data into a contiguous buffer before sending it, and unpacks it from a contiguous buffer after receiving it. Derived datatypes, which are described in Section [[pt2pt#Derived datatypes|Derived datatypes]] , allow one, in most cases, to avoid explicit packing and unpacking. The user specifies the layout of the data to be sent or received, and the communication library directly accesses a noncontiguous buffer. The pack/unpack routines are provided for compatibility with previous libraries. Also, they provide some functionality that is not otherwise available in MPI. For instance, a message can be received in several parts, where the receive operation done on a later part may depend on the content of a former part. Another use is that outgoing messages may be explicitly buffered in user supplied space, thus overriding the system buffering policy. Finally, the availability of pack and unpack operations facilitates the development of additional communication libraries layered on top of MPI.

![[API/MPI_PACK]]

Packs the message in the send buffer specified by `inbuf, incount, datatype` into the buffer space specified by `outbuf` and

`outsize`. The input buffer can be any communication buffer allowed in [[MPI_SEND]] . The output buffer is a contiguous storage area containing `outsize` bytes, starting at the address `outbuf` (length is counted in <span class="sans-serif">bytes</span>, not elements, as if it were a communication buffer for a message of type `MPI_PACKED`).

The input value of `position` is the first location in the output buffer to be used for packing. `position` is incremented by the size of the packed message, and the output value of `position` is the first location in the output buffer following the locations occupied by the packed message. The `comm` argument is the communicator that will be subsequently used for sending the packed message.

![[API/MPI_UNPACK]]

Unpacks a message into the receive buffer specified by `outbuf, outcount, datatype` from the buffer space specified by `inbuf` and `insize`. The output buffer can be any communication buffer allowed in [[MPI_RECV]] . The input buffer is a contiguous storage area containing `insize` bytes, starting at address `inbuf`.

The input value of `position` is the first location in the input buffer occupied by the packed message. `position` is incremented by the size of the packed message, so that the output value of `position` is the first location in the input buffer

after the locations occupied by the message that was unpacked. `comm` is the communicator used to receive the packed message.

> [!note] Advice to users

> Note the difference between [[MPI_RECV]] and [[MPI_UNPACK]] : in [[MPI_RECV]] , the `count` argument specifies the maximum number of items that can be received. The actual number of items received is determined by the length of the incoming message. In `MPI_UNPACK`, the `count` argument specifies the actual number of items that are unpacked; the “size” of the corresponding message is the increment in `position`. The reason for this change is that the “incoming message size” is not predetermined since the user decides how much to unpack; nor is it easy to determine the “message size” from the number of items to be unpacked. In fact, in a heterogeneous system, this number may not be determined *a priori*.

To understand the behavior of pack and unpack, it is convenient to think of the data part of a message as being the sequence obtained by concatenating the successive values sent in that message. The pack operation stores this sequence in the buffer space, as if sending the message to that buffer. The unpack operation retrieves this sequence from buffer space, as if receiving a message from that buffer. (It is helpful to think of internal Fortran files or <span class="sans-serif">sscanf</span> in C, for a similar function.)

Several messages can be successively packed into one **packing unit**. This is effected by several successive **related** calls to `MPI_PACK`, where the first call provides `position = 0`, and each successive call inputs the value of `position` that was output by the previous call, and the same values for `outbuf, outcount` and `comm`. This packing unit now contains the equivalent information that would have been stored in a message by one send call with a send buffer that is the “concatenation” of the individual send buffers.

A packing unit can be sent using type `MPI_PACKED`. Any point to point or collective communication function can be used to move the sequence of bytes that forms the packing unit from one process to another. This packing unit can now be received using any receive operation, with any datatype: the type matching rules are relaxed for messages sent with type `MPI_PACKED`.

A message sent with any type (including `MPI_PACKED`) can be received using the type `MPI_PACKED`. Such a message can then be unpacked by calls to [[MPI_UNPACK]] .

A packing unit (or a message created by a regular, “typed” send) can be unpacked into several successive messages. This is effected by several successive related calls to [[MPI_UNPACK]] , where the first call provides `position = 0`, and each successive call inputs the value of `position` that was output by the previous call, and the same values for `inbuf, insize` and `comm`.

The concatenation of two packing units is not necessarily a packing unit; nor is a substring of a packing unit necessarily a packing unit. Thus, one cannot concatenate two packing units and then unpack the result as one packing unit; nor can one unpack a substring of a packing unit as a separate packing unit. Each packing unit, that was created by a related sequence of pack calls, or by a regular send, must be unpacked as a unit, by a sequence of related unpack calls.

> [!tip] Rationale

> The restriction on “atomic” packing and unpacking of packing units allows the implementation to add at the head of packing units additional information, such as a description of the sender architecture (to be used for type conversion, in a heterogeneous environment)

The following call allows the user to find out how much space is needed to pack a message and, thus, manage space allocation for buffers.

![[API/MPI_PACK_SIZE]]

A call to [[MPI_PACK_SIZE]] returns in `size` an upper bound on the increment in `position` that is effected by a call to [[MPI_PACK]] .

> [!tip] Rationale

> The call returns an upper bound, rather than an exact bound, since the exact amount of space needed to pack the message may depend on the context (e.g., first message packed in a packing unit may take more space).

 An example using `MPI_PACK`.

    int position, i, j, a[2];
    char buff[1000];

    ....

    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    if (myrank == 0)
    {
       / * SENDER CODE */

      position = 0;
      MPI_Pack(&i, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);
      MPI_Pack(&j, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);
      MPI_Send( buff, position, MPI_PACKED, 1, 0, MPI_COMM_WORLD);
    }
    else  /* RECEIVER CODE */
      MPI_Recv( a, 2, MPI_INT, 0, 0, MPI_COMM_WORLD)

    }

 A elaborate example.

    int position, i;
    float a[1000];
    char buff[1000]

    ....

    MPI_Comm_rank(MPI_Comm_world, &myrank);
    if (myrank == 0)
    {
      / * SENDER CODE */

      int len[2];
      MPI_Aint disp[2];
      MPI_Datatype type[2], newtype;

      /* build datatype for i followed by a[0]...a[i-1] */

      len[0] = 1;
      len[1] = i;
      MPI_Address( &i, disp);
      MPI_Address( a, disp+1);
      type[0] = MPI_INT;
      type[1] = MPI_FLOAT;
      MPI_Type_struct( 2, len, disp, type, &newtype);
      MPI_Type_commit( &newtype);

      /* Pack i followed by a[0]...a[i-1]*/

      position = 0;
      MPI_Pack( MPI_BOTTOM, 1, newtype, buff, 1000, &position, MPI_COMM_WORLD);

      /* Send */

      MPI_Send( buff, position, MPI_PACKED, 1, 0,
                MPI_COMM_WORLD)

    /* *****
       One can replace the last three lines with
       MPI_Send( MPI_BOTTOM, 1, newtype, 1, 0, MPI_COMM_WORLD);
       ***** */
    }
    else /* myrank == 1 */
    {
       /* RECEIVER CODE */

      MPI_Status status;

      /* Receive */

      MPI_Recv( buff, 1000, MPI_PACKED, 0, 0, &status);

      /* Unpack i */

     position = 0;
     MPI_Unpack(buff, 1000, &position, &i, 1, MPI_INT, MPI_COMM_WORLD);

     /* Unpack a[0]...a[i-1] */
     MPI_Unpack(buff, 1000, &position, a, i, MPI_FLOAT, MPI_COMM_WORLD);
    }

 Each process sends a count, followed by count characters to the root; the root concatenate all characters into one string.

    int count, gsize, counts[64], totalcount, k1, k2, k,
        displs[64], position, concat_pos;
    char chr[100], *lbuf, *rbuf, *cbuf;
    ...
    MPI_Comm_size(comm, &gsize);
    MPI_Comm_rank(comm, &myrank);

          /* allocate local pack buffer */
    MPI_Pack_size(1, MPI_INT, comm, &k1);
    MPI_Pack_size(count, MPI_CHAR, comm, &k2);
    k = k1+k2;
    lbuf = (char *)malloc(k);

          /* pack count, followed by count characters */
    position = 0;
    MPI_Pack(&count, 1, MPI_INT, lbuf, k, &position, comm);
    MPI_Pack(chr, count, MPI_CHAR, lbuf, k, &position, comm);

    if (myrank != root) {
          /* gather at root sizes of all packed messages */
       MPI_Gather( &position, 1, MPI_INT, NULL, NULL,
                 NULL, root, comm);

          /* gather at root packed messages */
       MPI_Gatherv( &buf, position, MPI_PACKED, NULL,
                 NULL, NULL, NULL, root, comm);

    } else {   /* root code */
          /* gather sizes of all packed messages */
       MPI_Gather( &position, 1, MPI_INT, counts, 1,
                 MPI_INT, root, comm);

          /* gather all packed messages */
       displs[0] = 0;
       for (i=1; i < gsize; i++)
         displs[i] = displs[i-1] + counts[i-1];
       totalcount = dipls[gsize-1] + counts[gsize-1];
       rbuf = (char *)malloc(totalcount);
       cbuf = (char *)malloc(totalcount);
       MPI_Gatherv( lbuf, position, MPI_PACKED, rbuf,
                counts, displs, MPI_PACKED, root, comm);
     
           /* unpack all messages and concatenate strings */
       concat_pos = 0;
       for (i=0; i < gsize; i++) {
          position = 0;
          MPI_Unpack( rbuf+displs[i], totalcount-displs[i],
                &position, &count, 1, MPI_INT, comm);
          MPI_Unpack( rbuf+displs[i], totalcount-displs[i],
                &position, cbuf+concat_pos, count, MPI_CHAR, comm);
          concat_pos += count;
       }
       cbuf[concat_pos] = `\0';
    }

