# Language Bindings Summary



In this section we summarize the specific bindings for C and Fortran. First we present the constants, type definitions, info values and keys. Then we present the routine prototypes separately for each binding. Listings are alphabetical within chapter.

All ABI values must be cast to the appropriate type if the type of the constant is not a C `int` or Fortran `INTEGER`. For example, when `MPI_COMM_WORLD` is said to be 257, the implementation will use `((MPI_Comm)257)` in C.

## Defined Values and Handles



### Defined Constants



The C and Fortran names are listed below. Constants described as “integer constant expression” may be implemented as literal integer constants of the specified integer type substituted by the preprocessor or (where possible) as enum members.

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Error classes</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SUCCESS</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_BUFFER</code></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_COUNT</code></td>
<td style="text-align: left;">2</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_TYPE</code></td>
<td style="text-align: left;">3</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_TAG</code></td>
<td style="text-align: left;">4</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_COMM</code></td>
<td style="text-align: left;">5</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_RANK</code></td>
<td style="text-align: left;">6</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_REQUEST</code></td>
<td style="text-align: left;">7</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_ROOT</code></td>
<td style="text-align: left;">8</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_GROUP</code></td>
<td style="text-align: left;">9</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_OP</code></td>
<td style="text-align: left;">10</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_TOPOLOGY</code></td>
<td style="text-align: left;">11</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_DIMS</code></td>
<td style="text-align: left;">12</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_ARG</code></td>
<td style="text-align: left;">13</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_UNKNOWN</code></td>
<td style="text-align: left;">14</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_TRUNCATE</code></td>
<td style="text-align: left;">15</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_OTHER</code></td>
<td style="text-align: left;">16</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_INTERN</code></td>
<td style="text-align: left;">17</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_PENDING</code></td>
<td style="text-align: left;">18</td>
</tr>
<tr>
<td colspan="2" style="text-align: right;"><strong>(Continued on next page)</strong></td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Error classes (continued)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_IN_STATUS</code></td>
<td style="text-align: left;">19</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_ACCESS</code></td>
<td style="text-align: left;">20</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_AMODE</code></td>
<td style="text-align: left;">21</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_ASSERT</code></td>
<td style="text-align: left;">22</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_BAD_FILE</code></td>
<td style="text-align: left;">23</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_BASE</code></td>
<td style="text-align: left;">24</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_CONVERSION</code></td>
<td style="text-align: left;">25</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_DISP</code></td>
<td style="text-align: left;">26</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_DUP_DATAREP</code></td>
<td style="text-align: left;">27</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_FILE_EXISTS</code></td>
<td style="text-align: left;">28</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_FILE_IN_USE</code></td>
<td style="text-align: left;">29</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_FILE</code></td>
<td style="text-align: left;">30</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_INFO_KEY</code></td>
<td style="text-align: left;">31</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_INFO_NOKEY</code></td>
<td style="text-align: left;">32</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_INFO_VALUE</code></td>
<td style="text-align: left;">33</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_INFO</code></td>
<td style="text-align: left;">34</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_IO</code></td>
<td style="text-align: left;">35</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_KEYVAL</code></td>
<td style="text-align: left;">36</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_LOCKTYPE</code></td>
<td style="text-align: left;">37</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_NAME</code></td>
<td style="text-align: left;">38</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_NO_MEM</code></td>
<td style="text-align: left;">39</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_NOT_SAME</code></td>
<td style="text-align: left;">40</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_NO_SPACE</code></td>
<td style="text-align: left;">41</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_NO_SUCH_FILE</code></td>
<td style="text-align: left;">42</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_PORT</code></td>
<td style="text-align: left;">43</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_QUOTA</code></td>
<td style="text-align: left;">44</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_READ_ONLY</code></td>
<td style="text-align: left;">45</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_RMA_ATTACH</code></td>
<td style="text-align: left;">46</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_RMA_CONFLICT</code></td>
<td style="text-align: left;">47</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_RMA_RANGE</code></td>
<td style="text-align: left;">48</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_RMA_SHARED</code></td>
<td style="text-align: left;">49</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_RMA_SYNC</code></td>
<td style="text-align: left;">50</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_SERVICE</code></td>
<td style="text-align: left;">51</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_SIZE</code></td>
<td style="text-align: left;">52</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_SPAWN</code></td>
<td style="text-align: left;">53</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_UNSUPPORTED_DATAREP</code></td>
<td style="text-align: left;">54</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_UNSUPPORTED_OPERATION</code></td>
<td style="text-align: left;">55</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_WIN</code></td>
<td style="text-align: left;">56</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_RMA_FLAVOR</code></td>
<td style="text-align: left;">57</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_PROC_ABORTED</code></td>
<td style="text-align: left;">58</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_VALUE_TOO_LARGE</code></td>
<td style="text-align: left;">59</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_SESSION</code></td>
<td style="text-align: left;">60</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_ERRHANDLER</code></td>
<td style="text-align: left;">61</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_ABI</code></td>
<td style="text-align: left;">62</td>
</tr>
<tr>
<td colspan="2" style="text-align: right;"><strong>(Continued on next page)</strong></td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Error classes (continued)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_CANNOT_INIT</code></td>
<td style="text-align: left;">1001</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_NOT_ACCESSIBLE</code></td>
<td style="text-align: left;">1002</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_NOT_INITIALIZED</code></td>
<td style="text-align: left;">1003</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_NOT_SUPPORTED</code></td>
<td style="text-align: left;">1004</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_MEMORY</code></td>
<td style="text-align: left;">1005</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_INVALID</code></td>
<td style="text-align: left;">1006</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_INVALID_INDEX</code></td>
<td style="text-align: left;">1007</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_INVALID_ITEM</code></td>
<td style="text-align: left;">1008</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_INVALID_SESSION</code></td>
<td style="text-align: left;">1009</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_INVALID_HANDLE</code></td>
<td style="text-align: left;">1010</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_INVALID_NAME</code></td>
<td style="text-align: left;">1011</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_OUT_OF_HANDLES</code></td>
<td style="text-align: left;">1012</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_OUT_OF_SESSIONS</code></td>
<td style="text-align: left;">1013</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_CVAR_SET_NOT_NOW</code></td>
<td style="text-align: left;">1014</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_CVAR_SET_NEVER</code></td>
<td style="text-align: left;">1015</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_PVAR_NO_WRITE</code></td>
<td style="text-align: left;">1016</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_PVAR_NO_STARTSTOP</code></td>
<td style="text-align: left;">1017</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ERR_PVAR_NO_ATOMIC</code></td>
<td style="text-align: left;">1018</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERR_LASTCODE</code></td>
<td style="text-align: left;">16383</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Buffer address constants</strong></td>
</tr>
<tr>
<td style="text-align: left;">Fortran type: (predefined memory location)<sup>1</sup></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_BOTTOM</code></td>
<td style="text-align: left;"><code>((void*)0)</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_IN_PLACE</code></td>
<td style="text-align: left;"><code>((void*)1)</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_BUFFER_AUTOMATIC</code></td>
<td style="text-align: left;"><code>((void*)2)</code></td>
</tr>
<tr>
<td colspan="2" style="text-align: left;"><sup>1</sup> Note that in Fortran these constants are not usable for initialization</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Constants specifying empty or ignored input</strong></td>
</tr>
<tr>
<td style="text-align: left;">C type / Fortran type<sup>1</sup>   <code>MPI_ARGVS_NULL</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ARGV_NULL</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERRCODES_IGNORE</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;">array</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_STATUSES_IGNORE</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_STATUS_IGNORE</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNWEIGHTED</code></td>
<td style="text-align: left;">10</td>
</tr>
<tr>
<td style="text-align: left;">array</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WEIGHTS_EMPTY</code></td>
<td style="text-align: left;">11</td>
</tr>
<tr>
<td style="text-align: left;">array</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="2" style="text-align: left;"><sup>1</sup> Note that in Fortran these constants are not usable for initialization</td>
</tr>
<tr>
<td colspan="2" style="text-align: left;">expressions or assignment. See [[terms#Named Constants|Named Constants]] .</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Maximum sizes for strings</strong></td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_DATAREP_STRING</code></td>
<td style="text-align: left;">128</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_ERROR_STRING</code></td>
<td style="text-align: left;">512</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_INFO_KEY</code></td>
<td style="text-align: left;">256</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_INFO_VAL</code></td>
<td style="text-align: left;">1024</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_LIBRARY_VERSION_STRING</code></td>
<td style="text-align: left;">8192</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_OBJECT_NAME</code></td>
<td style="text-align: left;">128</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_PORT_NAME</code></td>
<td style="text-align: left;">1024</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_PROCESSOR_NAME</code></td>
<td style="text-align: left;">256</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_STRINGTAG_LEN</code></td>
<td style="text-align: left;">1024</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX_PSET_NAME_LEN</code></td>
<td style="text-align: left;">1024</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Mode constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_APPEND</code></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_CREATE</code></td>
<td style="text-align: left;">2</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_DELETE_ON_CLOSE</code></td>
<td style="text-align: left;">4</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_EXCL</code></td>
<td style="text-align: left;">8</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_RDONLY</code></td>
<td style="text-align: left;">16</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_RDWR</code></td>
<td style="text-align: left;">32</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_SEQUENTIAL</code></td>
<td style="text-align: left;">64</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_UNIQUE_OPEN</code></td>
<td style="text-align: left;">128</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_WRONLY</code></td>
<td style="text-align: left;">256</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_NOCHECK</code></td>
<td style="text-align: left;">1024</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_NOPRECEDE</code></td>
<td style="text-align: left;">2048</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_NOPUT</code></td>
<td style="text-align: left;">4096</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_NOSTORE</code></td>
<td style="text-align: left;">8192</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MODE_NOSUCCEED</code></td>
<td style="text-align: left;">16384</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Assorted constants</strong></td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ANY_SOURCE</code></td>
<td style="text-align: left;">-1</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ANY_TAG</code></td>
<td style="text-align: left;">-2</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_PROC_NULL</code></td>
<td style="text-align: left;">-3</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ROOT</code></td>
<td style="text-align: left;">-4</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNDEFINED</code></td>
<td style="text-align: left;">-32766</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_BSEND_OVERHEAD</code></td>
<td style="text-align: left;">512</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Threads constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_THREAD_SINGLE</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_THREAD_FUNNELED</code></td>
<td style="text-align: left;">1024</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_THREAD_SERIALIZED</code></td>
<td style="text-align: left;">2048</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_THREAD_MULTIPLE</code></td>
<td style="text-align: left;">4096</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>File operation constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ORDER_C</code></td>
<td style="text-align: left;">12 (<code>0xC</code>)</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ORDER_FORTRAN</code></td>
<td style="text-align: left;">15 (<code>0xF</code>)</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DISTRIBUTE_NONE</code></td>
<td style="text-align: left;">16</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DISTRIBUTE_BLOCK</code></td>
<td style="text-align: left;">17</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DISTRIBUTE_CYCLIC</code></td>
<td style="text-align: left;">18</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DISTRIBUTE_DFLT_DARG</code></td>
<td style="text-align: left;">19</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Datatype decoding constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI values</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_NAMED</code></td>
<td style="text-align: left;">101</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_DUP</code></td>
<td style="text-align: left;">102</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_CONTIGUOUS</code></td>
<td style="text-align: left;">103</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_VECTOR</code></td>
<td style="text-align: left;">104</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_HVECTOR</code></td>
<td style="text-align: left;">105</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_INDEXED</code></td>
<td style="text-align: left;">106</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_HINDEXED</code></td>
<td style="text-align: left;">107</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_INDEXED_BLOCK</code></td>
<td style="text-align: left;">108</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_HINDEXED_BLOCK</code></td>
<td style="text-align: left;">109</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_STRUCT</code></td>
<td style="text-align: left;">110</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_SUBARRAY</code></td>
<td style="text-align: left;">111</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_DARRAY</code></td>
<td style="text-align: left;">112</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_F90_REAL</code></td>
<td style="text-align: left;">113</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_F90_COMPLEX</code></td>
<td style="text-align: left;">114</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_F90_INTEGER</code></td>
<td style="text-align: left;">115</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_RESIZED</code></td>
<td style="text-align: left;">116</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMBINER_VALUE_INDEX</code></td>
<td style="text-align: left;">117</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>F90 datatype matching constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_TYPECLASS_INTEGER</code></td>
<td style="text-align: left;">192</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_TYPECLASS_REAL</code></td>
<td style="text-align: left;">193</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_TYPECLASS_COMPLEX</code></td>
<td style="text-align: left;">194</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Results of communicator and group comparisons</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_IDENT</code></td>
<td style="text-align: left;">201</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CONGRUENT</code></td>
<td style="text-align: left;">202</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SIMILAR</code></td>
<td style="text-align: left;">203</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNEQUAL</code></td>
<td style="text-align: left;">204</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Topologies</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CART</code></td>
<td style="text-align: left;">211</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_GRAPH</code></td>
<td style="text-align: left;">212</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DIST_GRAPH</code></td>
<td style="text-align: left;">213</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: left;"><strong>Communicator split type constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMM_TYPE_SHARED</code></td>
<td style="text-align: left;">221</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMM_TYPE_HW_UNGUIDED</code></td>
<td style="text-align: left;">222</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMM_TYPE_HW_GUIDED</code></td>
<td style="text-align: left;">223</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMM_TYPE_RESOURCE_GUIDED</code></td>
<td style="text-align: left;">224</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: left;"><strong>Window lock type constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOCK_EXCLUSIVE</code></td>
<td style="text-align: left;">301</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOCK_SHARED</code></td>
<td style="text-align: left;">302</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: left;"><strong>MPI window create flavors</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_FLAVOR_CREATE</code></td>
<td style="text-align: left;">311</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_FLAVOR_ALLOCATE</code></td>
<td style="text-align: left;">312</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_FLAVOR_DYNAMIC</code></td>
<td style="text-align: left;">313</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_FLAVOR_SHARED</code></td>
<td style="text-align: left;">314</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: left;"><strong>MPI window models</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_UNIFIED</code></td>
<td style="text-align: left;">321</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_SEPARATE</code></td>
<td style="text-align: left;">322</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: left;"><strong>File positioning constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SEEK_CUR</code></td>
<td style="text-align: left;">401</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SEEK_END</code></td>
<td style="text-align: left;">402</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SEEK_SET</code></td>
<td style="text-align: left;">403</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>File operation constants</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>MPI_Offset</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>OFFSET</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DISPLACEMENT_CURRENT</code></td>
<td style="text-align: left;">-1</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Environmental inquiry and predefined attribute keys</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_KEYVAL_INVALID</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_TAG_UB</code></td>
<td style="text-align: left;">501</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_IO</code></td>
<td style="text-align: left;">502</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_HOST</code> (deprecated)</td>
<td style="text-align: left;">503</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WTIME_IS_GLOBAL</code></td>
<td style="text-align: left;">504</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_APPNUM</code></td>
<td style="text-align: left;">505</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LASTUSEDCODE</code></td>
<td style="text-align: left;">506</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNIVERSE_SIZE</code></td>
<td style="text-align: left;">507</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_BASE</code></td>
<td style="text-align: left;">601</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_DISP_UNIT</code></td>
<td style="text-align: left;">602</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_SIZE</code></td>
<td style="text-align: left;">603</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_CREATE_FLAVOR</code></td>
<td style="text-align: left;">604</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_MODEL</code></td>
<td style="text-align: left;">605</td>
</tr>
</tbody>
</table>

|                                               |
|:----------------------------------------------|
| **Fortran support method specific constants** |

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Status array size and reserved index values (Fortran only)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
<td style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_STATUS_SIZE</code></td>
<td style="text-align: left;">8</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SOURCE</code></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_TAG</code></td>
<td style="text-align: left;">2</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ERROR</code></td>
<td style="text-align: left;">3</td>
</tr>
</tbody>
</table>



<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Fortran status array size and reserved index values (C only)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F_STATUS_SIZE</code></td>
<td style="text-align: left;">8</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F_SOURCE</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F_TAG</code></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F_ERROR</code></td>
<td style="text-align: left;">2</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Variable address size (Fortran only)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><code>MPI_ADDRESS_KIND</code></td>
<td style="text-align: left;"><code>c_intptr_t</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_OFFSET_KIND</code></td>
<td style="text-align: left;"><code>c_int64_t</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COUNT_KIND</code></td>
<td style="text-align: left;"><code>c_int64_t</code></td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Reserved communicators</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Comm</code> </span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span> <span> or <code>TYPE(MPI_Comm)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMM_NULL</code></td>
<td style="text-align: left;">256</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMM_WORLD</code></td>
<td style="text-align: left;">257</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMM_SELF</code></td>
<td style="text-align: left;">258</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="3" style="text-align: center;"><strong>Named predefined datatypes</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Datatype</code> </span></td>
<td rowspan="3" style="text-align: left;">C types</td>
<td rowspan="3" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><span> or <code>TYPE(MPI_Datatype)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DATATYPE_NULL</code></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">512</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_AINT</code></td>
<td style="text-align: left;"><code>MPI_Aint</code></td>
<td style="text-align: left;">513</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COUNT</code></td>
<td style="text-align: left;"><code>MPI_Count</code></td>
<td style="text-align: left;">514</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_OFFSET</code></td>
<td style="text-align: left;"><code>MPI_Offset</code></td>
<td style="text-align: left;">515</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_PACKED</code></td>
<td style="text-align: left;">(any C datatype)</td>
<td style="text-align: left;">519</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SHORT</code></td>
<td style="text-align: left;"><code>signed short</code></td>
<td style="text-align: left;">520</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INT</code></td>
<td style="text-align: left;"><code>signed int</code></td>
<td style="text-align: left;">521</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LONG</code></td>
<td style="text-align: left;"><code>signed long</code></td>
<td style="text-align: left;">522</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LONG_LONG_INT</code></td>
<td style="text-align: left;"><code>signed long long</code></td>
<td style="text-align: left;">523</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LONG_LONG</code> (as a synonym)</td>
<td style="text-align: left;"><code>signed long long</code></td>
<td style="text-align: left;">523</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNSIGNED_SHORT</code></td>
<td style="text-align: left;"><code>unsigned short</code></td>
<td style="text-align: left;">524</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNSIGNED</code></td>
<td style="text-align: left;"><code>unsigned int</code></td>
<td style="text-align: left;">525</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNSIGNED_LONG</code></td>
<td style="text-align: left;"><code>unsigned long</code></td>
<td style="text-align: left;">526</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNSIGNED_LONG_LONG</code></td>
<td style="text-align: left;"><code>unsigned long long</code></td>
<td style="text-align: left;">527</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_FLOAT</code></td>
<td style="text-align: left;"><code>float</code></td>
<td style="text-align: left;">528</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_C_COMPLEX</code></td>
<td style="text-align: left;"><code>float _Complex</code></td>
<td style="text-align: left;">530</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_C_FLOAT_COMPLEX</code> (as a synonym)</td>
<td style="text-align: left;"><code>float _Complex</code></td>
<td style="text-align: left;">530</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DOUBLE</code></td>
<td style="text-align: left;"><code>double</code></td>
<td style="text-align: left;">532</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_C_DOUBLE_COMPLEX</code></td>
<td style="text-align: left;"><code>double _Complex</code></td>
<td style="text-align: left;">534</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LONG_DOUBLE</code></td>
<td style="text-align: left;"><code>long double</code></td>
<td style="text-align: left;">544</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_C_LONG_DOUBLE_COMPLEX</code></td>
<td style="text-align: left;"><code>long double _Complex</code></td>
<td style="text-align: left;">548</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_C_BOOL</code></td>
<td style="text-align: left;"><code>_Bool</code></td>
<td style="text-align: left;">568</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WCHAR</code></td>
<td style="text-align: left;"><code>wchar_t</code><sup>1, 3</sup></td>
<td style="text-align: left;">572</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INT8_T</code></td>
<td style="text-align: left;"><code>int8_t</code></td>
<td style="text-align: left;">576</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UINT8_T</code></td>
<td style="text-align: left;"><code>uint8_t</code></td>
<td style="text-align: left;">577</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CHAR</code></td>
<td style="text-align: left;"><code>char</code><sup>1</sup></td>
<td style="text-align: left;">579</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SIGNED_CHAR</code></td>
<td style="text-align: left;"><code>signed char</code><sup>2</sup></td>
<td style="text-align: left;">580</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UNSIGNED_CHAR</code></td>
<td style="text-align: left;"><code>unsigned char</code><sup>2</sup></td>
<td style="text-align: left;">581</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_BYTE</code></td>
<td style="text-align: left;">(any C datatype)</td>
<td style="text-align: left;">583</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INT16_T</code></td>
<td style="text-align: left;"><code>int16_t</code></td>
<td style="text-align: left;">584</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UINT16_T</code></td>
<td style="text-align: left;"><code>uint16_t</code></td>
<td style="text-align: left;">585</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INT32_T</code></td>
<td style="text-align: left;"><code>int32_t</code></td>
<td style="text-align: left;">592</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UINT32_T</code></td>
<td style="text-align: left;"><code>uint32_t</code></td>
<td style="text-align: left;">593</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INT64_T</code></td>
<td style="text-align: left;"><code>int64_t</code></td>
<td style="text-align: left;">600</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_UINT64_T</code></td>
<td style="text-align: left;"><code>uint64_t</code></td>
<td style="text-align: left;">601</td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><sup>1</sup> Treated as printable character.</td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><sup>2</sup> Treated as integral value.</td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><sup>3</sup> Defined in <code>&lt;stddef.h&gt;</code>.</td>
</tr>
</tbody>
</table>

l\|l\|l\
C type: `MPI_Datatype` & &\
Fortran type: `INTEGER` &\
or `TYPE(MPI_Datatype)` &\
`MPI_LOGICAL` & `LOGICAL` & 536\
`MPI_INTEGER` & `INTEGER` & 537\
`MPI_REAL` & `REAL` & 538\
`MPI_COMPLEX` & `COMPLEX` & 539\
`MPI_DOUBLE_PRECISION` & `DOUBLE PRECISION` & 540\
`MPI_CHARACTER` & `CHARACTER(1)` & 542\
`MPI_AINT` & `ADDRESS` & 513\
`MPI_COUNT` & `COUNT` & 514\
`MPI_OFFSET` & `OFFSET` & 515\
`MPI_BYTE` & (any Fortran type) & 583  `MPI_PACKED` & (any Fortran type) & 519  

<table>
<thead>
<tr>
<th colspan="3" style="text-align: center;"><strong>Named predefined datatypes</strong><sup>1</sup></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Datatype</code> </span></td>
<td rowspan="3" style="text-align: left;">C++ types</td>
<td rowspan="3" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><span> or <code>TYPE(MPI_Datatype)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_FLOAT_COMPLEX</code></td>
<td style="text-align: left;"><code>std::complex&lt;float&gt;</code></td>
<td style="text-align: left;">531</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_DOUBLE_COMPLEX</code></td>
<td style="text-align: left;"><code>std::complex&lt;double&gt;</code></td>
<td style="text-align: left;">535</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_LONG_DOUBLE_COMPLEX</code></td>
<td style="text-align: left;"><code>std::complex&lt;long double&gt;</code></td>
<td style="text-align: left;">549</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_BOOL</code></td>
<td style="text-align: left;"><code>bool</code></td>
<td style="text-align: left;">569</td>
</tr>
<tr>
<td colspan="3" style="text-align: left;"><sup>1</sup> If an accompanying C++ compiler is missing, then the MPI datatypes in this</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="3" style="text-align: center;"><strong>Optional datatypes (Fortran)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Datatype</code> </span></td>
<td rowspan="3" style="text-align: left;">Fortran types</td>
<td rowspan="3" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><span> or <code>TYPE(MPI_Datatype)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DOUBLE_COMPLEX</code></td>
<td style="text-align: left;"><code>DOUBLE COMPLEX</code></td>
<td style="text-align: left;">541</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOGICAL1</code></td>
<td style="text-align: left;"><code>LOGICAL*1</code></td>
<td style="text-align: left;">704</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOGICAL2</code></td>
<td style="text-align: left;"><code>LOGICAL*2</code></td>
<td style="text-align: left;">712</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOGICAL4</code></td>
<td style="text-align: left;"><code>LOGICAL*4</code></td>
<td style="text-align: left;">720</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOGICAL8</code></td>
<td style="text-align: left;"><code>LOGICAL*8</code></td>
<td style="text-align: left;">728</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOGICAL16</code></td>
<td style="text-align: left;"><code>LOGICAL*16</code></td>
<td style="text-align: left;">736</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INTEGER1</code></td>
<td style="text-align: left;"><code>INTEGER*1</code></td>
<td style="text-align: left;">705</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INTEGER2</code></td>
<td style="text-align: left;"><code>INTEGER*2</code></td>
<td style="text-align: left;">713</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INTEGER4</code></td>
<td style="text-align: left;"><code>INTEGER*4</code></td>
<td style="text-align: left;">721</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INTEGER8</code></td>
<td style="text-align: left;"><code>INTEGER*8</code></td>
<td style="text-align: left;">729</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INTEGER16</code></td>
<td style="text-align: left;"><code>INTEGER*16</code></td>
<td style="text-align: left;">737</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_REAL2</code></td>
<td style="text-align: left;"><code>REAL*2</code></td>
<td style="text-align: left;">714</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_REAL4</code></td>
<td style="text-align: left;"><code>REAL*4</code></td>
<td style="text-align: left;">722</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_REAL8</code></td>
<td style="text-align: left;"><code>REAL*8</code></td>
<td style="text-align: left;">730</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_REAL16</code></td>
<td style="text-align: left;"><code>REAL*16</code></td>
<td style="text-align: left;">738</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMPLEX4</code></td>
<td style="text-align: left;"><code>COMPLEX*4</code></td>
<td style="text-align: left;">723</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMPLEX8</code></td>
<td style="text-align: left;"><code>COMPLEX*8</code></td>
<td style="text-align: left;">731</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMPLEX16</code></td>
<td style="text-align: left;"><code>COMPLEX*16</code></td>
<td style="text-align: left;">739</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_COMPLEX32</code></td>
<td style="text-align: left;"><code>COMPLEX*32</code></td>
<td style="text-align: left;">747</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Datatypes for reduction functions (C)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Datatype</code> </span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span> <span> or <code>TYPE(MPI_Datatype)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_FLOAT_INT</code></td>
<td style="text-align: left;">552</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_DOUBLE_INT</code></td>
<td style="text-align: left;">553</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LONG_INT</code></td>
<td style="text-align: left;">554</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_2INT</code></td>
<td style="text-align: left;">555</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SHORT_INT</code></td>
<td style="text-align: left;">556</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LONG_DOUBLE_INT</code></td>
<td style="text-align: left;">557</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Datatypes for reduction functions (Fortran)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Datatype</code> </span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span> <span> or <code>TYPE(MPI_Datatype)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_2REAL</code></td>
<td style="text-align: left;">560</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_2DOUBLE_PRECISION</code></td>
<td style="text-align: left;">561</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_2INTEGER</code></td>
<td style="text-align: left;">562</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Predefined message handles</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Message</code> </span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span> <span> or <code>TYPE(MPI_Message)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MESSAGE_NULL</code></td>
<td style="text-align: left;">296</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MESSAGE_NO_PROC</code></td>
<td style="text-align: left;">297</td>
</tr>
</tbody>
</table>

l\|l\
C type: `MPI_Errhandler` &\
Fortran type: `INTEGER` or `TYPE(MPI_Errhandler)`\
`MPI_ERRHANDLER_NULL` & 320  `MPI_ERRORS_ARE_FATAL` & 321\
`MPI_ERRORS_ABORT` & 322\
`MPI_ERRORS_RETURN` & 323\

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Environmental inquiry info key</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Info</code> </span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span> <span> or <code>TYPE(MPI_Info)</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INFO_NULL</code></td>
<td style="text-align: left;">304</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_INFO_ENV</code></td>
<td style="text-align: left;">305</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Collective operators</strong></td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span> <span> or <code>TYPE(MPI_Op)</code></span></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_OP_NULL</code></td>
<td style="text-align: left;">32</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SUM</code></td>
<td style="text-align: left;">33</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MIN</code></td>
<td style="text-align: left;">34</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAX</code></td>
<td style="text-align: left;">35</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_PROD</code></td>
<td style="text-align: left;">36</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_BAND</code></td>
<td style="text-align: left;">40</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_BOR</code></td>
<td style="text-align: left;">41</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_BXOR</code></td>
<td style="text-align: left;">42</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LAND</code></td>
<td style="text-align: left;">48</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LOR</code></td>
<td style="text-align: left;">49</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_LXOR</code></td>
<td style="text-align: left;">50</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MINLOC</code></td>
<td style="text-align: left;">56</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_MAXLOC</code></td>
<td style="text-align: left;">57</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_REPLACE</code></td>
<td style="text-align: left;">60</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_NO_OP</code></td>
<td style="text-align: left;">61</td>
</tr>
</tbody>
</table>

l\|l\
C type: `MPI_Group` &\
Fortran type: `INTEGER` or `TYPE(MPI_Group)`\
`MPI_GROUP_NULL` & 264  `MPI_GROUP_EMPTY` & 265\

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Other predefined handles</strong></td>
</tr>
<tr>
<td style="text-align: left;">C type / Fortran type   <code>MPI_REQUEST_NULL</code>   <span> or <code>TYPE(MPI_Request)</code></span></td>
<td style="text-align: left;">384</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_FILE_NULL</code></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><span> or <code>TYPE(MPI_File)</code></span></td>
<td style="text-align: left;">280</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SESSION_NULL</code></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><span> or <code>TYPE(MPI_Session)</code></span></td>
<td style="text-align: left;">288</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_WIN_NULL</code></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><span> or <code>TYPE(MPI_Win)</code></span></td>
<td style="text-align: left;">272</td>
</tr>
</tbody>
</table>



<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Predefined functions</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">C/Fortran name</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">C type</td>
<td style="text-align: left;">ABI value in <code>mpi.h</code></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_NULL_COPY_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_DUP_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_NULL_DELETE_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_NULL_COPY_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_DUP_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_NULL_DELETE_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_TYPE_NULL_COPY_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_TYPE_DUP_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_TYPE_NULL_DELETE_FN]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_CONVERSION_FN_NULL]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_CONVERSION_FN_NULL_C]]</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;">/ (n/a)</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="2" style="text-align: left;"><sup>1</sup> See the advice to implementors (on page [[advice-context-predefined-Fortran-implementors]] ) and advice to users (on page [[advice-context-predefined-Fortran-users]] )</td>
</tr>
<tr>
<td colspan="2" style="text-align: left;">[[context#Communicators|Communicators]] .</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Deprecated predefined functions</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span>C/Fortran name</span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;">  [[MPI_NULL_COPY_FN]]</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_DUP_FN]]</td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_NULL_DELETE_FN]]</td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>C constants specifying ignored input (no Fortran)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><code>MPI_F_STATUSES_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUSES_IGNORE</code> in <code>mpi</code> / <code>mpif.h</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F_STATUS_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUS_IGNORE</code> in <code>mpi</code> / <code>mpif.h</code></td>
</tr>
<tr>
<td style="text-align: left;">C constant <span> (type: <code>MPI_F08_status</code><code>*</code>)</span></td>
<td style="text-align: left;">is equivalent to the Fortran constant</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F08_STATUSES_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUSES_IGNORE</code> in <code>mpi_f08</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F08_STATUS_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUS_IGNORE</code> in <code>mpi_f08</code></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>C preprocessor constants and Fortran parameters</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: C-preprocessor macro that expands to an <code>int</code> value</span></td>
<td rowspan="2" style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_VERSION</code></td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_SUBVERSION</code></td>
<td style="text-align: left;">N/A</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ABI_VERSION</code></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_ABI_SUBVERSION</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td colspan="2" style="text-align: left;">The MPI API version constants change with every release of the standard</td>
</tr>
<tr>
<td colspan="2" style="text-align: left;">and are thus not constants in the ABI. The MPI ABI subversion will</td>
</tr>
<tr>
<td colspan="2" style="text-align: left;">increment with every release of the standard, unless there is a breaking</td>
</tr>
<tr>
<td colspan="2" style="text-align: left;">change, in which case the ABI version will increment and the subversion</td>
</tr>
<tr>
<td colspan="2" style="text-align: left;">will reset to zero.</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="3" style="text-align: center;"><strong>Handles used in the MPI tool information interface</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Handle</td>
<td style="text-align: left;">Type</td>
<td style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_ENUM_NULL</code></td>
<td style="text-align: left;"><code>MPI_T_enum</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_CVAR_HANDLE_NULL</code></td>
<td style="text-align: left;"><code>MPI_T_cvar_handle</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_HANDLE_NULL</code></td>
<td style="text-align: left;"><code>MPI_T_pvar_handle</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_SESSION_NULL</code></td>
<td style="text-align: left;"><code>MPI_T_pvar_session</code></td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;"><strong>Other Handles</strong></td>
</tr>
<tr>
<td style="text-align: left;">Handle</td>
<td style="text-align: left;">Type</td>
<td style="text-align: left;">ABI value</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_ALL_HANDLES</code></td>
<td style="text-align: left;"><code>MPI_T_pvar_handle</code></td>
<td style="text-align: left;">1</td>
</tr>
</tbody>
</table>

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>Verbosity levels in the MPI tool information interface</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_USER_BASIC</code></td>
<td style="text-align: left;"><code>0x09</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_USER_DETAIL</code></td>
<td style="text-align: left;"><code>0x0a</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_USER_ALL</code></td>
<td style="text-align: left;"><code>0x0c</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_TUNER_BASIC</code></td>
<td style="text-align: left;"><code>0x11</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_TUNER_DETAIL</code></td>
<td style="text-align: left;"><code>0x12</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_TUNER_ALL</code></td>
<td style="text-align: left;"><code>0x14</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_MPIDEV_BASIC</code></td>
<td style="text-align: left;"><code>0x21</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_MPIDEV_DETAIL</code></td>
<td style="text-align: left;"><code>0x22</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_VERBOSITY_MPIDEV_ALL</code></td>
<td style="text-align: left;"><code>0x24</code></td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Constants to identify associations of variables</strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><strong>in the MPI tool information interface</strong></td>
</tr>
<tr>
<td style="text-align: left;"><span> C type: integer constant expression of type <code>int</code></span></td>
<td style="text-align: left;"><span>ABI value</span></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_NO_OBJECT</code></td>
<td style="text-align: left;"><code>1</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_COMM</code></td>
<td style="text-align: left;"><code>2</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_DATATYPE</code></td>
<td style="text-align: left;"><code>3</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_ERRHANDLER</code></td>
<td style="text-align: left;"><code>4</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_FILE</code></td>
<td style="text-align: left;"><code>5</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_GROUP</code></td>
<td style="text-align: left;"><code>6</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_OP</code></td>
<td style="text-align: left;"><code>7</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_REQUEST</code></td>
<td style="text-align: left;"><code>8</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_WIN</code></td>
<td style="text-align: left;"><code>9</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_MESSAGE</code></td>
<td style="text-align: left;"><code>10</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_INFO</code></td>
<td style="text-align: left;"><code>11</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_BIND_MPI_SESSION</code></td>
<td style="text-align: left;"><code>12</code></td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Constants describing the scope of a control variable</strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><strong>in the MPI tool information interface</strong></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SCOPE_CONSTANT</code></td>
<td style="text-align: left;"><code>1</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SCOPE_READONLY</code></td>
<td style="text-align: left;"><code>2</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SCOPE_LOCAL</code></td>
<td style="text-align: left;"><code>3</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SCOPE_GROUP</code></td>
<td style="text-align: left;"><code>4</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SCOPE_GROUP_EQ</code></td>
<td style="text-align: left;"><code>5</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SCOPE_ALL</code></td>
<td style="text-align: left;"><code>6</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SCOPE_ALL_EQ</code></td>
<td style="text-align: left;"><code>7</code></td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Performance variable classes used by the</strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><strong>MPI tool information interface</strong></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_STATE</code></td>
<td style="text-align: left;"><code>1</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_LEVEL</code></td>
<td style="text-align: left;"><code>2</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_SIZE</code></td>
<td style="text-align: left;"><code>3</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_PERCENTAGE</code></td>
<td style="text-align: left;"><code>4</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_HIGHWATERMARK</code></td>
<td style="text-align: left;"><code>5</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_LOWWATERMARK</code></td>
<td style="text-align: left;"><code>6</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_COUNTER</code></td>
<td style="text-align: left;"><code>7</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_AGGREGATE</code></td>
<td style="text-align: left;"><code>8</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_TIMER</code></td>
<td style="text-align: left;"><code>9</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_PVAR_CLASS_GENERIC</code></td>
<td style="text-align: left;"><code>10</code></td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Source event ordering guarantees in the</strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><strong>MPI tool information interface</strong></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SOURCE_ORDERED</code></td>
<td style="text-align: left;">1</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_SOURCE_UNORDERED</code></td>
<td style="text-align: left;">2</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td colspan="2" style="text-align: center;"><strong>Callback safety requirement levels used in the</strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;"><strong>MPI tool information interface</strong></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_CB_REQUIRE_NONE</code></td>
<td style="text-align: left;"><code>0x00</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_CB_REQUIRE_MPI_RESTRICTED</code></td>
<td style="text-align: left;"><code>0x03</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_CB_REQUIRE_THREAD_SAFE</code></td>
<td style="text-align: left;"><code>0x0F</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_T_CB_REQUIRE_ASYNC_SIGNAL_SAFE</code></td>
<td style="text-align: left;"><code>0x3F</code></td>
</tr>
</tbody>
</table>

### Types

 The following are defined C type definitions included in the file `mpi.h`.\
`/* C opaque types */`\
`MPI_Aint`\
`MPI_Count`\
`MPI_Fint`\
`MPI_Offset`\
`MPI_Status`\
`MPI_F08_status`\
\
`/* C handles to assorted structures */`\
`MPI_Comm`\
`MPI_Datatype`\
`MPI_Errhandler`\
`MPI_File`\
`MPI_Group`\
`MPI_Info`\
`MPI_Message`\
`MPI_Op`\
`MPI_Request`\
`MPI_Session`\
`MPI_Win`\
\
`/* Types for the MPI_T interface */`\
`MPI_T_enum`\
`MPI_T_cvar_handle`\
`MPI_T_pvar_handle`\
`MPI_T_pvar_session`\
`MPI_T_event_instance`\
`MPI_T_event_registration`\
`MPI_T_source_order`\
`MPI_T_cb_safety`\
\
The following are defined Fortran type definitions included in the `mpi_f08` and `mpi` modules.\
`! Fortran opaque types in the mpi_f08 and mpi modules`\
`TYPE(MPI_Status)`\
\
`! Fortran handles in the mpi_f08 and mpi modules`\
`TYPE(MPI_Comm)`\
`TYPE(MPI_Datatype)`\
`TYPE(MPI_Errhandler)`\
`TYPE(MPI_File)`\
`TYPE(MPI_Group)`\
`TYPE(MPI_Info)`\
`TYPE(MPI_Message)`\
`TYPE(MPI_Op)`\
`TYPE(MPI_Request)`\
`TYPE(MPI_Session)`\
`TYPE(MPI_Win)`

### Prototype Definitions



#### C Bindings

The following are defined C typedefs for user-defined functions, also included in the file `mpi.h`.

    /* prototypes for user-defined functions */

#### Fortran 2008 Bindings with the `mpi_f08` Module

The callback prototypes when using the Fortran `mpi_f08` module are shown below:

The user-function argument to `MPI_Op_create` and `MPI_Op_create_c` should be declared according to:

The copy and delete function arguments to `MPI_Comm_create_keyval` should be declared according to:

The copy and delete function arguments to `MPI_Win_create_keyval` should be declared according to:

The copy and delete function arguments to `MPI_Type_create_keyval` should be declared according to:

The handler-function argument to `MPI_Comm_create_errhandler` should be declared like this:

The handler-function argument to `MPI_Win_create_errhandler` should be declared like this:

The handler-function argument to `MPI_File_create_errhandler` should be declared like this:

The handler-function argument to `MPI_Session_create_errhandler` should be declared like this:

The query, free, and cancel function arguments to `MPI_Grequest_start` should be declared according to:

The extent and conversion function arguments to `MPI_Register_datarep` and `MPI_Register_datarep_c` should be declared according to:

#### Fortran Bindings with `mpif.h` or the `mpi` Module

With the Fortran `mpi` module or (deprecated) `mpif.h`, here are examples of how each of the user-defined subroutines should be declared.

The user-function argument to [[MPI_OP_CREATE]] should be declared like this:

The copy and delete function arguments to [[MPI_COMM_CREATE_KEYVAL]] should be declared like these:

The copy and delete function arguments to [[MPI_WIN_CREATE_KEYVAL]] should be declared like these:

The copy and delete function arguments to [[MPI_TYPE_CREATE_KEYVAL]] should be declared like these:

The handler-function argument to [[MPI_COMM_CREATE_ERRHANDLER]] should be declared like this:

The handler-function argument to [[MPI_WIN_CREATE_ERRHANDLER]] should be declared like this:

The handler-function argument to [[MPI_FILE_CREATE_ERRHANDLER]] should be declared like this:

The handler-function argument to [[MPI_SESSION_CREATE_ERRHANDLER]] should be declared like this:

The query, free, and cancel function arguments to [[MPI_GREQUEST_START]] should be declared like these:

The extent and conversion function arguments to [[MPI_REGISTER_DATAREP]] should be declared like these:

### Deprecated Prototype Definitions

The following are defined C typedefs for deprecated user-defined functions, also included in the file `mpi.h`.

    /* prototypes for user-defined functions */

The following are deprecated Fortran user-defined callback subroutine prototypes.

The deprecated copy and delete function arguments to [[MPI_KEYVAL_CREATE]] should be declared like these:

### String Values

#### Default Communicator Names

The following default communicator names are defined by MPI.\
`MPI_COMM_WORLD`\
`MPI_COMM_SELF`\
`MPI_COMM_PARENT`\
`MPI_COMM_NULL`

#### Default Datatype Names

Named predefined datatypes have the default names of the datatype name. In addition, the following default datatype name is defined by MPI.\
`MPI_DATATYPE_NULL`

#### Default Window Names

The following default window name is defined by MPI.\
`MPI_WIN_NULL`

#### Reserved Data Representations

The following data representations are supported by MPI.\
`native`\
`internal`\
`external32`

#### Process Set Names

| **Process set name** | **Comment**                |
|:---------------------|:---------------------------|
| `mpi://`             | reserved namespace         |
| `mpi://SELF`         | mandatory process set name |
| `mpi://WORLD`        | mandatory process set name |

#### Info Keys

The following info keys are reserved. They are strings.\
`access_style`\
`accumulate_ops`\
`accumulate_ordering`\
`alloc_shared_noncontig`\
`appnum`\
`arch`\
`argv`\
`cb_block_size`\
`cb_buffer_size`\
`cb_nodes`\
`chunked`\
`chunked_item`\
`chunked_size`\
`collective_buffering`\
`command`\
`file`\
`file_perm`\
`filename`\
`host`\
`io_node_list`\
`ip_address`\
`ip_port`\
`maxprocs`\
`mpi_accumulate_granularity`\
`mpi_aint_size`\
`mpi_assert_allow_overtaking`\
`mpi_assert_exact_length`\
`mpi_assert_memory_alloc_kinds`\
`mpi_assert_no_any_source`\
`mpi_assert_no_any_tag`\
`mpi_complex4_supported`\
`mpi_complex8_supported`\
`mpi_complex16_supported`\
`mpi_complex32_supported`\
`mpi_count_size`\
`mpi_double_complex_supported`\
`mpi_double_precision_size`\
`mpi_hw_resource_type`\
`mpi_initial_errhandler`\
`mpi_integer_size`\
`mpi_integer1_supported`\
`mpi_integer2_supported`\
`mpi_integer4_supported`\
`mpi_integer8_supported`\
`mpi_integer16_supported`\
`mpi_logical_size`\
`mpi_logical1_supported`\
`mpi_logical2_supported`\
`mpi_logical4_supported`\
`mpi_logical8_supported`\
`mpi_logical16_supported`\
`mpi_memory_alloc_kinds`\
`mpi_minimum_memory_alignment`\
`mpi_offset_size`\
`mpi_pset_name`\
`mpi_size`\
`mpi_real_size`\
`mpi_real2_supported`\
`mpi_real4_supported`\
`mpi_real8_supported`\
`mpi_real16_supported`\
`nb_proc`\
`no_locks`\
`num_io_nodes`\
`path`\
`same_disp_unit`\
`same_size`\
`soft`\
`striping_factor`\
`striping_unit`\
`thread_level`\
`wdir`

#### Info Values

The following info values are reserved. They are strings.\
`alloc_mem`\
`false`\
`mpi`\
`mpi_errors_abort`\
`mpi_errors_are_fatal`\
`mpi_errors_return`\
`mpi_shared_memory`\
`MPI_THREAD_FUNNELED`\
`MPI_THREAD_MULTIPLE`\
`MPI_THREAD_SERIALIZED`\
`MPI_THREAD_SINGLE`\
`none`\
`random`\
`rar`\
`raw`\
`read_mostly`\
`read_once`\
`reverse_sequential`\
`same_op`\
`same_op_no_op`\
`sequential`\
`system`\
`true`\
`war`\
`waw`\
`win_allocate`\
`win_allocate_shared`\
`write_mostly`\
`write_once`

## Summary of the Semantics of all Operation-Related MPI Procedures



This annex provides the list of MPI procedures that are associated with an MPI operation, or inquiry procedures providing information about an operation.

In many cases, the MPI procedures and their properties are listed under certain constraints, e.g., a call to [[MPI_WAIT]] that completes either a nonblocking or a persistent operation, or RMA calls in combination with various synchronization methods.

**Table Legend:**

- **Stages:** `i`=initialization, `s`=starting, `c`=completion, `f`=freeing. The procedure does at least part of the indicated stage(s).

- **Cpl:** `ic`=incomplete procedure, `c`=completing procedure, `f`=freeing procedure

- **Loc:** `l`=local procedure, `nl`=non-local procedure

- **$`*`$**: exceptions, e.g., `ic+nl` = incomplete+non-local, and `c+l` = completing+local (both are defined as blocking)

- **Blk:** `b`=blocking procedure, `nb`=nonblocking procedure. Note that from a user’s view point, this column is only a hint. Relevant is, whether a routine is local or not and which resources are blocked until when. See both previous and last columns.

- **$`\ddagger`$**: exceptions, e.g., nonblocking procedures without prefix `I`, or that prefix `I` only marks immediate return.

- **Op:** part of operation type: `b-op` = blocking operation, `nb-op` = nonblocking operation, `p-op` = persistent operation, `pp-op` = persistent partitioned operation

- **Collective procedures:**

  - `C` = all processes of the group must call the procedure

  - `sq` = in the same sequence

  - `S1` = blocking synchronization, i.e., no process shall return from this procedure until all processes on the associated process group called this procedure

  - `W1` = the implementation is permitted to do S1 but not required to do S1

  - `S2` = start-complete-synchronization, i.e., no process shall complete the associated operation until all processes on the associated process group have called the associated starting procedure

  - `W2` = the implementation is permitted to do S2 but not required to do S2

- **Blocked resources:** They are blocked after the call until the end of the subsequent stage where this resource is not mentioned further in the table.

**Table Remarks:**

1.  Must not return before the corresponding MPI receive operation is started.

2.  Not related to an MPI operation. Prior to MPI-4.0, [[MPI_PROBE]] and [[MPI_IPROBE]] were also described as blocking and nonblocking. From MPI-4.0 onwards, only non-local and local are used to describe these procedures.

3.  Usually, [[MPI_WAIT]] is non-local, but in this case it is local.

4.  In case of a `MPI\_(I)BARRIER` on an intra-communicator, the `S1/S2` synchronization is required (instead of W1/W2).

5.  Collective: all processes must complete, but with the free choice of using [[MPI_WAIT]] or [[MPI_TEST]] returning `flag``= TRUE`.

6.  It also may not return until [[MPI_INIT]] was called in the children.

7.  Addresses are cached on the request handle.

8.  One of the rare cases that an incomplete call is non-local and therefore blocking.

9.  One shall not free or deallocate the buffer before the operation is freed, that is [[MPI_REQUEST_FREE]] returned.

10. For [[MPI_WAIT]] and [[MPI_TEST]] , see corresponding lines for a) [[MPI_BSEND]] , or b) [[MPI_IBCAST]] .

11. The prefix `I` marks only that this procedure returns immediately.

12. One of the exceptions that a completing and therefore blocking operation-related procedure is local.

13. `MPI\_(I)MPROBE` initializes the operation through generating the message handle whereas `MPI\_(I)MRECV` initializes the receive buffer (i.e., two MPI procedures together implement the initialization stage).

14. Nonblocking procedure without an `I` prefix.

15. Initialization stage (“`i`”) only if `flag``= TRUE` is returned else no operation is progressed.

16. Collective: all processes must start, but with the free choice of using [[MPI_START]] or [[MPI_STARTALL]] for a given persistent request handle (i.e., if one process starts a persistent request handle then all processes of the associated process group must start their corresponding request handle, and if any process starts then all processes must complete their handles).

17. In a correct MPI program, a call to `MPI\_(I)RSEND` requires that the receiver has already started the corresponding receive. Under this assumption, the call to [[MPI_RSEND]] and the call to [[MPI_WAIT]] with an (active) ready send request handle are local.

18. Based on their semantics, when called using an intra-communicator, [[MPI_ALLGATHER]] , [[MPI_ALLTOALL]] , and their [[V]] and [[W]] variants, [[MPI_ALLREDUCE]] , [[MPI_REDUCE_SCATTER]] , and [[MPI_REDUCE_SCATTER_BLOCK]] must synchronize (i.e., `S1/S2` instead of `W1/W2`) provided that all counts and the size of all datatypes are larger than zero.

19. [[MPI_COMM_FREE]] may return before any pending communication has finished and the communicator is deallocated. In contrast, [[MPI_COMM_DISCONNECT]] waits for pending communicaton to finish and deallocates the communicator before it returns.

20. The request handle is in the “active” state after [[MPI_START]] , i.e., [[MPI_REQUEST_FREE]] is now forbidden. But the starting stage is not yet finished, and the contents of the buffer are not yet “blocked.” An additional [[MPI_PREADY]] and variants [[MPI_PREADY_RANGE]] [[MPI_PREADY_LIST]] are required to activate each partition of the send buffer to finish the starting stage.

21. As part of the completion stage, the user is allowed to read part of the output buffer after returning from [[MPI_PARRIVED]] with `flag``= TRUE` before completing the whole operation with a [[MPI_WAIT]] / [[MPI_TEST]] procedure.

22. It initializes the attached buffer as completely free.

23. It uses the attached buffer and performs all four stages on the send buffer. It occupies the needed part of the attached buffer.

24. It waits until the attached buffer is empty, i.e., all messages have been transmitted, and then releases the attached buffer.

25. Although in case of `flag``= TRUE` the operation is completed, a subsequent call to test, wait, or free must be executed for deallocating or inactivating the request handle as final part of the stages c and f. It is listed only in this scenario, but can be used everywhere, where [[MPI_TEST]] can be called.

26. It frees the request handle. If the related communication operation is still ongoing then the completion and freeing stage can take place after the procedure returned.

27. Cancelling a send request is deprecated.

28. Can also be applied to activ persistent requests.

29. As an exception, [[MPI_WAIT]] is local and [[MPI_TEST]] repeatedly called will eventually return `flag``=true`. The cancelled send or receive operation is completed and the buffer can be reused. Whether the message is sent out from the buffer or received in the buffer, this part of the completion stage is only executed if a subsequent [[MPI_TEST_CANCELLED]] for the returned status would return `flag``= FALSE`. The freeing stage will be performed only for non-persistent requests.

30. In some cases, more than one MPI procedure may be needed to implement one stage of an MPI one-sided operation. For details on the semantics of one-sided operations, see [[Chapter]] sec:one-side-2.

31. Local completion only (at origin).

32. Local completion only (at target).

33. Completion at target and locally at origin.

34. Return from [[MPI_WIN_START]] and these subsequent procedures at the origin process may be delayed until [[MPI_WIN_POST]] has been called at the target process (see [[one-side#Synchronization Calls|Synchronization Calls]] and [[Example]] ex:1sided-start-complete).

35. Return from [[MPI_WIN_LOCK]] and these subsequent procedures may be delayed until other origin processes have released their lock (see [[one-side#Synchronization Calls|Synchronization Calls]] and [[Example]] ex:1sided-lock-unlock).

36. The init and freeing stages and the buffer address of the target window only apply to MPI processes in the role of a target of an RMA operation.

37. The freeing stage applies to operations only and does not apply to any request.

38. The same procedure call may serve different stages for different operations, i.e., the completion of a previous RMA and/or exposure epoch and/or the start of a next RMA and/or exposure epoch.

39. In addition to the completion and freeing of the RMA operations prior the the flush call (stages “`c+f`”), this call initializes the next RMA epoch (stage “`i`”).

40. The stages represent the invocation as part of an RMA operation. As collective procedure itself, it is a blocking procedure with all stages.
