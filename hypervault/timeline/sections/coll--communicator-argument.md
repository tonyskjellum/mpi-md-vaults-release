---
title: "Communicator Argument"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Communicator Argument

Chapter **coll** · in [[versions/v13/sections/coll#Communicator argument|MPI-1.3]], [[versions/v21/sections/coll#Communicator Argument|MPI-2.1]], [[versions/v22/sections/coll#Communicator Argument|MPI-2.2]], [[versions/v30/sections/coll#Communicator Argument|MPI-3.0]], [[versions/v31/sections/coll#Communicator Argument|MPI-3.1]], [[versions/v40/sections/coll#Communicator Argument|MPI-4.0]], [[versions/v41/sections/coll#Communicator Argument|MPI-4.1]], [[versions/v50/sections/coll#Communicator Argument|MPI-5.0]]

Heading by release: MPI-1.3: “Communicator argument”; MPI-2.1: “Communicator Argument”; MPI-2.2: “Communicator Argument”; MPI-3.0: “Communicator Argument”; MPI-3.1: “Communicator Argument”; MPI-4.0: “Communicator Argument”; MPI-4.1: “Communicator Argument”; MPI-5.0: “Communicator Argument”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~The key concept of the collective functions is to have a “group” of participating processes. The routines do not have a group identifier as an explicit argument. Instead, there is a communicator argument. For the purposes of this chapter, a communicator can be thought of as a group identifier linked with a context. An inter-communicator, that is, a communicator that spans two groups, is *not* allowed as an argument to a collective function.~~

==The key concept of the collective functions is to have a==

==group or groups==

==of participating processes.==

==The routines do not have group identifiers as explicit arguments.==

==Instead, there is a communicator argument.==

==Groups and communicators are discussed in full detail in Chapter [[versions/v21/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: *intra-communicators* and *inter-communicators*. An intracommunicator can be thought of as an indentifier for a single group of processes linked with a context. An intercommunicator identifies two distinct groups of processes linked with a context.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~group or groups~~

~~of participating processes.~~

~~The routines do not have group identifiers as explicit arguments.~~

~~Instead, there is a communicator argument.~~

~~Groups and communicators are discussed in full detail in Chapter [[versions/v30/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: *intra-communicators* and *inter-communicators*. An intracommunicator can be thought of as an indentifier for a single group of processes linked with a context. An intercommunicator identifies two distinct groups of processes linked with a context.~~

==group or groups of participating processes.==

==The routines do not have group identifiers as explicit arguments. Instead, there is a communicator argument.==

==Groups and communicators are discussed in full detail in Chapter [[versions/v30/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: *intra-communicators* and *inter-communicators*. An intracommunicator can be thought of as an identifier for a single group of processes linked with a context. An intercommunicator identifies two distinct groups of processes linked with a context.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The key concept of the collective functions is to have a~~

~~group or groups of participating processes.~~

~~The routines do not have group identifiers as explicit arguments. Instead, there is a communicator argument.~~

~~Groups and communicators are discussed in full detail in Chapter [[versions/v31/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: *intra-communicators* and *inter-communicators*. An intracommunicator can be thought of as an identifier for a single group of processes linked with a context. An intercommunicator identifies two distinct groups of processes linked with a context.~~

==The key concept of the collective functions is to have a group or groups of participating processes. The routines do not have group identifiers as explicit arguments. Instead, there is a communicator argument. Groups and communicators are discussed in full detail in Chapter [[versions/v31/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: *intra-communicators* and *inter-communicators*. An intracommunicator can be thought of as an identifier for a single group of processes linked with a context. An intercommunicator identifies two distinct groups of processes linked with a context.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The key concept of the collective functions is to have a group or groups of participating processes. The routines do not have group identifiers as explicit arguments. Instead, there is a communicator argument. Groups and communicators are discussed in full detail in Chapter [[versions/v40/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: *intra-communicators* and *inter-communicators*. An ~~intracommunicator~~ ==intra-communicator== can be thought of as an identifier for a single group of processes linked with a context. An ~~intercommunicator~~ ==inter-communicator== identifies two distinct groups of processes linked with a context.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The key concept of the collective functions is to have a group or groups of participating ==MPI== processes. The routines do not have group identifiers as explicit arguments. Instead, there is a communicator argument. Groups and communicators are discussed in full detail in Chapter [[versions/v41/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: ~~*intra-communicators*~~ ==**intra-communicators**== and ~~*inter-communicators*.~~ ==**inter-communicators**.== An intra-communicator can be thought of as an identifier for a single group of ==MPI== processes linked with a context. An inter-communicator identifies two distinct groups of ==MPI== processes linked with a context.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Communicator argument]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Communicator Argument]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Communicator Argument]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Communicator Argument]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Communicator Argument]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Communicator Argument]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Communicator Argument]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Communicator Argument]]
