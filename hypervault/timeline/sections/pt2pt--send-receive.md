---
title: "Send-Receive"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/pt2pt]
---

# Send-Receive

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Send-receive|MPI-1.3]], [[versions/v21/sections/pt2pt#Send-Receive|MPI-2.1]], [[versions/v22/sections/pt2pt#Send-Receive|MPI-2.2]], [[versions/v30/sections/pt2pt#Send-Receive|MPI-3.0]], [[versions/v31/sections/pt2pt#Send-Receive|MPI-3.1]]

Heading by release: MPI-1.3: “Send-receive”; MPI-2.1: “Send-Receive”; MPI-2.2: “Send-Receive”; MPI-3.0: “Send-Receive”; MPI-3.1: “Send-Receive”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

==The semantics of a send-receive operation is what would be obtained if the caller forked two concurrent threads, one to execute the send, and one to execute the receive, followed by a join of these two threads.==

~~The semantics of a send-receive operation is what would be obtained if the caller forked two concurrent threads, one to execute the send, and one to execute the receive, followed by a join of these two threads.~~

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Send-receive]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Send-Receive]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Send-Receive]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Send-Receive]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Send-Receive]]
