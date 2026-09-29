---
title: "`MPI_BOTTOM` and Combining Independent Variables in Datatypes"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# `MPI_BOTTOM` and Combining Independent Variables in Datatypes

Chapter **binding** · in [[versions/v30/sections/binding#MPI_BOTTOM and Combining Independent Variables in Datatypes|MPI-3.0]], [[versions/v31/sections/binding#MPI_BOTTOM and Combining Independent Variables in Datatypes|MPI-3.1]], [[versions/v40/sections/binding#`MPI_BOTTOM` and Combining Independent Variables in Datatypes|MPI-4.0]], [[versions/v41/sections/binding#`MPI_BOTTOM` and Combining Independent Variables in Datatypes|MPI-4.1]], [[versions/v50/sections/binding#`MPI_BOTTOM` and Combining Independent Variables in Datatypes|MPI-5.0]]

Heading by release: MPI-3.0: “MPI_BOTTOM and Combining Independent Variables in Datatypes”; MPI-3.1: “MPI_BOTTOM and Combining Independent Variables in Datatypes”; MPI-4.0: “`MPI_BOTTOM` and Combining Independent Variables in Datatypes”; MPI-4.1: “`MPI_BOTTOM` and Combining Independent Variables in Datatypes”; MPI-5.0: “`MPI_BOTTOM` and Combining Independent Variables in Datatypes”

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~This section is only relevant if the MPI program uses~~

~~a buffer argument to an [[versions/v31/API/MPI_SEND|MPI_SEND]] , [[versions/v31/API/MPI_RECV|MPI_RECV]] , etc., that hides the actual variables involved in the communication. `MPI_BOTTOM` with an `MPI_Datatype` containing absolute addresses is one example. Creating a datatype which uses one variable as an anchor and brings along others by using [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to determine their offsets from the anchor is another. The anchor variable would be the only one referenced in the call. Also attention must be paid if MPI operations are used that run in parallel with the user’s application.~~

==This section is only relevant if the MPI program uses a buffer argument to an [[versions/v31/API/MPI_SEND|MPI_SEND]] , [[versions/v31/API/MPI_RECV|MPI_RECV]] , etc., that hides the actual variables involved in the communication. `MPI_BOTTOM` with an `MPI_Datatype` containing *absolute addresses* is one example. Creating a datatype which uses one variable as an anchor and brings along others by using [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to determine their offsets from the anchor is another. The anchor variable would be the only one referenced in the call. Also attention must be paid if MPI operations are used that run in parallel with the user’s application.==

Fortran 90 register optimization.\ This source ~~...~~ ==$`...`$== can be compiled as:

Similar example with [[versions/v31/API/MPI_SEND|MPI_SEND]]\ This source ~~...~~ ==$`...`$== can be compiled as:

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

! buf contains val_old ! buf contains val_old buf = val_new call MPI_SEND(MPI_BOTTOM,1,type,...) call MPI_SEND(...) ! with buf as a displacement in type ! i.e. val_old is sent ! ! buf=val_new is moved to here ! and detected as dead code ! and therefore removed ! buf = val_overwrite buf = val_overwrite

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

This section is only relevant if the MPI program uses a buffer argument to an [[versions/v41/API/MPI_SEND|MPI_SEND]] , [[versions/v41/API/MPI_RECV|MPI_RECV]] , etc., that hides the actual variables involved in the communication. `MPI_BOTTOM` with an `MPI_Datatype` containing *absolute addresses* is one example. Creating a datatype ~~which~~ ==that== uses one variable as an anchor and brings along others by using [[versions/v41/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to determine their offsets from the anchor is another. The anchor variable would be the only one referenced in the call. Also attention must be paid if MPI operations are used that run in parallel with the user’s application.

Fortran 90 register ~~optimization.\ This source $`...`$ can be compiled as:~~ ==optimization.==

==\textbf{This source} \textbf{can be compiled as}== call MPI_GET_ADDRESS(buf,bufaddr, call MPI_GET_ADDRESS(buf,...) ierror) call MPI_TYPE_CREATE_STRUCT(1,1, call MPI_TYPE_CREATE_STRUCT(...) bufaddr, ~~MPI_REAL,type,ierror)~~ ==MPI_REAL,dtype,ierror)== call ~~MPI_TYPE_COMMIT(type,ierror)~~ ==MPI_TYPE_COMMIT(dtype,ierror)== call MPI_TYPE_COMMIT(...) val_old = buf register = buf val_old = register call ~~MPI_RECV(MPI_BOTTOM,1,type,...)~~ ==MPI_RECV(MPI_BOTTOM,1,dtype,...)== call MPI_RECV(MPI_BOTTOM,...) val_new = buf val_new = register

Similar example with ~~[[versions/v41/API/MPI_SEND|MPI_SEND]]\ This source $`...`$ can be compiled as:~~ ==[[versions/v41/API/MPI_SEND|MPI_SEND]]==

==\textbf{This source} \textbf{can be compiled as}== ! buf contains val_old ! buf contains val_old buf = val_new call ~~MPI_SEND(MPI_BOTTOM,1,type,...)~~ ==MPI_SEND(MPI_BOTTOM,1,dtype,...)== call MPI_SEND(...) ! with buf as a displacement in ~~type~~ ==dtype== ! ~~i.e.~~ ==i.e.,== val_old is sent ! ! buf=val_new is moved to here ! and detected as dead code ! and therefore removed ! buf = val_overwrite buf = val_overwrite

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#MPI_BOTTOM and Combining Independent Variables in Datatypes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#MPI_BOTTOM and Combining Independent Variables in Datatypes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#`MPI_BOTTOM` and Combining Independent Variables in Datatypes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#`MPI_BOTTOM` and Combining Independent Variables in Datatypes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#`MPI_BOTTOM` and Combining Independent Variables in Datatypes]]
