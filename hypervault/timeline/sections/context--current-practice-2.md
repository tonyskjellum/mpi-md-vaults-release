---
title: "Current Practice \#2"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Current Practice \#2

Chapter **context** · in [[versions/v13/sections/context#Current Practice \#2|MPI-1.3]], [[versions/v21/sections/context#Current Practice \#2|MPI-2.1]], [[versions/v22/sections/context#Current Practice \#2|MPI-2.2]], [[versions/v30/sections/context#Current Practice \#2|MPI-3.0]], [[versions/v31/sections/context#Current Practice \#2|MPI-3.1]], [[versions/v40/sections/context#Current Practice \#2|MPI-4.0]], [[versions/v41/sections/context#Current Practice \#2|MPI-4.1]], [[versions/v50/sections/context#Current Practice \#2|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~main(int argc, char **argv)        {          int me, count;          void *data;          ...          MPI_Init(&argc, &argv);          MPI_Comm_rank(MPI_COMM_WORLD, &me);~~

==main(int argc, char **argv)        {          int me, count;          void *data;          ...==

==         MPI_Init(&argc, &argv);          MPI_Comm_rank(MPI_COMM_WORLD, &me);==

~~         ...          MPI_Finalize();        }~~

==         ...==

==         MPI_Finalize();        }==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==int== main(int argc, char **argv) { int me, count; void *data; ...

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

int main(int argc, char ~~**argv)~~ ==*argv[])== { int me, count; void *data; ...

~~         ...~~

~~         MPI_Finalize();        }~~

==         ...          MPI_Finalize();          return 0;        }==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~This example~~ ==Example [[versions/v40/sections/context#Current Practice \ 2|Current Practice \ 2]]== illustrates the use of a collective communication.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~int main(int argc, char *argv[])        {          int me, count;          void *data;          ...~~

~~         MPI_Init(&argc, &argv);          MPI_Comm_rank(MPI_COMM_WORLD, &me);~~

~~         if(me == 0)          {              /* get input, create buffer ``data'' */              ...          }~~

~~         MPI_Bcast(data, count, MPI_BYTE, 0, MPI_COMM_WORLD);~~

~~         ...          MPI_Finalize();          return 0;        }~~

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
  int me, count;
  void *data;
  ...

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &me);

  if(me == 0)
  {
      /* get input, create buffer ``data'' */
      ...
  }

  MPI_Bcast(data, count, MPI_BYTE, 0, MPI_COMM_WORLD);

  ...
  MPI_Finalize();
  return 0;
}
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Current Practice \#2]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Current Practice \#2]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Current Practice \#2]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Current Practice \#2]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Current Practice \#2]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Current Practice \#2]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Current Practice \#2]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Current Practice \#2]]
