---
title: "Examples"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/ei]
---

# Examples

Chapter **ei** · in [[versions/v20/sections/ei#Examples|MPI-2.0]], [[versions/v21/sections/ei#Examples|MPI-2.1]], [[versions/v22/sections/ei#Examples|MPI-2.2]], [[versions/v30/sections/ei#Examples|MPI-3.0]], [[versions/v31/sections/ei#Examples|MPI-3.1]], [[versions/v40/sections/ei#Examples|MPI-4.0]], [[versions/v41/sections/ei#Examples|MPI-4.1]], [[versions/v50/sections/ei#Examples|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

int myreduce(MPI_Comm comm, int tag, int root, int valin, int *valout, MPI_Request *request) { ARGS *args; pthread_t thread;

/* start request */ MPI_Grequest_start(query_fn, free_fn, cancel_fn, NULL, request);

args = (ARGS*)malloc(sizeof(ARGS)); args->comm = comm; args->tag = tag; args->root = root; args->valin = valin; args->valout = valout; args->request = *request;

/* spawn thread to handle request */ /* The availability of the pthread_create call is system dependent */ pthread_create(&thread, NULL, reduce_thread, args);

return MPI_SUCCESS; }

/* thread code */ ~~void~~ ==void*== reduce_thread(void *ptr) { int lchild, rchild, parent, lval, rval, val; MPI_Request req[2]; ARGS *args;

args = (ARGS*)ptr;

/* compute left,right child and parent in tree; set to MPI_PROC_NULL if does not exist */ /* code not shown */ ...

MPI_Irecv(&lval, 1, MPI_INT, lchild, args->tag, args->comm, &req[0]); MPI_Irecv(&rval, 1, MPI_INT, rchild, args->tag, args->comm, &req[1]); MPI_Waitall(2, req, MPI_STATUSES_IGNORE); val = lval + args->valin + rval; MPI_Send( &val, 1, MPI_INT, parent, args->tag, args->comm ); if (parent == MPI_PROC_NULL) *(args->valout) = val; MPI_Grequest_complete((args->request)); free(ptr); ~~return;~~ ==return(NULL);== }

int query_fn(void *extra_state, MPI_Status *status) { /* always send just one int */ MPI_Status_set_elements(status, MPI_INT, 1); /* can never cancel so always true */ MPI_Status_set_cancelled(status, 0); /* choose not to return a value for this */ status->MPI_SOURCE = MPI_UNDEFINED; /* tag has ~~not~~ ==no== meaning for this generalized request */ status->MPI_TAG = MPI_UNDEFINED; /* this generalized request never fails */ return MPI_SUCCESS; }

int free_fn(void *extra_state) { /* this generalized request does not need to do any freeing */ /* as a result it never fails here */ return MPI_SUCCESS; }

int cancel_fn(void *extra_state, int complete) { /* This generalized request does not support cancelling. Abort if not already done. If done then treat as if cancel ~~failed. */~~ ==failed.*/== if (!complete) { fprintf(stderr, "Cannot cancel generalized request - aborting program\n"); MPI_Abort(MPI_COMM_WORLD, 99); } return MPI_SUCCESS; }

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

/* compute ~~left,right~~ ==left and right== child and parent in tree; set to MPI_PROC_NULL if does not exist */ /* code not shown */ ...

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

int myreduce(MPI_Comm comm, int tag, int root, int valin, int *valout, MPI_Request *request) { ARGS *args; pthread_t thread;

MPI_Irecv(&lval, 1, MPI_INT, lchild, args->tag, args->comm, &req[0]); MPI_Irecv(&rval, 1, MPI_INT, rchild, args->tag, args->comm, &req[1]); MPI_Waitall(2, req, MPI_STATUSES_IGNORE); val = lval + args->valin + rval; ~~MPI_Send( &val,~~ ==MPI_Send(&val,== 1, MPI_INT, parent, args->tag, ~~args->comm );~~ ==args->comm);== if (parent == MPI_PROC_NULL) *(args->valout) = val; MPI_Grequest_complete((args->request)); free(ptr); return(NULL); }

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~This example shows the code for a user-defined reduce operation on an `int` using a binary tree: each non-root node receives two messages, sums them, and sends them up. We assume that no status is returned and that the operation cannot be cancelled.~~

~~    typedef struct {        MPI_Comm comm;        int tag;        int root;        int valin;        int *valout;        MPI_Request request;        } ARGS;~~

~~    int myreduce(MPI_Comm comm, int tag, int root,                   int valin, int *valout, MPI_Request *request)     {        ARGS *args;        pthread_t thread;~~

~~       /* start request */        MPI_Grequest_start(query_fn, free_fn, cancel_fn, NULL, request);~~

~~       args = (ARGS*)malloc(sizeof(ARGS));        args->comm = comm;        args->tag = tag;        args->root = root;        args->valin = valin;        args->valout = valout;        args->request = *request;~~

~~       /* spawn thread to handle request */        /* The availability of the pthread_create call is system dependent */        pthread_create(&thread, NULL, reduce_thread, args);~~

~~       return MPI_SUCCESS;     }~~

~~    /* thread code */     void* reduce_thread(void *ptr)      {        int lchild, rchild, parent, lval, rval, val;        MPI_Request req[2];        ARGS *args;~~

~~       args = (ARGS*)ptr;~~

~~       /* compute left and right child and parent in tree; set            to MPI_PROC_NULL if does not exist  */        /* code not shown */        ...~~

~~       MPI_Irecv(&lval, 1, MPI_INT, lchild, args->tag, args->comm, &req[0]);        MPI_Irecv(&rval, 1, MPI_INT, rchild, args->tag, args->comm, &req[1]);        MPI_Waitall(2, req, MPI_STATUSES_IGNORE);        val = lval + args->valin + rval;        MPI_Send(&val, 1, MPI_INT, parent, args->tag, args->comm);        if (parent == MPI_PROC_NULL) *(args->valout) = val;        MPI_Grequest_complete((args->request));           free(ptr);        return(NULL);     }~~

~~    int query_fn(void *extra_state, MPI_Status *status)     {        /* always send just one int */        MPI_Status_set_elements(status, MPI_INT, 1);        /* can never cancel so always true */        MPI_Status_set_cancelled(status, 0);        /* choose not to return a value for this */        status->MPI_SOURCE = MPI_UNDEFINED;        /* tag has no meaning for this generalized request */        status->MPI_TAG = MPI_UNDEFINED;        /* this generalized request never fails */        return MPI_SUCCESS;     }~~

~~    int free_fn(void *extra_state)     {        /* this generalized request does not need to do any freeing */        /* as a result it never fails here */        return MPI_SUCCESS;     }~~

~~    int cancel_fn(void *extra_state, int complete)     {        /* This generalized request does not support cancelling.           Abort if not already done.  If done then treat as if cancel failed.*/        if (!complete) {          fprintf(stderr,                  "Cannot cancel generalized request - aborting program\n");          MPI_Abort(MPI_COMM_WORLD, 99);          }        return MPI_SUCCESS;     }~~

==This example shows the code for a user-defined reduce operation on an `int` using a binary tree: each nonroot node receives two messages, sums them, and sends them up. We assume that no status is returned and that the operation cannot be cancelled.==

==(code block added)==
``` [MPI]C
typedef struct {
   MPI_Comm comm;
   int tag;
   int root;
   int valin;
   int *valout;
   MPI_Request request;
   } ARGS;

int myreduce(MPI_Comm comm, int tag, int root,
             int valin, int *valout, MPI_Request *request)
{
   ARGS *args;
   pthread_t thread;
   
   /* start request */
   MPI_Grequest_start(query_fn, free_fn, cancel_fn, NULL, request);
   
   args = (ARGS*)malloc(sizeof(ARGS));
   args->comm = comm;
   args->tag = tag;
   args->root = root;
   args->valin = valin;
   args->valout = valout;
   args->request = *request;
   
   /* spawn thread to handle request */
   /* The availability of the pthread_create call is system dependent */
   pthread_create(&thread, NULL, reduce_thread, args);
   
   return MPI_SUCCESS;
}

/* thread code */
void* reduce_thread(void *ptr) 
{
   int lchild, rchild, parent, lval, rval, val;
   MPI_Request req[2];
   ARGS *args;
   
   args = (ARGS*)ptr;
   
   /* compute left and right child and parent in tree; set 
      to MPI_PROC_NULL if does not exist  */
   /* code not shown */
   ...
     
   MPI_Irecv(&lval, 1, MPI_INT, lchild, args->tag, args->comm, &req[0]);
   MPI_Irecv(&rval, 1, MPI_INT, rchild, args->tag, args->comm, &req[1]);
   MPI_Waitall(2, req, MPI_STATUSES_IGNORE);
   val = lval + args->valin + rval;
   MPI_Send(&val, 1, MPI_INT, parent, args->tag, args->comm);
   if (parent == MPI_PROC_NULL) *(args->valout) = val;
   MPI_Grequest_complete((args->request));   
   free(ptr);
   return(NULL);
}

int query_fn(void *extra_state, MPI_Status *status)
{
   /* always send just one int */
   MPI_Status_set_elements(status, MPI_INT, 1);
   /* can never cancel so always true */
   MPI_Status_set_cancelled(status, 0);
   /* choose not to return a value for this */
   status->MPI_SOURCE = MPI_UNDEFINED;
   /* tag has no meaning for this generalized request */
   status->MPI_TAG = MPI_UNDEFINED;
   /* this generalized request never fails */
   return MPI_SUCCESS;
}

int free_fn(void *extra_state)
{
   /* this generalized request does not need to do any freeing */
   /* as a result it never fails here */
   return MPI_SUCCESS;
}

int cancel_fn(void *extra_state, int complete)
{
   /* This generalized request does not support cancelling.
      Abort if not already done.
      If done then treat as if cancel failed.*/
   if (!complete) {
     fprintf(stderr,
             "Cannot cancel generalized request - aborting program\n");
     MPI_Abort(MPI_COMM_WORLD, 99);
   }
   return MPI_SUCCESS;
}
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

This example shows the code for a user-defined reduce operation on an `int` using a binary tree: each nonroot ~~node~~ ==MPI process== receives two messages, sums them, and sends them up. We assume that no status is returned and that the operation cannot be cancelled.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Examples]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Examples]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Examples]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Examples]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Examples]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/ei#Examples]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/ei#Examples]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/ei#Examples]]
