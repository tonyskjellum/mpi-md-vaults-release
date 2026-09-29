---
title: "The MPI Tool Information Interface"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# The MPI Tool Information Interface

Chapter **tools** · in [[versions/v30/sections/tools#The MPI Tool Information Interface|MPI-3.0]], [[versions/v31/sections/tools#The MPI Tool Information Interface|MPI-3.1]], [[versions/v40/sections/tools#The MPI Tool Information Interface|MPI-4.0]], [[versions/v41/sections/tools#The MPI Tool Information Interface|MPI-4.1]], [[versions/v50/sections/tools#The MPI Tool Information Interface|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

==Variables and categories across connected processes with equivalent names are required to have the same meaning (see the definition of “equivalent” as related to strings in Section [[versions/v31/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] ). Furthermore, enumerations with equivalent names across connected processes are required to have the same meaning, but are allowed to comprise different enumeration items. Enumeration items that have equivalent names across connected processes in enumerations with the same meaning must also have the same meaning. In order for variables and categories to have the same meaning, routines in the tools information interface that return details for those variables and categories have requirements on what parameters must be identical. These requirements are specified in their respective sections.==

==> [!tip] Rationale==

==> The intent of requiring the same meaning for entities with equivalent names is to enforce consistency across connected processes. For example, variables describing the number of packets sent on different types of network devices should have different names to reflect their potentially different meanings.==

Since the MPI tool information interface primarily focuses on tools and support libraries, MPI implementations are only required to provide C bindings for functions ==and constants== introduced in this section. Except where otherwise noted, all conventions and principles governing the C bindings of the MPI API also apply to the MPI tool information interface, which is available by including the ~~<span class="sans-serif">mpi.h</span>~~ ==`mpi.h`== header file. All routines in this interface have local semantics.

> The number and type of control variables and performance variables can vary between MPI implementations, platforms and different builds of the same implementation on the same platform as well as between runs. Hence, any application relying on a particular variable will not be portable. Further, there is no guarantee that ==the== number of ~~variables, variable indices,~~ ==variables== and variable ~~names~~ ==indices== are the same across ==connected== processes. > > This interface is primarily intended for performance monitoring tools, support tools, and libraries controlling the application’s environment. When maximum portability is desired, application programmers should either avoid using the MPI tool information interface or avoid being dependent on the existence of a particular control or performance variable.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

MPI implementations often use internal variables to control their operation and ~~performance.~~ ==performance and rely on internal events for their implementation.== Understanding and manipulating these variables ==and tracking these events== can provide a more efficient execution environment or improve performance for many applications. This section describes the MPI tool information interface, which provides a mechanism for MPI implementors to expose variables, each of which represents a particular property, setting, or performance measurement from within the MPI ~~implementation.~~ ==implementation, as well as expose events that can be tracked by tools.== The interface is split into ~~two~~ ==three== parts: the first part provides information ~~about~~ ==about,== and supports the setting ~~of~~ ==of,== control variables through which the MPI implementation tunes its configuration. The second part provides access to performance variables that can provide insight into internal performance information of the MPI implementation. ==The third part enables tools to query available events within an MPI implementation and register callbacks for them.==

To avoid restrictions on the MPI implementation, the MPI tool information interface allows the implementation to specify which control ==variables, performance variables,== and ~~performance variables~~ ==events== exist. Additionally, the user of the MPI tool information interface can obtain metadata about each available ~~variable,~~ ==variable or event,== such as its datatype, and a textual description. The MPI tool information interface provides the necessary routines to find all variables ==and events== that exist in a particular MPI ~~implementation,~~ ==implementation;== to query their ~~properties,~~ ==properties;== to retrieve descriptions about their ~~meaning, and~~ ==meaning;== to access and, if appropriate, to alter their ~~values.~~ ==values; and (in case of events) set callbacks triggered by them.==

~~Variables~~ ==Variables, events,== and categories across connected ==MPI== processes with equivalent names are required to have the same meaning (see the definition of “equivalent” as related to strings in Section [[versions/v40/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] ). Furthermore, enumerations with equivalent names across connected ==MPI== processes are required to have the same meaning, but are allowed to comprise different enumeration items. Enumeration items that have equivalent names across connected ==MPI== processes in enumerations with the same meaning must also have the same meaning. In order for variables and categories to have the same meaning, routines in the tools information interface that return details for those variables and categories have requirements on what parameters must be identical. These requirements are specified in their respective sections.

> The intent of requiring the same meaning for entities with equivalent names is to enforce consistency across connected ==MPI== processes. For example, variables describing the number of packets sent on different types of network devices should have different names to reflect their potentially different meanings.

The MPI tool information interface can be used independently from the MPI communication functionality. In particular, the routines of this interface can be called before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]] (or equivalent)~~ ==MPI is initialized== and after ~~[[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] .~~ ==MPI is finalized.== In order to support this behavior cleanly, the MPI tool information interface uses separate initialization and finalization routines. All identifiers used in the MPI tool information interface have the prefix ~~MPI_T\_.~~ ==`MPI_T_`.==

> The number and type of control ~~variables~~ ==variables, performance variables,== and ~~performance variables~~ ==events== can vary between MPI implementations, platforms and different builds of the same implementation on the same platform as well as between runs. Hence, any application relying on a particular variable will not be portable. Further, there is no guarantee that the number of variables and variable indices are the same across connected ==MPI== processes. > > This interface is primarily intended for performance monitoring tools, support tools, and libraries controlling the application’s environment. When maximum portability is desired, application programmers should either avoid using the MPI tool information interface or avoid being dependent on the existence of a particular control or performance ~~variable.~~ ==variable or of a particular event.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

MPI implementations often use internal variables to control their ~~operation~~ ==behavior== and performance and rely on internal events for their implementation. Understanding and manipulating these variables and tracking these events can provide a more efficient execution environment or improve performance for many applications. This section describes the MPI tool information interface, which provides a mechanism for MPI implementors to expose variables, each of which represents a particular property, setting, or performance measurement from within the MPI implementation, as well as expose events that can be tracked by tools. The interface is split into three parts: the first part provides information about, and supports the setting of, control variables through which the MPI implementation tunes its configuration. The second part provides access to performance variables that can provide insight into internal performance information of the MPI implementation. The third part enables tools to query available events within an MPI implementation and register callbacks for them.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#The MPI Tool Information Interface]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#The MPI Tool Information Interface]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#The MPI Tool Information Interface]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#The MPI Tool Information Interface]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#The MPI Tool Information Interface]]
