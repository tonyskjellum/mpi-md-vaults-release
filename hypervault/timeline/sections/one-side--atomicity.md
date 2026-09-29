---
title: "Atomicity"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Atomicity

Chapter **one-side** · in [[versions/v20/sections/one-side#Atomicity|MPI-2.0]], [[versions/v21/sections/one-side#Atomicity|MPI-2.1]], [[versions/v22/sections/one-side#Atomicity|MPI-2.2]], [[versions/v30/sections/one-side#Atomicity|MPI-3.0]], [[versions/v31/sections/one-side#Atomicity|MPI-3.1]], [[versions/v40/sections/one-side#Atomicity|MPI-4.0]], [[versions/v41/sections/one-side#Atomicity|MPI-4.1]], [[versions/v50/sections/one-side#Atomicity|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The outcome of concurrent accumulates to the same location, with the same operation and predefined datatype, is as if the accumulates where done at that location in some serial order. On the other hand, if two locations are both updated by two accumulate calls, then the updates may occur in reverse order at the two locations. Thus, there is no guarantee that the entire call to [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] is executed atomically. The effect of this lack of atomicity is limited: The previous correctness conditions imply that a location updated by a call to [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , cannot be accessed by load or an RMA call other than accumulate, until the [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] call has completed (at the target). Different interleavings can lead to different results only to the extent that computer arithmetics are not truly associative or commutative.~~

==The outcome of concurrent accumulate operations to the same location with the same predefined datatype is as if the accumulates were done at that location in some serial order. Additional restrictions on the operation apply; see the info key `accumulate_ops` in Section [[versions/v30/sections/one-side#Window Creation|Window Creation]] . Concurrent accumulate operations with different origin and target pairs are not ordered. Thus, there is no guarantee that the entire call to an accumulate operation is executed atomically. The effect of this lack of atomicity is limited: The previous correctness conditions imply that a location updated by a call to an accumulate operation cannot be accessed by a load or an RMA call other than accumulate until the accumulate operation has completed (at the target). Different interleavings can lead to different results only to the extent that computer arithmetics are not truly associative or commutative.==

==The outcome of accumulate operations with overlapping types of different sizes or target displacements is undefined.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The outcome of concurrent accumulate operations to the same location with the same predefined datatype is as if the accumulates were done at that location in some serial order. Additional restrictions on the operation apply; see the info key `accumulate_ops` in Section [[versions/v31/sections/one-side#Window Creation|Window Creation]] . Concurrent accumulate operations with different origin and target pairs are not ordered. Thus, there is no guarantee that the entire call to an accumulate operation is executed atomically. The effect of this lack of atomicity is limited: The previous correctness conditions imply that a location updated by a call to an accumulate operation cannot be accessed by a load or an RMA call other than accumulate until the accumulate operation has completed (at the target). Different interleavings can lead to different results only to the extent that computer arithmetics are not truly associative or commutative.~~

~~The outcome of accumulate operations with overlapping types of different sizes or target displacements is undefined.~~

==The outcome of concurrent accumulate operations to the same location with the same predefined datatype is as if the accumulates were done at that location in some serial order. Additional restrictions on the operation apply; see the info key `accumulate_ops` in Section [[versions/v31/sections/one-side#Window Creation|Window Creation]] . Concurrent accumulate operations with different origin and target pairs are not ordered. Thus, there is no guarantee that the entire call to an accumulate operation is executed atomically. The effect of this lack of atomicity is limited: The previous correctness conditions imply that a location updated by a call to an accumulate operation cannot be accessed by a load or an RMA call other than accumulate until the accumulate operation has completed (at the target). Different interleavings can lead to different results only to the extent that computer arithmetics are not truly associative or commutative. The outcome of accumulate operations with overlapping types of different sizes or target displacements is undefined.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The outcome of concurrent accumulate operations to the same location with the same predefined datatype is as if the ~~accumulates~~ ==accumulate operations== were done at that location in some serial order. Additional restrictions on the operation apply; see the info key `accumulate_ops` in Section [[versions/v41/sections/one-side#Window Creation|Window Creation]] . Concurrent accumulate operations with different origin and target pairs are not ordered. Thus, there is no guarantee ~~that the entire call to an accumulate operation is executed atomically.~~ ==of atomicity beyond element-wise atomicity.== The effect of this lack of atomicity is limited: The previous correctness conditions imply that a location updated by a ~~call to~~ an accumulate operation cannot be accessed by a load ==access== or an RMA ~~call~~ ==operation== other than ==another== accumulate ==operation== until the accumulate operation has completed (at the target). Different interleavings can lead to different results only to the extent that computer arithmetics are not truly associative or commutative. The outcome of accumulate operations with overlapping types of different sizes or target displacements is undefined.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The outcome of concurrent accumulate operations to the same location with the same predefined datatype is as if the accumulate operations were done at that location in some serial order. Additional restrictions on the operation apply; see the info key `accumulate_ops` in Section [[versions/v50/sections/one-side#Window Creation|Window Creation]] . Concurrent accumulate operations with different origin and target pairs are not ordered. Thus, there is no guarantee of atomicity beyond element-wise atomicity. The effect of this lack of atomicity is limited: The previous correctness conditions imply that a location updated by ~~a~~ an accumulate operation cannot be accessed by a load access or an RMA operation other than another accumulate operation until the accumulate operation has completed (at the target). Different interleavings can lead to different results only to the extent that computer arithmetics are not truly associative or commutative. The outcome of accumulate operations with overlapping types of different sizes or target displacements is undefined.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Atomicity]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Atomicity]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Atomicity]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Atomicity]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Atomicity]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Atomicity]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Atomicity]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Atomicity]]
