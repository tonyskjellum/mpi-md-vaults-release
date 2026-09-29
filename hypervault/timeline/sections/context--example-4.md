---
title: "Example \#4"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/context]
---

# Example \#4

Chapter **context** · in [[versions/v13/sections/context#Example \#4|MPI-1.3]], [[versions/v21/sections/context#Example \#4|MPI-2.1]], [[versions/v22/sections/context#Example \#4|MPI-2.2]], [[versions/v30/sections/context#Example \#4|MPI-3.0]], [[versions/v31/sections/context#Example \#4|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

if(me != MPI_UNDEFINED) { MPI_Irecv(buff1, count, MPI_DOUBLE, MPI_ANY_SOURCE, TAG_ARBITRARY, the_comm, request); MPI_Isend(buff2, count, MPI_DOUBLE, (me+1)%4, TAG_ARBITRARY, the_comm, request+1); ~~}~~ ==for(i = 0; i < SOME_COUNT, i++) MPI_Reduce(..., the_comm); MPI_Waitall(2, request, status);==

~~for(i = 0; i < SOME_COUNT, i++) MPI_Reduce(..., the_comm); MPI_Waitall(2, request, status);~~ ==MPI_Comm_free(&the_comm); }==

~~MPI_Comm_free(t&he_comm);~~ MPI_Group_free(&MPI_GROUP_WORLD); MPI_Group_free(&subgroup); MPI_Finalize(); }

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==int== main(int argc, char **argv) { int me; MPI_Request request[2]; MPI_Status status[2]; MPI_Group MPI_GROUP_WORLD, subgroup; int ranks[] = {2, 4, 6, 8}; MPI_Comm the_comm; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, &MPI_GROUP_WORLD);

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

int main(int argc, char ~~**argv)~~ ==*argv[])== { int me; MPI_Request request[2]; MPI_Status status[2]; MPI_Group MPI_GROUP_WORLD, subgroup; int ranks[] = {2, 4, 6, 8}; MPI_Comm the_comm; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, &MPI_GROUP_WORLD);

if(me != MPI_UNDEFINED) { MPI_Irecv(buff1, count, MPI_DOUBLE, MPI_ANY_SOURCE, TAG_ARBITRARY, the_comm, request); MPI_Isend(buff2, count, MPI_DOUBLE, (me+1)%4, TAG_ARBITRARY, the_comm, request+1); for(i = 0; i < ~~SOME_COUNT,~~ ==SOME_COUNT;== i++) MPI_Reduce(..., the_comm); MPI_Waitall(2, request, status);

MPI_Group_free(&MPI_GROUP_WORLD); MPI_Group_free(&subgroup); MPI_Finalize(); ==return 0;== }

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

int main(int argc, char *argv[]) { int me; MPI_Request request[2]; MPI_Status status[2]; MPI_Group ~~MPI_GROUP_WORLD,~~ ==group_world,== subgroup; int ranks[] = {2, 4, 6, 8}; MPI_Comm the_comm; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, ~~&MPI_GROUP_WORLD);~~ ==&group_world);==

~~MPI_Group_incl(MPI_GROUP_WORLD,~~ ==MPI_Group_incl(group_world,== 4, ranks, &subgroup); /* local */ MPI_Group_rank(subgroup, &me); /* local */

~~MPI_Group_free(&MPI_GROUP_WORLD);~~ ==MPI_Group_free(&group_world);== MPI_Group_free(&subgroup); MPI_Finalize(); return 0; }

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Example \#4]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Example \#4]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Example \#4]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Example \#4]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Example \#4]]
