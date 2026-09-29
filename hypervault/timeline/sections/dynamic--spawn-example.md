---
title: "Spawn Example"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Spawn Example

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Spawn Example|MPI-2.0]], [[versions/v21/sections/dynamic#Spawn Example|MPI-2.1]], [[versions/v22/sections/dynamic#Spawn Example|MPI-2.2]], [[versions/v30/sections/dynamic#Spawn Example|MPI-3.0]], [[versions/v31/sections/dynamic#Spawn Example|MPI-3.1]], [[versions/v40/sections/dynamic#Spawn Example|MPI-4.0]], [[versions/v41/sections/dynamic#Spawn Example|MPI-4.1]], [[versions/v50/sections/dynamic#Spawn Example|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

==Manager-worker Example Using [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]]==

==    /* manager */     #include <stdio.h>     #include "mpi.h"     int main(int argc, char *argv[])     {        int world_size, universe_size, *universe_sizep, flag;        MPI_Comm everyone;           /* inter-communicator */        char worker_program[100];==

==       MPI_Init(&argc, &argv);        MPI_Comm_size(MPI_COMM_WORLD, &world_size);==

==       if (world_size != 1)    error("Top heavy with management");==

==       MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_UNIVERSE_SIZE,                           &universe_sizep, &flag);         if (!flag) {             printf("This MPI does not support UNIVERSE_SIZE. How many\n\     processes total?");             scanf("%d", &universe_size);        } else universe_size = *universe_sizep;        if (universe_size == 1) error("No room to start workers");==

==       /*          * Now spawn the workers. Note that there is a run-time determination         * of what type of worker to spawn, and presumably this calculation must         * be done at run time and cannot be calculated before starting         * the program. If everything is known when the application is          * first started, it is generally better to start them all at once         * in a single MPI_COMM_WORLD.          */==

==       choose_worker_program(worker_program);        MPI_Comm_spawn(worker_program, MPI_ARGV_NULL, universe_size-1,                   MPI_INFO_NULL, 0, MPI_COMM_SELF, &everyone,                   MPI_ERRCODES_IGNORE);        /*         * Parallel code here. The communicator "everyone" can be used         * to communicate with the spawned processes, which have ranks 0,..         * MPI_UNIVERSE_SIZE-1 in the remote group of the inter-communicator         * "everyone".         */==

==       MPI_Finalize();        return 0;     }==

==    /* worker */==

==    #include "mpi.h"     int main(int argc, char *argv[])     {        int size;        MPI_Comm parent;        MPI_Init(&argc, &argv);        MPI_Comm_get_parent(&parent);        if (parent == MPI_COMM_NULL) error("No parent!");        MPI_Comm_remote_size(parent, &size);        if (size != 1) error("Something's wrong with the parent");==

==       /*         * Parallel code here.          * The manager is represented as the process with rank 0 in (the remote         * group of) the parent communicator.  If the workers need to communicate         * among themselves, they can use MPI_COMM_WORLD.         */==

==       MPI_Finalize();        return 0;     }==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    /* manager */     #include <stdio.h>     #include "mpi.h"     int main(int argc, char *argv[])     {        int world_size, universe_size, *universe_sizep, flag;        MPI_Comm everyone;           /* inter-communicator */        char worker_program[100];~~

~~       MPI_Init(&argc, &argv);        MPI_Comm_size(MPI_COMM_WORLD, &world_size);~~

~~       if (world_size != 1)    error("Top heavy with management");~~

~~       MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_UNIVERSE_SIZE,                           &universe_sizep, &flag);         if (!flag) {             printf("This MPI does not support UNIVERSE_SIZE. How many\n\     processes total?");             scanf("%d", &universe_size);        } else universe_size = *universe_sizep;        if (universe_size == 1) error("No room to start workers");~~

~~       /*          * Now spawn the workers. Note that there is a run-time determination         * of what type of worker to spawn, and presumably this calculation must         * be done at run time and cannot be calculated before starting         * the program. If everything is known when the application is          * first started, it is generally better to start them all at once         * in a single MPI_COMM_WORLD.          */~~

~~       choose_worker_program(worker_program);        MPI_Comm_spawn(worker_program, MPI_ARGV_NULL, universe_size-1,                   MPI_INFO_NULL, 0, MPI_COMM_SELF, &everyone,                   MPI_ERRCODES_IGNORE);        /*         * Parallel code here. The communicator "everyone" can be used         * to communicate with the spawned processes, which have ranks 0,..         * MPI_UNIVERSE_SIZE-1 in the remote group of the inter-communicator         * "everyone".         */~~

~~       MPI_Finalize();        return 0;     }~~

~~    /* worker */~~

~~    #include "mpi.h"     int main(int argc, char *argv[])     {        int size;        MPI_Comm parent;        MPI_Init(&argc, &argv);        MPI_Comm_get_parent(&parent);        if (parent == MPI_COMM_NULL) error("No parent!");        MPI_Comm_remote_size(parent, &size);        if (size != 1) error("Something's wrong with the parent");~~

~~       /*         * Parallel code here.          * The manager is represented as the process with rank 0 in (the remote         * group of) the parent communicator.  If the workers need to communicate         * among themselves, they can use MPI_COMM_WORLD.         */~~

~~       MPI_Finalize();        return 0;     }~~

==(code block added)==
``` [MPI]C
/* manager */
#include <stdio.h>
#include "mpi.h"
int main(int argc, char *argv[])
{
   int world_size, universe_size, *universe_sizep, flag;
   MPI_Comm everyone;           /* inter-communicator */
   char worker_program[100];

   MPI_Init(&argc, &argv);
   MPI_Comm_size(MPI_COMM_WORLD, &world_size);

   if (world_size != 1)    error("Top heavy with management");

   MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_UNIVERSE_SIZE,
                     &universe_sizep, &flag);
   if (!flag) {
        printf("This MPI does not support UNIVERSE_SIZE. How many\n\
processes total?");
        scanf("%d", &universe_size);
   } else universe_size = *universe_sizep;
   if (universe_size == 1) error("No room to start workers");

   /*
    * Now spawn the workers. Note that there is a run-time determination
    * of what type of worker to spawn, and presumably this calculation
    * must be done at run time and cannot be calculated before starting
    * the program. If everything is known when the application is
    * first started, it is generally better to start them all at once
    * in a single MPI_COMM_WORLD.
    */

   choose_worker_program(worker_program);
   MPI_Comm_spawn(worker_program, MPI_ARGV_NULL, universe_size-1,
                  MPI_INFO_NULL, 0, MPI_COMM_SELF, &everyone,
                  MPI_ERRCODES_IGNORE);
   /*
    * Parallel code here. The communicator "everyone" can be used
    * to communicate with the spawned processes, which have ranks 0,..
    * MPI_UNIVERSE_SIZE-1 in the remote group of the inter-communicator
    * "everyone".
    */

   MPI_Finalize();
   return 0;
}
```

==(code block added)==
``` [MPI]C
/* worker */

#include "mpi.h"
int main(int argc, char *argv[])
{
   int size;
   MPI_Comm parent;
   MPI_Init(&argc, &argv);
   MPI_Comm_get_parent(&parent);
   if (parent == MPI_COMM_NULL) error("No parent!");
   MPI_Comm_remote_size(parent, &size);
   if (size != 1) error("Something's wrong with the parent");

   /*
    * Parallel code here.
    * The manager is represented as the process with rank 0 in (the
    * remote group of) the parent communicator.  If the workers need
    * to communicate among themselves, they can use MPI_COMM_WORLD.
    */

   MPI_Finalize();
   return 0;
}
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~(code block removed)~~
``` [MPI]C
/* manager */
#include <stdio.h>
#include "mpi.h"
int main(int argc, char *argv[])
{
   int world_size, universe_size, *universe_sizep, flag;
   MPI_Comm everyone;           /* inter-communicator */
   char worker_program[100];

   MPI_Init(&argc, &argv);
   MPI_Comm_size(MPI_COMM_WORLD, &world_size);

   if (world_size != 1)    error("Top heavy with management");

   MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_UNIVERSE_SIZE,
                     &universe_sizep, &flag);
   if (!flag) {
        printf("This MPI does not support UNIVERSE_SIZE. How many\n\
processes total?");
        scanf("%d", &universe_size);
   } else universe_size = *universe_sizep;
   if (universe_size == 1) error("No room to start workers");

   /*
    * Now spawn the workers. Note that there is a run-time determination
    * of what type of worker to spawn, and presumably this calculation
    * must be done at run time and cannot be calculated before starting
    * the program. If everything is known when the application is
    * first started, it is generally better to start them all at once
    * in a single MPI_COMM_WORLD.
    */

   choose_worker_program(worker_program);
   MPI_Comm_spawn(worker_program, MPI_ARGV_NULL, universe_size-1,
                  MPI_INFO_NULL, 0, MPI_COMM_SELF, &everyone,
                  MPI_ERRCODES_IGNORE);
   /*
    * Parallel code here. The communicator "everyone" can be used
    * to communicate with the spawned processes, which have ranks 0,..
    * MPI_UNIVERSE_SIZE-1 in the remote group of the inter-communicator
    * "everyone".
    */

   MPI_Finalize();
   return 0;
}
```

==(code block added)==
``` [MPI]C
/* manager */
#include <stdio.h>
#include "mpi.h"
int main(int argc, char *argv[])
{
   int world_size, universe_size, *universe_sizep, flag;
   MPI_Comm everyone;           /* inter-communicator */
   char worker_program[100];

   MPI_Init(&argc, &argv);
   MPI_Comm_size(MPI_COMM_WORLD, &world_size);

   if (world_size != 1)    error("Top heavy with management");

   MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_UNIVERSE_SIZE,
                     &universe_sizep, &flag);
   if (!flag) {
        printf("This MPI does not support UNIVERSE_SIZE.\n"
               "How many processes total?");
        scanf("%d", &universe_size);
   } else universe_size = *universe_sizep;
   if (universe_size == 1) error("No room to start workers");

   /*
    * Now spawn the workers. Note that there is a run-time determination
    * of what type of worker to spawn, and presumably this calculation
    * must be done at run time and cannot be calculated before starting
    * the program. If everything is known when the application is
    * first started, it is generally better to start them all at once
    * in a single MPI_COMM_WORLD.
    */

   choose_worker_program(worker_program);
   MPI_Comm_spawn(worker_program, MPI_ARGV_NULL, universe_size-1,
                  MPI_INFO_NULL, 0, MPI_COMM_SELF, &everyone,
                  MPI_ERRCODES_IGNORE);
   /*
    * Parallel code here. The communicator "everyone" can be used
    * to communicate with the spawned processes, which have ranks 0,..
    * MPI_UNIVERSE_SIZE-1 in the remote group of the inter-communicator
    * "everyone".
    */

   MPI_Finalize();
   return 0;
}
```

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Spawn Example]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Spawn Example]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Spawn Example]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Spawn Example]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Spawn Example]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Spawn Example]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Spawn Example]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Spawn Example]]
