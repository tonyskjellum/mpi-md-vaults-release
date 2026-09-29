---
title: "Name Publishing"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Name Publishing

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Name Publishing|MPI-2.0]], [[versions/v21/sections/dynamic#Name Publishing|MPI-2.1]], [[versions/v22/sections/dynamic#Name Publishing|MPI-2.2]], [[versions/v30/sections/dynamic#Name Publishing|MPI-3.0]], [[versions/v31/sections/dynamic#Name Publishing|MPI-3.1]], [[versions/v40/sections/dynamic#Name Publishing|MPI-4.0]], [[versions/v41/sections/dynamic#Name Publishing|MPI-4.1]], [[versions/v50/sections/dynamic#Name Publishing|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

The routines in this section provide a mechanism for publishing names. A ~~( [[service_name]] , [[port_name]] )~~ ==(`service_name`, `port_name`)== pair is published by the server, and may be retrieved by a client using the ~~[[service_name]]~~ ==`service_name`== only. An MPI implementation defines the *scope* of the ~~[[service_name]] ,~~ ==`service_name`,== that is, the domain over which the ~~[[service_name]]~~ ==`service_name`== can be retrieved. If the domain is the empty set, that is, if no client can retrieve the information, then we say that name publishing is not supported. Implementations should document how the scope is determined. ~~High quality~~ ==High-quality== implementations will give some control to users through the `info` arguments to name publishing functions.

if ~~[[service_name]]~~ ==`service_name`== has already been published within the scope determined by `info`, the behavior of [[versions/v21/API/MPI_PUBLISH_NAME|MPI_PUBLISH_NAME]]

Note that while ~~[[service_name]]~~ ==`service_name`== has a limited scope, determined by the implementation, ~~[[port_name]]~~ ==`port_name`== always has global scope within the communication universe used by the implementation (i.e., it is globally unique).

> In some cases, an MPI implementation may use a name service that a user can also access directly. In this case, a name published by MPI could easily conflict with a name published by a user. In order to avoid such conflicts, MPI implementations should mangle service names so that they are unlikely to conflict with user code that makes use of the same service. Such name mangling will of course be completely transparent to the user. > > The following situation is problematic but unavoidable, if we want to allow implementations to use nameservers. Suppose there are multiple instances of “ocean” running on a machine. If the scope of a service name is confined to a job, then multiple oceans can coexist. If an implementation provides site-wide scope, however, multiple instances are not possible as all calls to [[versions/v21/API/MPI_PUBLISH_NAME|MPI_PUBLISH_NAME]] after the first may fail. There is no universal solution to this. > > To handle these situations, a ~~high quality~~ ==high-quality== implementation should make it possible to limit the domain over which names are published.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~The routines in this section provide a mechanism for publishing names. A (`service_name`, `port_name`) pair is published by the server, and may be retrieved by a client using the `service_name` only. An MPI implementation defines the *scope* of the `service_name`, that is, the domain over which the `service_name` can be retrieved. If the domain is the empty set, that is, if no client can retrieve the information, then we say that name publishing is not supported. Implementations should document how the scope is determined. High-quality implementations will give some control to users through the `info` arguments to name publishing functions.~~

~~Examples are given in the descriptions of individual functions.~~

==The routines in this section provide a mechanism for publishing names. A (`service_name`, `port_name`) pair is published by the server, and may be retrieved by a client using the `service_name` only. An MPI implementation defines the *scope* of the `service_name`, that is, the domain over which the `service_name` can be retrieved. If the domain is the empty set, that is, if no client can retrieve the information, then we say that name publishing is not supported. Implementations should document how the scope is determined. High-quality implementations will give some control to users through the `info` arguments to name publishing functions. Examples are given in the descriptions of individual functions.==

~~MPI permits publishing more than one `service_name` for a single `port_name`. On the other hand,~~

~~if `service_name` has already been published within the scope determined by `info`, the behavior of [[versions/v30/API/MPI_PUBLISH_NAME|MPI_PUBLISH_NAME]]~~

~~is undefined. An MPI implementation may, through a mechanism in the `info` argument to [[versions/v30/API/MPI_PUBLISH_NAME|MPI_PUBLISH_NAME]] , provide a way to allow multiple servers with the same service in the same scope. In this case, an implementation-defined policy will determine which of several port names is returned by [[versions/v30/API/MPI_LOOKUP_NAME|MPI_LOOKUP_NAME]] .~~

==MPI permits publishing more than one `service_name` for a single `port_name`. On the other hand, if `service_name` has already been published within the scope determined by `info`, the behavior of [[versions/v30/API/MPI_PUBLISH_NAME|MPI_PUBLISH_NAME]] is undefined. An MPI implementation may, through a mechanism in the `info` argument to [[versions/v30/API/MPI_PUBLISH_NAME|MPI_PUBLISH_NAME]] , provide a way to allow multiple servers with the same service in the same scope. In this case, an implementation-defined policy will determine which of several port names is returned by [[versions/v30/API/MPI_LOOKUP_NAME|MPI_LOOKUP_NAME]] .==

`port_name` should be the name of a port established by [[versions/v30/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] and not yet ~~deleted~~ ==released== by [[versions/v30/API/MPI_CLOSE_PORT|MPI_CLOSE_PORT]] . If it is not, the result is undefined.

~~This routine unpublishes a service name that has been previously~~

~~published. Attempting to unpublish a name that has not been published or has already been unpublished is erroneous and is indicated by the error class~~

~~`MPI_ERR_SERVICE`.~~

~~All published names must be unpublished before the corresponding port is closed and before the publishing process exits.~~

~~The behavior of [[versions/v30/API/MPI_UNPUBLISH_NAME|MPI_UNPUBLISH_NAME]] is implementation dependent when a process tries to unpublish a name that it did not publish.~~

==This routine unpublishes a service name that has been previously published. Attempting to unpublish a name that has not been published or has already been unpublished is erroneous and is indicated by the error class `MPI_ERR_SERVICE`.==

==All published names must be unpublished before the corresponding port is closed and before the publishing process exits. The behavior of [[versions/v30/API/MPI_UNPUBLISH_NAME|MPI_UNPUBLISH_NAME]] is implementation dependent when a process tries to unpublish a name that it did not publish.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The implementation must define the *scope* of a published service name, that is, the domain over which the service name is unique, and conversely, the domain over which the ~~(port name, service name)~~ ==(`port_name`, `service_name`)== pair may be retrieved. For instance, a service name may be unique to a job (where job is defined by a distributed operating system or batch scheduler), unique to a machine, or unique to a Kerberos realm. The scope may depend on the `info` argument to [[versions/v40/API/MPI_PUBLISH_NAME|MPI_PUBLISH_NAME]] .

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Name Publishing]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Name Publishing]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Name Publishing]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Name Publishing]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Name Publishing]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Name Publishing]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Name Publishing]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Name Publishing]]
