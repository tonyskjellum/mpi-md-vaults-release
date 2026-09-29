---
title: "Multiple Completions"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Multiple Completions

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Multiple Completions|MPI-1.3]], [[versions/v21/sections/pt2pt#Multiple Completions|MPI-2.1]], [[versions/v22/sections/pt2pt#Multiple Completions|MPI-2.2]], [[versions/v30/sections/pt2pt#Multiple Completions|MPI-3.0]], [[versions/v31/sections/pt2pt#Multiple Completions|MPI-3.1]], [[versions/v40/sections/pt2pt#Multiple Completions|MPI-4.0]], [[versions/v41/sections/pt2pt#Multiple Completions|MPI-4.1]], [[versions/v50/sections/pt2pt#Multiple Completions|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

When one or more of the communications completed by a call to `MPI_WAITALL` fail, it is desireable to return specific information on each communication. The function `MPI_WAITALL` will return in such case the error code MPI_ERR_IN_STATUS and will set the error field of each status to a specific error code. This code will be MPI_SUCCESS, if the specific communication completed; it will be another specific error code, if it failed; or it can be MPI_ERR_PENDING if it has neither failed nor completed. The function `MPI_WAITALL` will return ~~`MPI_SUCCESS`~~ ==MPI_SUCCESS== if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

CALL MPI_COMM_SIZE(comm, size, ierr) CALL MPI_COMM_RANK(comm, rank, ierr) IF(rank .GT. 0) THEN ! client code DO WHILE(.TRUE.) CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr) CALL MPI_WAIT(request, status, ierr) END DO ELSE ! rank=0 -- server code DO i=1, size-1 CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag, comm, ~~requests(i),~~ ==request_list(i),== ierr) END DO DO WHILE(.TRUE.) CALL MPI_WAITSOME(size, request_list, numdone, indices, statuses, ierr) DO i=1, numdone CALL DO_SERVICE(a(1, indices(i))) CALL MPI_IRECV(a(1, indices(i)), n, MPI_REAL, 0, tag, comm, ~~requests(indices(i)),~~ ==request_list(indices(i)),== ierr) END DO END DO END IF

### MPI-2.1 → MPI-2.2  (9 changed paragraphs)

Blocks until one of the operations associated with the active requests in the array has completed. If more then one operation is enabled and can terminate, one is arbitrarily chosen. Returns in `index` the index of that request in the array and returns in `status` the status of the completing communication. (The array is indexed from zero in C, and from one in Fortran.) If the request was allocated by a nonblocking communication operation, then it is deallocated and the request handle is set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.==

The `array_of_requests` list may contain null or inactive handles. If the list contains no active handles (list has length zero or all entries are null or inactive), then the call returns immediately with `index ~~= MPI_UNDEFINED`,~~ ===` `MPI_UNDEFINED`,== and a empty `status`.

The execution of `MPI_WAITANY(count, array_of_requests, index, status)` has the same effect as the execution of `MPI_WAIT(&array_of_requests[i], status)`, where `i` is the value returned by `index` (unless the value of `index` is ~~MPI_UNDEFINED).~~ ==`MPI_UNDEFINED`).== [[versions/v22/API/MPI_WAITANY|MPI_WAITANY]] with an array containing one active entry is equivalent to [[versions/v22/API/MPI_WAIT|MPI_WAIT]] .

Tests for completion of either one or none of the operations associated with active handles. In the former case, it returns <span class="sans-serif">flag = true</span>, returns in <span class="sans-serif">index</span> the index of this request in the array, and returns in <span class="sans-serif">status</span> the status of that operation; if the request was allocated by a nonblocking communication call then the request is deallocated and the handle is set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.== (The array is indexed from zero in C, and from one in Fortran.) In the latter case (no operation completed), it returns <span class="sans-serif">flag = false</span>, returns a value of ~~MPI_UNDEFINED~~ ==`MPI_UNDEFINED`== in `index` and `status` is undefined.

The array may contain null or inactive handles. If the array contains no active handles then the call returns immediately with <span class="sans-serif">flag = true</span>, `index` = ~~MPI_UNDEFINED,~~ ==`MPI_UNDEFINED`,== and an empty `status`.

~~the execution of `MPI_TESTANY(count, array_of_requests, index, status)` has the same effect as the execution of `MPI_TEST( &array_of_requests[i], flag, status)`, for <span class="sans-serif">i=0, 1 ,..., count-1</span>, in some arbitrary order, until one call returns <span class="sans-serif">flag = true</span>, or all fail. In the former case, <span class="sans-serif">index</span> is set to the last value of <span class="sans-serif">i</span>, and in the latter case, it is set to MPI_UNDEFINED. [[versions/v22/API/MPI_TESTANY|MPI_TESTANY]] with an array containing one active entry is equivalent to [[versions/v22/API/MPI_TEST|MPI_TEST]] .~~

~~> [!tip] Rationale~~

~~> The function [[versions/v22/API/MPI_TESTANY|MPI_TESTANY]] returns with `flag = true` exactly in those situations where the function [[versions/v22/API/MPI_WAITANY|MPI_WAITANY]] returns; both functions return in that case the same values in the remaining parameters. Thus, a blocking [[versions/v22/API/MPI_WAITANY|MPI_WAITANY]] can be easily replaced by a nonblocking [[versions/v22/API/MPI_TESTANY|MPI_TESTANY]] . The same relation holds for the other pairs of Wait and Test functions defined in this section.~~

==the execution of `MPI_TESTANY(count, array_of_requests, index, status)` has the same effect as the execution of `MPI_TEST( &array_of_requests[i], flag, status)`, for <span class="sans-serif">i=0, 1 ,..., count-1</span>, in some arbitrary order, until one call returns <span class="sans-serif">flag = true</span>, or all fail. In the former case, <span class="sans-serif">index</span> is set to the last value of <span class="sans-serif">i</span>, and in the latter case, it is set to `MPI_UNDEFINED`. [[versions/v22/API/MPI_TESTANY|MPI_TESTANY]] with an array containing one active entry is equivalent to [[versions/v22/API/MPI_TEST|MPI_TEST]] .==

Blocks until all communication operations associated with active handles in the list complete, and return the status of all these operations (this includes the case where no handle in the list is active). Both arrays have the same number of valid entries. The `i`-th entry in `array_of_statuses` is set to the return status of the `i`-th operation. Requests that were created by nonblocking communication operations are deallocated and the corresponding handles in the array are set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.==

When one or more of the communications completed by a call to `MPI_WAITALL` fail, it is desireable to return specific information on each communication. The function `MPI_WAITALL` will return in such case the error code ~~MPI_ERR_IN_STATUS~~ ==`MPI_ERR_IN_STATUS`== and will set the error field of each status to a specific error code. This code will be ~~MPI_SUCCESS,~~ ==`MPI_SUCCESS`,== if the specific communication completed; it will be another specific error code, if it failed; or it can be ~~MPI_ERR_PENDING~~ ==`MPI_ERR_PENDING`== if it has neither failed nor completed. The function `MPI_WAITALL` will return ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

Returns `flag = true` if all communications associated with active handles in the array have completed (this includes the case where no handle in the list is active). In this case, each status entry that corresponds to an active handle request is set to the status of the corresponding communication; if the request was allocated by a nonblocking communication call then it is deallocated, and the handle is set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.==

Waits until at least one of the operations associated with active handles in the list have completed. Returns in `outcount` the number of requests from the list `array_of_requests` that have completed. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array `array_of_status` the status for these completed operations. If a request that completed was allocated by a nonblocking communication call, then it is deallocated, and the associated handle is set to ~~MPI_REQUEST_NULL.~~ ==`MPI_REQUEST_NULL`.==

If the list contains no active handles, then the call returns immediately with `outcount ~~= MPI_UNDEFINED`.~~ ===` `MPI_UNDEFINED`.==

When one or more of the communications completed by [[versions/v22/API/MPI_WAITSOME|MPI_WAITSOME]] fails, then it is desirable to return specific information on each communication. The arguments `outcount`, `array_of_indices` and `array_of_statuses` will be adjusted to indicate completion of all communications that have succeeded or failed. The call will return the error code ~~MPI_ERR_IN_STATUS~~ ==`MPI_ERR_IN_STATUS`== and the error field of each status returned will be set to indicate success or to indicate the specific error that occurred. The call will return ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== if no request resulted in an error, and will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

If there is no active handle in the list it returns `outcount ~~= MPI_UNDEFINED`.~~ ===` `MPI_UNDEFINED`.==

CALL MPI_COMM_SIZE(comm, size, ierr) CALL MPI_COMM_RANK(comm, rank, ierr) IF(rank .GT. 0) THEN ! client code DO WHILE(.TRUE.) CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr) CALL MPI_WAIT(request, status, ierr) END DO ELSE ! rank=0 -- server code DO i=1, size-1 CALL MPI_IRECV(a(1,i), n, MPI_REAL, ~~i~~ ==i,== tag, comm, request_list(i), ierr) END DO DO WHILE(.TRUE.) CALL MPI_WAITANY(size-1, request_list, index, status, ierr) CALL DO_SERVICE(a(1,index)) ! handle one message CALL MPI_IRECV(a(1, index), n, MPI_REAL, index, tag, comm, request_list(index), ierr) END DO END IF

### MPI-2.2 → MPI-3.0  (9 changed paragraphs)

Blocks until one of the operations associated with the active requests in the array has completed. If more ~~then~~ ==than== one operation is enabled and can terminate, one is arbitrarily chosen. Returns in `index` the index of that request in the array and returns in `status` the status of the completing ~~communication.~~ ==operation.== (The array is indexed from zero in C, and from one in Fortran.) If the request ~~was allocated by a nonblocking communication operation, then~~ ==is an active persistent request,== it ==is marked inactive. Any other type of request== is deallocated and the request handle is set to `MPI_REQUEST_NULL`.

The `array_of_requests` list may contain null or inactive handles. If the list contains no active handles (list has length zero or all entries are null or inactive), then the call returns immediately with `index =` `MPI_UNDEFINED`, and ~~a~~ ==an== empty `status`.

Tests for completion of either one or none of the operations associated with active handles. In the former case, it returns <span class="sans-serif">flag = true</span>, returns in <span class="sans-serif">index</span> the index of this request in the array, and returns in <span class="sans-serif">status</span> the status of that ~~operation; if~~ ==operation. If== the request ~~was allocated by a nonblocking communication call then the~~ ==is an active persistent request, it is marked as inactive. Any other type of== request is deallocated and the handle is set to `MPI_REQUEST_NULL`. (The array is indexed from zero in C, and from one in Fortran.) In the latter case (no operation completed), it returns <span class="sans-serif">flag = false</span>, returns a value of `MPI_UNDEFINED` in `index` and `status` is undefined.

~~If the array of requests contains active handles then~~

~~the execution of `MPI_TESTANY(count, array_of_requests, index, status)` has the same effect as the execution of `MPI_TEST( &array_of_requests[i], flag, status)`, for <span class="sans-serif">i=0, 1 ,..., count-1</span>, in some arbitrary order, until one call returns <span class="sans-serif">flag = true</span>, or all fail. In the former case, <span class="sans-serif">index</span> is set to the last value of <span class="sans-serif">i</span>, and in the latter case, it is set to `MPI_UNDEFINED`. [[versions/v30/API/MPI_TESTANY|MPI_TESTANY]] with an array containing one active entry is equivalent to [[versions/v30/API/MPI_TEST|MPI_TEST]] .~~

==If the array of requests contains active handles then the execution of `MPI_TESTANY(count, array_of_requests, index, status)` has the same effect as the execution of `MPI_TEST( &array_of_requests[i], flag, status)`, for <span class="sans-serif">i=0, 1 ,..., count-1</span>, in some arbitrary order, until one call returns <span class="sans-serif">flag = true</span>, or all fail. In the former case, <span class="sans-serif">index</span> is set to the last value of <span class="sans-serif">i</span>, and in the latter case, it is set to `MPI_UNDEFINED`. [[versions/v30/API/MPI_TESTANY|MPI_TESTANY]] with an array containing one active entry is equivalent to [[versions/v30/API/MPI_TEST|MPI_TEST]] .==

~~Blocks until all communication operations associated with active handles in the list complete, and return the status of all these operations (this includes the case where no handle in the list is active). Both arrays have the same number of valid entries. The `i`-th entry in `array_of_statuses` is set to the return status of the `i`-th operation. Requests that were created by nonblocking communication operations are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`.~~

~~The list may contain null or inactive handles. The call sets to empty the status of each such entry.~~

==Blocks until all communication operations associated with active handles in the list complete, and return the status of all these operations (this includes the case where no handle in the list is active). Both arrays have the same number of valid entries. The `i`-th entry in `array_of_statuses` is set to the return status of the `i`-th operation. Active persistent requests are marked inactive. Requests of any other type are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`. The list may contain null or inactive handles. The call sets to empty the status of each such entry.==

When one or more of the communications completed by a call to `MPI_WAITALL` fail, it is ~~desireable~~ ==desirable== to return specific information on each communication. The function `MPI_WAITALL` will return in such case the error code `MPI_ERR_IN_STATUS` and will set the error field of each status to a specific error code. This code will be `MPI_SUCCESS`, if the specific communication completed; it will be another specific error code, if it failed; or it can be `MPI_ERR_PENDING` if it has neither failed nor completed. The function `MPI_WAITALL` will return `MPI_SUCCESS` if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

~~Returns `flag = true` if all communications associated with active handles in the array have completed (this includes the case where no handle in the list is active). In this case, each status entry that corresponds to an active handle request is set to the status of the corresponding communication; if the request was allocated by a nonblocking communication call then it is deallocated, and the handle is set to `MPI_REQUEST_NULL`.~~

~~Each status entry that corresponds to a null or inactive handle is set to empty.~~

==Returns `flag = true` if all communications associated with active handles in the array have completed (this includes the case where no handle in the list is active). In this case, each status entry that corresponds to an active request is set to the status of the corresponding operation. Active persistent requests are marked inactive. Requests of any other type are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`. Each status entry that corresponds to a null or inactive handle is set to empty.==

Errors that occurred during the execution of [[versions/v30/API/MPI_TESTALL|MPI_TESTALL]] are handled ==in the same manner== as errors in [[versions/v30/API/MPI_WAITALL|MPI_WAITALL]] .

~~Waits until at least one of the operations associated with active handles in the list have completed. Returns in `outcount` the number of requests from the list `array_of_requests` that have completed. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array `array_of_status` the status for these completed operations. If a request that completed was allocated by a nonblocking communication call, then it is deallocated, and the associated handle is set to `MPI_REQUEST_NULL`.~~

==Waits until at least one of the operations associated with active handles in the list have completed. Returns in `outcount` the number of requests from the list `array_of_requests` that have completed. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array `array_of_status` the status for these completed operations.==

==Completed active persistent requests are marked as inactive. Any other type or request that completed is deallocated, and the associated handle is set to `MPI_REQUEST_NULL`.==

~~Behaves like [[versions/v30/API/MPI_WAITSOME|MPI_WAITSOME]] , except that it returns immediately. If no operation has completed it returns `outcount = 0`.~~

~~If there is no active handle in the list it returns `outcount =` `MPI_UNDEFINED`.~~

==Behaves like [[versions/v30/API/MPI_WAITSOME|MPI_WAITSOME]] , except that it returns immediately. If no operation has completed it returns `outcount = 0`. If there is no active handle in the list it returns `outcount =` `MPI_UNDEFINED`.==

### MPI-3.0 → MPI-3.1  (8 changed paragraphs)

It is convenient to be able to wait for the completion of any, some, or all the operations in a list, rather than having to wait for a specific message. A call to ~~`MPI_WAITANY`~~ ==[[versions/v31/API/MPI_WAITANY|MPI_WAITANY]]== or ~~`MPI_TESTANY`~~ ==[[versions/v31/API/MPI_TESTANY|MPI_TESTANY]]== can be used to wait for the completion of one out of several operations. A call to ~~`MPI_WAITALL`~~ ==[[versions/v31/API/MPI_WAITALL|MPI_WAITALL]]== or ~~`MPI_TESTALL`~~ ==[[versions/v31/API/MPI_TESTALL|MPI_TESTALL]]== can be used to wait for all pending operations in a list. A call to [[versions/v31/API/MPI_WAITSOME|MPI_WAITSOME]] or [[versions/v31/API/MPI_TESTSOME|MPI_TESTSOME]] can be used to complete all enabled operations in a list.

The execution of ~~`MPI_WAITANY(count, array_of_requests, index, status)`~~ ==[[versions/v31/API/MPI_WAITANY|MPI_WAITANY]]== has the same effect as the execution of ~~`MPI_WAIT(&array_of_requests[i], status)`,~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]] ,== where `i` is the value returned by `index` (unless the value of `index` is `MPI_UNDEFINED`). [[versions/v31/API/MPI_WAITANY|MPI_WAITANY]] with an array containing one active entry is equivalent to [[versions/v31/API/MPI_WAIT|MPI_WAIT]] .

Tests for completion of either one or none of the operations associated with active handles. In the former case, it returns ~~<span class="sans-serif">flag~~ ==`flag== = ~~true</span>,~~ ==true`,== returns in ~~<span class="sans-serif">index</span>~~ ==`index`== the index of this request in the array, and returns in ~~<span class="sans-serif">status</span>~~ ==`status`== the status of that operation. If the request is an active persistent request, it is marked as inactive. Any other type of request is deallocated and the handle is set to `MPI_REQUEST_NULL`. (The array is indexed from zero in C, and from one in Fortran.) In the latter case (no operation completed), it returns ~~<span class="sans-serif">flag~~ ==`flag== = ~~false</span>,~~ ==false`,== returns a value of `MPI_UNDEFINED` in `index` and `status` is undefined.

The array may contain null or inactive handles. If the array contains no active handles then the call returns immediately with ~~<span class="sans-serif">flag~~ ==`flag== = ~~true</span>,~~ ==true`,== `index` = `MPI_UNDEFINED`, and an empty `status`.

If the array of requests contains active handles then the execution of ~~`MPI_TESTANY(count, array_of_requests, index, status)`~~ ==[[versions/v31/API/MPI_TESTANY|MPI_TESTANY]]== has the same effect as the execution of ~~`MPI_TEST( &array_of_requests[i], flag, status)`,~~ ==[[versions/v31/API/MPI_TEST|MPI_TEST]] ,== for ~~<span class="sans-serif">i=0,~~ ==`i=0,== 1 ~~,..., count-1</span>,~~ ==,`$`...`$`, count-1`,== in some arbitrary order, until one call returns ~~<span class="sans-serif">flag~~ ==`flag== = ~~true</span>,~~ ==true`,== or all fail. In the former case, ~~<span class="sans-serif">index</span>~~ ==`index`== is set to the last value of ~~<span class="sans-serif">i</span>,~~ ==`i`,== and in the latter case, it is set to `MPI_UNDEFINED`. [[versions/v31/API/MPI_TESTANY|MPI_TESTANY]] with an array containing one active entry is equivalent to [[versions/v31/API/MPI_TEST|MPI_TEST]] .

The error-free execution of ~~`MPI_WAITALL(count, array_of_requests, array_of_statuses)`~~ ==[[versions/v31/API/MPI_WAITALL|MPI_WAITALL]]== has the same effect as the execution of

~~`MPI_WAIT(&array_of_request[i], &array_of_statuses[i])`,~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]] ,== for ~~<span class="sans-serif">i=0 ,..., count-1</span>,~~ ==`i=0 ,`$`...`$`, count-1`,== in some arbitrary order. [[versions/v31/API/MPI_WAITALL|MPI_WAITALL]] with an array of length one is equivalent to [[versions/v31/API/MPI_WAIT|MPI_WAIT]] .

When one or more of the communications completed by a call to ~~`MPI_WAITALL`~~ ==[[versions/v31/API/MPI_WAITALL|MPI_WAITALL]]== fail, it is desirable to return specific information on each communication. The function ~~`MPI_WAITALL`~~ ==[[versions/v31/API/MPI_WAITALL|MPI_WAITALL]]== will return in such case the error code `MPI_ERR_IN_STATUS` and will set the error field of each status to a specific error code. This code will be `MPI_SUCCESS`, if the specific communication completed; it will be another specific error code, if it failed; or it can be `MPI_ERR_PENDING` if it has neither failed nor completed. The function ~~`MPI_WAITALL`~~ ==[[versions/v31/API/MPI_WAITALL|MPI_WAITALL]]== will return `MPI_SUCCESS` if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

~~Waits until at least one of the operations associated with active handles in the list have completed. Returns in `outcount` the number of requests from the list `array_of_requests` that have completed. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array `array_of_status` the status for these completed operations.~~

~~Completed active persistent requests are marked as inactive. Any other type or request that completed is deallocated, and the associated handle is set to `MPI_REQUEST_NULL`.~~

==Waits until at least one of the operations associated with active handles in the list have completed. Returns in `outcount` the number of requests from the list `array_of_requests` that have completed. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array `array_of_status` the status for these completed operations. Completed active persistent requests are marked as inactive. Any other type or request that completed is deallocated, and the associated handle is set to `MPI_REQUEST_NULL`.==

[[versions/v31/API/MPI_TESTSOME|MPI_TESTSOME]] is a local operation, which returns immediately, whereas [[versions/v31/API/MPI_WAITSOME|MPI_WAITSOME]] will block until a communication completes, if it was passed a list that contains at least one active handle. Both calls fulfill a ~~<span class="sans-serif">fairness</span>~~ ==**fairness**== requirement: If a request for a receive repeatedly appears in a list of requests passed to [[versions/v31/API/MPI_WAITSOME|MPI_WAITSOME]] or [[versions/v31/API/MPI_TESTSOME|MPI_TESTSOME]] , and a matching send has been posted, then the receive will eventually succeed, unless the send is satisfied by another receive; and similarly for send requests.

Client-server code (starvation can occur).

Same code, using [[versions/v31/API/MPI_WAITSOME|MPI_WAITSOME]] .

### MPI-3.1 → MPI-4.0  (11 changed paragraphs)

It is convenient to be able to wait for the ~~completion~~ ==*completion*== of any, some, or all the operations in a list, rather than having to wait for a specific message. A call to [[versions/v40/API/MPI_WAITANY|MPI_WAITANY]] or [[versions/v40/API/MPI_TESTANY|MPI_TESTANY]] can be used to wait for the ~~completion~~ ==*completion*== of one out of several operations. A call to [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] or [[versions/v40/API/MPI_TESTALL|MPI_TESTALL]] can be used to wait for all pending operations in a list. A call to [[versions/v40/API/MPI_WAITSOME|MPI_WAITSOME]] or [[versions/v40/API/MPI_TESTSOME|MPI_TESTSOME]] can be used to ~~complete~~ ==*complete*== all enabled operations in a list.

Blocks until one of the operations associated with the ~~active~~ ==*active*== requests in the array has ~~completed.~~ ==*completed*.== If more than one operation is enabled and can ~~terminate,~~ ==terminate ,== one is arbitrarily chosen. Returns in `index` the index of that request in the array and returns in `status` the status of the completing operation. (The array is indexed from zero in C, and from one in Fortran.) If the request is an ~~active persistent request,~~ ==*active* *persistent communication request*,== it is marked ~~inactive.~~ ==*inactive*.== Any other type of request is deallocated and the request handle is set to `MPI_REQUEST_NULL`.

The `array_of_requests` list may contain ~~null~~ ==*null*== or ~~inactive~~ ==*inactive*== handles. If the list contains no ~~active~~ ==*active*== handles (list has length zero or all entries are ~~null~~ ==*null*== or ~~inactive),~~ ==*inactive*),== then the call returns immediately with ~~`index =` `MPI_UNDEFINED`,~~ ==`index``=``MPI_UNDEFINED`,== and an ~~empty~~ ==*empty*== `status`.

The execution of [[versions/v40/API/MPI_WAITANY|MPI_WAITANY]] ==with an array containing multiple entries== has the same effect as the execution of [[versions/v40/API/MPI_WAIT|MPI_WAIT]] ~~, where `i` is~~ ==with== the ==array entry indicated by the output== value ~~returned by~~ ==of== `index` (unless the ==output== value of `index` is `MPI_UNDEFINED`). [[versions/v40/API/MPI_WAITANY|MPI_WAITANY]] with an array containing one ~~active~~ ==*active*== entry is equivalent to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] .

Tests for ~~completion~~ ==*completion*== of either one or none of the operations associated with ~~active~~ ==*active*== handles. In the former case, it returns ~~`flag =~~ ==`flag``=== true`, returns in `index` the index of this request in the array, and returns in `status` the status of that operation. If the request is an ~~active persistent request,~~ ==*active* *persistent communication request*,== it is marked as ~~inactive.~~ ==*inactive*.== Any other type of request is deallocated and the handle is set to `MPI_REQUEST_NULL`. (The array is indexed from zero in C, and from one in Fortran.) In the latter case (no operation ~~completed),~~ ==*completed*),== it returns ~~`flag =~~ ==`flag``=== false`, returns a value of `MPI_UNDEFINED` in `index` and `status` is undefined.

The array may contain ~~null~~ ==*null*== or inactive handles. If the array contains no ~~active~~ ==*active*== handles then the call returns ~~immediately~~ ==*immediately*== with ~~`flag =~~ ==`flag``=== true`, ~~`index` = `MPI_UNDEFINED`,~~ ==`index``=``MPI_UNDEFINED`,== and an ~~empty~~ ==*empty*== `status`.

If the array of requests contains ~~active~~ ==*active*== handles then the execution of [[versions/v40/API/MPI_TESTANY|MPI_TESTANY]] has the same effect as the execution of [[versions/v40/API/MPI_TEST|MPI_TEST]] ~~, for `i=0, 1 ,`$`...`$`, count-1`,~~ ==with each of the array elements== in some arbitrary order, until one call returns ~~`flag =~~ ==`flag``=== true`, or all fail. In the former case, `index` is set to ~~the last value of `i`,~~ ==indicate which array element returned `flag``= true`== and in the latter case, it is set to `MPI_UNDEFINED`. [[versions/v40/API/MPI_TESTANY|MPI_TESTANY]] with an array containing one ~~active~~ ==*active*== entry is equivalent to [[versions/v40/API/MPI_TEST|MPI_TEST]] .

~~Blocks until all communication operations associated with active handles in the list complete, and return the status of all these operations (this includes the case where no handle in the list is active). Both arrays have the same number of valid entries. The `i`-th entry in `array_of_statuses` is set to the return status of the `i`-th operation. Active persistent requests are marked inactive. Requests of any other type are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`. The list may contain null or inactive handles. The call sets to empty the status of each such entry.~~

~~The error-free execution of [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] has the same effect as the execution of~~

~~[[versions/v40/API/MPI_WAIT|MPI_WAIT]] , for `i=0 ,`$`...`$`, count-1`, in some arbitrary order. [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] with an array of length one is equivalent to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] .~~

~~When one or more of the communications completed by a call to [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] fail, it is desirable to return specific information on each communication. The function [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] will return in such case the error code `MPI_ERR_IN_STATUS` and will set the error field of each status to a specific error code. This code will be `MPI_SUCCESS`, if the specific communication completed; it will be another specific error code, if it failed; or it can be `MPI_ERR_PENDING` if it has neither failed nor completed. The function [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] will return `MPI_SUCCESS` if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.~~

==Blocks until all communication operations associated with *active* handles in the list *complete*, and returns the status of all these operations (this includes the case where no handle in the list is *active*). Both arrays have the same number of valid entries. The `i`-th entry in `array_of_statuses` is set to the return status of the `i`-th operation. *Active* *persistent requests* are marked *inactive*. Requests of any other type are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`. The list may contain *null* or *inactive* handles. The call sets to *empty* the status of each such entry.==

==The error-free execution of [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] has the same effect as the execution of [[versions/v40/API/MPI_WAIT|MPI_WAIT]] for each of the array elements in some arbitrary order. [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] with an array of length one is equivalent to [[versions/v40/API/MPI_WAIT|MPI_WAIT]] .==

==When one or more of the communications *completed* by a call to [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] fail, it is desirable to return specific information on each communication. The function [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] will return in such case the error code `MPI_ERR_IN_STATUS` and will set the error field of each status to a specific error code. This code will be `MPI_SUCCESS`, if the specific communication *completed*; it will be another specific error code, if it failed; or it can be `MPI_ERR_PENDING` if it has neither failed nor *completed*. The function [[versions/v40/API/MPI_WAITALL|MPI_WAITALL]] will return `MPI_SUCCESS` if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.==

Returns ~~`flag =~~ ==`flag``=== true` if all communications associated with ~~active~~ ==*active*== handles in the array have ~~completed~~ ==*completed*== (this includes the case where no handle in the list is ~~active).~~ ==*active*).== In this case, each status entry that corresponds to an ~~active~~ ==*active*== request is set to the status of the corresponding operation. ~~Active persistent requests~~ ==*Active* *persistent requests*== are marked ~~inactive.~~ ==*inactive*.== Requests of any other type are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`. Each status entry that corresponds to a ~~null~~ ==*null*== or ~~inactive~~ ==*inactive*== handle is set to ~~empty.~~ ==*empty*.==

Otherwise, ~~`flag =~~ ==`flag``=== false` is returned, no request is modified and the values of the status entries are undefined. This is a ~~local operation.~~ ==*local* procedure.==

Waits until at least one of the operations associated with ~~active~~ ==*active*== handles in the list have ~~completed.~~ ==*completed*.== Returns in `outcount` the number of requests from the list `array_of_requests` that have ~~completed.~~ ==*completed*.== Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array ~~`array_of_status`~~ ==`array_of_statuses`== the status for these ~~completed~~ ==*completed*== operations. ~~Completed active persistent requests~~ ==*Completed* *active* *persistent requests*== are marked as ~~inactive.~~ ==*inactive*.== Any other type or request that ~~completed~~ ==*completed*== is deallocated, and the associated handle is set to `MPI_REQUEST_NULL`.

If the list contains no ~~active~~ ==*active*== handles, then the call returns ~~immediately~~ ==*immediately*== with ~~`outcount =` `MPI_UNDEFINED`.~~ ==`outcount``=``MPI_UNDEFINED`.==

When one or more of the communications ~~completed~~ ==*completed*== by [[versions/v40/API/MPI_WAITSOME|MPI_WAITSOME]] fails, then it is desirable to return specific information on each communication. The arguments `outcount`, `array_of_indices` and `array_of_statuses` will be adjusted to indicate ~~completion~~ ==*completion*== of all communications that have succeeded or failed. The call will return the error code `MPI_ERR_IN_STATUS` and the error field of each status returned will be set to indicate success or to indicate the specific error that occurred. The call will return `MPI_SUCCESS` if no request resulted in an error, and will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

Behaves like [[versions/v40/API/MPI_WAITSOME|MPI_WAITSOME]] , except that it returns ~~immediately.~~ ==*immediately*.== If no operation has completed it returns ~~`outcount =~~ ==`outcount``=== 0`. If there is no ~~active~~ ==*active*== handle in the list it returns ~~`outcount =` `MPI_UNDEFINED`.~~ ==`outcount``=``MPI_UNDEFINED`.==

[[versions/v40/API/MPI_TESTSOME|MPI_TESTSOME]] is a ~~local operation,~~ ==*local* procedure,== which returns ~~immediately,~~ ==*immediately*,== whereas [[versions/v40/API/MPI_WAITSOME|MPI_WAITSOME]] will block until a communication ~~completes,~~ ==*completes*,== if it was passed a list that contains at least one ~~active~~ ==*active*== handle. Both calls fulfill a ~~**fairness** requirement:~~ ==**fairness requirement**:== If a request for a receive repeatedly appears in a list of requests passed to [[versions/v40/API/MPI_WAITSOME|MPI_WAITSOME]] or [[versions/v40/API/MPI_TESTSOME|MPI_TESTSOME]] , and a matching send has been posted, then the receive will eventually succeed, unless the send is satisfied by another receive; and similarly for send requests.

> The use of [[versions/v40/API/MPI_TESTSOME|MPI_TESTSOME]] is likely to be more efficient than the use of [[versions/v40/API/MPI_TESTANY|MPI_TESTANY]] . The former returns information on all ~~completed~~ ==*completed*== communications, with the latter, a new call is required for each communication that completes. > > A server with multiple clients can use [[versions/v40/API/MPI_WAITSOME|MPI_WAITSOME]] so as not to starve any client. Clients send messages to the server with service requests. The server calls [[versions/v40/API/MPI_WAITSOME|MPI_WAITSOME]] with one receive request for each client, and then handles all receives that completed. If a call to [[versions/v40/API/MPI_WAITANY|MPI_WAITANY]] is used instead, then one client could starve while requests from another client always sneak in first.

> [[versions/v40/API/MPI_TESTSOME|MPI_TESTSOME]] should ~~complete~~ ==*complete*== as many pending communications as possible.

CALL MPI_COMM_SIZE(comm, size, ierr) CALL MPI_COMM_RANK(comm, rank, ierr) ~~IF(rank~~ ==IF (rank== .GT. 0) THEN ! client code DO WHILE(.TRUE.) CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr) CALL MPI_WAIT(request, status, ierr) END DO ELSE ! rank=0 -- server code DO ~~i=1, size-1~~ ==i=1,size-1== CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag, ==&== comm, request_list(i), ierr) END DO DO WHILE(.TRUE.) CALL MPI_WAITANY(size-1, request_list, index, status, ierr) CALL DO_SERVICE(a(1,index)) ! handle one message CALL MPI_IRECV(a(1, index), n, MPI_REAL, index, tag, ==&== comm, request_list(index), ierr) END DO END IF

CALL MPI_COMM_SIZE(comm, size, ierr) CALL MPI_COMM_RANK(comm, rank, ierr) ~~IF(rank~~ ==IF (rank== .GT. 0) THEN ! client code DO WHILE(.TRUE.) CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr) CALL MPI_WAIT(request, status, ierr) END DO ELSE ! rank=0 -- server code DO ~~i=1, size-1~~ ==i=1,size-1== CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag, ==&== comm, request_list(i), ierr) END DO DO WHILE(.TRUE.) CALL MPI_WAITSOME(size, request_list, numdone, ==&== indices, statuses, ierr) DO ~~i=1, numdone~~ ==i=1,numdone== CALL DO_SERVICE(a(1, indices(i))) CALL MPI_IRECV(a(1, indices(i)), n, MPI_REAL, 0, tag, ==&== comm, request_list(indices(i)), ierr) END DO END DO END IF

### MPI-4.0 → MPI-4.1  (10 changed paragraphs)

It is convenient to be able to wait for the *completion* of any, some, or all the operations in a list, rather than having to wait for a specific message. A call to [[versions/v41/API/MPI_WAITANY|MPI_WAITANY]] or [[versions/v41/API/MPI_TESTANY|MPI_TESTANY]] can be used to wait for the *completion* of one out of several operations. A call to [[versions/v41/API/MPI_WAITALL|MPI_WAITALL]] or [[versions/v41/API/MPI_TESTALL|MPI_TESTALL]] can be used to wait for all ~~pending~~ ==*pending*== operations in a list. A call to [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] or [[versions/v41/API/MPI_TESTSOME|MPI_TESTSOME]] can be used to *complete* all enabled operations in a list.

If the array of requests contains *active* handles then the execution of [[versions/v41/API/MPI_TESTANY|MPI_TESTANY]] has the same effect as the execution of [[versions/v41/API/MPI_TEST|MPI_TEST]] with each of the ==*active* handles in the== array ~~elements~~ in some arbitrary order, until one call returns `flag``= true`, or all ~~fail.~~ ==return `flag``= false`.== In the former case, `index` is set to indicate which array element returned `flag``= true` and in the latter case, it is set to `MPI_UNDEFINED`. [[versions/v41/API/MPI_TESTANY|MPI_TESTANY]] with an array containing one *active* entry is equivalent to [[versions/v41/API/MPI_TEST|MPI_TEST]] .

When one or more of the ~~communications~~ ==communication operations== *completed* by a call to [[versions/v41/API/MPI_WAITALL|MPI_WAITALL]] fail, it is desirable to return specific information on each communication. The function [[versions/v41/API/MPI_WAITALL|MPI_WAITALL]] will return in such case the error code `MPI_ERR_IN_STATUS` and will set the error field of each status to a specific error code. This code will be `MPI_SUCCESS`, if the specific communication *completed*; it will be another specific error code, if it failed; or it can be `MPI_ERR_PENDING` if it has neither failed nor *completed*. The function [[versions/v41/API/MPI_WAITALL|MPI_WAITALL]] will return `MPI_SUCCESS` if no request had an error, or will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

Returns `flag``= true` if all ~~communications~~ ==communication operations== associated with *active* handles in the array have *completed* (this includes the case where no handle in the list is *active*). In this case, each status entry that corresponds to an *active* request is set to the status of the corresponding operation. *Active* *persistent requests* are marked *inactive*. Requests of any other type are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`. Each status entry that corresponds to a *null* or *inactive* handle is set to *empty*.

When one or more of the ~~communications~~ ==communication operations== *completed* by [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] fails, then it is desirable to return specific information on each communication. The arguments `outcount`, `array_of_indices` and `array_of_statuses` will be adjusted to indicate *completion* of all ~~communications~~ ==communication operations== that have succeeded or failed. The call will return the error code `MPI_ERR_IN_STATUS` and the error field of each status returned will be set to indicate success or to indicate the specific error that occurred. The call will return `MPI_SUCCESS` if no request resulted in an error, and will return another error code if it failed for other reasons (such as invalid arguments). In such cases, it will not update the error fields of the statuses.

~~Behaves~~ ==This procedure behaves== like [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] , except that it returns *immediately*. If no operation has completed it returns `outcount``= 0`. If there is no *active* handle in the list it returns `outcount``=``MPI_UNDEFINED`.

[[versions/v41/API/MPI_TESTSOME|MPI_TESTSOME]] is a *local* procedure, which returns *immediately*, whereas [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] will block until a communication *completes*, if it was passed a list that contains at least one *active* handle. Both calls fulfill a **fairness requirement**: If a request for a receive repeatedly appears in a list of requests passed to [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] or [[versions/v41/API/MPI_TESTSOME|MPI_TESTSOME]] , and a matching send has been ~~posted,~~ ==*started*,== then the receive will eventually succeed, unless the send is satisfied by another receive; and similarly for send requests.

> The use of [[versions/v41/API/MPI_TESTSOME|MPI_TESTSOME]] is likely to be more efficient than the use of [[versions/v41/API/MPI_TESTANY|MPI_TESTANY]] . The former returns information on all *completed* ~~communications,~~ ==communication operations,== with the latter, a new call is required for each communication that completes. > > A server with multiple clients can use [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] so as not to starve any client. Clients send messages to the server with service requests. The server calls [[versions/v41/API/MPI_WAITSOME|MPI_WAITSOME]] with one receive request for each client, and then handles all receives that completed. If a call to [[versions/v41/API/MPI_WAITANY|MPI_WAITANY]] is used instead, then one client could starve while requests from another client always sneak in first.

> [[versions/v41/API/MPI_TESTSOME|MPI_TESTSOME]] should *complete* as many ~~pending communications~~ ==*pending* communication operations of the `array_of_requests`== as possible.

~~    CALL MPI_COMM_SIZE(comm, size, ierr)     CALL MPI_COMM_RANK(comm, rank, ierr)     IF (rank .GT. 0) THEN         ! client code        DO WHILE(.TRUE.)           CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr)           CALL MPI_WAIT(request, status, ierr)        END DO     ELSE         ! rank=0 -- server code        DO i=1,size-1           CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag, &                          comm, request_list(i), ierr)        END DO        DO WHILE(.TRUE.)           CALL MPI_WAITANY(size-1, request_list, index, status, ierr)           CALL DO_SERVICE(a(1,index))  ! handle one message           CALL MPI_IRECV(a(1, index), n, MPI_REAL, index, tag, &                          comm, request_list(index), ierr)        END DO     END IF~~

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_SIZE(comm, size, ierr)
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .GT. 0) THEN         ! client code
   DO WHILE(.TRUE.)
      CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr)
      CALL MPI_WAIT(request, status, ierr)
   END DO
ELSE         ! rank=0 -- server code
   DO i=1,size-1
      CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag, &
                     comm, request_list(i), ierr)
   END DO
   DO WHILE(.TRUE.)
      CALL MPI_WAITANY(size-1, request_list, index, status, ierr)
      CALL DO_SERVICE(a(1,index))  ! handle one message
      CALL MPI_IRECV(a(1, index), n, MPI_REAL, index, tag, &
                     comm, request_list(index), ierr)
   END DO
END IF
```

~~    CALL MPI_COMM_SIZE(comm, size, ierr)     CALL MPI_COMM_RANK(comm, rank, ierr)     IF (rank .GT. 0) THEN         ! client code        DO WHILE(.TRUE.)           CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr)           CALL MPI_WAIT(request, status, ierr)        END DO     ELSE         ! rank=0 -- server code        DO i=1,size-1           CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag, &                          comm, request_list(i), ierr)        END DO        DO WHILE(.TRUE.)           CALL MPI_WAITSOME(size, request_list, numdone, &                             indices, statuses, ierr)           DO i=1,numdone              CALL DO_SERVICE(a(1, indices(i)))              CALL MPI_IRECV(a(1, indices(i)), n, MPI_REAL, 0, tag, &                             comm, request_list(indices(i)), ierr)           END DO        END DO     END IF~~

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_SIZE(comm, size, ierr)
CALL MPI_COMM_RANK(comm, rank, ierr)
IF (rank .GT. 0) THEN         ! client code
   DO WHILE(.TRUE.)
      CALL MPI_ISEND(a, n, MPI_REAL, 0, tag, comm, request, ierr)
      CALL MPI_WAIT(request, status, ierr)
   END DO
ELSE         ! rank=0 -- server code
   DO i=1,size-1
      CALL MPI_IRECV(a(1,i), n, MPI_REAL, i, tag, &
                     comm, request_list(i), ierr)
   END DO
   DO WHILE(.TRUE.)
      CALL MPI_WAITSOME(size, request_list, numdone, &
                        indices, statuses, ierr)
      DO i=1,numdone
         CALL DO_SERVICE(a(1, indices(i)))
         CALL MPI_IRECV(a(1, indices(i)), n, MPI_REAL, 0, tag, &
                        comm, request_list(indices(i)), ierr)
      END DO
   END DO
END IF
```

### MPI-4.1 → MPI-5.0  (4 changed paragraphs)

~~Blocks~~ ==Does not return== until one of the operations associated with the *active* requests in the array has *completed*. If more than one operation is enabled and can ~~terminate ,~~ ==*complete*,== one is arbitrarily chosen. Returns in `index` the index of that request in the array and returns in `status` the status of the completing operation. (The array is indexed from zero in C, and from one in Fortran.) If the request is an *active* *persistent communication request*, it is marked *inactive*. Any other type of request is deallocated and the request handle is set to `MPI_REQUEST_NULL`.

~~Blocks~~ ==Does not return== until all communication operations associated with *active* handles in the list *complete*, and returns the status of all these operations (this includes the case where no handle in the list is *active*). Both arrays have the same number of valid entries. The `i`-th entry in `array_of_statuses` is set to the return status of the `i`-th operation. *Active* *persistent requests* are marked *inactive*. Requests of any other type are deallocated and the corresponding handles in the array are set to `MPI_REQUEST_NULL`. The list may contain *null* or *inactive* handles. The call sets to *empty* the status of each such entry.

~~Waits~~ ==Does not return== until at least one of the operations associated with *active* handles in the list have *completed*. Returns in `outcount` the number of requests from the list `array_of_requests` that have *completed*. Returns in the first `outcount` locations of the array `array_of_indices` the indices of these operations (index within the array `array_of_requests`; the array is indexed from zero in C and from one in Fortran). Returns in the first `outcount` locations of the array `array_of_statuses` the status for these *completed* operations. *Completed* *active* *persistent requests* are marked as *inactive*. Any other type or request that *completed* is deallocated, and the associated handle is set to `MPI_REQUEST_NULL`.

[[versions/v50/API/MPI_TESTSOME|MPI_TESTSOME]] is a *local* procedure, which returns *immediately*, whereas [[versions/v50/API/MPI_WAITSOME|MPI_WAITSOME]] will ~~block~~ ==not return== until a communication *completes*, if it was passed a list that contains at least one *active* handle. Both calls fulfill a **fairness requirement**: If a request for a receive repeatedly appears in a list of requests passed to [[versions/v50/API/MPI_WAITSOME|MPI_WAITSOME]] or [[versions/v50/API/MPI_TESTSOME|MPI_TESTSOME]] , and a matching send has been *started*, then the receive will eventually succeed, unless the send is satisfied by another receive; and similarly for send requests.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Multiple Completions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Multiple Completions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Multiple Completions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Multiple Completions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Multiple Completions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Multiple Completions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Multiple Completions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Multiple Completions]]
