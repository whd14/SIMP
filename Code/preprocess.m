clear all, close all, clc;
tt_data=textread('tt_data.txt','','delimiter','\t,_');
tt_data = sortrows(tt_data,2);
tt_data = sortrows(tt_data,1);
tt_data(:,2)=floor(tt_data(:,2)/100);
IndexTT=IND_GEN(tt_data);
tt_data(:,1)=-1.*tt_data(:,1);


fs_data=textread('fs_data.txt','','delimiter','\t,_');
fs_data = sortrows(fs_data,2);
fs_data = sortrows(fs_data,1);
fs_data(:,2)=floor(fs_data(:,2)/100);
IndexFS=IND_GEN(fs_data);

load adj_mat;
dir='Nbr';
IDlist=[1:220];
dataSUB=[];
if ~exist(dir) 
    mkdir(dir)         
end
for fid=IDlist
    dataSUB=fs_data(IndexFS(fid,1):IndexFS(fid,2),:);
    for tid=1:max(abs(tt_data(:,1)))
        if adj_mat(tid,fid)==1
            dataPIE=tt_data(IndexTT(tid,1):IndexTT(tid,2),:);
            dataSUB=[dataSUB;dataPIE];
        end
    end
    save([dir '/' num2str(fid)],'dataSUB');
end



