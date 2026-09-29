---
title: "Example 2: Three-Group “Ring”"
chapter: context
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Example 2: Three-Group “Ring”

Chapter **context** · in [[versions/v31/sections/context#Example 2: Three-Group “Ring”|MPI-3.1]], [[versions/v40/sections/context#Example 2: Three-Group “Ring”|MPI-4.0]], [[versions/v41/sections/context#Example 2: Three-Group “Ring”|MPI-4.1]], [[versions/v50/sections/context#Example 2: Three-Group “Ring”|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==int== main(int argc, char **argv) { MPI_Comm myComm; /* intra-communicator of local sub-group */ MPI_Comm myFirstComm; /* inter-communicators */ MPI_Comm mySecondComm; MPI_Status status; int membershipKey; int rank;

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

*Figure: Three-group ~~ring.*~~ ==ring*==

int main(int argc, char ~~**argv)~~ ==*argv[])== { MPI_Comm myComm; /* intra-communicator of local sub-group */ MPI_Comm myFirstComm; /* inter-communicators */ MPI_Comm mySecondComm; ~~MPI_Status status;~~ int membershipKey; int rank;

/* Then free communicators before terminating... */ MPI_Comm_free(&myFirstComm); MPI_Comm_free(&mySecondComm); MPI_Comm_free(&myComm); MPI_Finalize(); ==return 0;== }

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~Groups~~ ==As shown in Figure [[versions/v40/sections/context#Example 2: Three-Group “Ring”|Example 2: Three-Group “Ring”]] , groups== 0 and 1 communicate. Groups 1 and 2 communicate. Groups 0 and 2 communicate. Therefore, each requires two inter-communicators.

/* Build inter-communicators. Tags are hard-coded. */ if (membershipKey == 0) { /* Group 0 communicates with groups 1 and 2. */ ~~MPI_Intercomm_create( myComm,~~ ==MPI_Intercomm_create(myComm,== 0, MPI_COMM_WORLD, 1, 1, &myFirstComm); ~~MPI_Intercomm_create( myComm,~~ ==MPI_Intercomm_create(myComm,== 0, MPI_COMM_WORLD, 2, 2, &mySecondComm); } else if (membershipKey == 1) { /* Group 1 communicates with groups 0 and 2. */ ~~MPI_Intercomm_create( myComm,~~ ==MPI_Intercomm_create(myComm,== 0, MPI_COMM_WORLD, 0, 1, &myFirstComm); ~~MPI_Intercomm_create( myComm,~~ ==MPI_Intercomm_create(myComm,== 0, MPI_COMM_WORLD, 2, 12, &mySecondComm); } else if (membershipKey == 2) { /* Group 2 communicates with groups 0 and 1. */ ~~MPI_Intercomm_create( myComm,~~ ==MPI_Intercomm_create(myComm,== 0, MPI_COMM_WORLD, 0, 2, &myFirstComm); ~~MPI_Intercomm_create( myComm,~~ ==MPI_Intercomm_create(myComm,== 0, MPI_COMM_WORLD, 1, 12, &mySecondComm); }

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~       int main(int argc, char *argv[])        {          MPI_Comm   myComm;      /* intra-communicator of local sub-group */          MPI_Comm   myFirstComm; /* inter-communicators */          MPI_Comm   mySecondComm;          int membershipKey;          int rank;~~

~~         MPI_Init(&argc, &argv);          MPI_Comm_rank(MPI_COMM_WORLD, &rank);          ...~~

~~         /* User code must generate membershipKey in the range [0, 1, 2] */          membershipKey = rank % 3;~~

~~         /* Build intra-communicator for local sub-group */          MPI_Comm_split(MPI_COMM_WORLD, membershipKey, rank, &myComm);~~

~~         /* Build inter-communicators.  Tags are hard-coded. */          if (membershipKey == 0)          {             /* Group 0 communicates with groups 1 and 2. */            MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 1,                                 1, &myFirstComm);            MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 2,                                 2, &mySecondComm);          }          else if (membershipKey == 1)          {         /* Group 1 communicates with groups 0 and 2. */            MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 0,                                 1, &myFirstComm);            MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 2,                                 12, &mySecondComm);          }          else if (membershipKey == 2)          {        /* Group 2 communicates with groups 0 and 1. */            MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 0,                                 2, &myFirstComm);            MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 1,                                 12, &mySecondComm);          }~~

~~         /* Do some work ... */~~

~~         /* Then free communicators before terminating... */          MPI_Comm_free(&myFirstComm);          MPI_Comm_free(&mySecondComm);          MPI_Comm_free(&myComm);          MPI_Finalize();          return 0;        }~~

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
  MPI_Comm   myComm;      /* intra-communicator of local sub-group */
  MPI_Comm   myFirstComm; /* inter-communicators */
  MPI_Comm   mySecondComm;
  int membershipKey;
  int rank;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  ...

  /* User code must generate membershipKey in the range [0, 1, 2] */
  membershipKey = rank % 3;

  /* Build intra-communicator for local sub-group */
  MPI_Comm_split(MPI_COMM_WORLD, membershipKey, rank, &myComm);

  /* Build inter-communicators. Tags are hard-coded. */
  if (membershipKey == 0)
  {             /* Group 0 communicates with groups 1 and 2. */
    MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 1,
                         1, &myFirstComm);
    MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 2,
                         2, &mySecondComm);
  }
  else if (membershipKey == 1)
  {         /* Group 1 communicates with groups 0 and 2. */
    MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 0,
                         1, &myFirstComm);
    MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 2,
                         12, &mySecondComm);
  }
  else if (membershipKey == 2)
  {        /* Group 2 communicates with groups 0 and 1. */
    MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 0,
                         2, &myFirstComm);
    MPI_Intercomm_create(myComm, 0, MPI_COMM_WORLD, 1,
                         12, &mySecondComm);
  }

  /* Do some work ... */

  /* Then free communicators before terminating... */
  MPI_Comm_free(&myFirstComm);
  MPI_Comm_free(&mySecondComm);
  MPI_Comm_free(&myComm);
  MPI_Finalize();
  return 0;
}
```

## Text by release

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Example 2: Three-Group “Ring”]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Example 2: Three-Group “Ring”]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Example 2: Three-Group “Ring”]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Example 2: Three-Group “Ring”]]
