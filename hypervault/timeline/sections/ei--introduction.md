---
title: "Introduction"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/ei]
---

# Introduction

Chapter **ei** · in [[versions/v20/sections/ei#Introduction|MPI-2.0]], [[versions/v21/sections/ei#Introduction|MPI-2.1]], [[versions/v22/sections/ei#Introduction|MPI-2.2]], [[versions/v30/sections/ei#Introduction|MPI-3.0]], [[versions/v31/sections/ei#Introduction|MPI-3.1]], [[versions/v40/sections/ei#Introduction|MPI-4.0]], [[versions/v41/sections/ei#Introduction|MPI-4.1]], [[versions/v50/sections/ei#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~This chapter begins with calls used to create **generalized requests**.~~

~~The objective of this MPI-2 addition is to allow users of MPI to be able to create new nonblocking operations with an interface similar to what is present in MPI. This can be used to layer new functionality on top of MPI. Next, Section [[versions/v21/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This is needed for generalized requests.~~

~~Section [[versions/v21/sections/ei#Naming Objects|Naming Objects]] allows users to associate names with~~

~~communicators, windows, and datatypes. This will allow debuggers and profilers to identify communicators, windows, and datatypes with more useful labels. Section [[versions/v21/sections/ei#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] allows users to add error codes, classes, and strings to MPI. With users being able to layer functionality on top of MPI, it is desirable for them to use the same error mechanisms found in MPI.~~

~~Section [[versions/v21/sections/ei#Decoding a Datatype|Decoding a Datatype]] deals with decoding datatypes. The opaque datatype object has found a number of uses outside MPI. Furthermore, a number of tools wish to display internal information about a datatype. To achieve this, datatype decoding functions are provided.~~

~~The chapter continues, in Section [[versions/v21/sections/ei#MPI and Threads|MPI and Threads]] , with a discussion of how threads are to be handled in MPI-2. Although thread compliance is not required, the standard specifies how threads are to work if they are provided. Section [[versions/v21/sections/ei#New Attribute Caching Functions|New Attribute Caching Functions]] has information on caching on communicators, datatypes, and windows. Finally, Section [[versions/v21/sections/ei#Duplicating a Datatype|Duplicating a Datatype]] discusses duplicating a datatype.~~

==This chapter begins with calls used to create **generalized requests**,==

==which allow users==

==to create new nonblocking operations with an interface similar to what is present in MPI. This can be used to layer new functionality on top of MPI. Next, Section [[versions/v21/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This is needed for generalized==

==requests.==

==The chapter continues, in Section [[versions/v21/sections/ei#MPI and Threads|MPI and Threads]] , with a discussion of how threads are to be handled in==

==MPI.==

==Although thread compliance is not required, the standard specifies how threads are to work if they are provided.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~which allow users~~

~~to create new nonblocking operations with an interface similar to what is present in MPI. This can be used to layer new functionality on top of MPI. Next, Section [[versions/v30/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This is needed for generalized~~

~~requests.~~

==which allow users to create new nonblocking operations with an interface similar to what is present in MPI. These calls can be used to layer new functionality on top of MPI. Next, Section [[versions/v30/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This functionality is needed for generalized requests.==

~~MPI.~~

~~Although thread compliance is not required, the standard specifies how threads are to work if they are provided.~~

==MPI. Although thread compliance is not required, the standard specifies how threads are to work if they are provided.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~This chapter begins with calls used to create **generalized requests**,~~

~~which allow users to create new nonblocking operations with an interface similar to what is present in MPI. These calls can be used to layer new functionality on top of MPI. Next, Section [[versions/v31/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This functionality is needed for generalized requests.~~

~~The chapter continues, in Section [[versions/v31/sections/ei#MPI and Threads|MPI and Threads]] , with a discussion of how threads are to be handled in~~

~~MPI. Although thread compliance is not required, the standard specifies how threads are to work if they are provided.~~

==This chapter begins with calls used to create **generalized requests**, which allow users to create new nonblocking operations with an interface similar to what is present in MPI. These calls can be used to layer new functionality on top of MPI. Next, Section [[versions/v31/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This functionality is needed for generalized requests.==

==The chapter continues, in Section [[versions/v31/sections/ei#MPI and Threads|MPI and Threads]] , with a discussion of how threads are to be handled in MPI. Although thread compliance is not required, the standard specifies how threads are to work if they are provided.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~This chapter begins with calls used to create **generalized requests**, which allow users to create new nonblocking operations with an interface similar to what is present in MPI. These calls can be used to layer new functionality on top of MPI. Next, Section [[versions/v40/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This functionality is needed for generalized requests.~~

~~The chapter continues, in Section [[versions/v40/sections/ei#MPI and Threads|MPI and Threads]] , with a discussion of how threads are to be handled in MPI. Although thread compliance is not required, the standard specifies how threads are to work if they are provided.~~

==This chapter contains calls used to create **generalized requests**, which allow users to create new nonblocking operations with an interface similar to what is present in MPI. These calls can be used to layer new functionality on top of MPI. Section [[versions/v40/sections/ei#Associating Information with Status|Associating Information with Status]] deals with setting the information found in `status`. This functionality is needed for generalized requests.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Introduction]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Introduction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Introduction]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/ei#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/ei#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/ei#Introduction]]
