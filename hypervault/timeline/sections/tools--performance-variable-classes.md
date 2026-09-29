---
title: "Performance Variable Classes"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Performance Variable Classes

Chapter **tools** · in [[versions/v30/sections/tools#Performance Variable Classes|MPI-3.0]], [[versions/v31/sections/tools#Performance Variable Classes|MPI-3.1]], [[versions/v40/sections/tools#Performance Variable Classes|MPI-4.0]], [[versions/v41/sections/tools#Performance Variable Classes|MPI-4.1]], [[versions/v50/sections/tools#Performance Variable Classes|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

- `MPI_T_PVAR_CLASS_SIZE`\ A performance variable in this class represents a value that is the ~~fixed~~ size of a resource. Values returned from variables in this class are non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current ~~utilization level~~ ==size== of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_HIGHWATERMARK`\ A performance variable in this class represents a value that describes the high watermark utilization of a resource. The value of a variable of this class is non-negative and grows monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the ~~starting value~~ ==variable== is ~~set.~~ ==started or reset.== MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_LOWWATERMARK`\ A performance variable in this class represents a value that describes the low watermark utilization of a resource. The value of a variable of this class is non-negative and decreases monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the ~~starting value~~ ==variable== is ~~set.~~ ==started or reset.== MPI implementations must ensure that variables of this class cannot overflow.

- `MPI_T_PVAR_CLASS_TIMER`\ The value of a performance variable in this class represents the aggregated time that the MPI implementation spends executing a particular event, type of event, or section of the MPI library. This class has the same basic semantics as `MPI_T_PVAR_CLASS_AGGREGATE`, but explicitly records a timing value. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. If the type `MPI_DOUBLE` is used, the units that represent time in this datatype must match the units used by ~~`MPI_WTIME`.~~ ==[[versions/v31/API/MPI_WTIME|MPI_WTIME]] .== Otherwise, the time units should be documented, e.g., in the description returned by [[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] . Variables of this class can overflow.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

- ~~`MPI_T_PVAR_CLASS_STATE`\~~ ==`MPI_T_PVAR_CLASS_STATE`== A performance variable in this class represents a set of discrete states. Variables of this class are represented by `MPI_INT` and can be set by the MPI implementation at any time. Variables of this type should be described further using an enumeration, as discussed in Section [[versions/v40/sections/tools#Datatype System|Datatype System]] . The starting value is the current state of the implementation at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- ~~`MPI_T_PVAR_CLASS_LEVEL`\~~ ==`MPI_T_PVAR_CLASS_LEVEL`== A performance variable in this class represents a value that describes the utilization level of a resource. The value of a variable of this class can change at any time to match the current utilization level of the resource. Values returned from variables in this class are non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- ~~`MPI_T_PVAR_CLASS_SIZE`\~~ ==`MPI_T_PVAR_CLASS_SIZE`== A performance variable in this class represents a value that is the size of a resource. Values returned from variables in this class are non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current size of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- ~~`MPI_T_PVAR_CLASS_PERCENTAGE`\~~ ==`MPI_T_PVAR_CLASS_PERCENTAGE`== The value of a performance variable in this class represents the percentage utilization of a finite resource. The value of a variable of this class can change at any time to match the current utilization level of the resource. It will be returned as an `MPI_DOUBLE` datatype. The value must always be between 0.0 (resource not used at all) and 1.0 (resource completely used). The starting value is the current percentage utilization level of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

- ~~`MPI_T_PVAR_CLASS_HIGHWATERMARK`\~~ ==`MPI_T_PVAR_CLASS_HIGHWATERMARK`== A performance variable in this class represents a value that describes the high watermark utilization of a resource. The value of a variable of this class is non-negative and grows monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the variable is started or reset. MPI implementations must ensure that variables of this class cannot overflow.

- ~~`MPI_T_PVAR_CLASS_LOWWATERMARK`\~~ ==`MPI_T_PVAR_CLASS_LOWWATERMARK`== A performance variable in this class represents a value that describes the low watermark utilization of a resource. The value of a variable of this class is non-negative and decreases monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the variable is started or reset. MPI implementations must ensure that variables of this class cannot overflow.

- ~~`MPI_T_PVAR_CLASS_COUNTER`\~~ ==`MPI_T_PVAR_CLASS_COUNTER`== A performance variable in this class counts the number of occurrences of a specific event (e.g., the number of memory allocations within an MPI library). The value of a variable of this class increases monotonically from the initialization or reset of the performance variable by one for each specific event that is observed. Values must be non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`. The starting value for variables of this class is 0. Variables of this class can overflow.

- ~~`MPI_T_PVAR_CLASS_AGGREGATE`\~~ ==`MPI_T_PVAR_CLASS_AGGREGATE`== The value of a performance variable in this class is an an aggregated value that represents a sum of arguments processed during a specific event (e.g., the amount of memory allocated by all memory allocations). This class is similar to the counter class, but instead of counting individual events, the value can be incremented by arbitrary amounts. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. Variables of this class can overflow.

- ~~`MPI_T_PVAR_CLASS_TIMER`\~~ ==`MPI_T_PVAR_CLASS_TIMER`== The value of a performance variable in this class represents the aggregated time that the MPI implementation spends executing a particular event, type of event, or section of the MPI library. This class has the same basic semantics as `MPI_T_PVAR_CLASS_AGGREGATE`, but explicitly records a timing value. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be non-negative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. If the type `MPI_DOUBLE` is used, the units that represent time in this datatype must match the units used by [[versions/v40/API/MPI_WTIME|MPI_WTIME]] . Otherwise, the time units should be documented, e.g., in the description returned by [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] . Variables of this class can overflow.

- ~~`MPI_T_PVAR_CLASS_GENERIC`\~~ ==`MPI_T_PVAR_CLASS_GENERIC`== This class can be used to describe a variable that does not fit into any of the other classes. For variables in this class, the starting value is variable-specific and implementation-defined.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~- `MPI_T_PVAR_CLASS_STATE`~~ ==`MPI_T_PVAR_CLASS_STATE`:== A performance variable in this class represents a set of discrete states. Variables of this class are represented by `MPI_INT` and can be set by the MPI implementation at any time. Variables of this type should be described further using an enumeration, as discussed in Section [[versions/v41/sections/tools#Datatype System|Datatype System]] . The starting value is the current state of the implementation at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

~~- `MPI_T_PVAR_CLASS_LEVEL`~~ ==`MPI_T_PVAR_CLASS_LEVEL`:== A performance variable in this class represents a value that describes the utilization level of a resource. The value of a variable of this class can change at any time to match the current utilization level of the resource. Values returned from variables in this class are ~~non-negative~~ ==nonnegative== and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

~~- `MPI_T_PVAR_CLASS_SIZE`~~ ==`MPI_T_PVAR_CLASS_SIZE`:== A performance variable in this class represents a value that is the size of a resource. Values returned from variables in this class are ~~non-negative~~ ==nonnegative== and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current size of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

~~- `MPI_T_PVAR_CLASS_PERCENTAGE`~~ ==`MPI_T_PVAR_CLASS_PERCENTAGE`:== The value of a performance variable in this class represents the percentage utilization of a finite resource. The value of a variable of this class can change at any time to match the current utilization level of the resource. It will be returned as an `MPI_DOUBLE` datatype. The value must always be between 0.0 (resource not used at all) and 1.0 (resource completely used). The starting value is the current percentage utilization level of the resource at the time that the starting value is set. MPI implementations must ensure that variables of this class cannot overflow.

~~- `MPI_T_PVAR_CLASS_HIGHWATERMARK`~~ ==`MPI_T_PVAR_CLASS_HIGHWATERMARK`:== A performance variable in this class represents a value that describes the ~~high watermark~~ ==maximum observed== utilization of a resource. The value of a variable of this class is ~~non-negative~~ ==nonnegative== and grows monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the variable is started or reset. MPI implementations must ensure that variables of this class cannot overflow.

~~- `MPI_T_PVAR_CLASS_LOWWATERMARK`~~ ==`MPI_T_PVAR_CLASS_LOWWATERMARK`:== A performance variable in this class represents a value that describes the ~~low watermark~~ ==minimum observed== utilization of a resource. The value of a variable of this class is ~~non-negative~~ ==nonnegative== and decreases monotonically from the initialization or reset of the variable. It can be represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value is the current utilization level of the resource at the time that the variable is started or reset. MPI implementations must ensure that variables of this class cannot overflow.

~~- `MPI_T_PVAR_CLASS_COUNTER`~~ ==`MPI_T_PVAR_CLASS_COUNTER`:== A performance variable in this class counts the number of occurrences of a specific event (e.g., the number of memory allocations within an MPI library). The value of a variable of this class increases monotonically from the initialization or reset of the performance variable by one for each specific event that is observed. Values must be ~~non-negative~~ ==nonnegative== and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`. The starting value for variables of this class is 0. Variables of this class can overflow.

~~- `MPI_T_PVAR_CLASS_AGGREGATE`~~ ==`MPI_T_PVAR_CLASS_AGGREGATE`:== The value of a performance variable in this class is an an aggregated value that represents a sum of arguments processed during a specific event (e.g., the amount of memory allocated by all memory allocations). This class is similar to the counter class, but instead of counting individual events, the value can be incremented by arbitrary amounts. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be ~~non-negative~~ ==nonnegative== and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. Variables of this class can overflow.

~~- `MPI_T_PVAR_CLASS_TIMER`~~ ==`MPI_T_PVAR_CLASS_TIMER`:== The value of a performance variable in this class represents the aggregated time that the MPI implementation spends executing a particular event, type of event, or section of the MPI library. This class has the same basic semantics as `MPI_T_PVAR_CLASS_AGGREGATE`, but explicitly records a timing value. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be ~~non-negative~~ ==nonnegative== and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. If the type `MPI_DOUBLE` is used, the units that represent time in this datatype must match the units used by [[versions/v41/API/MPI_WTIME|MPI_WTIME]] . Otherwise, the time units should be documented, e.g., in the description returned by [[versions/v41/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] . Variables of this class can overflow.

~~- `MPI_T_PVAR_CLASS_GENERIC`~~ ==`MPI_T_PVAR_CLASS_GENERIC`:== This class can be used to describe a variable that does not fit into any of the other classes. For variables in this class, the starting value is variable-specific and implementation-defined.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

`MPI_T_PVAR_CLASS_AGGREGATE`: The value of a performance variable in this class is ~~an~~ an aggregated value that represents a sum of arguments processed during a specific event (e.g., the amount of memory allocated by all memory allocations). This class is similar to the counter class, but instead of counting individual events, the value can be incremented by arbitrary amounts. The value of a variable of this class increases monotonically from the initialization or reset of the performance variable. It must be nonnegative and represented by one of the following datatypes: `MPI_UNSIGNED`, `MPI_UNSIGNED_LONG`, `MPI_UNSIGNED_LONG_LONG`, `MPI_DOUBLE`. The starting value for variables of this class is 0. Variables of this class can overflow.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Performance Variable Classes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Performance Variable Classes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Performance Variable Classes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Performance Variable Classes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Performance Variable Classes]]
