---
title: "Allowing User Functions at Process Termination"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/inquiry]
---

# Allowing User Functions at Process Termination

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Allowing User Functions at Process Termination|MPI-2.1]], [[versions/v22/sections/inquiry#Allowing User Functions at Process Termination|MPI-2.2]], [[versions/v30/sections/inquiry#Allowing User Functions at Process Termination|MPI-3.0]], [[versions/v31/sections/inquiry#Allowing User Functions at Process Termination|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

There are times in which it would be convenient to have actions happen when an MPI process finishes. For example, a routine may do initializations that are useful until the MPI job (or that part of the job that being terminated in the case of dynamically created processes) is finished. This can be accomplished in MPI by attaching an attribute to ~~MPI_COMM_SELF~~ ==`MPI_COMM_SELF`== with a callback function. When [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] is called, it will first execute the equivalent of an [[versions/v22/API/MPI_COMM_FREE|MPI_COMM_FREE]] on ~~MPI_COMM_SELF.~~ ==`MPI_COMM_SELF`.== This will cause the delete callback function to be executed on all keys

associated with ~~MPI_COMM_SELF,~~ ==`MPI_COMM_SELF`,== in ~~an arbitrary order.~~ ==the reverse order that they were set on `MPI_COMM_SELF`.== If no key has been

attached to ~~MPI_COMM_SELF,~~ ==`MPI_COMM_SELF`,== then no callback is invoked. The “freeing” of ~~MPI_COMM_SELF~~ ==`MPI_COMM_SELF`== occurs before any other parts of MPI are affected. Thus, for example, calling [[versions/v22/API/MPI_FINALIZED|MPI_FINALIZED]] will return `false` in any of these callback functions. Once done with ~~MPI_COMM_SELF,~~ ==`MPI_COMM_SELF`,== the order and rest of the actions taken by [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]]

> Since attributes can be added from any supported language, the MPI implementation needs to remember the creating language so the correct callback is made. ==> > Implementations that use the attribute delete callback on `MPI_COMM_SELF` internally should register their internal callbacks before returning from [[versions/v22/API/MPI_INIT|MPI_INIT]] / [[versions/v22/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , so that libraries or applications will not have portions of the MPI implementation shut down before the application-level callbacks are made.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~There are times in which it would be convenient to have actions happen when an MPI process finishes. For example, a routine may do initializations that are useful until the MPI job (or that part of the job that being terminated in the case of dynamically created processes) is finished. This can be accomplished in MPI by attaching an attribute to `MPI_COMM_SELF` with a callback function. When [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] is called, it will first execute the equivalent of an [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] on `MPI_COMM_SELF`. This will cause the delete callback function to be executed on all keys~~

~~associated with `MPI_COMM_SELF`, in the reverse order that they were set on `MPI_COMM_SELF`. If no key has been~~

~~attached to `MPI_COMM_SELF`, then no callback is invoked. The “freeing” of `MPI_COMM_SELF` occurs before any other parts of MPI are affected. Thus, for example, calling [[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] will return `false` in any of these callback functions. Once done with `MPI_COMM_SELF`, the order and rest of the actions taken by [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]]~~

==There are times in which it would be convenient to have actions happen when an MPI process finishes. For example, a routine may do initializations that are useful until the MPI job (or that part of the job that being terminated in the case of dynamically created processes) is finished. This can be accomplished in MPI by attaching an attribute to `MPI_COMM_SELF` with a callback function. When [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] is called, it will first execute the equivalent of an [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] on `MPI_COMM_SELF`. This will cause the delete callback function to be executed on all keys associated with `MPI_COMM_SELF`, in the reverse order that they were set on `MPI_COMM_SELF`. If no key has been attached to `MPI_COMM_SELF`, then no callback is invoked. The “freeing” of `MPI_COMM_SELF` occurs before any other parts of MPI are affected. Thus, for example, calling [[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] will return `false` in any of these callback functions. Once done with `MPI_COMM_SELF`, the order and rest of the actions taken by [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]]==

> Since attributes can be added from any supported language, the MPI implementation needs to remember the creating language so the correct callback is made. ~~> >~~ Implementations that use the attribute delete callback on `MPI_COMM_SELF` internally should register their internal callbacks before returning from [[versions/v30/API/MPI_INIT|MPI_INIT]] / [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , so that libraries or applications will not have portions of the MPI implementation shut down before the application-level callbacks are made.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~There are times in which it would be convenient to have actions happen when an MPI process finishes. For example, a routine may do initializations that are useful until the MPI job (or that part of the job that being terminated in the case of dynamically created processes) is finished. This can be accomplished in MPI by attaching an attribute to `MPI_COMM_SELF` with a callback function. When [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] is called, it will first execute the equivalent of an [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] on `MPI_COMM_SELF`. This will cause the delete callback function to be executed on all keys associated with `MPI_COMM_SELF`, in the reverse order that they were set on `MPI_COMM_SELF`. If no key has been attached to `MPI_COMM_SELF`, then no callback is invoked. The “freeing” of `MPI_COMM_SELF` occurs before any other parts of MPI are affected. Thus, for example, calling [[versions/v31/API/MPI_FINALIZED|MPI_FINALIZED]] will return `false` in any of these callback functions. Once done with `MPI_COMM_SELF`, the order and rest of the actions taken by [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]]~~

~~is not specified.~~

==There are times in which it would be convenient to have actions happen when an MPI process finishes. For example, a routine may do initializations that are useful until the MPI job (or that part of the job that being terminated in the case of dynamically created processes) is finished. This can be accomplished in MPI by attaching an attribute to `MPI_COMM_SELF` with a callback function. When [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] is called, it will first execute the equivalent of an [[versions/v31/API/MPI_COMM_FREE|MPI_COMM_FREE]] on `MPI_COMM_SELF`. This will cause the delete callback function to be executed on all keys associated with `MPI_COMM_SELF`, in the reverse order that they were set on `MPI_COMM_SELF`. If no key has been attached to `MPI_COMM_SELF`, then no callback is invoked. The “freeing” of `MPI_COMM_SELF` occurs before any other parts of MPI are affected. Thus, for example, calling [[versions/v31/API/MPI_FINALIZED|MPI_FINALIZED]] will return `false` in any of these callback functions. Once done with `MPI_COMM_SELF`, the order and rest of the actions taken by [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] is not specified.==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Allowing User Functions at Process Termination]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Allowing User Functions at Process Termination]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Allowing User Functions at Process Termination]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Allowing User Functions at Process Termination]]
