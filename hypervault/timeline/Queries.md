# Queries (Dataview)

The biographies carry `introduced`, `deprecated`, `removed`, `continued_as`, `present_in` in their frontmatter. With the Dataview plugin these become queries; without it every note still reads correctly.

```dataview
TABLE introduced, deprecated, removed
FROM #mpi/routine
WHERE deprecated != null AND removed = null
SORT deprecated
```

```dataview
LIST
FROM #mpi/routine
WHERE introduced = "MPI-5.0"
```

```dataview
TABLE length(present_in) AS releases
FROM #mpi/routine
SORT length(present_in) ASC
LIMIT 40
```
