---
title: "Inter-Communication"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Inter-Communication

Chapter **context** · in [[versions/v13/sections/context#Inter-Communication|MPI-1.3]], [[versions/v21/sections/context#Inter-Communication|MPI-2.1]], [[versions/v22/sections/context#Inter-Communication|MPI-2.2]], [[versions/v30/sections/context#Inter-Communication|MPI-3.0]], [[versions/v31/sections/context#Inter-Communication|MPI-3.1]], [[versions/v40/sections/context#Inter-Communication|MPI-4.0]], [[versions/v41/sections/context#Inter-Communication|MPI-4.1]], [[versions/v50/sections/context#Inter-Communication|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

~~All point-to-point communication described thus far has involved communication between processes that are members of the same group. This type of communication is called “int­ra-com­mun­i­cat­ion” and the communicator used is called an “intra-communicator,” as we have noted earlier in the chapter.~~

==All communication described thus far has involved==

==communication between processes that are members of the same group. This type of communication is called “int­ra-com­mun­i­cat­ion” and the communicator used is called an “intra-communicator,” as we have noted earlier in the chapter.==

~~- The syntax of point-to-point communication is the same for both inter- and int­ra-com­mun­i­cat­ion. The same communicator can be used both for send and for receive operations.~~

==- The syntax of point-to-point==

==  and collective==

==  communication is the same for both inter- and int­ra-com­mun­i­cat­ion. The same communicator can be used both for send and for receive operations.==

~~- An inter-communicator cannot be used for collective communication.~~

> For the purpose of point-to-point communication, communicators can be represented in each process by a tuple consisting of: > > group > > send_context > > receive_context > > source > > For inter-communicators, **group** describes the remote group, and **source** is the rank of the process in the local group. For intra-communicators, **group** is the communicator group (remote=local), **source** is the rank of the process in this group, and **send context** and **receive context** are identical. A group ~~is~~ ==> > can be > >== represented by a rank-to-absolute-address translation table. > > The inter-communicator cannot be discussed sensibly without considering processes in both the local and remote groups. Imagine a process **P** in group $`\cal P`$, which has an inter-communicator $`\textbf{C}_{\cal P}`$, and a process **Q** in group $`\cal Q`$, which has an inter-communicator $`\textbf{C}_{\cal Q}`$. Then > > - $`\textbf{C}_{\cal P}`$.group describes the group $`\cal Q`$ and $`\textbf{C}_{\cal Q}`$.group describes the group $`\cal P`$. > > - $`\textbf{C}_{\cal P}`$.send_context = $`C_{\cal Q}`$.receive_context and the context is unique in $`\cal Q`$;\ > $`\textbf{C}_{\cal P}`$.receive_context = $`\textbf{C}_{\cal Q}`$.send_context and this context is unique in $`\cal P`$. > > - $`\textbf{C}_{\cal P}`$.source is rank of **P** in $`\cal P`$ and $`\textbf{C}_{\cal Q}`$.source is rank of **Q** in $`\cal Q`$. > > Assume that **P** sends a message to **Q** using the inter-communicator. Then **P** uses the **group** table to find the absolute address of **Q**; **source** and **send_context** are appended to the message. > > Assume that **Q** posts a receive with an explicit source argument using the inter-communicator. Then **Q** matches **receive_context** to the message context and source argument to the message source. > > The same algorithm is appropriate for intra-communicators as well. > > In order to support inter-communicator accessors and constructors, it is necessary to supplement this model with additional structures, that store information about the local communication group, and additional safe contexts.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The routine `MPI_COMM_TEST_INTER` may be used to determine if a communicator is an inter- or intra-communicator. Inter-communicators can be used as arguments to some of the other communicator access routines. Inter-communicators cannot be used as input to some of the constructor routines for intra-communicators (for instance, ~~[[versions/v22/API/MPI_COMM_CREATE|MPI_COMM_CREATE]]~~ ==[[versions/v22/API/MPI_CART_CREATE|MPI_CART_CREATE]]== ).

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~All communication described thus far has involved~~

~~communication between processes that are members of the same group. This type of communication is called “int­ra-com­mun­i­cat­ion” and the communicator used is called an “intra-communicator,” as we have noted earlier in the chapter.~~

==All communication described thus far has involved communication between processes that are members of the same group. This type of communication is called “int­ra-com­mun­i­cat­ion” and the communicator used is called an “intra-communicator,” as we have noted earlier in the chapter.==

All inter-communicator constructors are blocking ==except for [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]]== and require that the local and remote groups be disjoint.

~~- The syntax of point-to-point~~

~~  and collective~~

~~  communication is the same for both inter- and int­ra-com­mun­i­cat­ion. The same communicator can be used both for send and for receive operations.~~

==- The syntax of point-to-point and collective communication is the same for both inter- and int­ra-com­mun­i­cat­ion. The same communicator can be used both for send and for receive operations.==

> For the purpose of point-to-point communication, communicators can be represented in each process by a tuple consisting of: > > group > > send_context > > receive_context > > source > > For inter-communicators, **group** describes the remote group, and **source** is the rank of the process in the local group. For intra-communicators, **group** is the communicator group (remote=local), **source** is the rank of the process in this group, and **send context** and **receive context** are identical. A group > > can be ~~> >~~ represented by a rank-to-absolute-address translation table. > > The inter-communicator cannot be discussed sensibly without considering processes in both the local and remote groups. Imagine a process **P** in group $`\cal P`$, which has an inter-communicator $`\textbf{C}_{\cal P}`$, and a process **Q** in group $`\cal Q`$, which has an inter-communicator $`\textbf{C}_{\cal Q}`$. Then > > - $`\textbf{C}_{\cal P}`$.group describes the group $`\cal Q`$ and $`\textbf{C}_{\cal Q}`$.group describes the group $`\cal P`$. > > - $`\textbf{C}_{\cal P}`$.send_context = ~~$`C_{\cal~~ ==$`\textbf{C}_{\cal== Q}`$.receive_context and the context is unique in $`\cal Q`$;\ > $`\textbf{C}_{\cal P}`$.receive_context = $`\textbf{C}_{\cal Q}`$.send_context and this context is unique in $`\cal P`$. > > - $`\textbf{C}_{\cal P}`$.source is rank of **P** in $`\cal P`$ and $`\textbf{C}_{\cal Q}`$.source is rank of **Q** in $`\cal Q`$. > > Assume that **P** sends a message to **Q** using the inter-communicator. Then **P** uses the **group** table to find the absolute address of **Q**; **source** and **send_context** are appended to the message. > > Assume that **Q** posts a receive with an explicit source argument using the inter-communicator. Then **Q** matches **receive_context** to the message context and source argument to the message source. > > The same algorithm is appropriate for intra-communicators as well. > > In order to support inter-communicator accessors and constructors, it is necessary to supplement this model with additional structures, that store information about the local communication group, and additional safe contexts.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

All communication described thus far has involved communication between processes that are members of the same group. This type of communication is called ~~“int­ra-com­mun­i­cat­ion”~~ ==“**int­ra-com­mun­i­cat­ion**”== and the communicator used is called an ~~“intra-communicator,”~~ ==“**intra-communicator**,”== as we have noted earlier in the chapter.

In modular and multi-disciplinary applications, different process groups execute distinct modules and processes within different modules communicate with one another in a pipeline or a more general module graph. In these applications, the most natural way for a process to specify a target process is by the rank of the target process within the target group. In applications that contain internal user-level servers, each server may be a process group that provides services to one or more clients, and each client may be a process group that uses the services of one or more servers. It is again most natural to specify the target process by rank within the target group in these applications. This type of communication is called ~~“int­er-com­mun­i­cat­ion”~~ ==“**int­er-com­mun­i­cat­ion**”== and the communicator used is called an ~~“inter-communicator,”~~ ==“**inter-communicator**,”== as introduced earlier.

An ~~int­er-com­mun­i­cat­ion~~ ==**inter-communication**== is a point-to-point communication between processes in different groups. The group containing a process that initiates an int­er-com­mun­i­cat­ion operation is called the “local group,” that is, the sender in a send and the receiver in a receive. The group containing the target process is called the “remote group,” that is, the receiver in a send and the sender in a receive. As in int­ra-com­mun­i­cat­ion, the target process is specified using a `(communicator, rank)` pair. Unlike int­ra-com­mun­i­cat­ion, the rank is relative to a second, remote group.

The routine ~~`MPI_COMM_TEST_INTER`~~ ==[[versions/v31/API/MPI_COMM_TEST_INTER|MPI_COMM_TEST_INTER]]== may be used to determine if a communicator is an inter- or intra-communicator. Inter-communicators can be used as arguments to some of the other communicator access routines. Inter-communicators cannot be used as input to some of the constructor routines for intra-communicators (for instance, [[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] ).

> For the purpose of point-to-point communication, communicators can be represented in each process by a tuple consisting of: > > group > > send_context > > receive_context > > source > > For inter-communicators, ~~**group**~~ ==*group*== describes the remote group, and ~~**source**~~ ==*source*== is the rank of the process in the local group. For intra-communicators, ~~**group**~~ ==*group*== is the communicator group (remote=local), ~~**source**~~ ==*source*== is the rank of the process in this group, and ~~**send context**~~ ==*send context*== and ~~**receive context**~~ ==*receive context*== are identical. A group ~~> >~~ can be represented by a rank-to-absolute-address translation table. > > The inter-communicator cannot be discussed sensibly without considering processes in both the local and remote groups. Imagine a process **P** in group $`\cal P`$, which has an inter-communicator ~~$`\textbf{C}_{\cal P}`$,~~ ==**$`\textbf{C}_{\cal P}`$**,== and a process **Q** in group $`\cal Q`$, which has an inter-communicator ~~$`\textbf{C}_{\cal Q}`$.~~ ==**$`\textbf{C}_{\cal Q}`$**.== Then > > - ~~$`\textbf{C}_{\cal P}`$.group~~ ==**$`\textbf{C}_{\cal P}`$.group**== describes the group $`\cal Q`$ and ~~$`\textbf{C}_{\cal Q}`$.group~~ ==**$`\textbf{C}_{\cal Q}`$.group**== describes the group $`\cal P`$. > > - ~~$`\textbf{C}_{\cal~~ ==**$`\textbf{C}_{\cal== P}`$.send_context = $`\textbf{C}_{\cal ~~Q}`$.receive_context~~ ==Q}`$.receive_context**== and the context is unique in $`\cal Q`$;\ > ~~$`\textbf{C}_{\cal~~ ==**$`\textbf{C}_{\cal== P}`$.receive_context = $`\textbf{C}_{\cal ~~Q}`$.send_context~~ ==Q}`$.send_context**== and this context is unique in $`\cal P`$. > > - ~~$`\textbf{C}_{\cal P}`$.source~~ ==**$`\textbf{C}_{\cal P}`$.source**== is rank of **P** in $`\cal P`$ and ~~$`\textbf{C}_{\cal Q}`$.source~~ ==**$`\textbf{C}_{\cal Q}`$.source**== is rank of **Q** in $`\cal Q`$. > > Assume that **P** sends a message to **Q** using the inter-communicator. Then **P** uses the **group** table to find the absolute address of **Q**; **source** and **send_context** are appended to the message. > > Assume that **Q** posts a receive with an explicit source argument using the inter-communicator. Then **Q** matches **receive_context** to the message context and source argument to the message source. > > The same algorithm is appropriate for intra-communicators as well. > > In order to support inter-communicator accessors and constructors, it is necessary to supplement this model with additional structures, that store information about the local communication group, and additional safe contexts.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

This section introduces the concept of ~~int­er-com­mun­i­cat­ion~~ ==inter-/communication== and describes the portions of MPI that support it. It describes support for writing programs that contain user-level servers.

All communication described thus far has involved communication between processes that are members of the same group. This type of communication is called ~~“**int­ra-com­mun­i­cat­ion**”~~ ==“**intra-/communication**”== and the communicator used is called an “**intra-communicator**,” as we have noted earlier in the chapter.

In modular and multi-disciplinary applications, different process groups execute distinct modules and processes within different modules communicate with one another in a pipeline or a more general module graph. In these applications, the most natural way for a process to specify a target process is by the rank of the target process within the target group. In applications that contain internal user-level servers, each server may be a process group that provides services to one or more clients, and each client may be a process group that uses the services of one or more servers. It is again most natural to specify the target process by rank within the target group in these applications. This type of communication is called ~~“**int­er-com­mun­i­cat­ion**”~~ ==“**inter-/communication**”== and the communicator used is called an “**inter-communicator**,” as introduced earlier.

An **inter-communication** is a point-to-point communication between processes in different groups. The group containing a process that initiates an ~~int­er-com­mun­i­cat­ion~~ ==inter-/communication== operation is called the “local group,” that is, the sender in a send and the receiver in a receive. The group containing the target process is called the “remote group,” that is, the receiver in a send and the sender in a receive. As in ~~int­ra-com­mun­i­cat­ion,~~ ==intra-/communication,== the target process is specified using a ~~`(communicator, rank)`~~ ==(`communicator`, `rank`)== pair. Unlike ~~int­ra-com­mun­i­cat­ion,~~ ==intra-/communication,== the rank is relative to a second, remote group.

> The groups must be disjoint for several reasons. Primarily, this is the intent of the ~~intercommunicators — to~~ ==inter-communicators—to== provide a communicator for communication between disjoint groups. This is reflected in the definition of [[versions/v40/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] , which allows the user to control the ranking of the processes in the created ~~intracommunicator;~~ ==intra-communicator;== this ranking makes little sense if the groups are not disjoint. In addition, the natural extension of collective operations to ~~intercommunicators~~ ==inter-communicators== makes the most sense when the groups are disjoint.

Here is a summary of the properties of ~~int­er-com­mun­i­cat­ion~~ ==inter-/communication== and inter-communicators:

- The syntax of point-to-point and collective communication is the same for both inter- and ~~int­ra-com­mun­i­cat­ion.~~ ==intra-/communication.== The same communicator can be used both for send and for receive operations.

- A communicator will provide either intra- or ~~int­er-com­mun­i­cat­ion,~~ ==inter-/communication,== never both.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

All communication described thus far has involved communication between ==MPI== processes that are members of the same group. This type of communication is called “**intra-/communication**” and the communicator used is called an “**intra-communicator**,” as we have noted earlier in the chapter.

In modular and multi-disciplinary applications, different ==MPI== process groups execute distinct modules and ==MPI== processes within different modules communicate with one another in a pipeline or a more general module graph. In these applications, the most natural way for a ==MPI== process to specify a target ==MPI== process is by the rank of the target ==MPI== process within the target group. In applications that contain internal user-level servers, each server may be a ==MPI== process group that provides services to one or more clients, and each client may be a ==MPI== process group that uses the services of one or more servers. It is again most natural to specify the target ==MPI== process by rank within the target group in these applications. This type of communication is called “**inter-/communication**” and the communicator used is called an “**inter-communicator**,” as introduced earlier.

An **inter-communication** is a point-to-point communication between ==MPI== processes in different groups. The group containing ~~a~~ ==an MPI== process that initiates an inter-/communication operation is called the “local group,” that is, the sender in a send and the receiver in a receive. The group containing the target ==MPI== process is called the “remote group,” that is, the receiver in a send and the sender in a receive. As in intra-/communication, the target ==MPI== process is specified using a (`communicator`, `rank`) pair. Unlike intra-/communication, the rank is relative to a second, remote group.

> The groups must be disjoint for several reasons. ~~Primarily, this is~~ ==First,== the intent of the ~~inter-communicators—to~~ ==inter-communicators is to== provide a communicator for communication between disjoint groups. This is reflected in the definition of [[versions/v41/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] , which allows the user to control the ranking of the ==MPI== processes in the created intra-communicator; this ranking makes little sense if the groups are not disjoint. In addition, the natural extension of collective operations to inter-communicators makes the most sense when the groups are disjoint.

- A target ==MPI== process is addressed by its rank in the remote group, both for sends and for receives.

> For the purpose of point-to-point communication, communicators can be represented in each process by a tuple consisting of: > > ~~group~~ ==**group**\== > ==**send_context**\== > ~~send_context~~ ==**receive_context**\== > ~~> receive_context > > source~~ ==**source**== > > For inter-communicators, *group* describes the remote group, and *source* is the rank of the ==MPI== process in the local group. For intra-communicators, *group* is the communicator group (remote=local), *source* is the rank of the ==MPI== process in this group, and *send context* and *receive context* are identical. A group can be represented by a rank-to-absolute-address translation table. > > The inter-communicator cannot be discussed sensibly without considering ==MPI== processes in both the local and remote groups. Imagine ~~a~~ ==an MPI== process **P** in group $`\cal P`$, which has an inter-communicator **$`\textbf{C}_{\cal P}`$**, and ~~a~~ ==an MPI== process **Q** in group $`\cal Q`$, which has an inter-communicator **$`\textbf{C}_{\cal Q}`$**. Then > > - **$`\textbf{C}_{\cal P}`$.group** describes the group $`\cal Q`$ and **$`\textbf{C}_{\cal Q}`$.group** describes the group $`\cal P`$. > > - **$`\textbf{C}_{\cal P}`$.send_context = $`\textbf{C}_{\cal Q}`$.receive_context** and the context is unique in $`\cal Q`$;\ > **$`\textbf{C}_{\cal P}`$.receive_context = $`\textbf{C}_{\cal Q}`$.send_context** and this context is unique in $`\cal P`$. > > - **$`\textbf{C}_{\cal P}`$.source** is rank of **P** in $`\cal P`$ and **$`\textbf{C}_{\cal Q}`$.source** is rank of **Q** in $`\cal Q`$. > > Assume that **P** sends a message to **Q** using the inter-communicator. Then **P** uses the **group** table to find the absolute address of **Q**; **source** and **send_context** are appended to the message. > > Assume that **Q** posts a receive with an explicit source argument using the inter-communicator. Then **Q** matches **receive_context** to the message context and source argument to the message source. > > The same algorithm is appropriate for intra-communicators as well. > > In order to support inter-communicator accessors and constructors, it is necessary to supplement this model with additional structures, that store information about the local communication group, and additional safe contexts.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

In modular and multi-disciplinary applications, different MPI process groups execute distinct modules and MPI processes within different modules communicate with one another in a pipeline or a more general module graph. In these applications, the most natural way for ~~a~~ ==an== MPI process to specify a target MPI process is by the rank of the target MPI process within the target group. In applications that contain internal user-level servers, each server may be ~~a~~ ==an== MPI process group that provides services to one or more clients, and each client may be ~~a~~ ==an== MPI process group that uses the services of one or more servers. It is again most natural to specify the target MPI process by rank within the target group in these applications. This type of communication is called “**inter-/communication**” and the communicator used is called an “**inter-communicator**,” as introduced earlier.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Inter-Communication]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Inter-Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Inter-Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Inter-Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Inter-Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Inter-Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Inter-Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Inter-Communication]]
