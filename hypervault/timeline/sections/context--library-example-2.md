---
title: "Library Example \#2"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Library Example \#2

Chapter **context** · in [[versions/v13/sections/context#Library Example \#2|MPI-1.3]], [[versions/v21/sections/context#Library Example \#2|MPI-2.1]], [[versions/v22/sections/context#Library Example \#2|MPI-2.2]], [[versions/v30/sections/context#Library Example \#2|MPI-3.0]], [[versions/v31/sections/context#Library Example \#2|MPI-3.1]], [[versions/v40/sections/context#Library Example \#2|MPI-4.0]], [[versions/v41/sections/context#Library Example \#2|MPI-4.1]], [[versions/v50/sections/context#Library Example \#2|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~       void lib_call(MPI_Comm comm)        {          int me, done = 0;          MPI_Comm_rank(comm, &me);          if(me == 0)             while(!done)             {                MPI_Recv(..., MPI_ANY_SOURCE, MPI_ANY_TAG, comm);                ...             }          else          {            /* work */            MPI_Send(..., 0, ARBITRARY_TAG, comm);            ....          }     #ifdef EXAMPLE_2C          /* include (resp, exclude) for safety (resp, no safety): */          MPI_Barrier(comm);     #endif        }~~

~~The above example is really three examples, depending on whether or not one includes rank 3 in `list_b`, and whether or not a synchronize is included in `lib_call`. This example illustrates that, despite contexts, subsequent calls to `lib_call` with the same context need not be safe from one another (colloquially, “back-masking”). Safety is realized if the `MPI_Barrier` is added. What this demonstrates is that libraries have to be written carefully, even with contexts. When rank 3 is excluded, then the synchronize is not needed to get safety from back masking.~~

~~Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no backmasking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots (see~~

~~). Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source selectivity — deleting either feature removes the guarantee that backmasking cannot be required.~~

==       void lib_call(MPI_Comm comm)        {          int me, done = 0;          MPI_Status status;           MPI_Comm_rank(comm, &me);          if(me == 0)             while(!done)             {                MPI_Recv(..., MPI_ANY_SOURCE, MPI_ANY_TAG, comm, &status);                ...             }          else          {            /* work */            MPI_Send(..., 0, ARBITRARY_TAG, comm);            ....          }     #ifdef EXAMPLE_2C          /* include (resp, exclude) for safety (resp, no safety): */          MPI_Barrier(comm);     #endif        }==

==The above example is really three examples, depending on whether or not one includes rank 3 in `list_b`, and whether or not a synchronize is included in [[lib_call]] . This example illustrates that, despite contexts, subsequent calls to [[lib_call]] with the same context need not be safe from one another (colloquially, “back-masking”). Safety is realized if the `MPI_Barrier` is added. What this demonstrates is that libraries have to be written carefully, even with contexts. When rank 3 is excluded, then the synchronize is not needed to get safety from back masking.==

==Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no backmasking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots==

==(see ).==

==Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source selectivity — deleting either feature removes the guarantee that backmasking cannot be required.==

All of the foregoing is a supposition of “collective calls” implemented with point-to-point operations. MPI implementations may or may not implement collective calls using point-to-point operations. These algorithms are used to illustrate the issues of correctness and safety, independent of how MPI implements its collective calls. See also ~~section~~ ==Section== [[versions/v21/sections/context#Formalizing the Loosely Synchronous Model|Formalizing the Loosely Synchronous Model]] .

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==int== main(int argc, char **argv) { int ma, mb; MPI_Group MPI_GROUP_WORLD, group_a, group_b; MPI_Comm comm_a, comm_b;

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

int main(int argc, char ~~**argv)~~ ==*argv[])== { int ma, mb; MPI_Group MPI_GROUP_WORLD, group_a, group_b; MPI_Comm comm_a, comm_b;

static int list_a[] = {0, 1}; #if defined(EXAMPLE_2B) ~~|~~ ==||== defined(EXAMPLE_2C) static int list_b[] = {0, 2 ,3}; #else/* EXAMPLE_2A */ static int list_b[] = {0, 2}; #endif int size_list_a = sizeof(list_a)/sizeof(int); int size_list_b = sizeof(list_b)/sizeof(int);

if(comm_a != MPI_COMM_NULL) MPI_Comm_free(&comm_a); if(comm_b != MPI_COMM_NULL) MPI_Comm_free(&comm_b); MPI_Group_free(&group_a); MPI_Group_free(&group_b); MPI_Group_free(&MPI_GROUP_WORLD); MPI_Finalize(); ==return 0;== }

~~The above example is really three examples, depending on whether or not one includes rank 3 in `list_b`, and whether or not a synchronize is included in [[lib_call]] . This example illustrates that, despite contexts, subsequent calls to [[lib_call]] with the same context need not be safe from one another (colloquially, “back-masking”). Safety is realized if the `MPI_Barrier` is added. What this demonstrates is that libraries have to be written carefully, even with contexts. When rank 3 is excluded, then the synchronize is not needed to get safety from back masking.~~

~~Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no backmasking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots~~

~~(see ).~~

~~Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source selectivity — deleting either feature removes the guarantee that backmasking cannot be required.~~

==The above example is really three examples, depending on whether or not one includes rank 3 in `list_b`, and whether or not a synchronize is included in [[lib_call]] . This example illustrates that, despite contexts, subsequent calls to [[lib_call]] with the same context need not be safe from one another (colloquially, “back-masking”). Safety is realized if the `MPI_Barrier` is added. What this demonstrates is that libraries have to be written carefully, even with contexts. When rank 3 is excluded, then the synchronize is not needed to get safety from back-masking.==

==Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no back-masking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots==

==(see ). Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source selectivity — deleting either feature removes the guarantee that back-masking cannot be required.==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

int main(int argc, char *argv[]) { int ma, mb; MPI_Group ~~MPI_GROUP_WORLD,~~ ==group_world,== group_a, group_b; MPI_Comm comm_a, comm_b;

... MPI_Init(&argc, &argv); MPI_Comm_group(MPI_COMM_WORLD, ~~&MPI_GROUP_WORLD);~~ ==&group_world);==

~~MPI_Group_incl(MPI_GROUP_WORLD,~~ ==MPI_Group_incl(group_world,== size_list_a, list_a, &group_a); ~~MPI_Group_incl(MPI_GROUP_WORLD,~~ ==MPI_Group_incl(group_world,== size_list_b, list_b, &group_b);

if(comm_a != MPI_COMM_NULL) MPI_Comm_free(&comm_a); if(comm_b != MPI_COMM_NULL) MPI_Comm_free(&comm_b); MPI_Group_free(&group_a); MPI_Group_free(&group_b); ~~MPI_Group_free(&MPI_GROUP_WORLD);~~ ==MPI_Group_free(&group_world);== MPI_Finalize(); return 0; }

~~Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no back-masking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots~~

~~(see ). Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source selectivity — deleting either feature removes the guarantee that back-masking cannot be required.~~

==Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no back-masking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots (see ). Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source selectivity — deleting either feature removes the guarantee that back-masking cannot be required.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

void lib_call(MPI_Comm comm) { int me, done = 0; MPI_Status status; MPI_Comm_rank(comm, &me); if(me == 0) while(!done) { MPI_Recv(..., MPI_ANY_SOURCE, MPI_ANY_TAG, comm, &status); ... } else { /* work */ MPI_Send(..., 0, ARBITRARY_TAG, comm); ~~....~~ ==...== } #ifdef EXAMPLE_2C /* include (resp, exclude) for safety (resp, no safety): */ MPI_Barrier(comm); #endif }

Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no back-masking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots (see ). Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source ~~selectivity — deleting~~ ==selectivity—deleting== either feature removes the guarantee that back-masking cannot be required.

Algorithms that try to do ~~non-deterministic~~ ==nondeterministic== broadcasts or other calls that include wildcard operations will not generally have the good properties of the deterministic implementations of “reduce,” “allreduce,” and “broadcast.” Such algorithms would have to utilize the monotonically increasing tags (within a communicator scope) to keep things straight.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

==Second library example==

~~       int main(int argc, char *argv[])        {          int ma, mb;          MPI_Group group_world, group_a, group_b;          MPI_Comm comm_a, comm_b;~~

~~         static int list_a[] = {0, 1};     #if  defined(EXAMPLE_2B) || defined(EXAMPLE_2C)          static int list_b[] = {0, 2 ,3};     #else/* EXAMPLE_2A */          static int list_b[] = {0, 2};     #endif          int size_list_a = sizeof(list_a)/sizeof(int);          int size_list_b = sizeof(list_b)/sizeof(int);~~

~~         ...          MPI_Init(&argc, &argv);          MPI_Comm_group(MPI_COMM_WORLD, &group_world);~~

~~         MPI_Group_incl(group_world, size_list_a, list_a, &group_a);          MPI_Group_incl(group_world, size_list_b, list_b, &group_b);~~

~~         MPI_Comm_create(MPI_COMM_WORLD, group_a, &comm_a);          MPI_Comm_create(MPI_COMM_WORLD, group_b, &comm_b);~~

~~         if(comm_a != MPI_COMM_NULL)             MPI_Comm_rank(comm_a, &ma);          if(comm_b != MPI_COMM_NULL)             MPI_Comm_rank(comm_b, &mb);~~

~~         if(comm_a != MPI_COMM_NULL)             lib_call(comm_a);~~

~~         if(comm_b != MPI_COMM_NULL)          {            lib_call(comm_b);            lib_call(comm_b);          }~~

~~         if(comm_a != MPI_COMM_NULL)            MPI_Comm_free(&comm_a);          if(comm_b != MPI_COMM_NULL)            MPI_Comm_free(&comm_b);          MPI_Group_free(&group_a);          MPI_Group_free(&group_b);          MPI_Group_free(&group_world);          MPI_Finalize();          return 0;         }~~

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
  int ma, mb;
  MPI_Group group_world, group_a, group_b;
  MPI_Comm comm_a, comm_b;

  static int list_a[] = {0, 1};
#if  defined(EXAMPLE_2B) || defined(EXAMPLE_2C)
  static int list_b[] = {0, 2 ,3};
#else/* EXAMPLE_2A */
  static int list_b[] = {0, 2};
#endif
  int size_list_a = sizeof(list_a)/sizeof(int);
  int size_list_b = sizeof(list_b)/sizeof(int);

  ...
  MPI_Init(&argc, &argv);
  MPI_Comm_group(MPI_COMM_WORLD, &group_world);

  MPI_Group_incl(group_world, size_list_a, list_a, &group_a);
  MPI_Group_incl(group_world, size_list_b, list_b, &group_b);

  MPI_Comm_create(MPI_COMM_WORLD, group_a, &comm_a);
  MPI_Comm_create(MPI_COMM_WORLD, group_b, &comm_b);

  if(comm_a != MPI_COMM_NULL)
     MPI_Comm_rank(comm_a, &ma);
  if(comm_b != MPI_COMM_NULL)
     MPI_Comm_rank(comm_b, &mb);

  if(comm_a != MPI_COMM_NULL)
     lib_call(comm_a);

  if(comm_b != MPI_COMM_NULL)
  {
    lib_call(comm_b);
    lib_call(comm_b);
  }

  if(comm_a != MPI_COMM_NULL)
    MPI_Comm_free(&comm_a);
  if(comm_b != MPI_COMM_NULL)
    MPI_Comm_free(&comm_b);
  MPI_Group_free(&group_a);
  MPI_Group_free(&group_b);
  MPI_Group_free(&group_world);
  MPI_Finalize();
  return 0;
}
```

~~       void lib_call(MPI_Comm comm)        {          int me, done = 0;          MPI_Status status;           MPI_Comm_rank(comm, &me);          if(me == 0)             while(!done)             {                MPI_Recv(..., MPI_ANY_SOURCE, MPI_ANY_TAG, comm, &status);                ...             }          else          {            /* work */            MPI_Send(..., 0, ARBITRARY_TAG, comm);            ...          }     #ifdef EXAMPLE_2C          /* include (resp, exclude) for safety (resp, no safety): */          MPI_Barrier(comm);     #endif        }~~

~~The above example is really three examples, depending on whether or not one includes rank 3 in `list_b`, and whether or not a synchronize is included in [[lib_call]] . This example illustrates that, despite contexts, subsequent calls to [[lib_call]] with the same context need not be safe from one another (colloquially, “back-masking”). Safety is realized if the `MPI_Barrier` is added. What this demonstrates is that libraries have to be written carefully, even with contexts. When rank 3 is excluded, then the synchronize is not needed to get safety from back-masking.~~

~~Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no back-masking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots (see ). Here we rely on two guarantees of MPI: pairwise ordering of messages between processes in the same context, and source selectivity—deleting either feature removes the guarantee that back-masking cannot be required.~~

==(code block added)==
``` [MPI]C
void lib_call(MPI_Comm comm)
{
  int me, done = 0;
  MPI_Status status; 
  MPI_Comm_rank(comm, &me);
  if(me == 0)
     while(!done)
     {
        MPI_Recv(..., MPI_ANY_SOURCE, MPI_ANY_TAG, comm, &status);
        ...
     }
  else
  {
    /* work */
    MPI_Send(..., 0, ARBITRARY_TAG, comm);
    ...
  }
#ifdef EXAMPLE_2C
  /* include (resp, exclude) for safety (resp, no safety): */
  MPI_Barrier(comm);
#endif
}
```

==The above example is three examples, depending on whether or not one includes rank 3 in `list_b`, and whether or not a synchronizing operation is included in [[lib_call]] . This example illustrates that, despite contexts, subsequent calls to [[lib_call]] with the same context need not be safe from one another (colloquially, “back-masking”). Safety is realized if a call to `MPI_Barrier` is added. What this demonstrates is that libraries have to be written carefully, even with contexts. When rank 3 is excluded, then the synchronizing operation is not needed to get safety from back-masking.==

==Algorithms like “reduce” and “allreduce” have strong enough source selectivity properties so that they are inherently okay (no back-masking), provided that MPI provides basic guarantees. So are multiple calls to a typical tree-broadcast algorithm with the same root or different roots (see ). Here we rely on two guarantees of MPI: pairwise ordering of messages between MPI processes in the same context, and source selectivity—deleting either feature removes the guarantee that back-masking cannot be required.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Library Example \#2]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Library Example \#2]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Library Example \#2]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Library Example \#2]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Library Example \#2]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Library Example \#2]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Library Example \#2]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Library Example \#2]]
