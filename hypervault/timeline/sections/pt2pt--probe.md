---
title: "Probe"
chapter: pt2pt
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Probe

Chapter **pt2pt** · in [[versions/v30/sections/pt2pt#Probe|MPI-3.0]], [[versions/v31/sections/pt2pt#Probe|MPI-3.1]], [[versions/v40/sections/pt2pt#Probe|MPI-4.0]], [[versions/v41/sections/pt2pt#Probe|MPI-4.1]], [[versions/v50/sections/pt2pt#Probe|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~`MPI_IPROBE(source, tag, comm, flag, status)`~~ ==[[versions/v31/API/MPI_IPROBE|MPI_IPROBE]]== returns `flag = true` if there is a message that can be received and that matches the pattern specified by the arguments `source`, `tag`, and `comm`. The call matches the same message that would have been received by a call to [[versions/v31/API/MPI_RECV|MPI_RECV]] executed at the same point in the program, and returns in `status` the same value that would have been returned by ~~`MPI_RECV()`.~~ ==[[versions/v31/API/MPI_RECV|MPI_RECV]] .== Otherwise, the call returns `flag = false`, and leaves `status` undefined.

If ~~`MPI_IPROBE`~~ ==[[versions/v31/API/MPI_IPROBE|MPI_IPROBE]]== returns `flag = true`, then the content of the status object can be subsequently accessed as described in Section [[versions/v31/sections/pt2pt#Return Status|Return Status]] to find the source, tag and length of the probed message.

A probe with `MPI_PROC_NULL` as source returns flag = true, and the status object returns source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG`, and count = 0; see ~~Section [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] on page~~ [[versions/v31/sections/pt2pt#Null Processes|Null Processes]] .

~~`MPI_PROBE`~~ ==[[versions/v31/API/MPI_PROBE|MPI_PROBE]]== behaves like ~~`MPI_IPROBE`~~ ==[[versions/v31/API/MPI_IPROBE|MPI_IPROBE]]== except that it is a blocking call that returns only after a matching message has been found.

The MPI implementation of [[versions/v31/API/MPI_PROBE|MPI_PROBE]] and [[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] needs to guarantee progress: if a call to [[versions/v31/API/MPI_PROBE|MPI_PROBE]] has been issued by a process, and a send that matches the probe has been initiated by some process, then the call to [[versions/v31/API/MPI_PROBE|MPI_PROBE]] will return, unless the message is received by another concurrent receive operation (that is executed by another thread at the probing process). Similarly, if a process busy waits with [[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] and a matching message has been issued, then the call to [[versions/v31/API/MPI_IPROBE|MPI_IPROBE]] will eventually return ~~<span class="sans-serif">flag~~ ==`flag== = ~~true</span>~~ ==true`== unless the message is received by another concurrent receive operation or matched by a concurrent matched probe.

Use blocking probe to wait for an incoming message.

A similar program to the previous example, but now it has a problem.

> A call to [[versions/v31/API/MPI_PROBE|MPI_PROBE]] will match the message that would have been received by a call to [[versions/v31/API/MPI_RECV|MPI_RECV]] executed at the same point. Suppose that this message has source ~~<span class="sans-serif">s</span>,~~ ==`s`,== tag ~~<span class="sans-serif">t</span>~~ ==`t`== and communicator ~~<span class="sans-serif">c</span>.~~ ==`c`.== If the tag argument in the probe call has value `MPI_ANY_TAG` then the message probed will be the earliest pending message from source ~~<span class="sans-serif">s</span>~~ ==`s`== with communicator ~~<span class="sans-serif">c</span>~~ ==`c`== and any tag; in any case, the message probed will be the earliest pending message from source ~~<span class="sans-serif">s</span>~~ ==`s`== with tag ~~<span class="sans-serif">t</span>~~ ==`t`== and communicator ~~<span class="sans-serif">c</span>~~ ==`c`== (this is the message that would have been received, so as to preserve message order). This message continues as the earliest pending message from source ~~<span class="sans-serif">s</span>~~ ==`s`== with tag ~~<span class="sans-serif">t</span>~~ ==`t`== and communicator ~~<span class="sans-serif">c</span>,~~ ==`c`,== until it is received. A receive operation subsequent to the probe that uses the same communicator as the probe and uses the tag and source values returned by the probe, must receive this message, unless it has already been received by another receive operation.

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

~~[[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] returns `flag = true` if there is a message that can be received and that matches the pattern specified by the arguments `source`, `tag`, and `comm`. The call matches the same message that would have been received by a call to [[versions/v40/API/MPI_RECV|MPI_RECV]] executed at the same point in the program, and returns in `status` the same value that would have been returned by [[versions/v40/API/MPI_RECV|MPI_RECV]] . Otherwise, the call returns `flag = false`, and leaves `status` undefined.~~

~~If [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] returns `flag = true`, then the content of the status object can be subsequently accessed as described in Section [[versions/v40/sections/pt2pt#Return Status|Return Status]] to find the source, tag and length of the probed message.~~

~~A subsequent receive executed with the same communicator, and the source and tag returned in status by [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] will receive the message that was matched by the probe, if no other intervening receive occurs after the probe, and the send is not successfully cancelled before the receive. If the receiving process is multithreaded, it is the user’s responsibility to ensure that the last condition holds.~~

~~The `source` argument of [[versions/v40/API/MPI_PROBE|MPI_PROBE]] can be `MPI_ANY_SOURCE`, and the `tag` argument can be `MPI_ANY_TAG`, so that one can probe for messages from an arbitrary source and/or with an arbitrary tag. However, a specific communication context must be provided with the `comm` argument.~~

==[[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] returns `flag``= true` if there is a message that can be received and that matches the pattern specified by the arguments `source`, `tag`, and `comm`. The call matches the same message that would have been received by a call to [[versions/v40/API/MPI_RECV|MPI_RECV]] with the same argument values for `source`, `tag`, `comm`, and `status` executed at the same point in the program, and returns in `status` the same value that would have been returned by [[versions/v40/API/MPI_RECV|MPI_RECV]] . Otherwise, the call returns `flag``= false`, and leaves `status` undefined.==

==If [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] returns `flag``= true`, then the content of the status object can be subsequently accessed as described in Section [[versions/v40/sections/pt2pt#Return Status|Return Status]] to find the source, tag, and length of the probed message.==

==[[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] is a *local* procedure since its return does not depend on MPI calls in other MPI processes, which is marked with the prefix `I` (for *immediate*).==

==A subsequent receive executed with the same communicator, and the source and tag returned in status by [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] will receive the message that was matched by the probe, if no other intervening receive occurs after the probe, and the send is not successfully *cancelled* before the receive. If the receiving process is multithreaded, it is the user’s responsibility to ensure that the last condition holds.==

==The `source` argument of [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] can be `MPI_ANY_SOURCE`, and the `tag` argument can be `MPI_ANY_TAG`, so that one can *probe* for *messages* from an arbitrary source and/or with an arbitrary tag. However, a specific communication context must be provided with the `comm` argument.==

A probe with `MPI_PROC_NULL` as source returns ~~flag = true,~~ ==`flag``= true`,== and the status object returns ~~source = `MPI_PROC_NULL`, tag = `MPI_ANY_TAG`,~~ ==`source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`,== and ~~count = 0;~~ ==`count``= 0`;== see [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] .

~~[[versions/v40/API/MPI_PROBE|MPI_PROBE]] behaves like [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] except that it is a blocking call that returns only after a matching message has been found.~~

~~The MPI implementation of [[versions/v40/API/MPI_PROBE|MPI_PROBE]] and [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] needs to guarantee progress: if a call to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] has been issued by a process, and a send that matches the probe has been initiated by some process, then the call to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] will return, unless the message is received by another concurrent receive operation (that is executed by another thread at the probing process). Similarly, if a process busy waits with [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] and a matching message has been issued, then the call to [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] will eventually return `flag = true` unless the message is received by another concurrent receive operation or matched by a concurrent matched probe.~~

~~Use blocking probe to wait for an incoming message.~~

~~           CALL MPI_COMM_RANK(comm, rank, ierr)            IF (rank.EQ.0) THEN                CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)            ELSE IF (rank.EQ.1) THEN                CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)            ELSE IF (rank.EQ.2) THEN                DO i=1, 2                   CALL MPI_PROBE(MPI_ANY_SOURCE, 0,                                  comm, status, ierr)                   IF (status(MPI_SOURCE) .EQ. 0) THEN     100               CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr)                   ELSE     200               CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr)                   END IF                END DO            END IF~~

==[[versions/v40/API/MPI_PROBE|MPI_PROBE]] behaves like [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] except that it is a *non-local* call that returns only after a matching message has been found.==

==The MPI implementation of [[versions/v40/API/MPI_PROBE|MPI_PROBE]] and [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] needs to guarantee *progress*: if a call to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] has been issued by a process, and a send that matches the probe has been *initiated* by some process, then the call to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] will return, unless the message is received by another concurrent receive operation (that is executed by another thread at the probing process).==

==Similarly, if a process busy waits with [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] and a matching message has been issued, then the call to [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] will eventually return `flag``= true` unless the message is received by another concurrent receive operation or matched by a concurrent *matching probe*.==

==Use probe to wait for an incoming message.==

==        CALL MPI_COMM_RANK(comm, rank, ierr)         IF (rank .EQ. 0) THEN            CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)         ELSE IF (rank .EQ. 1) THEN            CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)         ELSE IF (rank .EQ. 2) THEN            DO i=1,2               CALL MPI_PROBE(MPI_ANY_SOURCE, 0, &                              comm, status, ierr)               IF (status(MPI_SOURCE) .EQ. 0) THEN     100          CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr)               ELSE     200          CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr)               END IF            END DO         END IF==

==! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------== CALL MPI_COMM_RANK(comm, rank, ierr) IF ~~(rank.EQ.0)~~ ==(rank .EQ. 0)== THEN CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr) ELSE IF ~~(rank.EQ.1)~~ ==(rank .EQ. 1)== THEN CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr) ELSE IF ~~(rank.EQ.2)~~ ==(rank .EQ. 2)== THEN DO ~~i=1, 2~~ ==i=1,2== CALL MPI_PROBE(MPI_ANY_SOURCE, 0, ==&== comm, status, ierr) IF (status(MPI_SOURCE) .EQ. 0) THEN 100 CALL MPI_RECV(i, 1, MPI_INTEGER, MPI_ANY_SOURCE, ==&== 0, comm, status, ierr) ELSE 200 CALL MPI_RECV(x, 1, MPI_REAL, MPI_ANY_SOURCE, ==&== 0, comm, status, ierr) END IF END DO END IF

In Example [[pt2pt-exQ]] , the two receive calls in statements labeled 100 and 200 in Example [[pt2pt-exP]] ==are== slightly modified, using `MPI_ANY_SOURCE` as the `source` argument. The program is now incorrect: the receive operation may receive a message that is distinct from the message probed by the preceding call to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] .

> In a multithreaded MPI program, [[versions/v40/API/MPI_PROBE|MPI_PROBE]] and [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] might need special care. If a thread ~~probes~~ ==*probes*== for a message and then immediately posts a matching receive, the receive may match a message other than that found by the probe since another thread could concurrently receive that original message . [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] solve this problem by matching the incoming message so that it may only be received with [[versions/v40/API/MPI_MRECV|MPI_MRECV]] or [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] on the corresponding ~~message handle.~~ ==*message handle*.==

> A call to [[versions/v40/API/MPI_PROBE|MPI_PROBE]] will match the message that would have been received by a call to [[versions/v40/API/MPI_RECV|MPI_RECV]] ==with the same argmument values for `source`, `tag`, `comm`, and `status`== executed at the same point. Suppose that this message has source `s`, tag `t` and communicator `c`. If the tag argument in the probe call has value `MPI_ANY_TAG` then the message probed will be the earliest pending message from source `s` with communicator `c` and any tag; in any case, the message probed will be the earliest pending message from source `s` with tag `t` and communicator `c` (this is the message that would have been received, so as to preserve message order). This message continues as the earliest pending message from source `s` with tag `t` and communicator `c`, until it is received. A receive operation subsequent to the probe that uses the same communicator as the probe and uses the tag and source values returned by the probe, must receive this message, unless it has already been received by another receive operation.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

A subsequent receive executed with the same communicator, and the source and tag returned in status by [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] will receive the message that was matched by the probe, if no other intervening receive occurs after the probe, and the send is not successfully *cancelled* before the receive. If the receiving ==MPI== process is multithreaded, it is the user’s responsibility to ensure that the last condition holds.

A probe with `MPI_PROC_NULL` as source returns `flag``= true`, and the status object returns `source``=``MPI_PROC_NULL`, `tag``=``MPI_ANY_TAG`, and `count``= 0`; see [[versions/v41/sections/pt2pt#Null ==MPI== Processes|Null ==MPI== Processes]] .

[[versions/v41/API/MPI_PROBE|MPI_PROBE]] behaves like [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] except that it is a ~~*non-local*~~ ==*nonlocal*== call that returns only after a matching message has been found.

The MPI implementation of [[versions/v41/API/MPI_PROBE|MPI_PROBE]] and [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] needs to guarantee *progress*: if a call to [[versions/v41/API/MPI_PROBE|MPI_PROBE]] has been issued by ~~a~~ ==an MPI== process, and a send that matches the probe has been *initiated* by some ==MPI== process, then the call to [[versions/v41/API/MPI_PROBE|MPI_PROBE]] will return, unless the message is received by another concurrent receive operation (that is executed by another thread at the probing ==MPI== process).

Similarly, if ~~a~~ ==an MPI== process ~~busy waits with~~ ==repeatedly calls== [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] and a matching message has been issued, then ~~the call to~~ [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] will eventually return `flag``= true` unless the message is received by another concurrent receive operation or matched by a concurrent *matching probe*. ==See also [[versions/v41/sections/terms#Progress|Progress]] on *progress*.==

~~        CALL MPI_COMM_RANK(comm, rank, ierr)         IF (rank .EQ. 0) THEN            CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)         ELSE IF (rank .EQ. 1) THEN            CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)         ELSE IF (rank .EQ. 2) THEN            DO i=1,2               CALL MPI_PROBE(MPI_ANY_SOURCE, 0, &                              comm, status, ierr)               IF (status(MPI_SOURCE) .EQ. 0) THEN     100          CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr)               ELSE     200          CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr)               END IF            END DO         END IF~~

==(code block added)==
``` [MPI]Fortran
CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (rank .EQ. 0) THEN
       CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)
    ELSE IF (rank .EQ. 1) THEN
       CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)
    ELSE IF (rank .EQ. 2) THEN
       DO i=1,2
          CALL MPI_PROBE(MPI_ANY_SOURCE, 0, comm, status, ierr)
          IF (status(MPI_SOURCE) .EQ. 0) THEN
100          CALL MPI_RECV(i, 1, MPI_INTEGER, 0, 0, comm, status, ierr)
          ELSE
200          CALL MPI_RECV(x, 1, MPI_REAL, 1, 0, comm, status, ierr)
          END IF
       END DO
    END IF
```

~~    ! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------         CALL MPI_COMM_RANK(comm, rank, ierr)         IF (rank .EQ. 0) THEN            CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)         ELSE IF (rank .EQ. 1) THEN            CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)         ELSE IF (rank .EQ. 2) THEN            DO i=1,2               CALL MPI_PROBE(MPI_ANY_SOURCE, 0, &                              comm, status, ierr)               IF (status(MPI_SOURCE) .EQ. 0) THEN     100          CALL MPI_RECV(i, 1, MPI_INTEGER, MPI_ANY_SOURCE, &                                0, comm, status, ierr)               ELSE     200          CALL MPI_RECV(x, 1, MPI_REAL, MPI_ANY_SOURCE, &                                0, comm, status, ierr)               END IF            END DO         END IF~~

==(code block added)==
``` [MPI]Fortran
! ---------------- THIS EXAMPLE IS ERRONEOUS ---------------
    CALL MPI_COMM_RANK(comm, rank, ierr)
    IF (rank .EQ. 0) THEN
       CALL MPI_SEND(i, 1, MPI_INTEGER, 2, 0, comm, ierr)
    ELSE IF (rank .EQ. 1) THEN
       CALL MPI_SEND(x, 1, MPI_REAL, 2, 0, comm, ierr)
    ELSE IF (rank .EQ. 2) THEN
       DO i=1,2
          CALL MPI_PROBE(MPI_ANY_SOURCE, 0, comm, status, ierr)
          IF (status(MPI_SOURCE) .EQ. 0) THEN
100          CALL MPI_RECV(i, 1, MPI_INTEGER, MPI_ANY_SOURCE, &
                           0, comm, status, ierr)
          ELSE
200          CALL MPI_RECV(x, 1, MPI_REAL, MPI_ANY_SOURCE, &
                           0, comm, status, ierr)
          END IF
       END DO
    END IF
```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The MPI ~~implementation~~ ==implementations== of [[versions/v50/API/MPI_PROBE|MPI_PROBE]] and [[versions/v50/API/MPI_IPROBE|MPI_IPROBE]] ~~needs~~ ==need== to guarantee *progress*: if a call to [[versions/v50/API/MPI_PROBE|MPI_PROBE]] has been issued by an MPI process, and a send that matches the probe has been *initiated* by some MPI process, then the call to [[versions/v50/API/MPI_PROBE|MPI_PROBE]] will return, unless the message is received by another concurrent receive operation (that is executed by another thread at the probing MPI process).

> A call to [[versions/v50/API/MPI_PROBE|MPI_PROBE]] will match the message that would have been received by a call to [[versions/v50/API/MPI_RECV|MPI_RECV]] with the same argmument values for `source`, `tag`, `comm`, and `status` executed at the same point. Suppose that this message has source `s`, tag `t` and communicator `c`. If the tag argument in the probe call has value ~~`MPI_ANY_TAG`~~ ==`MPI_ANY_TAG`,== then the message probed will be the earliest pending message from source `s` with communicator `c` and any tag; in any case, the message probed will be the earliest pending message from source `s` with tag `t` and communicator `c` (this is the message that would have been received, so as to preserve message order). This message continues as the earliest pending message from source `s` with tag `t` and communicator `c`, until it is received. A receive operation subsequent to the probe that uses the same communicator as the probe and uses the tag and source values returned by the probe, must receive this message, unless it has already been received by another receive operation.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Probe]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Probe]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Probe]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Probe]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Probe]]
