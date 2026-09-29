---
title: "Environmental Inquiries"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Environmental Inquiries

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Environmental Inquiries|MPI-1.3]], [[versions/v21/sections/inquiry#Environmental Inquiries|MPI-2.1]], [[versions/v22/sections/inquiry#Environmental Inquiries|MPI-2.2]], [[versions/v30/sections/inquiry#Environmental Inquiries|MPI-3.0]], [[versions/v31/sections/inquiry#Environmental Inquiries|MPI-3.1]], [[versions/v40/sections/inquiry#Environmental Inquiries|MPI-4.0]], [[versions/v41/sections/inquiry#Environmental Inquiries|MPI-4.1]], [[versions/v50/sections/inquiry#Environmental Inquiries|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

A set of attributes that describe the execution environment are attached to the communicator MPI_COMM_WORLD when MPI is initialized. The value of these attributes can be inquired by using the function [[versions/v21/API/MPI_ATTR_GET|MPI_ATTR_GET]] described in Chapter [[versions/v21/sections/context#Groups, Contexts, ==Communicators,== and ~~Communicators|Groups,~~ ==Caching|Groups,== Contexts, ==Communicators,== and ~~Communicators]]~~ ==Caching]]== . It is erroneous to delete these attributes,

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

A set of attributes that describe the execution environment are attached to the communicator ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== when MPI is initialized. The value of these attributes can be inquired by using the function ~~[[versions/v22/API/MPI_ATTR_GET|MPI_ATTR_GET]]~~ ==[[versions/v22/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]]== described in Chapter [[versions/v22/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . It is erroneous to delete these attributes,

~~MPI_TAG_UB~~ ==`MPI_TAG_UB`== Upper bound for tag value.

~~MPI_HOST~~ ==`MPI_HOST`== Host process rank, if such exists, ~~MPI_PROC_NULL,~~ ==`MPI_PROC_NULL`,== otherwise.

~~MPI_IO~~ ==`MPI_IO`== rank of a node that has regular I/O facilities (possibly myrank). Nodes in the same communicator may return different values for this parameter.

~~MPI_WTIME_IS_GLOBAL~~ ==`MPI_WTIME_IS_GLOBAL`== Boolean variable that indicates whether clocks are synchronized.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~A set of attributes that describe the execution environment are attached to the communicator `MPI_COMM_WORLD` when MPI is initialized. The value of these attributes can be inquired by using the function [[versions/v30/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] described in Chapter [[versions/v30/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . It is erroneous to delete these attributes,~~

~~free their keys, or change their values.~~

==A set of attributes that describe the execution environment are attached to the communicator `MPI_COMM_WORLD` when MPI is initialized. The values of these attributes can be inquired by using the function [[versions/v30/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] described in==

==Section [[versions/v30/sections/context#Caching|Caching]] on page [[versions/v30/sections/context#Caching|Caching]] and in Section [[versions/v30/sections/binding#Attributes|Attributes]] on page [[versions/v30/sections/binding#Attributes|Attributes]] .==

==It is erroneous to delete these attributes, free their keys, or change their values.==

Vendors may add ~~implementation specific~~ ==implementation-specific== parameters (such as node number, real memory size, virtual memory size, etc.)

These predefined attributes do not change value between MPI initialization ( [[versions/v30/API/MPI_INIT|MPI_INIT]] ==)== and MPI completion ( [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] ), and cannot be updated or deleted by users.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~A set of attributes that describe the execution environment are attached to the communicator `MPI_COMM_WORLD` when MPI is initialized. The values of these attributes can be inquired by using the function [[versions/v31/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] described in~~

~~Section [[versions/v31/sections/context#Caching|Caching]] on page [[versions/v31/sections/context#Caching|Caching]] and in Section [[versions/v31/sections/binding#Attributes|Attributes]] on page [[versions/v31/sections/binding#Attributes|Attributes]] .~~

~~It is erroneous to delete these attributes, free their keys, or change their values.~~

==A set of attributes that describe the execution environment are attached to the communicator `MPI_COMM_WORLD` when MPI is initialized. The values of these attributes can be inquired by using the function [[versions/v31/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] described in [[versions/v31/sections/context#Caching|Caching]] and in [[versions/v31/sections/binding#Attributes|Attributes]] . It is erroneous to delete these attributes, free their keys, or change their values.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~A~~ ==When using the World Model (Section [[versions/v40/sections/dynamic#The World Model|The World Model]] ), a== set of attributes that describe the execution environment ~~are~~ ==is== attached to the communicator `MPI_COMM_WORLD` when MPI is initialized. The values of these attributes can be inquired by using the function [[versions/v40/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] described in [[versions/v40/sections/context#Caching|Caching]] and in [[versions/v40/sections/binding#Attributes|Attributes]] . It is erroneous to delete these attributes, free their keys, or change their values.

==When using the Sessions Model (Section [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] ), only the `MPI_TAG_UB` attribute is available.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~`MPI_TAG_UB`   Upper bound for tag value.~~

~~`MPI_HOST`   Host process rank, if such exists, `MPI_PROC_NULL`, otherwise.~~

~~`MPI_IO`   rank of a node that has regular I/O facilities (possibly myrank). Nodes in the same communicator may return different values for this parameter.~~

~~`MPI_WTIME_IS_GLOBAL`   Boolean variable that indicates whether clocks are synchronized.~~

==`MPI_TAG_UB`:   Upper bound for tag value.==

==`MPI_IO`:   Rank of a node that has regular I/O facilities (possibly myrank). Nodes in the same communicator may return different values for this parameter.==

==`MPI_WTIME_IS_GLOBAL`:   Boolean variable that indicates whether clocks are synchronized.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

`MPI_IO`: Rank of ~~a node~~ ==an MPI process== that has regular I/O facilities (possibly ~~myrank). Nodes~~ ==the rank of the calling MPI process). MPI processes== in the same communicator may return different values for this parameter.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Environmental Inquiries]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Environmental Inquiries]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Environmental Inquiries]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Environmental Inquiries]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Environmental Inquiries]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Environmental Inquiries]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Environmental Inquiries]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Environmental Inquiries]]
