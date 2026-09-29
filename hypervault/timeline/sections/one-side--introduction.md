---
title: "Introduction"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Introduction

Chapter **one-side** · in [[versions/v20/sections/one-side#Introduction|MPI-2.0]], [[versions/v21/sections/one-side#Introduction|MPI-2.1]], [[versions/v22/sections/one-side#Introduction|MPI-2.2]], [[versions/v30/sections/one-side#Introduction|MPI-3.0]], [[versions/v31/sections/one-side#Introduction|MPI-3.1]], [[versions/v40/sections/one-side#Introduction|MPI-4.0]], [[versions/v41/sections/one-side#Introduction|MPI-4.1]], [[versions/v50/sections/one-side#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

The design of the RMA functions allows implementors to take advantage, in many cases, of fast communication mechanisms provided by various platforms, such as coherent or noncoherent shared memory, DMA engines, hardware-supported put/get operations, communication coprocessors, etc. The most frequently used RMA communication mechanisms can be layered on top of ~~message passing.~~ ==message-passing.== However, support for asynchronous communication agents (handlers, threads, etc.) is needed, for certain RMA functions, in a distributed memory environment.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Remote Memory Access (RMA) extends the communication mechanisms of MPI by allowing one process to specify all communication parameters, both for the sending side and for the receiving side. This mode of communication facilitates the coding of some applications with dynamically changing data access patterns where the data distribution is fixed or slowly changing.~~

~~In such a case, each process can compute what data it needs to access or update at other processes. However, processes may not know which data in their own memory need to be accessed or updated by remote processes, and may not even know the identity of these processes. Thus, the transfer parameters are all available only on one side. Regular send/receive communication requires matching operations by sender and receiver.~~

~~In order to issue the matching operations, an application needs to distribute the transfer parameters. This may require all processes to participate in a time consuming global computation, or to periodically poll for potential communication requests to receive and act upon. The use of RMA communication mechanisms avoids the need for global computations or explicit polling. A generic example of this nature is the execution of an assignment of the form `A = B(map)`, where `map` is a permutation vector, and `A, B` and `map` are distributed in the same manner.~~

~~Message-passing communication achieves two effects: *communication* of data from sender to receiver; and *synchronization* of sender with receiver. The RMA design separates these two functions. Three communication calls are provided: [[versions/v30/API/MPI_PUT|MPI_PUT]] (remote write), [[versions/v30/API/MPI_GET|MPI_GET]] (remote read) and [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] (remote update). A larger number of synchronization calls are provided that support different synchronization styles. The design is similar to that of weakly coherent memory systems: correct ordering of memory accesses has to be imposed by the user, using synchronization calls; the implementation can delay communication operations until the synchronization calls occur, for efficiency.~~

~~The design of the RMA functions allows implementors to take advantage, in many cases, of fast communication mechanisms provided by various platforms, such as coherent or noncoherent shared memory, DMA engines, hardware-supported put/get operations, communication coprocessors, etc. The most frequently used RMA communication mechanisms can be layered on top of message-passing. However, support for asynchronous communication agents (handlers, threads, etc.) is needed, for certain RMA functions, in a distributed memory environment.~~

==Remote Memory Access (RMA) extends the communication mechanisms of MPI by allowing one process to specify all communication parameters, both for the sending side and for the receiving side. This mode of communication facilitates the coding of some applications with dynamically changing data access patterns where the data distribution is fixed or slowly changing. In such a case, each process can compute what data it needs to access or to update at other processes. However, the programmer may not be able to easily determine which data in a process may need to be accessed or to be updated by operations executed by a different process, and may not even know which processes may perform such updates. Thus, the transfer parameters are all available only on one side. Regular send/receive communication requires matching operations by sender and receiver. In order to issue the matching operations, an application needs to distribute the transfer parameters. This distribution may require all processes to participate in a time-consuming global computation, or to poll for potential communication requests to receive and upon which to act periodically. The use of RMA communication mechanisms avoids the need for global computations or explicit polling. A generic example of this nature is the execution of an assignment of the form `A = B(map)`, where `map` is a permutation vector, and `A`, `B`, and `map` are distributed in the same manner.==

==Message-passing communication achieves two effects: *communication* of data from sender to receiver and *synchronization* of sender with receiver. The RMA design separates these two functions.==

==The following communication calls are provided:==

==- Remote write: [[versions/v30/API/MPI_PUT|MPI_PUT]] , [[versions/v30/API/MPI_RPUT|MPI_RPUT]]==

==- Remote read: [[versions/v30/API/MPI_GET|MPI_GET]] , [[versions/v30/API/MPI_RGET|MPI_RGET]]==

==- Remote update: [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v30/API/MPI_RACCUMULATE|MPI_RACCUMULATE]]==

==- Remote read and update: [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , [[versions/v30/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] , and [[versions/v30/API/MPI_FETCH_AND_OP|MPI_FETCH_AND_OP]]==

==- Remote atomic swap operations: [[versions/v30/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]]==

==This chapter refers to an operations set that includes all remote update, remote read and update, and remote atomic swap operations as “accumulate” operations.==

==MPI supports two fundamentally different memory models: separate and unified. The separate model makes no assumption about memory consistency and is highly portable. This model is similar to that of weakly coherent memory systems: the user must impose correct ordering of memory accesses through synchronization calls. The unified model can exploit cache-coherent hardware and hardware-accelerated, one-sided operations that are commonly available in high-performance systems.==

==The two different models are discussed in detail in Section [[versions/v30/sections/one-side#Memory Model|Memory Model]] .==

==Both models support several synchronization calls to support different synchronization styles.==

==The design of the RMA functions allows implementors to take advantage of fast or asynchronous communication mechanisms provided by various platforms, such as coherent or noncoherent shared memory, DMA engines, hardware-supported put/get operations, and communication coprocessors. The most frequently used RMA communication mechanisms can be layered on top of message-passing. However, certain RMA functions might need support for asynchronous communication agents in software (handlers, threads, etc.) in a distributed memory environment.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~Remote Memory Access (RMA) extends the communication mechanisms of MPI by allowing one process to specify all communication parameters, both for the sending side and for the receiving side. This mode of communication facilitates the coding of some applications with dynamically changing data access patterns where the data distribution is fixed or slowly changing. In such a case, each process can compute what data it needs to access or to update at other processes. However, the programmer may not be able to easily determine which data in a process may need to be accessed or to be updated by operations executed by a different process, and may not even know which processes may perform such updates. Thus, the transfer parameters are all available only on one side. Regular send/receive communication requires matching operations by sender and receiver. In order to issue the matching operations, an application needs to distribute the transfer parameters. This distribution may require all processes to participate in a time-consuming global computation, or to poll for potential communication requests to receive and upon which to act periodically. The use of RMA communication mechanisms avoids the need for global computations or explicit polling. A generic example of this nature is the execution of an assignment of the form `A = B(map)`, where `map` is a permutation vector, and `A`, `B`, and `map` are distributed in the same manner.~~

~~Message-passing communication achieves two effects: *communication* of data from sender to receiver and *synchronization* of sender with receiver. The RMA design separates these two functions.~~

~~The following communication calls are provided:~~

==**Remote Memory Access** **(RMA)** extends the communication mechanisms of MPI by allowing one process to specify all communication parameters, both for the sending side and for the receiving side. This mode of communication facilitates the coding of some applications with dynamically changing data access patterns where the data distribution is fixed or slowly changing. In such a case, each process can compute what data it needs to access or to update at other processes. However, the programmer may not be able to easily determine which data in a process may need to be accessed or to be updated by operations executed by a different process, and may not even know which processes may perform such updates. Thus, the transfer parameters are all available only on one side. Regular send/receive communication requires matching operations by sender and receiver. In order to issue the matching operations, an application needs to distribute the transfer parameters. This distribution may require all processes to participate in a time-consuming global computation, or to poll for potential communication requests to receive and upon which to act periodically. The use of RMA communication mechanisms avoids the need for global computations or explicit polling. A generic example of this nature is the execution of an assignment of the form `A = B(map)`, where `map` is a permutation vector, and `A`, `B`, and `map` are distributed in the same manner.==

==Message-passing communication achieves two effects: *communication* of data from sender to receiver and *synchronization* of sender with receiver. The RMA design separates these two functions. The following communication calls are provided:==

~~MPI supports two fundamentally different memory models: separate and unified. The separate model makes no assumption about memory consistency and is highly portable. This model is similar to that of weakly coherent memory systems: the user must impose correct ordering of memory accesses through synchronization calls. The unified model can exploit cache-coherent hardware and hardware-accelerated, one-sided operations that are commonly available in high-performance systems.~~

~~The two different models are discussed in detail in Section [[versions/v31/sections/one-side#Memory Model|Memory Model]] .~~

~~Both models support several synchronization calls to support different synchronization styles.~~

==MPI supports two fundamentally different *memory models*: *separate* and *unified*. The separate model makes no assumption about memory consistency and is highly portable. This model is similar to that of weakly coherent memory systems: the user must impose correct ordering of memory accesses through synchronization calls. The unified model can exploit cache-coherent hardware and hardware-accelerated, one-sided operations that are commonly available in high-performance systems. The two different models are discussed in detail in Section [[versions/v31/sections/one-side#Memory Model|Memory Model]] . Both models support several synchronization calls to support different synchronization styles.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~We shall denote by **origin** the process that performs the call, and by **target** the process in which the memory is accessed. Thus, in a put operation, source=origin and destination=target; in a get operation, source=target and destination=origin.~~

==We shall denote by **origin** the process that performs the call, and by **target** the process in which the memory is accessed. Thus, in a put operation, `source = origin` and `destination = target`; in a get operation, `source = target` and `destination = origin`.==

==The use of terms such as nonblocking and local in this chapter follow the usage in MPI-3.1, and this chapter has not been updated to follow the definitions in Section [[terms-semantic]] . The MPI Forum intends to update this chapter in a subsequent version of the MPI standard to follow the definitions in Section [[terms-semantic]] .==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

**Remote Memory Access** **(RMA)** extends the communication mechanisms of MPI by allowing one ==MPI== process to specify all communication parameters, both for the sending side and for the receiving side. This mode of communication facilitates the coding of some applications with dynamically changing data access patterns where the data distribution is fixed or slowly changing. In such a case, each ==MPI== process can compute what data it needs to access or to update at other ==MPI== processes. However, the programmer may not be able to easily determine which data in ~~a~~ ==an MPI== process may need to be accessed or to be updated by operations ~~executed~~ ==initiated== by a different ==MPI== process, and may not even know which ==MPI== processes may perform such updates. Thus, the transfer parameters are all available only on one side. Regular send/receive communication requires matching operations by sender and receiver. In order to issue the matching operations, an application needs to distribute the transfer parameters. This distribution may require all ==MPI== processes to participate in a time-consuming global computation, or to poll for potential communication requests to receive and upon which to act periodically. The use of RMA communication ~~mechanisms~~ ==operations== avoids the need for global computations or explicit polling. A generic example of this nature is the execution of an assignment of the form `A = B(map)`, where `map` is a permutation vector, and `A`, `B`, and `map` are distributed in the same manner.

- Remote atomic ~~swap operations:~~ ==swap:== [[versions/v41/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]]

~~We shall denote by **origin** the process that performs the call, and by **target** the process in which the memory is accessed. Thus, in a put operation, `source = origin` and `destination = target`; in a get operation, `source = target` and `destination = origin`.~~

~~The use of terms such as nonblocking and local in this chapter follow the usage in MPI-3.1, and this chapter has not been updated to follow the definitions in Section [[terms-semantic]] . The MPI Forum intends to update this chapter in a subsequent version of the MPI standard to follow the definitions in Section [[terms-semantic]] .~~

==We shall denote by **origin** or *origin process* the MPI process that calls an RMA procedure, and by **target** or *target process* the MPI process whose memory is accessed. Thus, in a put operation, `source = origin` and `destination = target`; in a get operation, `source = target` and `destination = origin`.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Introduction]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Introduction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Introduction]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Introduction]]
