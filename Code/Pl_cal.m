clear all, close all, clc;
tt_data=textread('tt_data.txt','','delimiter','\t,_');
fs_data=textread('fs_data.txt','','delimiter','\t,_');
Nac1=size(tt_data,1);
Nac2=size(fs_data,1);
Tn= 17249;
scale=0.1;
problist=[0.015 0.003];
ProbMat=zeros(1801,3601);

fs_data(:,3)=floor(fs_data(:,3)/scale)+901;
fs_data(:,4)=floor(fs_data(:,4)/scale)+1801;
tt_data(:,3)=floor(tt_data(:,3)/scale)+901;
tt_data(:,4)=floor(tt_data(:,4)/scale)+1801;

for i=1:size(fs_data,1)
    mx=fs_data(i,3);
    my=fs_data(i,4);
	ProbMat(mx,my)=ProbMat(mx,my)+1;
end

for i=1:size(tt_data,1)
    mx=tt_data(i,3);
    my=tt_data(i,4);
	ProbMat(mx,my)=ProbMat(mx,my)+1;
end

ProbMat=(ProbMat)./(Nac1*problist(1)+Nac2*problist(2))./(Tn);
save ProbMat ProbMat