---
title: "Library Example \#1"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Library Example \#1

Chapter **context** · in [[versions/v13/sections/context#Library Example \#1|MPI-1.3]], [[versions/v21/sections/context#Library Example \#1|MPI-2.1]], [[versions/v22/sections/context#Library Example \#1|MPI-2.2]], [[versions/v30/sections/context#Library Example \#1|MPI-3.0]], [[versions/v31/sections/context#Library Example \#1|MPI-3.1]], [[versions/v40/sections/context#Library Example \#1|MPI-4.0]], [[versions/v41/sections/context#Library Example \#1|MPI-4.1]], [[versions/v50/sections/context#Library Example \#1|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

void user_end_op(user_lib_t *handle) { MPI_Status ~~*status;~~ ==status;== MPI_Wait(handle -> isend_handle, ~~status);~~ ==&status);== MPI_Wait(handle -> irecv_handle, ~~status);~~ ==&status);== }

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==int== main(int argc, char **argv) { int done = 0; user_lib_t *libh_a, *libh_b; void *dataset1, *dataset2; ... MPI_Init(&argc, &argv); ... init_user_lib(MPI_COMM_WORLD, &libh_a); init_user_lib(MPI_COMM_WORLD, &libh_b); ... user_start_op(libh_a, dataset1); user_start_op(libh_b, dataset2); ... while(!done) { /* work */ ... MPI_Reduce(..., MPI_COMM_WORLD); ... /* see if done */ ... } user_end_op(libh_a); user_end_op(libh_b);

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

int main(int argc, char ~~**argv)~~ ==*argv[])== { int done = 0; user_lib_t *libh_a, *libh_b; void *dataset1, *dataset2; ... MPI_Init(&argc, &argv); ... init_user_lib(MPI_COMM_WORLD, &libh_a); init_user_lib(MPI_COMM_WORLD, &libh_b); ... user_start_op(libh_a, dataset1); user_start_op(libh_b, dataset2); ... while(!done) { /* work */ ... MPI_Reduce(..., MPI_COMM_WORLD); ... /* see if done */ ... } user_end_op(libh_a); user_end_op(libh_b);

uninit_user_lib(libh_a); uninit_user_lib(libh_b); MPI_Finalize(); ==return 0;== }

void user_end_op(user_lib_t *handle) { MPI_Status status; ~~MPI_Wait(handle~~ ==MPI_Wait(& handle== -> isend_handle, &status); ~~MPI_Wait(handle~~ ==MPI_Wait(& handle== -> irecv_handle, &status); }

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

user_lib_initsave(&save); /* local */ MPI_Comm_dup(comm, ~~&(save -> comm));~~ ==&(save->comm));==

void user_start_op(user_lib_t *handle, void *data) { MPI_Irecv( ..., handle->comm, ~~&(handle -> irecv_handle)~~ ==&(handle->irecv_handle)== ); MPI_Isend( ..., handle->comm, ~~&(handle -> isend_handle)~~ ==&(handle->isend_handle)== ); }

void user_end_op(user_lib_t *handle) { MPI_Status status; ~~MPI_Wait(& handle -> isend_handle,~~ ==MPI_Wait(&handle->isend_handle,== &status); ~~MPI_Wait(& handle -> irecv_handle,~~ ==MPI_Wait(&handle->irecv_handle,== &status); }

void uninit_user_lib(user_lib_t *handle) { ~~MPI_Comm_free(&(handle -> comm));~~ ==MPI_Comm_free(&(handle->comm));== free(handle); }

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

==First library example==

~~       int main(int argc, char *argv[])        {          int done = 0;          user_lib_t *libh_a, *libh_b;          void *dataset1, *dataset2;          ...          MPI_Init(&argc, &argv);          ...          init_user_lib(MPI_COMM_WORLD, &libh_a);          init_user_lib(MPI_COMM_WORLD, &libh_b);          ...          user_start_op(libh_a, dataset1);          user_start_op(libh_b, dataset2);          ...          while(!done)          {             /* work */             ...             MPI_Reduce(..., MPI_COMM_WORLD);             ...             /* see if done */             ...          }          user_end_op(libh_a);          user_end_op(libh_b);~~

~~         uninit_user_lib(libh_a);          uninit_user_lib(libh_b);          MPI_Finalize();          return 0;        }~~

==(code block added)==
``` [MPI]C
int main(int argc, char *argv[])
{
  int done = 0;
  user_lib_t *libh_a, *libh_b;
  void *dataset1, *dataset2;
  ...
  MPI_Init(&argc, &argv);
  ...
  init_user_lib(MPI_COMM_WORLD, &libh_a);
  init_user_lib(MPI_COMM_WORLD, &libh_b);
  ...
  user_start_op(libh_a, dataset1);
  user_start_op(libh_b, dataset2);
  ...
  while(!done)
  {
     /* work */
     ...
     MPI_Reduce(..., MPI_COMM_WORLD);
     ...
     /* see if done */
     ...
  }
  user_end_op(libh_a);
  user_end_op(libh_b);

  uninit_user_lib(libh_a);
  uninit_user_lib(libh_b);
  MPI_Finalize();
  return 0;
}
```

~~       void init_user_lib(MPI_Comm comm, user_lib_t **handle)        {          user_lib_t *save;~~

~~         user_lib_initsave(&save); /* local */          MPI_Comm_dup(comm, &(save->comm));~~

~~         /* other inits */          ...~~

~~         *handle = save;        }~~

==(code block added)==
``` [MPI]C
void init_user_lib(MPI_Comm comm, user_lib_t **handle)
{
  user_lib_t *save;

  user_lib_initsave(&save); /* local */
  MPI_Comm_dup(comm, &(save->comm));

  /* other inits */
  ...

  *handle = save;
}
```

~~       void user_start_op(user_lib_t *handle, void *data)        {          MPI_Irecv( ..., handle->comm, &(handle->irecv_handle) );          MPI_Isend( ..., handle->comm, &(handle->isend_handle) );        }~~

==(code block added)==
``` [MPI]C
void user_start_op(user_lib_t *handle, void *data)
{
  MPI_Irecv( ..., handle->comm, &(handle->irecv_handle) );
  MPI_Isend( ..., handle->comm, &(handle->isend_handle) );
}
```

~~       void user_end_op(user_lib_t *handle)        {          MPI_Status status;          MPI_Wait(&handle->isend_handle, &status);          MPI_Wait(&handle->irecv_handle, &status);        }~~

==(code block added)==
``` [MPI]C
void user_end_op(user_lib_t *handle)
{
  MPI_Status status;
  MPI_Wait(&handle->isend_handle, &status);
  MPI_Wait(&handle->irecv_handle, &status);
}
```

~~       void uninit_user_lib(user_lib_t *handle)        {          MPI_Comm_free(&(handle->comm));          free(handle);        }~~

==(code block added)==
``` [MPI]C
void uninit_user_lib(user_lib_t *handle)
{
  MPI_Comm_free(&(handle->comm));
  free(handle);
}
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Library Example \#1]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Library Example \#1]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Library Example \#1]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Library Example \#1]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Library Example \#1]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Library Example \#1]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Library Example \#1]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Library Example \#1]]
