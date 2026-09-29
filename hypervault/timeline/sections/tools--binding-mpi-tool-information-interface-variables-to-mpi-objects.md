---
title: "Binding MPI Tool Information Interface Variables to MPI Objects"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Binding MPI Tool Information Interface Variables to MPI Objects

Chapter **tools** · in [[versions/v30/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects|MPI-3.0]], [[versions/v31/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects|MPI-3.1]], [[versions/v40/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects|MPI-4.0]], [[versions/v41/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects|MPI-4.1]], [[versions/v50/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

| Constant | MPI object | |:----------------------------|:--------------------------------------------| | `MPI_T_BIND_NO_OBJECT` | N/A; applies globally to entire MPI process | | `MPI_T_BIND_MPI_COMM` | MPI communicators | | `MPI_T_BIND_MPI_DATATYPE` | MPI datatypes | | `MPI_T_BIND_MPI_ERRHANDLER` | MPI error handlers | | `MPI_T_BIND_MPI_FILE` | MPI file handles | | `MPI_T_BIND_MPI_GROUP` | MPI groups | | `MPI_T_BIND_MPI_OP` | MPI reduction operators | | `MPI_T_BIND_MPI_REQUEST` | MPI requests | | `MPI_T_BIND_MPI_WIN` | MPI windows for one-sided communication | | `MPI_T_BIND_MPI_MESSAGE` | MPI message object | | `MPI_T_BIND_MPI_INFO` | MPI info object | ==| `MPI_T_BIND_MPI_SESSION` | MPI session object |==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Each MPI tool information interface variable provides access to a particular control setting or performance property of the MPI implementation. A variable may refer to a specific MPI object such as a communicator, datatype, or one-sided communication window, or the variable may refer more generally to the MPI environment of the process. Except for the last case, the variable must be bound to exactly one MPI object before it can be used. Table [[versions/v41/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects|Binding MPI Tool Information Interface Variables to MPI Objects]] lists all MPI object types to which an MPI tool information interface variable can be bound, together with the matching constant that MPI tool information interface routines return to identify the object type. ==It is erroneous to bind a control variable, performance variable, or event to a handle that would not be valid to use as an input argument to another MPI call (excluding calls to the MPI Tool Information Interface) at the same point of execution.==

| ~~Constant~~ ==**Constant**== | ~~MPI object~~ ==**MPI object**== | |:----------------------------|:--------------------------------------------| | `MPI_T_BIND_NO_OBJECT` | N/A; applies globally to entire MPI process | | `MPI_T_BIND_MPI_COMM` | MPI communicators | | `MPI_T_BIND_MPI_DATATYPE` | MPI datatypes | | `MPI_T_BIND_MPI_ERRHANDLER` | MPI error handlers | | `MPI_T_BIND_MPI_FILE` | MPI file handles | | `MPI_T_BIND_MPI_GROUP` | MPI groups | | `MPI_T_BIND_MPI_OP` | MPI reduction operators | | `MPI_T_BIND_MPI_REQUEST` | MPI requests | | `MPI_T_BIND_MPI_WIN` | MPI windows for one-sided communication | | `MPI_T_BIND_MPI_MESSAGE` | MPI message object | | `MPI_T_BIND_MPI_INFO` | MPI info object | | `MPI_T_BIND_MPI_SESSION` | MPI session object |

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

| **Constant** | **MPI object** | |:----------------------------|:--------------------------------------------| | `MPI_T_BIND_NO_OBJECT` | N/A; applies globally to entire MPI process | | `MPI_T_BIND_MPI_COMM` | MPI ~~communicators~~ ==communicator== | | `MPI_T_BIND_MPI_DATATYPE` | MPI ~~datatypes~~ ==datatype== | | `MPI_T_BIND_MPI_ERRHANDLER` | MPI error ~~handlers~~ ==handler== | | `MPI_T_BIND_MPI_FILE` | MPI file ~~handles~~ ==handle== | | `MPI_T_BIND_MPI_GROUP` | MPI ~~groups~~ ==group== | | `MPI_T_BIND_MPI_OP` | MPI reduction ~~operators~~ ==operator== | | `MPI_T_BIND_MPI_REQUEST` | MPI ~~requests~~ ==request== | | `MPI_T_BIND_MPI_WIN` | MPI ~~windows for one-sided communication~~ ==window== | | `MPI_T_BIND_MPI_MESSAGE` | MPI message object | | `MPI_T_BIND_MPI_INFO` | MPI info object | | `MPI_T_BIND_MPI_SESSION` | MPI session ~~object~~ |

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects]]
