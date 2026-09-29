---
title: "(Approximate) Current Practice \#3"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# (Approximate) Current Practice \#3

Chapter **context** · in [[versions/v13/sections/context#(Approximate) Current Practice \#3|MPI-1.3]], [[versions/v21/sections/context#(Approximate) Current Practice \#3|MPI-2.1]], [[versions/v22/sections/context#(Approximate) Current Practice \#3|MPI-2.2]], [[versions/v30/sections/context#(Approximate) Current Practice \#3|MPI-3.0]], [[versions/v31/sections/context#(Approximate) Current Practice \#3|MPI-3.1]], [[versions/v40/sections/context#(Approximate) Current Practice \#3|MPI-4.0]], [[versions/v41/sections/context#(Approximate) Current Practice \#3|MPI-4.1]], [[versions/v50/sections/context#(Approximate) Current Practice \#3|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~        if(me != 0)         {           /* compute on slave */           ...           MPI_Reduce(send_buf,recv_buff,count, MPI_INT, MPI_SUM, 1, commslave);           ...         }         /* zero falls through immediately to this reduce, others do later... */         MPI_Reduce(send_buf2, recv_buff2, count2,                    MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);~~

~~        MPI_Comm_free(&commslave);         MPI_Group_free(&MPI_GROUP_WORLD);         MPI_Group_free(&grprem);         MPI_Finalize();       }~~

~~This example illustrates how a group consisting of all but the zeroth process of the “all” group is created, and then how a communicator is formed (`commslave`) for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the MPI_COMM_WORLD context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in MPI_COMM_WORLD is insulated from communication in `commslave`, and vice versa.~~

==        if(me != 0)         {           /* compute on slave */           ...           MPI_Reduce(send_buf,recv_buff,count, MPI_INT, MPI_SUM, 1, commslave);           ...           MPI_Comm_free(&commslave);         }         /* zero falls through immediately to this reduce, others do later... */         MPI_Reduce(send_buf2, recv_buff2, count2,                    MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);==

==        MPI_Group_free(&MPI_GROUP_WORLD);         MPI_Group_free(&grprem);         MPI_Finalize();       }==

==This example illustrates how a group consisting of all but the zeroth process of the “all” group is created, and then how a communicator is formed==

==(`commslave`)==

==for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the MPI_COMM_WORLD context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in MPI_COMM_WORLD is insulated from communication in `commslave`, and vice versa.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

==int== main(int argc, char **argv) { int me, count, count2; void *send_buf, *recv_buf, *send_buf2, *recv_buf2; MPI_Group MPI_GROUP_WORLD, grprem; MPI_Comm commslave; static int ranks[] = {0}; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, &MPI_GROUP_WORLD); MPI_Comm_rank(MPI_COMM_WORLD, &me); /* local */

for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== is insulated from communication in `commslave`, and vice versa.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

int main(int argc, char ~~**argv)~~ ==*argv[])== { int me, count, count2; void *send_buf, *recv_buf, *send_buf2, *recv_buf2; MPI_Group MPI_GROUP_WORLD, grprem; MPI_Comm commslave; static int ranks[] = {0}; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, &MPI_GROUP_WORLD); MPI_Comm_rank(MPI_COMM_WORLD, &me); /* local */

if(me != 0) { /* compute on slave */ ... ~~MPI_Reduce(send_buf,recv_buff,count,~~ ==MPI_Reduce(send_buf,recv_buf,count,== MPI_INT, MPI_SUM, 1, commslave); ... MPI_Comm_free(&commslave); } /* zero falls through immediately to this reduce, others do later... */ MPI_Reduce(send_buf2, ~~recv_buff2,~~ ==recv_buf2,== count2, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

MPI_Group_free(&MPI_GROUP_WORLD); MPI_Group_free(&grprem); MPI_Finalize(); ==return 0;== }

~~(`commslave`)~~

~~for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the `MPI_COMM_WORLD` context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in `MPI_COMM_WORLD` is insulated from communication in `commslave`, and vice versa.~~

==(`commslave`) for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the `MPI_COMM_WORLD` context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in `MPI_COMM_WORLD` is insulated from communication in `commslave`, and vice versa.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

int main(int argc, char *argv[]) { int me, count, count2; void *send_buf, *recv_buf, *send_buf2, *recv_buf2; MPI_Group ~~MPI_GROUP_WORLD,~~ ==group_world,== grprem; MPI_Comm commslave; static int ranks[] = {0}; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, ~~&MPI_GROUP_WORLD);~~ ==&group_world);== MPI_Comm_rank(MPI_COMM_WORLD, &me); /* local */

~~MPI_Group_excl(MPI_GROUP_WORLD,~~ ==MPI_Group_excl(group_world,== 1, ranks, &grprem); /* local */ MPI_Comm_create(MPI_COMM_WORLD, grprem, &commslave);

~~        MPI_Group_free(&MPI_GROUP_WORLD);         MPI_Group_free(&grprem);         MPI_Finalize();         return 0;       }~~

~~This example illustrates how a group consisting of all but the zeroth process of the “all” group is created, and then how a communicator is formed~~

~~(`commslave`) for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the `MPI_COMM_WORLD` context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in `MPI_COMM_WORLD` is insulated from communication in `commslave`, and vice versa.~~

==        MPI_Group_free(&group_world);         MPI_Group_free(&grprem);         MPI_Finalize();         return 0;       }==

==This example illustrates how a group consisting of all but the zeroth process of the “all” group is created, and then how a communicator is formed (`commslave`) for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the `MPI_COMM_WORLD` context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in `MPI_COMM_WORLD` is insulated from communication in `commslave`, and vice versa.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

int main(int argc, char *argv[]) { int me, count, count2; void *send_buf, *recv_buf, *send_buf2, *recv_buf2; MPI_Group group_world, grprem; MPI_Comm ~~commslave;~~ ==commWorker;== static int ranks[] = {0}; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, &group_world); MPI_Comm_rank(MPI_COMM_WORLD, &me); /* local */

MPI_Group_excl(group_world, 1, ranks, &grprem); /* local */ MPI_Comm_create(MPI_COMM_WORLD, grprem, ~~&commslave);~~ ==&commWorker);==

if(me != 0) { /* compute on ~~slave~~ ==worker== */ ... MPI_Reduce(send_buf,recv_buf,count, MPI_INT, MPI_SUM, 1, ~~commslave);~~ ==commWorker);== ... ~~MPI_Comm_free(&commslave);~~ ==MPI_Comm_free(&commWorker);== } /* zero falls through immediately to this reduce, others do later... */ MPI_Reduce(send_buf2, recv_buf2, count2, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

~~This example~~ ==Example [[versions/v40/sections/context#(Approximate) Current Practice \ 3|(Approximate) Current Practice \ 3]]== illustrates how a group consisting of all but the zeroth process of the “all” group is created, and then how a communicator is formed ~~(`commslave`)~~ ==(`commWorker`)== for that new group. The new communicator is used in a collective call, and all processes execute a collective call in the `MPI_COMM_WORLD` context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in `MPI_COMM_WORLD` is insulated from communication in ~~`commslave`,~~ ==`commWorker`,== and vice versa.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==[language={[MPI]C},basicstyle=]== int main(int argc, char *argv[]) { int me, count, count2; void *send_buf, *recv_buf, *send_buf2, *recv_buf2; MPI_Group group_world, grprem; MPI_Comm commWorker; static int ranks[] = {0}; ... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, &group_world); MPI_Comm_rank(MPI_COMM_WORLD, &me); /* local */

MPI_Group_excl(group_world, 1, ranks, &grprem); /* local */ MPI_Comm_create(MPI_COMM_WORLD, grprem, &commWorker);

if(me != 0) { /* compute on worker */ ... MPI_Reduce(send_buf,recv_buf,count, MPI_INT, MPI_SUM, 1, commWorker); ... MPI_Comm_free(&commWorker); } /* zero falls through immediately to this reduce, others do later... */ MPI_Reduce(send_buf2, recv_buf2, count2, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

MPI_Group_free(&group_world); MPI_Group_free(&grprem); MPI_Finalize(); return 0; }

Example [[versions/v41/sections/context#(Approximate) Current Practice \ 3|(Approximate) Current Practice \ 3]] illustrates how a group consisting of all but the zeroth ==MPI== process of the “all” group is created, and then how a communicator is formed (`commWorker`) for that new group. The new communicator is used in a collective call, and all ==MPI== processes execute a collective call in the `MPI_COMM_WORLD` context. This example illustrates how the two communicators (that inherently possess distinct contexts) protect communication. That is, communication in `MPI_COMM_WORLD` is insulated from communication in `commWorker`, and vice versa.

In summary, “group safety” is achieved via communicators because distinct contexts within communicators are enforced to be unique on any ==MPI== process.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#(Approximate) Current Practice \#3]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#(Approximate) Current Practice \#3]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#(Approximate) Current Practice \#3]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#(Approximate) Current Practice \#3]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#(Approximate) Current Practice \#3]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#(Approximate) Current Practice \#3]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#(Approximate) Current Practice \#3]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#(Approximate) Current Practice \#3]]
