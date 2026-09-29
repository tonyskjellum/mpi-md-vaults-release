---
title: "Return Status"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Return Status

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Return status|MPI-1.3]], [[versions/v21/sections/pt2pt#Return Status|MPI-2.1]], [[versions/v22/sections/pt2pt#Return Status|MPI-2.2]], [[versions/v30/sections/pt2pt#Return Status|MPI-3.0]], [[versions/v31/sections/pt2pt#Return Status|MPI-3.1]], [[versions/v40/sections/pt2pt#Return Status|MPI-4.0]], [[versions/v41/sections/pt2pt#Return Status|MPI-4.1]], [[versions/v50/sections/pt2pt#Return Status|MPI-5.0]]

Heading by release: MPI-1.3: “Return status”; MPI-2.1: “Return Status”; MPI-2.2: “Return Status”; MPI-3.0: “Return Status”; MPI-3.1: “Return Status”; MPI-4.0: “Return Status”; MPI-4.1: “Return Status”; MPI-5.0: “Return Status”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~In general, message passing calls do not modify the value of the error code field of status variables. This field may be updated only by the functions in Section [[versions/v21/sections/pt2pt#Multiple Completions|Multiple Completions]] which return multiple statuses. The field is updated if and only if such function returns with an error code of MPI_ERR_IN_STATUS.~~

==In C++, the `status` object is handled through the following methods:==

==In general, message-passing calls do not modify the value of the error code field of status variables. This field may be updated only by the functions in Section [[versions/v21/sections/pt2pt#Multiple Completions|Multiple Completions]] which return multiple statuses. The field is updated if and only if such function returns with an error code of MPI_ERR_IN_STATUS.==

Returns the number of entries received. (Again, we count *entries*, each of type *datatype*, not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable. (We shall later see, in Section ~~[[versions/v21/sections/pt2pt#Use~~ ==[[datatypes#Use== of ~~general datatypes~~ ==General Datatypes== in ~~communication|Use~~ ==Communication|Use== of ~~general datatypes~~ ==General Datatypes== in ~~communication]]~~ ==Communication]]== , that [[versions/v21/API/MPI_GET_COUNT|MPI_GET_COUNT]] may return, in certain situations, the value MPI_UNDEFINED.)

~~> Some message passing libraries use `INOUT` `count`, `tag` and `source` arguments, thus using them both to specify the selection criteria for incoming messages and return the actual envelope values of the received message. The use of a separate status argument prevents errors that are often attached with `INOUT` argument (e.g., using the MPI_ANY_TAG constant as the tag in a receive). Some libraries use calls that refer implicitly to the “last message received.” This is not thread safe. > > The `datatype` argument is passed to `MPI_GET_COUNT` so as to improve performance. A message might be received without counting the number of elements it contains, and the count value is often not needed. Also, this allows the same function to be used after a call to > > `MPI_PROBE` or `MPI_IPROBE`. With a status from `MPI_PROBE` or `MPI_IPROBE`, the same datatypes are allowed as in a call to `MPI_RECV` to receive this message.~~

==> Some message-passing libraries use `INOUT` `count`, `tag` and `source` arguments, thus using them both to specify the selection criteria for incoming messages and return the actual envelope values of the received message. The use of a separate status argument prevents errors that are often attached with `INOUT` argument (e.g., using the MPI_ANY_TAG constant as the tag in a receive). Some libraries use calls that refer implicitly to the “last message received.” This is not thread safe. > > The `datatype` argument is passed to `MPI_GET_COUNT` so as to improve performance. A message might be received without counting the number of elements it contains, and the count value is often not needed. Also, this allows the same function to be used after a call to > > `MPI_PROBE` or `MPI_IPROBE`. With a status from `MPI_PROBE` or `MPI_IPROBE`, the same datatypes are allowed as in a call to `MPI_RECV` to receive this message.==

==The value returned as the `count` argument of [[versions/v21/API/MPI_GET_COUNT|MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transfered is greater than zero, MPI_UNDEFINED is returned.==

==> [!tip] Rationale==

==> Zero-length datatypes may be created in a number of cases. > > An important case is > > [[versions/v21/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] , where the definition of the particular > > darray > > results in an empty block on some MPI process. Programs written in an SPMD style will not check for this special case and may want to use [[versions/v21/API/MPI_GET_COUNT|MPI_GET_COUNT]] to check the status.==

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

In C, `status` is a structure that contains three fields named ~~MPI_SOURCE, MPI_TAG,~~ ==`MPI_SOURCE`, `MPI_TAG`,== and ~~MPI_ERROR;~~ ==`MPI_ERROR`;== the structure may contain additional fields. Thus, `status.MPI_SOURCE`, `status.MPI_TAG` and `status.MPI_ERROR` contain the source, tag, and error code, respectively, of the received message.

In Fortran, `status` is an array of `INTEGER`s of size ~~MPI_STATUS_SIZE.~~ ==`MPI_STATUS_SIZE`.== The constants ~~MPI_SOURCE, MPI_TAG~~ ==`MPI_SOURCE`, `MPI_TAG`== and ~~MPI_ERROR~~ ==`MPI_ERROR`== are the indices of the entries that store the source, tag and error fields. Thus, `status(MPI_SOURCE)`, `status(MPI_TAG)` and `status(MPI_ERROR)` contain, respectively, the source, tag and error code of the received message.

In general, message-passing calls do not modify the value of the error code field of status variables. This field may be updated only by the functions in Section [[versions/v22/sections/pt2pt#Multiple Completions|Multiple Completions]] which return multiple statuses. The field is updated if and only if such function returns with an error code of ~~MPI_ERR_IN_STATUS.~~ ==`MPI_ERR_IN_STATUS`.==

Returns the number of entries received. (Again, we count *entries*, each of type *datatype*, not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable. (We shall later see, in Section [[versions/v22/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , that [[versions/v22/API/MPI_GET_COUNT|MPI_GET_COUNT]] may return, in certain situations, the value ~~MPI_UNDEFINED.)~~ ==`MPI_UNDEFINED`.)==

> Some message-passing libraries use `INOUT` `count`, `tag` and `source` arguments, thus using them both to specify the selection criteria for incoming messages and return the actual envelope values of the received message. The use of a separate status argument prevents errors that are often attached with `INOUT` argument (e.g., using the ~~MPI_ANY_TAG~~ ==`MPI_ANY_TAG`== constant as the tag in a receive). Some libraries use calls that refer implicitly to the “last message received.” This is not thread safe. > > The `datatype` argument is passed to `MPI_GET_COUNT` so as to improve performance. A message might be received without counting the number of elements it contains, and the count value is often not needed. Also, this allows the same function to be used after a call to > > `MPI_PROBE` or `MPI_IPROBE`. With a status from `MPI_PROBE` or `MPI_IPROBE`, the same datatypes are allowed as in a call to `MPI_RECV` to receive this message.

The value returned as the `count` argument of [[versions/v22/API/MPI_GET_COUNT|MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transfered is greater than zero, ~~MPI_UNDEFINED~~ ==`MPI_UNDEFINED`== is returned.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~The source or tag of a received message may not be known if wildcard values were used in the receive operation.~~

~~Also, if multiple requests are completed by a single MPI function (see Section [[versions/v30/sections/pt2pt#Multiple Completions|Multiple Completions]] ), a distinct error code may need to be returned for each request. The information is returned by the `status` argument of [[versions/v30/API/MPI_RECV|MPI_RECV]] . The type of `status` is MPI-defined. Status variables need to be explicitly allocated by the user, that is, they are not system objects.~~

==The source or tag of a received message may not be known if wildcard values were used in the receive operation. Also, if multiple requests are completed by a single MPI function (see Section [[versions/v30/sections/pt2pt#Multiple Completions|Multiple Completions]] ), a distinct error code may need to be returned for each request. The information is returned by the `status` argument of [[versions/v30/API/MPI_RECV|MPI_RECV]] . The type of `status` is MPI-defined. Status variables need to be explicitly allocated by the user, that is, they are not system objects.==

~~In Fortran, `status` is an array of `INTEGER`s of size `MPI_STATUS_SIZE`. The constants `MPI_SOURCE`, `MPI_TAG` and `MPI_ERROR` are the indices of the entries that store the source, tag and error fields. Thus, `status(MPI_SOURCE)`, `status(MPI_TAG)` and `status(MPI_ERROR)` contain, respectively, the source, tag and error code of the received message.~~

~~In C++, the `status` object is handled through the following methods:~~

==In Fortran with `USE` `mpi` or `INCLUDE` `’mpif.h’`, `status` is an array of `INTEGER`s of size `MPI_STATUS_SIZE`. The constants `MPI_SOURCE`, `MPI_TAG` and `MPI_ERROR` are the indices of the entries that store the source, tag and error fields. Thus, `status(MPI_SOURCE)`, `status(MPI_TAG)` and `status(MPI_ERROR)` contain, respectively, the source, tag and error code of the received message.==

==With Fortran `USE` `mpi_f08`, status is defined as the Fortran `BIND(C)` derived type `TYPE(MPI_Status)`==

==containing three public fields named `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR`. `TYPE(MPI_Status)` may contain additional, implementation-specific fields. Thus, `status%MPI_SOURCE`, `status%MPI_TAG` and `status%MPI_ERROR` contain the source, tag, and error code of a received message respectively. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined to allow conversion between both status representations. Conversion routines are provided in Section [[versions/v30/sections/binding#Status|Status]] on page [[versions/v30/sections/binding#Status|Status]] .==

==> [!tip] Rationale==

==> The Fortran `TYPE(MPI_Status)` is defined as a `BIND(C)` derived type > > so that it can be used at any location where the status integer array representation can be used, e.g., in user defined common blocks.==

==> [!tip] Rationale==

==> It is allowed to have the same name (e.g., `MPI_SOURCE`) defined as a constant (e.g., Fortran parameter) and as a field of a derived type.==

~~Returns the number of entries received. (Again, we count *entries*, each of type *datatype*, not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable. (We shall later see, in Section [[versions/v30/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , that [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] may return, in certain situations, the value `MPI_UNDEFINED`.)~~

==Returns the number of entries received. (Again, we count *entries*, each of type *datatype*, not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable.==

==If the number of entries received exceeds the limits of the `count` parameter, then `MPI_GET_COUNT` sets the value of `count` to `MPI_UNDEFINED`.==

==There are other situations where the value of `count` can be set to `MPI_UNDEFINED`; see Section [[versions/v30/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .==

> Some message-passing libraries use `INOUT` `count`, `tag` and `source` arguments, thus using them both to specify the selection criteria for incoming messages and return the actual envelope values of the received message. The use of a separate status argument prevents errors that are often attached with `INOUT` argument (e.g., using the `MPI_ANY_TAG` constant as the tag in a receive). Some libraries use calls that refer implicitly to the “last message received.” This is not thread safe. > > The `datatype` argument is passed to `MPI_GET_COUNT` so as to improve performance. A message might be received without counting the number of elements it contains, and the count value is often not needed. Also, this allows the same function to be used after a call to ~~> >~~ `MPI_PROBE` or `MPI_IPROBE`. With a status from `MPI_PROBE` or `MPI_IPROBE`, the same datatypes are allowed as in a call to `MPI_RECV` to receive this message.

The value returned as the `count` argument of [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes ~~transfered~~ ==transferred== is greater than zero, `MPI_UNDEFINED` is returned.

> Zero-length datatypes may be created in a number of cases. ~~> >~~ An important case is > > [[versions/v30/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] , where the definition of the particular > > darray ~~> >~~ results in an empty block on some MPI process. Programs written in an SPMD style will not check for this special case and may want to use [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] to check the status.

All send and receive operations use the `buf`, `count`,`datatype`, `source`, `dest`, `tag`, ~~`comm`~~ ==`comm`,== and `status` arguments in the same way as the blocking `MPI_SEND` and `MPI_RECV` operations described in this section.

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~With Fortran `USE` `mpi_f08`, status is defined as the Fortran `BIND(C)` derived type `TYPE(MPI_Status)`~~

~~containing three public fields named `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR`. `TYPE(MPI_Status)` may contain additional, implementation-specific fields. Thus, `status%MPI_SOURCE`, `status%MPI_TAG` and `status%MPI_ERROR` contain the source, tag, and error code of a received message respectively. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined to allow conversion between both status representations. Conversion routines are provided in Section [[versions/v31/sections/binding#Status|Status]] on page [[versions/v31/sections/binding#Status|Status]] .~~

==With Fortran `USE` `mpi_f08`, status is defined as the Fortran `BIND(C)` derived type `TYPE(MPI_Status)` containing three public `INTEGER` fields named `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR`. `TYPE(MPI_Status)` may contain additional, implementation-specific fields. Thus, `status%MPI_SOURCE`, `status%MPI_TAG` and `status%MPI_ERROR` contain the source, tag, and error code of a received message respectively. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined to allow conversion between both status representations. Conversion routines are provided in [[versions/v31/sections/binding#Status|Status]] .==

> The Fortran `TYPE(MPI_Status)` is defined as a `BIND(C)` derived type ~~> >~~ so that it can be used at any location where the status integer array representation can be used, e.g., in user defined common blocks.

> The error field in status is not needed for calls that return only one status, such as ~~`MPI_WAIT`,~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]] ,== since that would only duplicate the information returned by the function itself. The current design avoids the additional overhead of setting it, in such cases. The field is needed for calls that return multiple statuses, since each request may have had a different failure.

~~Returns the number of entries received. (Again, we count *entries*, each of type *datatype*, not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable.~~

~~If the number of entries received exceeds the limits of the `count` parameter, then `MPI_GET_COUNT` sets the value of `count` to `MPI_UNDEFINED`.~~

~~There are other situations where the value of `count` can be set to `MPI_UNDEFINED`; see Section [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .~~

==Returns the number of entries received. (Again, we count *entries*, each of type *datatype*, not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable. If the number of entries received exceeds the limits of the `count` parameter, then [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] sets the value of `count` to `MPI_UNDEFINED`. There are other situations where the value of `count` can be set to `MPI_UNDEFINED`; see Section [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .==

> Some message-passing libraries use `INOUT` `count`, `tag` and `source` arguments, thus using them both to specify the selection criteria for incoming messages and return the actual envelope values of the received message. The use of a separate status argument prevents errors that are often attached with `INOUT` argument (e.g., using the `MPI_ANY_TAG` constant as the tag in a receive). Some libraries use calls that refer implicitly to the “last message received.” This is not thread safe. > > The `datatype` argument is passed to ~~`MPI_GET_COUNT`~~ ==[[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]]== so as to improve performance. A message might be received without counting the number of elements it contains, and the count value is often not needed. Also, this allows the same function to be used after a call to ~~`MPI_PROBE`~~ ==[[versions/v31/API/MPI_PROBE|MPI_PROBE]]== or ~~`MPI_IPROBE`.~~ ==[[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] .== With a status from ~~`MPI_PROBE`~~ ==[[versions/v31/API/MPI_PROBE|MPI_PROBE]]== or ~~`MPI_IPROBE`,~~ ==[[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] ,== the same datatypes are allowed as in a call to ~~`MPI_RECV`~~ ==[[versions/v31/API/MPI_RECV|MPI_RECV]]== to receive this message.

> Zero-length datatypes may be created in a number of cases. An important case is ~~> >~~ [[versions/v31/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] , where the definition of the particular ~~> >~~ darray results in an empty block on some MPI process. Programs written in an SPMD style will not check for this special case and may want to use [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] to check the status.

> The buffer size required for the receive can be affected by data conversions and by the stride of the receive datatype. In most cases, the safest approach is to use the same datatype with ~~`MPI_GET_COUNT`~~ ==[[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]]== and the receive.

All send and receive operations use the `buf`, `count`,`datatype`, `source`, `dest`, `tag`, `comm`, and `status` arguments in the same way as the blocking ~~`MPI_SEND`~~ ==[[versions/v31/API/MPI_SEND|MPI_SEND]]== and ~~`MPI_RECV`~~ ==[[versions/v31/API/MPI_RECV|MPI_RECV]]== operations described in this section.

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

In C, `status` is a structure that contains three fields named `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR`; the structure may contain additional fields. Thus, `status.MPI_SOURCE`, ~~`status.MPI_TAG`~~ ==`status.MPI_TAG`,== and `status.MPI_ERROR` contain the source, tag, and error code, respectively, of the received message.

In Fortran with `USE` `mpi` or `INCLUDE` `’mpif.h’`, `status` is an array of `INTEGER`s of size `MPI_STATUS_SIZE`. The constants `MPI_SOURCE`, ~~`MPI_TAG`~~ ==`MPI_TAG`,== and `MPI_ERROR` are the indices of the entries that store the source, ~~tag~~ ==tag,== and error fields. Thus, `status(MPI_SOURCE)`, ~~`status(MPI_TAG)`~~ ==`status(MPI_TAG)`,== and `status(MPI_ERROR)` contain, respectively, the source, ~~tag~~ ==tag,== and error code of the received message.

With Fortran `USE` `mpi_f08`, status is defined as the Fortran `BIND(C)` derived type `TYPE(MPI_Status)` containing three public `INTEGER` fields named `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR`. `TYPE(MPI_Status)` may contain additional, implementation-specific fields. Thus, `status%MPI_SOURCE`, ~~`status%MPI_TAG`~~ ==`status%MPI_TAG`,== and `status%MPI_ERROR` contain the source, tag, and error code of a received message respectively. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined to allow conversion between both status representations. Conversion routines are provided in [[versions/v40/sections/binding#Status|Status]] .

Returns the number of entries received. (Again, we count *entries*, each of type ~~*datatype*,~~ ==`datatype`,== not *bytes*.) The `datatype` argument should match the argument provided by the receive call that set the `status` variable. If the number of entries received exceeds the limits of the `count` parameter, then [[versions/v40/API/MPI_GET_COUNT|MPI_GET_COUNT]] sets the value of `count` to `MPI_UNDEFINED`. There are other situations where the value of `count` can be set to `MPI_UNDEFINED`; see Section [[versions/v40/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .

> Some message-passing libraries use ~~`INOUT`~~ ==INOUT== `count`, `tag` and `source` arguments, thus using them both to specify the selection criteria for incoming messages and return the actual ~~envelope~~ ==*envelope*== values of the received message. The use of a separate status argument prevents errors that are often attached with ~~`INOUT`~~ ==INOUT== argument (e.g., using the `MPI_ANY_TAG` constant as the tag in a receive). Some libraries use calls that refer implicitly to the “last message received.” This is not thread safe. > > The `datatype` argument is passed to [[versions/v40/API/MPI_GET_COUNT|MPI_GET_COUNT]] so as to improve performance. A message might be received without counting the number of elements it contains, and the count value is often not needed. Also, this allows the same function to be used after a call to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] or [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] . With a status from [[versions/v40/API/MPI_PROBE|MPI_PROBE]] or [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , the same datatypes are allowed as in a call to [[versions/v40/API/MPI_RECV|MPI_RECV]] to receive this message.

All send and receive operations use the `buf`, ~~`count`,`datatype`,~~ ==`count`, `datatype`,== `source`, `dest`, `tag`, `comm`, and `status` arguments in the same way as the blocking [[versions/v40/API/MPI_SEND|MPI_SEND]] and [[versions/v40/API/MPI_RECV|MPI_RECV]] ~~operations~~ ==procedures== described in this section.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

In Fortran with ~~`USE` `mpi`~~ ==`USE mpi`== or ~~`INCLUDE` `’mpif.h’`,~~ ==(deprecated) `INCLUDE ’mpif.h’`,== `status` is an array of `INTEGER`s of size `MPI_STATUS_SIZE`. The constants `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR` are the indices of the entries that store the source, tag, and error fields. Thus, `status(MPI_SOURCE)`, `status(MPI_TAG)`, and `status(MPI_ERROR)` contain, respectively, the source, tag, and error code of the received message.

In general, message-passing calls do not modify the value of the error code field of status variables. This field may be updated only by the functions in Section [[versions/v41/sections/pt2pt#Multiple Completions|Multiple Completions]] ~~which~~ ==that== return multiple statuses. The field is updated if and only if such function returns with an error code of `MPI_ERR_IN_STATUS`.

==While the `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR` status values are directly accessible by the user, for convenience in some contexts, users can also access them via procedure calls, as described below.==

==![[versions/v41/API/MPI_STATUS_GET_SOURCE]]==

==Returns in `source` the value of the `MPI_SOURCE` field in the `status` object.==

==![[versions/v41/API/MPI_STATUS_GET_TAG]]==

==Returns in `tag` the value in the `MPI_TAG` field of the `status` object.==

==![[versions/v41/API/MPI_STATUS_GET_ERROR]]==

==Returns in `err` the value in the `MPI_ERROR` field of the `status` object.==

==Procedures for setting these fields in a status object are defined in Section [[versions/v41/sections/ei#Associating Information with Status|Associating Information with Status]] .==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Return status]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Return Status]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Return Status]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Return Status]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Return Status]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Return Status]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Return Status]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Return Status]]
