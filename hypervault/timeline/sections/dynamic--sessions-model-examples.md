---
title: "Sessions Model Examples"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Sessions Model Examples

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Sessions Model Examples|MPI-4.0]], [[versions/v41/sections/dynamic#Sessions Model Examples|MPI-4.1]], [[versions/v50/sections/dynamic#Sessions Model Examples|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

~~    #include <stdio.h>     #include <stdlib.h>     #include <string.h>     #include "mpi.h"~~

~~    static MPI_Session lib_shandle = MPI_SESSION_NULL;     static MPI_Comm lib_comm = MPI_COMM_NULL;~~

~~    int library_foo_init(void)     {        int rc, flag, valuelen;        int ret = 0;        const char pset_name[] = "mpi://WORLD";        const char mt_key[] = "thread_level";        const char mt_value[] = "MPI_THREAD_MULTIPLE";        char out_value[100];   /* large enough */        MPI_Group wgroup = MPI_GROUP_NULL;        MPI_Info sinfo = MPI_INFO_NULL;        MPI_Info tinfo = MPI_INFO_NULL;~~

~~       MPI_Info_create(&sinfo);        MPI_Info_set(sinfo, mt_key, mt_value);        rc = MPI_Session_init(sinfo, MPI_ERRORS_RETURN,                                &lib_shandle);        if (rc != MPI_SUCCESS) {           ret = -1;           goto fn_exit;        }~~

~~       /*         * check we got thread support level foo library needs         */        rc = MPI_Session_get_info(lib_shandle, &tinfo);        if (rc != MPI_SUCCESS) {           ret = -1;           goto fn_exit;        }~~

~~       valuelen = sizeof(out_value);        MPI_Info_get_string(tinfo, mt_key, &valuelen,                     out_value, &flag);        if (0 == flag) {           printf("Could not find key %s\n", mt_key);           ret = -1;           goto fn_exit;        }~~

~~       if (strcmp(out_value, mt_value)) {           printf("Did not get thread multiple support, got %s\n",                  out_value);           ret = -1;           goto fn_exit;        }~~

~~       /*         * create a group from the WORLD process set         */        rc = MPI_Group_from_session_pset(lib_shandle,                                         pset_name,                                         &wgroup);        if (rc != MPI_SUCCESS) {           ret = -1;           goto fn_exit;        }~~

~~       /*         * get a communicator         */        rc = MPI_Comm_create_from_group(wgroup,                                        "org.mpi-forum.mpi-v4_0.example-ex11_8",                                        MPI_INFO_NULL,                                        MPI_ERRORS_RETURN,                                        &lib_comm);        if (rc != MPI_SUCCESS) {           ret = -1;           goto fn_exit;        }~~

~~       /*         * free group, library doesn't need it.         */~~

~~    fn_exit:        MPI_Group_free(&wgroup);~~

~~       if (sinfo != MPI_INFO_NULL) {           MPI_Info_free(&sinfo);        }~~

~~       if (tinfo != MPI_INFO_NULL) {           MPI_Info_free(&tinfo);        }~~

~~       if (ret != 0) {           MPI_Session_finalize(&lib_shandle);        }~~

~~       return ret;     }~~

~~Example [[versions/v41/sections/dynamic#Sessions Model Examples|Sessions Model Examples]] shows how the pre-defined `mpi://WORLD` process set can be used to first create a local MPI group and then subsequently to create an MPI communicator from this group.~~

==(code block added)==
``` [MPI]C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mpi.h"

static MPI_Session lib_shandle = MPI_SESSION_NULL;
static MPI_Comm lib_comm = MPI_COMM_NULL;

int library_foo_init(void)
{
   int rc, flag, valuelen;
   int ret = 0;
   const char pset_name[] = "mpi://WORLD";
   const char mt_key[] = "thread_level";
   const char mt_value[] = "MPI_THREAD_MULTIPLE";
   char out_value[100];   /* large enough */
   MPI_Group wgroup = MPI_GROUP_NULL;
   MPI_Info sinfo = MPI_INFO_NULL;
   MPI_Info tinfo = MPI_INFO_NULL;

   MPI_Info_create(&sinfo);
   MPI_Info_set(sinfo, mt_key, mt_value);
   rc = MPI_Session_init(sinfo, MPI_ERRORS_RETURN,
                         &lib_shandle);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * check we got thread support level foo library needs
    */
   rc = MPI_Session_get_info(lib_shandle, &tinfo);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   valuelen = sizeof(out_value);
   MPI_Info_get_string(tinfo, mt_key, &valuelen,
                       out_value, &flag);
   if (0 == flag) {
      printf("Could not find key %s\n", mt_key);
      ret = -1;
      goto fn_exit;
   }

   if (strcmp(out_value, mt_value)) {
      printf("Did not get thread multiple support, got %s\n",
             out_value);
      ret = -1;
      goto fn_exit;
   }

   /*
    * create a group from the WORLD process set
    */
   rc = MPI_Group_from_session_pset(lib_shandle,
                                    pset_name,
                                    &wgroup);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * get a communicator
    */
   rc = MPI_Comm_create_from_group(wgroup,
                              "org.mpi-forum.mpi-v4_0.example-ex11_10",
                              MPI_INFO_NULL,
                              MPI_ERRORS_RETURN,
                              &lib_comm);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * free group, library doesn't need it.
    */

fn_exit:
   MPI_Group_free(&wgroup);

   if (sinfo != MPI_INFO_NULL) {
      MPI_Info_free(&sinfo);
   }

   if (tinfo != MPI_INFO_NULL) {
      MPI_Info_free(&tinfo);
   }

   if (ret != 0) {
      MPI_Session_finalize(&lib_shandle);
   }

   return ret;
}
```

==Example [[versions/v41/sections/dynamic#Sessions Model Examples|Sessions Model Examples]] shows how the predefined `mpi://WORLD` process set can be used to first create a local MPI group and then subsequently to create an MPI communicator from this group.==

==[language={[MPI]C},basicstyle=]== #include <stdio.h> #include <stdlib.h> #include <string.h> #include "mpi.h"

==[language={[MPI08withlen]Fortran},basicstyle=]== PROGRAM MAIN USE mpi_f08 IMPLICIT NONE INTEGER :: pset_len, ierror, n_psets CHARACTER(LEN=:), ALLOCATABLE :: pset_name TYPE(MPI_Session) :: shandle TYPE(MPI_Group) :: pgroup TYPE(MPI_Comm) :: pcomm

! ! create a MPI communicator from the group ! CALL MPI_Comm_create_from_group(pgroup, "session_example", & MPI_INFO_NULL, & MPI_ERRORS_RETURN, & pcomm)

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~Simple example illustrating creation of an MPI communicator using the Sessions Model.~~

~~(code block removed)~~
``` [MPI]C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mpi.h"

static MPI_Session lib_shandle = MPI_SESSION_NULL;
static MPI_Comm lib_comm = MPI_COMM_NULL;

int library_foo_init(void)
{
   int rc, flag, valuelen;
   int ret = 0;
   const char pset_name[] = "mpi://WORLD";
   const char mt_key[] = "thread_level";
   const char mt_value[] = "MPI_THREAD_MULTIPLE";
   char out_value[100];   /* large enough */
   MPI_Group wgroup = MPI_GROUP_NULL;
   MPI_Info sinfo = MPI_INFO_NULL;
   MPI_Info tinfo = MPI_INFO_NULL;

   MPI_Info_create(&sinfo);
   MPI_Info_set(sinfo, mt_key, mt_value);
   rc = MPI_Session_init(sinfo, MPI_ERRORS_RETURN,
                         &lib_shandle);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * check we got thread support level foo library needs
    */
   rc = MPI_Session_get_info(lib_shandle, &tinfo);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   valuelen = sizeof(out_value);
   MPI_Info_get_string(tinfo, mt_key, &valuelen,
                       out_value, &flag);
   if (0 == flag) {
      printf("Could not find key %s\n", mt_key);
      ret = -1;
      goto fn_exit;
   }

   if (strcmp(out_value, mt_value)) {
      printf("Did not get thread multiple support, got %s\n",
             out_value);
      ret = -1;
      goto fn_exit;
   }

   /*
    * create a group from the WORLD process set
    */
   rc = MPI_Group_from_session_pset(lib_shandle,
                                    pset_name,
                                    &wgroup);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * get a communicator
    */
   rc = MPI_Comm_create_from_group(wgroup,
                              "org.mpi-forum.mpi-v4_0.example-ex11_10",
                              MPI_INFO_NULL,
                              MPI_ERRORS_RETURN,
                              &lib_comm);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * free group, library doesn't need it.
    */

fn_exit:
   MPI_Group_free(&wgroup);

   if (sinfo != MPI_INFO_NULL) {
      MPI_Info_free(&sinfo);
   }

   if (tinfo != MPI_INFO_NULL) {
      MPI_Info_free(&tinfo);
   }

   if (ret != 0) {
      MPI_Session_finalize(&lib_shandle);
   }

   return ret;
}
```

==Example illustrating creation of an MPI communicator using the Sessions Model.==

==(code block added)==
``` [MPI]C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mpi.h"

static MPI_Session lib_shandle = MPI_SESSION_NULL;
static MPI_Comm lib_comm = MPI_COMM_NULL;

int library_foo_init(void)
{
   int rc, flag, valuelen;
   int ret = 0;
   const char pset_name[] = "mpi://WORLD";
   const char mt_key[] = "thread_level";
   const char mt_value[] = "MPI_THREAD_MULTIPLE";
   char out_value[100];   /* large enough */
   MPI_Group wgroup = MPI_GROUP_NULL;
   MPI_Info sinfo = MPI_INFO_NULL;
   MPI_Info tinfo = MPI_INFO_NULL;

   MPI_Info_create(&sinfo);
   MPI_Info_set(sinfo, mt_key, mt_value);
   rc = MPI_Session_init(sinfo, MPI_ERRORS_RETURN,
                         &lib_shandle);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * check we got thread support level foo library needs
    */
   rc = MPI_Session_get_info(lib_shandle, &tinfo);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   valuelen = sizeof(out_value);
   MPI_Info_get_string(tinfo, mt_key, &valuelen,
                       out_value, &flag);
   if (0 == flag) {
      printf("Could not find key %s\n", mt_key);
      ret = -1;
      goto fn_exit;
   }

   if (strcmp(out_value, mt_value)) {
      printf("Did not get thread multiple support, got %s\n",
             out_value);
      ret = -1;
      goto fn_exit;
   }

   /*
    * create a group from the WORLD process set
    */
   rc = MPI_Group_from_session_pset(lib_shandle,
                                    pset_name,
                                    &wgroup);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * get a communicator
    */
   rc = MPI_Comm_create_from_group(wgroup,
                              "org.mpi-forum.mpi-v4_0.example-ex11_10",
                              MPI_INFO_NULL,
                              MPI_ERRORS_RETURN,
                              &lib_comm);
   if (rc != MPI_SUCCESS) {
      ret = -1;
      goto fn_exit;
   }

   /*
    * release unused resources
    */

fn_exit:
   if (wgroup != MPI_GROUP_NULL) {
      MPI_Group_free(&wgroup);
   }

   if (sinfo != MPI_INFO_NULL) {
      MPI_Info_free(&sinfo);
   }

   if (tinfo != MPI_INFO_NULL) {
      MPI_Info_free(&tinfo);
   }

   if (ret != 0) {
      MPI_Session_finalize(&lib_shandle);
   }

   return ret;
}
```

==       if (pset_name == NULL) {            fprintf(stderr, "Unable to find matching process set\n");            return EXIT_FAILURE;        }==

free(pset_name); ==if (pgroup != MPI_GROUP_NULL) {== MPI_Group_free(&pgroup); ==}== MPI_Info_free(&sinfo); MPI_Session_finalize(&shandle);

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Sessions Model Examples]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Sessions Model Examples]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Sessions Model Examples]]
