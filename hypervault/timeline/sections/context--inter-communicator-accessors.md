---
title: "Inter-Communicator Accessors"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Inter-Communicator Accessors

Chapter **context** · in [[versions/v13/sections/context#Inter-communicator Accessors|MPI-1.3]], [[versions/v21/sections/context#Inter-communicator Accessors|MPI-2.1]], [[versions/v22/sections/context#Inter-communicator Accessors|MPI-2.2]], [[versions/v30/sections/context#Inter-communicator Accessors|MPI-3.0]], [[versions/v31/sections/context#Inter-communicator Accessors|MPI-3.1]], [[versions/v40/sections/context#Inter-Communicator Accessors|MPI-4.0]], [[versions/v41/sections/context#Inter-Communicator Accessors|MPI-4.1]], [[versions/v50/sections/context#Inter-Communicator Accessors|MPI-5.0]]

Heading by release: MPI-1.3: “Inter-communicator Accessors”; MPI-2.1: “Inter-communicator Accessors”; MPI-2.2: “Inter-communicator Accessors”; MPI-3.0: “Inter-communicator Accessors”; MPI-3.1: “Inter-communicator Accessors”; MPI-4.0: “Inter-Communicator Accessors”; MPI-4.1: “Inter-Communicator Accessors”; MPI-5.0: “Inter-Communicator Accessors”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~<table> <tbody> <tr> <td colspan="2" style="text-align: center;"><code>MPI_COMM_*</code> Function Behavior</td> </tr> <tr> <td colspan="2" style="text-align: center;">(in Inter-Communication Mode)</td> </tr> <tr> <td style="text-align: left;"><code>MPI_COMM_SIZE</code></td> <td style="text-align: left;">returns the size of the local group.</td> </tr> <tr> <td style="text-align: left;"><code>MPI_COMM_GROUP</code></td> <td style="text-align: left;">returns the local group.</td> </tr> <tr> <td style="text-align: left;"><code>MPI_COMM_RANK</code></td> <td style="text-align: left;">returns the rank in the local group</td> </tr> </tbody> </table>~~

==|                  |                                      | |:-----------------|:-------------------------------------| | `MPI_COMM_SIZE`  | returns the size of the local group. | | `MPI_COMM_GROUP` | returns the local group.             | | `MPI_COMM_RANK`  | returns the rank in the local group  |==

==`MPI_COMM\_\*` Function Behavior (in Inter-Communication Mode)==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

This local routine allows the calling process to determine if a communicator is an inter-communicator or an intra-communicator. It returns ~~true~~ ==`true`== if it is an inter-communicator, otherwise ~~false.~~ ==`false`.==

Furthermore, the operation `MPI_COMM_COMPARE` is valid for inter-communicators. Both communicators must be either intra- or inter-communicators, or else ~~MPI_UNEQUAL~~ ==`MPI_UNEQUAL`== results. Both corresponding local and remote groups must compare correctly to get the results ~~MPI_CONGRUENT~~ ==`MPI_CONGRUENT`== and ~~MPI_SIMILAR.~~ ==`MPI_SIMILAR`.== In particular, it is possible for ~~MPI_SIMILAR~~ ==`MPI_SIMILAR`== to result because either the local or remote groups were similar but not identical.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Furthermore, the operation `MPI_COMM_COMPARE` is valid for inter-communicators. Both communicators must be either intra- or inter-communicators, or else `MPI_UNEQUAL` results. Both corresponding local and remote groups must compare correctly to get the results `MPI_CONGRUENT` and `MPI_SIMILAR`. In particular, it is possible for `MPI_SIMILAR` to result because either the local or remote groups were similar but not identical.~~

~~The following accessors provide consistent access to the remote group of an inter-communicator:~~

~~The following are all local operations.~~

==Furthermore, the operation `MPI_COMM_COMPARE` is valid for inter-communicators. Both communicators must be either intra- or inter-communicators, or else `MPI_UNEQUAL` results. Both corresponding local and remote groups must compare correctly to get the results `MPI_CONGRUENT` or `MPI_SIMILAR`. In particular, it is possible for `MPI_SIMILAR` to result because either the local or remote groups were similar but not identical.==

==The following accessors provide consistent access to the remote group of an inter-communicator. The following are all local operations.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

| | | ~~|:-----------------|:-------------------------------------|~~ ==|:-----------------------|:-------------------------------------|== | ~~`MPI_COMM_SIZE`~~ ==[[versions/v31/API/MPI_COMM_SIZE|MPI_COMM_SIZE]]== | returns the size of the local group. | | ~~`MPI_COMM_GROUP`~~ ==[[versions/v31/API/MPI_COMM_GROUP|MPI_COMM_GROUP]]== | returns the local group. | | ~~`MPI_COMM_RANK`~~ ==[[versions/v31/API/MPI_COMM_RANK|MPI_COMM_RANK]]== | returns the rank in the local group |

Furthermore, the operation ~~`MPI_COMM_COMPARE`~~ ==[[versions/v31/API/MPI_COMM_COMPARE|MPI_COMM_COMPARE]]== is valid for inter-communicators. Both communicators must be either intra- or inter-communicators, or else `MPI_UNEQUAL` results. Both corresponding local and remote groups must compare correctly to get the results `MPI_CONGRUENT` or `MPI_SIMILAR`. In particular, it is possible for `MPI_SIMILAR` to result because either the local or remote groups were similar but not identical.

> Symmetric access to both the local and remote groups of an inter-communicator is important, so this function, as well as ~~`MPI_COMM_REMOTE_SIZE`~~ ==[[versions/v31/API/MPI_COMM_REMOTE_SIZE|MPI_COMM_REMOTE_SIZE]]== have been provided.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~This local routine allows the calling process to determine if a communicator is an inter-communicator or an intra-communicator. It returns `true` if it is an inter-communicator, otherwise `false`.~~

~~When an inter-communicator is used as an input argument to the communicator accessors described above under intra-communication, the following table describes behavior.~~

==This local routine allows the calling MPI process to determine if a communicator is an inter-communicator or an intra-communicator. It returns `true` if it is an inter-communicator, otherwise `false`.==

`MPI_COMM\_\*` ~~Function Behavior~~ ==function behavior== (in ~~Inter-Communication Mode)~~ ==inter-communication mode)==

==Table [[versions/v41/sections/context#Inter-Communicator Accessors|Inter-Communicator Accessors]] describes the behavior when an inter-communicator is used as an input argument to the communicator accessors described above under intra-communication.== Furthermore, the operation [[versions/v41/API/MPI_COMM_COMPARE|MPI_COMM_COMPARE]] is valid for inter-communicators. Both communicators must be either intra- or inter-communicators, or else `MPI_UNEQUAL` results. Both corresponding local and remote groups must compare correctly to get the results `MPI_CONGRUENT` or `MPI_SIMILAR`. In particular, it is possible for `MPI_SIMILAR` to result because either the local or remote groups were similar but not identical.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

| | | |:-----------------------|:-------------------------------------| | [[versions/v50/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] | returns the size of the local group. | | [[versions/v50/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] | returns the local group. | | [[versions/v50/API/MPI_COMM_RANK|MPI_COMM_RANK]] | returns the rank in the local ~~group~~ ==group.== |

> Symmetric access to both the local and remote groups of an ~~inter-communicator~~ ==inter-/communicator== is important, so this function, as well as [[versions/v50/API/MPI_COMM_REMOTE_SIZE|MPI_COMM_REMOTE_SIZE]] have been provided.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Inter-communicator Accessors]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Inter-communicator Accessors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Inter-communicator Accessors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Inter-communicator Accessors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Inter-communicator Accessors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Inter-Communicator Accessors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Inter-Communicator Accessors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Inter-Communicator Accessors]]
