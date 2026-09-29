---
title: "MPI Operations"
chapter: terms
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# MPI Operations

Chapter **terms** · in [[versions/v40/sections/terms#MPI Operations|MPI-4.0]], [[versions/v41/sections/terms#MPI Operations|MPI-4.1]], [[versions/v50/sections/terms#MPI Operations|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (8 changed paragraphs)

**MPI ~~operation**~~ ==operation**:== An MPI operation is a sequence of steps performed by the MPI library to establish and enable data transfer and/or synchronization. It consists of four stages: initialization, starting, completion, and freeing, and it is implemented as a set of one or more MPI procedures, see Section [[versions/v41/sections/terms#MPI Procedures|MPI Procedures]] .

**Starting** hands over ~~the~~ control of the data buffers, if any, to the associated operation.

**Blocking ~~operation**~~ ==operation**:== For a **blocking operation**, all four stages are combined in a single procedure call (as shown in Figure [[versions/v41/sections/terms#MPI Operations|MPI Operations]] and defined in Section [[versions/v41/sections/terms#MPI Procedures|MPI Procedures]] ).

**Nonblocking ~~operation**~~ ==operation**:== For a **nonblocking operation**, the initialization and starting stages are combined into a single nonblocking procedure call and the completion and freeing stages are combined into a separate, single procedure call, which can be blocking or nonblocking (as shown in Figure [[versions/v41/sections/terms#MPI Operations|MPI Operations]] and defined in Section [[versions/v41/sections/terms#MPI Procedures|MPI Procedures]] ).

**Persistent ~~operation**~~ ==operation**:== For a **persistent operation**, there is a separate procedure for each of the four stages (as shown in Figure [[versions/v41/sections/terms#MPI Operations|MPI Operations]] and defined in Section [[versions/v41/sections/terms#MPI Procedures|MPI Procedures]] ). Each of these procedures may be blocking or nonblocking.

==These four stages lead to the **operation states** **initialized**, **started**, **complete**, and==

==**freed**. A *started operation* is also named **active**, and the states *initialized* and *complete* are also named **inactive**.==

==*Active* communication and I/O operations are also named **pending** operations. Note that a *pending* operation can be a nonblocking or persistent operation that is started and not yet complete (even if the request handle has been freed), or a blocking operation that is not yet complete, such as a receive operation that is waiting for a message to be received.==

**Collective ~~operation** Collective operations are defined as operations that involve~~ ==operation**: A set of related operations, one per MPI process in== a group or groups of MPI processes. For collective operations the completion stage may or may not finish before all processes in the group have started the operation.

~~**Noncollective operation**   Noncollective operations are defined as operations that are not collective.~~

==**Noncollective operation**:   Noncollective operations are defined as operations that are not collective.==

==Many MPI operations coordinate activities at multiple MPI processes: the semantics of such an operation require one or more other specific semantically-related operations to be *started* before it is guaranteed that the operation can transition to the *complete* operation state. For example, a receive operation requires a related send operation to be started before the receive can complete; or a collective operation might not complete before such operations are also started in all MPI processes of the respective group.==

==**Enabled**:   An MPI operation is **enabled** at a particular MPI process when all specific semantically-related operations required to guarantee completion at that MPI process have been started.==

==> [!tip] Rationale==

==> MPI implementations may include optimizations (for example, automatic buffering) that allow an MPI operation to complete before it is enabled.==

==Some MPI operations are **a priori enabled**, i.e., they do not require any other specific semantically-related operation for completion. For example, a buffered send operation completes independently of the related receive operation.==

==Once an MPI operation is *enabled*, the operation must eventually complete.==

==An operation may already be enabled before it is started. For example, a receive operation is already enabled if it is started after the matching send operation was started.==

==> [!tip] Rationale==

==> The definition of an operation $`A`$ being *enabled* is asymmetric: *enabled* includes that all specific semantically-related operations $`A'_i`$ required to guarantee completion have been started, but does not include that the operation $`A`$ itself is already started. > > Examples: > > - A receive is enabled exactly when the related send is started. > > - A standard mode send operation is enabled exactly when the related receive is started. If an MPI implementation chooses to use internal buffering, the send operation may be already completed > >   before it is enabled, i.e., the receive is started. > > - A synchronous mode send operation is enabled exactly when the related receive is started and must not complete before it is enabled. > > - A buffered mode send operation is a priori enabled. > > - A ready mode send can be started only when it is already enabled, i.e., the related receive is started. > > - For a collective broadcast, the operation at a particular MPI process is enabled exactly when all other MPI processes in the group have started their related broadcast operation. > > Specifically, for the set of related operations on a group of MPI processes that constitute a collective operation that may synchronize, the operation on a particular MPI process $`p`$ is enabled when all other MPI processes $`p_i \neq p`$ in the group have started their related operation, while the operation on $`p`$ need not have started yet.==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

**Collective operation**: A ==**collective operation** is a== set of related operations, one per MPI process in a group or groups of MPI processes. For collective operations the completion stage may or may not finish before all processes in the group have started the operation.

**Noncollective operation**: ~~Noncollective operations~~ ==**Noncollective operations**== are defined as operations that are not collective.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#MPI Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#MPI Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#MPI Operations]]
