Usage
============
Put "tt_data.txt" and "fs_data.txt" into the same directory as the code.<p>
Run "main.m" to obtain the result.

Document
============
main.m -- Script of whole process to obtain the result.

AjdMat_GEN.m -- Script to obtain the adjacent matrix of IDs.

preprocess.m -- Script to obtain the neighborhood of target IDs (No. 1 ~ 220 user). For each target ID, save records of its neighborhood IDs into "./Nbr/*.mat"

Pl_cal.m -- Script to calculate the parameter of visiting location l, i.e., p_l.

invoke_Weight.m -- Calculate the matching scores for each target IDs with candidate ID sets in its neighborhood.

WeightCmpt.m -- Function of calculating the matching score.<br>
[Nodelist Likelilist ETPSGL] = WeightCmpt(cookie, Index, t_gap, Type,setsize, flag)<br>
1. cookie: location records of all IDs. Each row has 4 elements: user ID, timestamp, longitude and latitude.<br>
2. Index: descripe the range of each ID in cookie. Row k corresponds to ID k. Each row has 2 elements: the start of logs, the end of logs.<br>
3. t_gap: temporal resolution of the algorithm.<br>
4. Type: descipe the type of all IDs. Row k corresponds to ID k. Each row has 2 elements: type of ID k, parameter of having ID of corresponding type.<br>
5. setsize: the size of candidate sets, ranging from 2 to infinite. If set it as 2, it is pair-wise matching. If set it as 3, it matches 2 other IDs for the target ID.
6. flag: boolean variable to describe whether using approximation algorithm.

<p>

ACC_cal.m -- Script to calculate the AUC for the obtained results.

HashZ.m -- Function of hashing the user ID to 1,2,3,...

TimeSimGap.m -- Function of judging whether two timestamps are located in the same time bin. 

SeqGEN.m -- Function of generate all candidate sets. For each selected ID, the corresponding element in the seq is set as 1.

Change Logs
============
Update document of scripts and functions. -- June 9th. 2017

Update the code, run "main.m" to obtain the result.
Documents in more detail will also be updated soon. -- June 8th. 2017


