---
title: "Finalizing MPI"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Finalizing MPI

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Finalizing MPI|MPI-4.0]], [[versions/v41/sections/dynamic#Finalizing MPI|MPI-4.1]], [[versions/v50/sections/dynamic#Finalizing MPI|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (10 changed paragraphs)

~~This routine cleans up all MPI state associated with the World Model. If an MPI program terminates normally (i.e., not due to a call to [[versions/v41/API/MPI_ABORT|MPI_ABORT]] or an unrecoverable error) then each process must call [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] before it exits.~~

~~Before an MPI process invokes [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications associated with the World Model. It must locally complete all MPI operations that it initiated and must execute matching calls needed to complete MPI communications initiated by other processes. For example, if the process executed a nonblocking send, it must eventually call [[versions/v41/API/MPI_WAIT|MPI_WAIT]] , [[versions/v41/API/MPI_TEST|MPI_TEST]] , [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or any derived function; if the process is the target of a send, then it must post the matching receive; if it is part of a group executing a collective operation, then it must have completed its participation in the operation.~~

==This routine cleans up all MPI state associated with the World Model. If an MPI program that initializes the World Model terminates normally (i.e., not due to a call to [[versions/v41/API/MPI_ABORT|MPI_ABORT]] or an unrecoverable error) then each process must call [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] before it exits.==

==Before an MPI process invokes [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications associated with the World Model. It must locally complete all MPI operations that it initiated and must execute matching calls needed to complete MPI communications initiated by other processes. For example, if the process executed a nonblocking send, it must eventually call [[versions/v41/API/MPI_WAIT|MPI_WAIT]] , [[versions/v41/API/MPI_TEST|MPI_TEST]] , [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or any derived function; if the process is the target of a send, then it must post the matching receive; if it is part of a group executing a collective operation, then it must have completed its participation in the operation. This means that before calling [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , all message handles associated with the World Model must be received (with [[versions/v41/API/MPI_MRECV|MPI_MRECV]] or derived procedures) and all request handles associated with the World Model must be freed in the case of nonblocking operations, and must be inactive or freed in the case of persistent operations (i.e., by calling one of the procedures==

==`MPI\_{TEST$`|`$WAIT}{$`|`$ANY$`|`$SOME$`|`$ALL}` or [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] ).==

~~`MPI_XXX_FREE` calls.~~

==`MPI_XXX_FREE` , [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , or [[versions/v41/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] calls.==

==Once [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] returns, no MPI procedure may be called in the World Model (not even [[versions/v41/API/MPI_INIT|MPI_INIT]] , or freeing objects created within the World Model), except for those listed in [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

~~Process 0 Process 1 --------- ---------~~ ==\textbf{Process 0} \textbf{Process 1}== MPI_Init(); MPI_Init(); MPI_Send(dest=1); MPI_Recv(src=0); MPI_Finalize(); MPI_Finalize();

~~Process 0 Process 1 --------- ---------~~ ==\textbf{Process 0} \textbf{Process 1}== MPI_Init(); MPI_Init(); ~~MPI_Send (dest=1);~~ ==MPI_Send(dest=1);== MPI_Finalize(); MPI_Finalize();

~~Process 0 Process 1 --------- ---------~~ ==\textbf{Process 0} \textbf{Process 1}== MPI_Init(); MPI_Init(); MPI_Isend(dest=1); MPI_Recv(src=0); MPI_Request_free(); MPI_Finalize(); MPI_Finalize(); exit(); exit();

~~Process 0 Process 1 --------- ---------~~ ==\textbf{Process 0} \textbf{Process 1}== MPI_Init(); MPI_Init(); buffer = malloc(1000000); MPI_Recv(src=0); MPI_Buffer_attach(); MPI_Finalize(); ~~MPI_Send(dest=1));~~ ==MPI_Send(dest=1);== exit(); MPI_Finalize(); free(buffer); exit();

~~Process 0 Process 1 --------- ---------~~ ==\textbf{Process 0} \textbf{Process 1}== MPI_Issend(dest=1); MPI_Finalize(); MPI_Cancel(); MPI_Wait(); MPI_Finalize();

> Even though a process has executed all MPI calls needed to complete the communications it is involved with, such communication may not yet be completed from the viewpoint of the underlying MPI system. For example, a blocking send may have returned, even though the data is still buffered at the sender in an MPI buffer; an MPI process may receive a cancel request for a message it has completed receiving. The MPI implementation must ensure that a process has completed any involvement in MPI communication before [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] returns. Thus, if a process exits after the call to [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , this will not cause an ongoing communication to fail. The MPI implementation should also complete freeing all objects marked for deletion by MPI calls that freed them. ==See also [[versions/v41/sections/terms#Progress|Progress]] on *progress*.==

> Applications that handle errors are encouraged to implement all rank-specific code before the call to [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] . In Example [[example-finalize-rank0]] ~~below,~~ ==,== the process with rank 0 in `MPI_COMM_WORLD` may have been terminated before, during, or after the call to [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , possibly leading to the code after [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] never being executed.

~~        ...         MPI_Comm_rank(MPI_COMM_WORLD, &myrank);         ...         MPI_Finalize();         if (myrank == 0) {             resultfile = fopen("outfile", "w");             dump_results(resultfile);             fclose(resultfile);         }         exit(0);~~

==(code block added)==
``` [MPI]C
...
MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
...
MPI_Finalize();
if (myrank == 0) {
    resultfile = fopen("outfile", "w");
    dump_results(resultfile);
    fclose(resultfile);
}
exit(0);
```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

Before an MPI process invokes [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications associated with the World Model. It must locally complete all MPI operations that it initiated and must execute matching calls needed to complete MPI communications initiated by other processes. For example, if the process executed a nonblocking send, it must eventually call [[versions/v50/API/MPI_WAIT|MPI_WAIT]] , [[versions/v50/API/MPI_TEST|MPI_TEST]] , [[versions/v50/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or any derived function; if the process is the target of a send, then it must post the matching receive; if it is part of a group executing a collective operation, then it must have completed its participation in the operation. This means that before calling [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] , all message handles associated with the World Model must be received (with [[versions/v50/API/MPI_MRECV|MPI_MRECV]] or derived procedures) and all request handles associated with the World Model must be freed in the case of nonblocking operations, and must be inactive or freed in the case of persistent ==or partitioned== operations (i.e., by calling one of the procedures

Failures may disrupt MPI operations during and after MPI finalization. A ~~high quality~~ ==high-quality== implementation shall not deadlock in MPI finalization, even in the presence of failures. The normal rules for MPI error handling continue to apply. After `MPI_COMM_SELF` has been “freed” (see Section [[versions/v50/sections/dynamic#Allowing User Functions at MPI Finalization|Allowing User Functions at MPI Finalization]] ), errors that are not associated with a communicator, window, or file raise the initial error handler (set during the launch operation, see [[versions/v50/sections/dynamic#Reserved Keys|Reserved Keys]] ).

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Finalizing MPI]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Finalizing MPI]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Finalizing MPI]]
