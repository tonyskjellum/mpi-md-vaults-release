---
title: "Attributes Example"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Attributes Example

Chapter **context** · in [[versions/v13/sections/context#Attributes Example|MPI-1.3]], [[versions/v21/sections/context#Attributes Example|MPI-2.1]], [[versions/v22/sections/context#Attributes Example|MPI-2.2]], [[versions/v30/sections/context#Attributes Example|MPI-3.0]], [[versions/v31/sections/context#Attributes Example|MPI-3.1]], [[versions/v40/sections/context#Attributes Example|MPI-4.0]], [[versions/v41/sections/context#Attributes Example|MPI-4.1]], [[versions/v50/sections/context#Attributes Example|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

if (gop_key == MPI_KEYVAL_INVALID) /* get a key on first call ever */ { if ( ! ~~MPI_Keyval_create(~~ ==MPI_Comm_create_keyval(== gop_stuff_copier, gop_stuff_destructor, &gop_key, (void *)0)); /* get the key while assigning its copy and delete callback behavior. */

~~MPI_Attr_get~~ ==MPI_Comm_get_attr== (comm, gop_key, &gop_stuff, &foundflag); if (foundflag) { /* This module has executed in this group before. We will use the cached information */ } else { /* This is a group that we have not yet cached anything in. We will now do so. */

/* Third, store gop_stuff as the attribute value */ ~~MPI_Attr_put~~ ==MPI_Comm_set_attr== ( comm, gop_key, gop_stuff); } /* Then, in any case, use contents of *gop_stuff to do the global op ... */ }

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

> This example shows how to write a collective communication operation that uses caching to be more efficient after the first call. ~~The coding style assumes that MPI function results return only error statuses.~~

==void== Efficient_Collective_Op ~~(comm,~~ ==(MPI_Comm comm,== ...) ~~MPI_Comm comm;~~ { gop_stuff_type *gop_stuff; MPI_Group group; int foundflag;

/* Third, store gop_stuff as the attribute value */ MPI_Comm_set_attr ~~( comm,~~ ==(comm,== gop_key, gop_stuff); } /* Then, in any case, use contents of *gop_stuff to do the global op ... */ }

==int== gop_stuff_destructor ~~(comm,~~ ==(MPI_Comm comm, int== keyval, ~~gop_stuff, extra) MPI_Comm comm; int keyval;~~ ==void *gop_stuffP, void *extra) {== gop_stuff_type ~~*gop_stuff; void *extra; {~~ ==*gop_stuff = (gop_stuff_type *)gop_stuffP;== if (keyval != gop_key) { /* abort -- programming error */ }

/* If no references remain, then free the storage */ if (gop_stuff -> ref_count == 0) { free((void *)gop_stuff); } ==return MPI_SUCCESS;== }

/* The following routine is called by MPI when a group is copied */ ==int== gop_stuff_copier ~~(comm,~~ ==(MPI_Comm comm, int== keyval, ~~extra, gop_stuff_in, gop_stuff_out, flag) MPI_Comm comm;~~ ==void *extra, void *gop_stuff_inP, void *gop_stuff_outP,== int ~~keyval;~~ ==*flag) {== gop_stuff_type ~~*gop_stuff_in, *gop_stuff_out; void *extra; {~~ ==*gop_stuff_in = (gop_stuff_type *)gop_stuff_inP; gop_stuff_type **gop_stuff_out = (gop_stuff_type **)gop_stuff_outP;== if (keyval != gop_key) { /* abort -- programming error */ }

/* The new group adds one reference to this gop_stuff */ ~~gop_stuff~~ ==gop_stuff_in== -> ref_count += 1; ~~gop_stuff_out~~ ==*gop_stuff_out== = gop_stuff_in; ==return MPI_SUCCESS;== }

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~         if (gop_key == MPI_KEYVAL_INVALID) /* get a key on first call ever */          {            if ( ! MPI_Comm_create_keyval( gop_stuff_copier,                                     gop_stuff_destructor,                                     &gop_key, (void *)0));            /* get the key while assigning its copy and delete callback               behavior. */~~

~~           MPI_Abort (comm, 99);          }~~

==         if (gop_key == MPI_KEYVAL_INVALID) /* get a key on first call ever */          {            if ( ! MPI_Comm_create_keyval( gop_stuff_copier,                                     gop_stuff_destructor,                                     &gop_key, (void *)0) ) {            /* get the key while assigning its copy and delete callback               behavior. */            } else                MPI_Abort (comm, 99);          }==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

void ~~Efficient_Collective_Op (MPI_Comm~~ ==Efficient_Collective_Op(MPI_Comm== comm, ...) { gop_stuff_type *gop_stuff; MPI_Group group; int foundflag;

if (gop_key == MPI_KEYVAL_INVALID) /* get a key on first call ever */ { if ( ! ~~MPI_Comm_create_keyval( gop_stuff_copier,~~ ==MPI_Comm_create_keyval(gop_stuff_copier,== gop_stuff_destructor, &gop_key, ~~(void *)0) )~~ ==NULL))== { /* get the key while assigning its copy and delete callback behavior. */ } else ~~MPI_Abort (comm,~~ ==MPI_Abort(comm,== 99); }

~~MPI_Comm_get_attr (comm,~~ ==MPI_Comm_get_attr(comm,== gop_key, &gop_stuff, &foundflag); if (foundflag) { /* This module has executed in this group before. We will use the cached information */ } else { /* This is a group that we have not yet cached anything in. We will now do so. */

gop_stuff = (gop_stuff_type *) ~~malloc (sizeof(gop_stuff_type));~~ ==malloc(sizeof(gop_stuff_type));== if (gop_stuff == NULL) { /* abort on out-of-memory error */ }

~~gop_stuff -> ref_count~~ ==gop_stuff->ref_count== = 1;

/* Third, store gop_stuff as the attribute value */ ~~MPI_Comm_set_attr (comm,~~ ==MPI_Comm_set_attr(comm,== gop_key, gop_stuff); } /* Then, in any case, use contents of *gop_stuff to do the global op ... */ }

int ~~gop_stuff_destructor (MPI_Comm~~ ==gop_stuff_destructor(MPI_Comm== comm, int keyval, void *gop_stuffP, void *extra) { gop_stuff_type *gop_stuff = (gop_stuff_type *)gop_stuffP; if (keyval != gop_key) { /* abort -- programming error */ }

/* The group's being freed removes one reference to gop_stuff */ ~~gop_stuff -> ref_count~~ ==gop_stuff->ref_count== -= 1;

/* If no references remain, then free the storage */ if ~~(gop_stuff -> ref_count~~ ==(gop_stuff->ref_count== == 0) { free((void *)gop_stuff); } return MPI_SUCCESS; }

/* The following routine is called by MPI when a group is copied */ int ~~gop_stuff_copier (MPI_Comm~~ ==gop_stuff_copier(MPI_Comm== comm, int keyval, void *extra, void *gop_stuff_inP, void *gop_stuff_outP, int *flag) { gop_stuff_type *gop_stuff_in = (gop_stuff_type *)gop_stuff_inP; gop_stuff_type **gop_stuff_out = (gop_stuff_type **)gop_stuff_outP; if (keyval != gop_key) { /* abort -- programming error */ }

/* The new group adds one reference to this gop_stuff */ ~~gop_stuff_in -> ref_count~~ ==gop_stuff_in->ref_count== += 1; *gop_stuff_out = gop_stuff_in; return MPI_SUCCESS; }

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~       /* key for this module's stuff: */        static int gop_key = MPI_KEYVAL_INVALID;~~

~~       typedef struct        {           int ref_count;          /* reference count */           /* other stuff, whatever else we want */        } gop_stuff_type;~~

~~       void Efficient_Collective_Op(MPI_Comm comm, ...)        {          gop_stuff_type *gop_stuff;          MPI_Group       group;          int             foundflag;~~

~~         MPI_Comm_group(comm, &group);~~

~~         if (gop_key == MPI_KEYVAL_INVALID) /* get a key on first call ever */          {            if ( ! MPI_Comm_create_keyval(gop_stuff_copier,                                     gop_stuff_destructor,                                     &gop_key, NULL)) {            /* get the key while assigning its copy and delete callback               behavior. */            } else                MPI_Abort(comm, 99);          }~~

~~         MPI_Comm_get_attr(comm, gop_key, &gop_stuff, &foundflag);          if (foundflag)          { /* This module has executed in this group before.               We will use the cached information */          }          else          { /* This is a group that we have not yet cached anything in.               We will now do so.            */~~

~~           /* First, allocate storage for the stuff we want,               and initialize the reference count */~~

~~           gop_stuff = (gop_stuff_type *) malloc(sizeof(gop_stuff_type));            if (gop_stuff == NULL) { /* abort on out-of-memory error */ }~~

~~           gop_stuff->ref_count = 1;~~

~~           /* Second, fill in *gop_stuff with whatever we want.               This part isn't shown here */~~

~~           /* Third, store gop_stuff as the attribute value */            MPI_Comm_set_attr(comm, gop_key, gop_stuff);          }          /* Then, in any case, use contents of *gop_stuff             to do the global op ... */        }~~

~~       /* The following routine is called by MPI when a group is freed */~~

~~       int gop_stuff_destructor(MPI_Comm comm, int keyval, void *gop_stuffP,                                  void *extra)        {          gop_stuff_type *gop_stuff = (gop_stuff_type *)gop_stuffP;          if (keyval != gop_key) { /* abort -- programming error */ }~~

~~         /* The group's being freed removes one reference to gop_stuff */          gop_stuff->ref_count -= 1;~~

~~         /* If no references remain, then free the storage */          if (gop_stuff->ref_count == 0) {            free((void *)gop_stuff);          }          return MPI_SUCCESS;        }~~

~~       /* The following routine is called by MPI when a group is copied */        int gop_stuff_copier(MPI_Comm comm, int keyval, void *extra,                        void *gop_stuff_inP, void *gop_stuff_outP, int *flag)        {          gop_stuff_type *gop_stuff_in = (gop_stuff_type *)gop_stuff_inP;          gop_stuff_type **gop_stuff_out = (gop_stuff_type **)gop_stuff_outP;          if (keyval != gop_key) { /* abort -- programming error */ }~~

~~         /* The new group adds one reference to this gop_stuff */          gop_stuff_in->ref_count += 1;          *gop_stuff_out = gop_stuff_in;          return MPI_SUCCESS;        }~~

==(code block added)==
``` [MPI]C
/* key for this module's stuff: */
static int gop_key = MPI_KEYVAL_INVALID;

typedef struct
{
   int ref_count;          /* reference count */
   /* other stuff, whatever else we want */
} gop_stuff_type;

void Efficient_Collective_Op(MPI_Comm comm, ...)
{
  gop_stuff_type *gop_stuff;
  MPI_Group       group;
  int             foundflag;

  MPI_Comm_group(comm, &group);

  if (gop_key == MPI_KEYVAL_INVALID) /* get a key on first call ever */
  {
    if ( ! MPI_Comm_create_keyval(gop_stuff_copier,
                             gop_stuff_destructor,
                             &gop_key, NULL)) {
    /* get the key while assigning its copy and delete callback
       behavior. */
    } else
        MPI_Abort(comm, 99);
  }

  MPI_Comm_get_attr(comm, gop_key, &gop_stuff, &foundflag);
  if (foundflag)
  { /* This module has executed in this group before.
       We will use the cached information */
  }
  else
  { /* This is a group that we have not yet cached anything in.
       We will now do so.
    */

    /* First, allocate storage for the stuff we want,
       and initialize the reference count */

    gop_stuff = (gop_stuff_type *) malloc(sizeof(gop_stuff_type));
    if (gop_stuff == NULL) { /* abort on out-of-memory error */ }

    gop_stuff->ref_count = 1;

    /* Second, fill in *gop_stuff with whatever we want.
       This part isn't shown here */

    /* Third, store gop_stuff as the attribute value */
    MPI_Comm_set_attr(comm, gop_key, gop_stuff);
  }
  /* Then, in any case, use contents of *gop_stuff
     to do the global op ... */
}

/* The following routine is called by MPI when a group is freed */

int gop_stuff_destructor(MPI_Comm comm, int keyval, void *gop_stuffP, 
                         void *extra)
{
  gop_stuff_type *gop_stuff = (gop_stuff_type *)gop_stuffP;
  if (keyval != gop_key) { /* abort -- programming error */ }

  /* The group's being freed removes one reference to gop_stuff */
  gop_stuff->ref_count -= 1;

  /* If no references remain, then free the storage */
  if (gop_stuff->ref_count == 0) {
    free((void *)gop_stuff);
  }
  return MPI_SUCCESS;
}

/* The following routine is called by MPI when a group is copied */
int gop_stuff_copier(MPI_Comm comm, int keyval, void *extra, 
               void *gop_stuff_inP, void *gop_stuff_outP, int *flag)
{
  gop_stuff_type *gop_stuff_in = (gop_stuff_type *)gop_stuff_inP;
  gop_stuff_type **gop_stuff_out = (gop_stuff_type **)gop_stuff_outP;
  if (keyval != gop_key) { /* abort -- programming error */ }

  /* The new group adds one reference to this gop_stuff */
  gop_stuff_in->ref_count += 1;
  *gop_stuff_out = gop_stuff_in;
  return MPI_SUCCESS;
}
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Attributes Example]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Attributes Example]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Attributes Example]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Attributes Example]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Attributes Example]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Attributes Example]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Attributes Example]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Attributes Example]]
