clear all, close all, clc;
load ProbMat
IDlist=[1:220];
Nsample=length(IDlist);
t_gap=24;
setsize=2;
REScell=cell(Nsample,1);
ct=0;
for i=IDlist
    filename=['./Nbr/' num2str(i) '.mat'];
    if exist(filename,'file')
        load(filename);
    else
        continue;
    end
    dataSUB=dataSUB(:,[1 3 4 2]);
    dataSUB=PlocGET(dataSUB,t_gap,ProbMat);
    [dataSUB IDremap]=HashZ(dataSUB);
    IndexSUB=IND_GEN(dataSUB);
    Type=[[1;    2+zeros(length(IndexSUB)-1,1)] [0.003;      0.015+zeros(length(IndexSUB)-1,1)]];
    [Nodelist Likelilist ETPSGL]=WeightCmpt(dataSUB, IndexSUB, t_gap, Type, setsize, true);
    IDremap=IDremap';
    REScell{i}=[IDremap(Nodelist) Likelilist];
    ['run ' num2str(i)]
    ct=ct+1;
	[i ct]
end
save RES_Likelihood REScell;