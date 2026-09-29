---
title: "Fairness"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Fairness

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Fairness|MPI-1.3]], [[versions/v21/sections/pt2pt#Fairness|MPI-2.1]], [[versions/v22/sections/pt2pt#Fairness|MPI-2.2]], [[versions/v30/sections/pt2pt#Fairness|MPI-3.0]], [[versions/v31/sections/pt2pt#Fairness|MPI-3.1]], [[versions/v40/sections/pt2pt#Fairness|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

MPI makes no guarantee of *fairness* in the handling of communication. Suppose that a send is posted. Then it is possible that the destination process repeatedly posts a receive that matches this send, yet the message is never received, because it is each time overtaken by another message, sent from another source. Similarly, suppose that a receive was posted by a ~~multi-threaded~~ ==multithreaded== process. Then it is possible that messages that match this receive are repeatedly received, yet the receive is never satisfied, because it is overtaken by other receives posted at this node (by other executing threads). It is the programmer’s responsibility to prevent starvation in such situations.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

MPI makes no guarantee of ~~*fairness*~~ ==**fairness**== in the handling of communication. Suppose that a send is posted. Then it is possible that the destination process repeatedly posts a receive that matches this send, yet the message is never received, because it is each time overtaken by another message, sent from another source. Similarly, suppose that a receive was posted by a multithreaded process. Then it is possible that messages that match this receive are repeatedly received, yet the receive is never satisfied, because it is overtaken by other receives posted at this node (by other executing threads). It is the programmer’s responsibility to prevent starvation in such situations.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Fairness]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Fairness]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Fairness]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Fairness]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Fairness]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Fairness]]
