---
title: "Inquire Hardware Resource Information"
chapter: inquiry
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Inquire Hardware Resource Information

Chapter **inquiry** · in [[versions/v41/sections/inquiry#Inquire Hardware Resource Information|MPI-4.1]], [[versions/v50/sections/inquiry#Inquire Hardware Resource Information|MPI-5.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1

_Section appears in MPI-4.1._

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

==> [!note] Advice to users==

==> The information returned in the info object might reflect the “hardware” resources presented to the application by a virtualized environment and may be restricted by access permissions or other constraints like environment variables and OS settings.==

> Users should be cautious when using such keys ~~as~~ ==because== comparisons between different providers may not be always meaningful ~~nor~~ ==or== relevant. ==Also, the same hardware resource can be listed by multiple providers under different names. > > > > One provider could convey types that represent individual hardware resource instances—for example, `provider_1://core/FF53C8A9` or `provider_1://numanode/2`—while another provider could provide types that represent categories or locations of hardware resources—for example, `provider_2://core` or `provider_2://numanode`. > > > > It is anticipated that types that represent categories or locations will be more useful for [[versions/v50/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] than types that represent individual resources.==

==Splitting `MPI_COMM_WORLD` into subcommunicators according to NUMANode from the hwloc provider.==

==(code block added)==
``` [MPI]C
MPI_Info hw_info;
  MPI_Comm hw_comm;
  int      nb_keys  = 0, flag = 0;
  int      is_found = 0, is_restricted = 0; 
  int      valuelen = 6; // max length between "false" and "true" + 1 
  char    *value    = calloc(valuelen, sizeof(char));
  char    *hw_type  = calloc((MPI_MAX_INFO_KEY+1), sizeof(char));
  
  MPI_Get_hw_resource_info(&hw_info);
  
  MPI_Info_get_nkeys(hw_info, &nb_keys);  
  for(int index = 0 ; index < nb_keys ; index++){
    MPI_Info_get_nthkey(hw_info, index, hw_type);
    MPI_Info_get_string(hw_info, hw_type, &valuelen, value, &flag);     
    if(strcmp(hw_type, "hwloc://NUMANode") == 0){
      is_found = 1;
      if(strcmp(value,"true") == 0)
        is_restricted = 1;
      break; // Resource of type NUMANode found
    }
  }

  // The calling MPI process is restricted to a resource
  // of the chosen type (NUMANode)
  if(is_found  && is_restricted){
    MPI_Info split_info;
    int rank;
    
    MPI_Info_create(&split_info);
    
    // hw_type now serves as value for the "mpi_hw_resource_type" key
    MPI_Info_set(split_info, "mpi_hw_resource_type", hw_type);

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_split_type(MPI_COMM_WORLD, MPI_COMM_TYPE_RESOURCE_GUIDED,
                        rank, split_info, &hw_comm);

    // Check and use hw_comm from this point if it's a valid
    // communicator or different from MPI_COMM_SELF or MPI_COMM_WORLD.
  } else {
    // If resource is not found or not restricted to it,
    // the calling MPI process does not participate to the call
    // hence the use of MPI_UNDEFINED as split_type and    
    // MPI_COMM_NULL is produced as output communicator
    
    MPI_Comm_split_type(MPI_COMM_WORLD, MPI_UNDEFINED,
                        -1, MPI_INFO_NULL, &hw_comm);       
  }  
```

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Inquire Hardware Resource Information]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Inquire Hardware Resource Information]]
