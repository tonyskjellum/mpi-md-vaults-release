---
title: "Communication Safety Example"
chapter: context
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Communication Safety Example

Chapter **context** · in [[versions/v40/sections/context#Communication Safety Example|MPI-4.0]], [[versions/v41/sections/context#Communication Safety Example|MPI-4.1]], [[versions/v50/sections/context#Communication Safety Example|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~       #define TAG_ARBITRARY 12345        #define SOME_COUNT       50~~

~~       int main(int argc, char *argv[])        {          int me;          MPI_Request request[2];          MPI_Status status[2];          MPI_Group group_world, subgroup;          int ranks[] = {2, 4, 6, 8};          MPI_Comm the_comm;          ...          MPI_Init(&argc, &argv);          MPI_Comm_group(MPI_COMM_WORLD, &group_world);~~

~~         MPI_Group_incl(group_world, 4, ranks, &subgroup); /* local */          MPI_Group_rank(subgroup, &me);     /* local */~~

~~         MPI_Comm_create(MPI_COMM_WORLD, subgroup, &the_comm);~~

~~         if(me != MPI_UNDEFINED)          {              MPI_Irecv(buff1, count, MPI_DOUBLE, MPI_ANY_SOURCE, TAG_ARBITRARY,                                the_comm, request);              MPI_Isend(buff2, count, MPI_DOUBLE, (me+1)%4, TAG_ARBITRARY,                                the_comm, request+1);              for(i = 0; i < SOME_COUNT; i++)                MPI_Reduce(..., the_comm);              MPI_Waitall(2, request, status);~~

~~             MPI_Comm_free(&the_comm);          }~~

~~         MPI_Group_free(&group_world);          MPI_Group_free(&subgroup);          MPI_Finalize();          return 0;        }~~

==(code block added)==
``` [MPI]C
#define TAG_ARBITRARY 12345
#define SOME_COUNT       50

int main(int argc, char *argv[])
{
  int me;
  MPI_Request request[2];
  MPI_Status status[2];
  MPI_Group group_world, subgroup;
  int ranks[] = {2, 4, 6, 8};
  MPI_Comm the_comm;
  ...
  MPI_Init(&argc, &argv);
  MPI_Comm_group(MPI_COMM_WORLD, &group_world);

  MPI_Group_incl(group_world, 4, ranks, &subgroup); /* local */
  MPI_Group_rank(subgroup, &me);     /* local */

  MPI_Comm_create(MPI_COMM_WORLD, subgroup, &the_comm);

  if(me != MPI_UNDEFINED)
  {
      MPI_Irecv(buff1, count, MPI_DOUBLE, MPI_ANY_SOURCE,
                        TAG_ARBITRARY, the_comm, request);
      MPI_Isend(buff2, count, MPI_DOUBLE, (me+1)%4, TAG_ARBITRARY,
                        the_comm, request+1);
      for(i = 0; i < SOME_COUNT; i++)
          MPI_Reduce(..., the_comm);
      MPI_Waitall(2, request, status);

      MPI_Comm_free(&the_comm);
  }

  MPI_Group_free(&group_world);
  MPI_Group_free(&subgroup);
  MPI_Finalize();
  return 0;
}
```

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Communication Safety Example]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Communication Safety Example]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Communication Safety Example]]
