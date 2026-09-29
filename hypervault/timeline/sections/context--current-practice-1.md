---
title: "Current Practice \#1"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Current Practice \#1

Chapter **context** · in [[versions/v13/sections/context#Current Practice \#1|MPI-1.3]], [[versions/v21/sections/context#Current Practice \#1|MPI-2.1]], [[versions/v22/sections/context#Current Practice \#1|MPI-2.2]], [[versions/v30/sections/context#Current Practice \#1|MPI-3.0]], [[versions/v31/sections/context#Current Practice \#1|MPI-3.1]], [[versions/v40/sections/context#Current Practice \#1|MPI-4.0]], [[versions/v41/sections/context#Current Practice \#1|MPI-4.1]], [[versions/v50/sections/context#Current Practice \#1|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

if((me % 2) == 0) { /* send unless highest-numbered process */ if((me + 1) < size) MPI_Send(..., me + 1, SOME_TAG, MPI_COMM_WORLD); } else MPI_Recv(..., me - 1, SOME_TAG, ~~MPI_COMM_WORLD);~~ ==MPI_COMM_WORLD, &status);==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

==int== main(int argc, char **argv) { int me, size; ... MPI_Init ( &argc, &argv ); MPI_Comm_rank (MPI_COMM_WORLD, &me); MPI_Comm_size (MPI_COMM_WORLD, &size);

==int== main(int argc, char **argv) { int me, size; int SOME_TAG = 0; ... MPI_Init(&argc, &argv);

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~       int main(int argc, char **argv)        {          int me, size;          ...          MPI_Init ( &argc, &argv );          MPI_Comm_rank (MPI_COMM_WORLD, &me);          MPI_Comm_size (MPI_COMM_WORLD, &size);~~

~~         (void)printf ("Process %d size %d\n", me, size);          ...          MPI_Finalize();        }~~

~~Example \#1a is a do-nothing program that initializes itself legally,~~

~~and refers to the “all” communicator, and prints a message. It terminates itself legally too. This example does not imply that MPI supports `printf`-like communication itself.~~

==       int main(int argc, char *argv[])        {          int me, size;          ...          MPI_Init ( &argc, &argv );          MPI_Comm_rank (MPI_COMM_WORLD, &me);          MPI_Comm_size (MPI_COMM_WORLD, &size);==

==         (void)printf ("Process %d size %d\n", me, size);          ...          MPI_Finalize();          return 0;        }==

==Example \#1a is a do-nothing program that initializes itself, and refers to the “all” communicator, and prints a message. It terminates itself too. This example does not imply that MPI supports `printf`-like communication itself.==

int main(int argc, char ~~**argv)~~ ==*argv[])== { int me, size; int SOME_TAG = 0; ... MPI_Init(&argc, &argv);

... MPI_Finalize(); ==return 0;== }

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~Example \#1a:~~ ==Parallel output of a message==

int main(int argc, char *argv[]) { int me, size; ... ~~MPI_Init ( &argc, &argv ); MPI_Comm_rank (MPI_COMM_WORLD,~~ ==MPI_Init(&argc, &argv); MPI_Comm_rank(MPI_COMM_WORLD,== &me); ~~MPI_Comm_size (MPI_COMM_WORLD,~~ ==MPI_Comm_size(MPI_COMM_WORLD,== &size);

~~(void)printf ("Process~~ ==(void)printf("Process== %d size %d\n", me, size); ... MPI_Finalize(); return 0; }

Example ~~\#1a~~ ==[[versions/v40/sections/context#Current Practice \ 1|Current Practice \ 1]]== is a do-nothing program that initializes itself, and refers to the “all” communicator, and prints a message. It terminates itself too. This example does not imply that MPI supports `printf`-like communication itself.

~~Example \#1b~~ ==Message exchange== (supposing that `size` is ~~even):~~ ==even)==

Example ~~\#1b~~ ==[[versions/v40/sections/context#Current Practice \ 1|Current Practice \ 1]]== schematically illustrates message exchanges between “even” and “odd” processes in the “all” communicator.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~       int main(int argc, char *argv[])        {          int me, size;          ...          MPI_Init(&argc, &argv);          MPI_Comm_rank(MPI_COMM_WORLD, &me);          MPI_Comm_size(MPI_COMM_WORLD, &size);~~

~~         (void)printf("Process %d size %d\n", me, size);          ...          MPI_Finalize();          return 0;        }~~

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
  int me, size;
  ...
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  (void)printf("MPI process %d size %d\n", me, size);
  ...
  MPI_Finalize();
  return 0;
}
```

~~        int main(int argc, char *argv[])         {            int me, size;            int SOME_TAG = 0;            ...            MPI_Init(&argc, &argv);~~

~~           MPI_Comm_rank(MPI_COMM_WORLD, &me);   /* local */            MPI_Comm_size(MPI_COMM_WORLD, &size); /* local */~~

~~           if((me % 2) == 0)            {               /* send unless highest-numbered process */               if((me + 1) < size)                  MPI_Send(..., me + 1, SOME_TAG, MPI_COMM_WORLD);            }            else               MPI_Recv(..., me - 1, SOME_TAG, MPI_COMM_WORLD, &status);~~

~~           ...            MPI_Finalize();            return 0;         }~~

~~Example [[versions/v41/sections/context#Current Practice \ 1|Current Practice \ 1]] schematically illustrates message exchanges between “even” and “odd” processes in the “all” communicator.~~

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
   int me, size;
   int SOME_TAG = 0;
   ...
   MPI_Init(&argc, &argv);

   MPI_Comm_rank(MPI_COMM_WORLD, &me);   /* local */
   MPI_Comm_size(MPI_COMM_WORLD, &size); /* local */

   if((me % 2) == 0)
   {
      /* send unless highest-numbered MPI process */
      if((me + 1) < size)
         MPI_Send(..., me + 1, SOME_TAG, MPI_COMM_WORLD);
   }
   else
      MPI_Recv(..., me - 1, SOME_TAG, MPI_COMM_WORLD, &status);

   ...
   MPI_Finalize();
   return 0;
}
```

==Example [[versions/v41/sections/context#Current Practice \ 1|Current Practice \ 1]] schematically illustrates message exchanges between “even” and “odd” MPI processes in the “all” communicator.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~(code block removed)~~
``` [MPI]C
int main(int argc, char *argv[])
{
  int me, size;
  ...
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  (void)printf("MPI process %d size %d\n", me, size);
  ...
  MPI_Finalize();
  return 0;
}
```

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
  int me, size;
  ...
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &me);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  printf("MPI process %d size %d\n", me, size);
  ...
  MPI_Finalize();
  return 0;
}
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Current Practice \#1]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Current Practice \#1]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Current Practice \#1]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Current Practice \#1]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Current Practice \#1]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Current Practice \#1]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Current Practice \#1]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Current Practice \#1]]
